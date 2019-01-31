package controllers

import (
	"encoding/json"
	"hash/fnv"
	"image"
	"log"
	"mime/multipart"
	"net/http"
	"os"
	"path/filepath"
	"serveur/models"
	"strconv"

	"github.com/disintegration/imaging"

	"github.com/astaxie/beego"
)

const (
	thumbnailsPath   = "http://localhost:8080/files/240x180/"
	imagesPath       = "http://localhost:8080/files/640x480/"
	thumbnailsFolder = "./files/240x180/"
	imagesFolder     = "./files/640x480/"
)

type UploadController struct {
	beego.Controller
}

// Post handle file upload request
func (c *UploadController) Post() {
	_, fileHeader, err := c.GetFile("files")
	if err != nil {
		log.Println(err)
		c.Ctx.Output.SetStatus(http.StatusInternalServerError)
		return
	}

	var jsonRes models.Picture

	img, err := saveImage(fileHeader)
	if err != nil {
		log.Println(err)
		c.Ctx.Output.SetStatus(http.StatusInternalServerError)
		return
	}
	jsonRes = *img

	c.Data["json"] = jsonRes
	c.ServeJSON()
}

// Delete handle delete request to remove uploaded files
func (c *UploadController) Delete() {
	img := struct {
		FileName string `json:"fileName"`
	}{}
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &img)
	if err != nil {
		log.Println(err)
	}

	// remove thumbnail
	err = os.Remove(thumbnailsFolder + img.FileName)
	if err != nil {
		log.Println(err)
	}
	// remove main image
	err = os.Remove(imagesFolder + img.FileName)
	if err != nil {
		log.Println(err)
	}
	c.Data["json"] = img
	c.ServeJSON()
}

func hash(s string) string {
	h := fnv.New64a()
	h.Write([]byte(s))
	return strconv.FormatUint(h.Sum64(), 10)
}

// saveImage save uploaded file on files folder
func saveImage(file *multipart.FileHeader) (img *models.Picture, err error) {
	f, err := file.Open()

	defer f.Close()
	if err != nil {
		return
	}

	fileExt := filepath.Ext(file.Filename)
	fileName := hash(file.Filename) + fileExt

	imgSrc, _, err := image.Decode(f)
	if err != nil {
		return
	}

	imgDst240 := imaging.Fit(imgSrc, 240, 180, imaging.Lanczos)
	err = imaging.Save(imgDst240, thumbnailsFolder+fileName)
	if err != nil {
		return
	}

	imgDst640 := imaging.Fit(imgSrc, 640, 480, imaging.Lanczos)
	err = imaging.Save(imgDst640, imagesFolder+fileName)
	if err != nil {
		return
	}

	img = &models.Picture{
		ThumbnailURL: thumbnailsPath + fileName,
		URL:          imagesPath + fileName,
	}
	return
}
