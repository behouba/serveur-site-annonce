package controllers

import (
	"encoding/json"
	"hash/fnv"
	"image"
	"log"
	"mime/multipart"
	"os"
	"path/filepath"
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

type AdvertImage struct {
	ImageURL     string `json:"imageURL"`
	ThumbnailURL string `json:"thumbnailURL"`
}

func (c *UploadController) Post() {
	_, fileHeader, err := c.GetFile("files")
	if err != nil {
		log.Println(err)
		return
	}

	var jsonRes AdvertImage

	// for _, file := range filesHeaders {
	img, err := saveImage(fileHeader)
	if err != nil {
		log.Println(err)
	}
	jsonRes = *img
	// }

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
func saveImage(file *multipart.FileHeader) (img *AdvertImage, err error) {
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

	imgDst240 := imaging.Resize(imgSrc, 240, 180, imaging.Lanczos)
	err = imaging.Save(imgDst240, "./files/240x180/"+fileName)
	if err != nil {
		return
	}

	imgDst640 := imaging.Resize(imgSrc, 640, 480, imaging.Lanczos)
	err = imaging.Save(imgDst640, "./files/640x480/"+fileName)
	if err != nil {
		return
	}

	img = &AdvertImage{
		ThumbnailURL: thumbnailsPath + fileName,
		ImageURL:     imagesPath + fileName,
	}
	return
}
