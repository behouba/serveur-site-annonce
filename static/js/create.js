$(document).ready(function() {
  Vue.options.delimiters = ["{", "}"];

  // AdImages store images urls object
  var AdImages = [];

  // form state constants values
  const simple = 1;
  const cars = 2;
  const clothing = 3;
  const shoes = 4;
  const gender = 5;
  const services = 6;
  const housing = 7;
  const moto = 8;

  var createApp = new Vue({
    el: "#create",
    data: {
      cities: [],
      propState: simple,
      prevPropState: simple,
      props: {simple, cars, clothing, shoes, gender, services, housing, moto},
      categories: [],
      categoryId: null,
      form: {},
      data: {
        attributes: {},
      },
      adTypeId: 1,
    },
    methods: {
      advertJSON: function() {
        this.data.imagesURL = AdImages;
        console.log(JSON.parse(JSON.stringify(this.data)));
      },
      adTypeChange: function() {
        var adTypeId = Number($("#adTypes").val());
        console.log(adTypeId == 2);
        if (adTypeId == 2 || adTypeId == 4) {
          this.propState = simple;
          this.form.showPrice = false;
          console.log(adTypeId, "simple");
        } else {
          console.log(createApp.categoryId);
          setPropState(this);
          this.form.showPrice = true;
          initPriceTips();
          console.log(adTypeId, "cars");
        }
        this.data.adTypeId = adTypeId;
      },
      genderChange: function() {
        var genderId = Number($("#clothingGender").val());
        this.form.clothingSizes = this.setClothingSize(genderId);
        this.data.attributes.genderId = genderId;
        // console.log(genderId, this.form.clothingSizes);
      },
      setClothingSize: function(c) {
        switch (c) {
          case 1:
            return this.form.womenClothingSizes;
          case 2:
            return this.form.menClothingSizes;
          case 3:
            return this.form.childClothingSizes;
        }
      },
      changeHousingType: function() {
        this.data.housingTypeId = Number($("#housingTypes").val());
        if (this.data.housingTypeId != 3) {
          this.form.showHousingRoom = true;
        } else {
          this.form.showHousingRoom = false;
        }
      },
    },
    created() {
      axios
        .get("/api/cities")
        .then(res => {
          this.cities = res.data;
          console.log(this.cities);
        })
        .catch(err => {
          console.log(err);
        });
      axios
        .get("/api/form/json_content")
        .then(res => {
          $("#create").show();
          init();
          this.form = res.data;
          // console.log(JSON.stringify(res.data));
        })
        .catch(err => {
          console.log(err.message);
        });
    },
  });

  function resetPropsValues() {
    $(".propSelect").prop("selectedIndex", 0);
    // createApp.data = {};
  }

  $("#phoneNumberInput").on("input", function() {
    createApp.data.tel = phoneNumberFormater(createApp.data.tel);
  });

  function phoneNumberFormater(value) {
    var f = value.replace(/\D/g, "");
    switch (f.length) {
      case 3:
        f = f.replace(/(\d{2})(\d{1})/, "$1-$2");
        break;
      case 4:
        f = f.replace(/(\d{2})(\d{2})/, "$1-$2");
        break;
      case 5:
        f = f.replace(/(\d{2})(\d{2})(\d{1})/, "$1-$2-$3");
        break;
      case 6:
        f = f.replace(/(\d{2})(\d{2})(\d{2})/, "$1-$2-$3");
        break;
      case 7:
        f = f.replace(/(\d{2})(\d{2})(\d{2})(\d{1})/, "$1-$2-$3-$4");
        break;
      case 8:
        f = f.replace(/(\d{2})(\d{2})(\d{2})(\d{2})/, "$1-$2-$3-$4");
        break;
    }
    // f = f.replace(/(\d{2})(\d{2})(\d{2})(\d{1})/, "$1-$2-$3-$4");
    return f;
  }

  $(document).on("input", "#ad-price", function() {
    createApp.data.price = moneyFormater(createApp.data.price);
    // $("#ad-price").val(moneyFormater(this.value))
  });
  function moneyFormater(x) {
    console.log(x.length);
    var val = x.replace(/\D/g, "");
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  function init() {
    initPriceTips();
    $("#category-select").dropdown({
      onChange: function(value, text, $choice) {
        createApp.categoryId = Number(value);
        createApp.data.categoryId = Number(value);
        createApp.form.typesOptions = createApp.form.optionT1;
        console.log(createApp.categoryId);
        setPropState(createApp);
        resetPropsValues();
        createApp.data.attributes = {};
      },
    });

    $("#cityPicker .ui.dropdown").dropdown({
      onChange: function(value, text, $choice) {
        createApp.data.cityId = Number(value);
      },
    });
  }

  function setPropState(app) {
    switch (app.categoryId) {
      case 20: // moto
        app.propState = moto;
        app.form.typesOptions = app.form.optionT2;
        app.form.showAdTypes = true;
        break;
      case 19: // voitures
        app.propState = cars;
        app.form.typesOptions = app.form.optionT2;
        app.form.showAdTypes = true;
        break;
      case 30: // vetements
        app.propState = clothing;
        app.form.typesOptions = app.form.optionT1;
        app.form.showAdTypes = true;
        break;
      case 31: // chaussures
        app.propState = shoes;
        app.form.typesOptions = app.form.optionT1;
        app.form.showAdTypes = true;
        break;
      case 32: // autres modes et bien-etre
      case 33:
      case 34:
        app.form.typesOptions = app.form.optionT1;
        app.form.showAdTypes = true;
        app.propState = gender;
        break;
      case 5: // services
        app.propState = services;
        app.form.showAdTypes = false;
        break;
      case 67: // immobilier
      case 68:
        app.propState = housing;
        app.form.showAdTypes = false;
        break;
      case 58:
      case 60:
        app.propState = simple;
        app.form.showAdTypes = false;
        app.form.showPrice = true;
        app.form.priceLabel = "Salaire";
        break;
      case 59:
      case 61:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 134:
        app.propState = simple;
        app.form.showAdTypes = false;
        app.form.showPrice = false;
        break;
      case 69:
      case 70:
        app.propState = simple;
        app.form.showAdTypes = false;
        break;
      default:
        app.propState = simple;
        app.form.showAdTypes = true;
        app.form.showPrice = true;
        app.form.priceLabel = "Prix";
        break;
    }

    if (app.form.showAdTypes === true) {
      initTypesTips();
    }
    if (app.form.showPrice === true) {
      initPriceTips();
    }
  }

  function initPriceTips() {
    setTimeout(() => {
      $("#ad-price").popup({
        on: "focus",
        position: "bottom left",
        title: "Comment mettre un prix sur l'annonce?",
        content:
          "Quelques information sur comment ecrire le titre de l'annonce etc prix...",
        variation: "wide",
      });
    }, 500);
  }

  function initTypesTips() {
    setTimeout(() => {
      $("#adTypes").popup({
        on: "focus",
        position: "right center",
        title: "Comment choisir le type d'annonce?",
        content:
          "Quelques information sur comment ecrire le titre de l'annonce etc types...",
        variation: "wide",
      });
    }, 500);
  }

  $("#ad-title").popup({
    on: "focus",
    position: "bottom left",
    title: "Comment choisir le titre de mon annonce?",
    content:
      "Quelques information sur comment ecrire le titre de l'annonce etc titre",
    variation: "wide",
  });

  $("#descritpion").popup({
    on: "focus",
    position: "bottom left",
    title: "Comment decrire l'annonce?",
    content:
      "Quelques information sur comment ecrire le titre de l'annonce etc descr...",
    variation: "wide",
  });

  /*
    This part of the code control
    file upload, uploaded files thumbnail
    preview and uploaded files removal
  */
  var readURL = function(input) {
    if (AdImages.length >= 4) {
      return;
    }

    var files = input.files;
    var loopCount = files.length > 4 ? 4 : files.length;

    if (files && files[0]) {
      for (var i = 0; i < loopCount; i++) {
        var file = files[i];

        if (file.size > 10000000) {
          alert("Fichier trop grand, choissisez des images de mois de 10 Mb");
          continue;
        }

        uploadFile(file);

        if (i === 4 || AdImages.length + (i + 1) >= 4) {
          console.log(AdImages.length + (i + 1));
          break;
        }
      }
    }
    console.log(AdImages);
  };

  $(".file-upload").on("change", function() {
    readURL(this);
  });

  $(".upload-button").on("click", function() {
    $(".file-upload").click();
  });

  async function uploadFile(file) {
    var formData = new FormData();
    formData.append("files", file);

    var config = {headers: {"Content-Type": "multipart/form-data"}};

    try {
      const res = await axios.post("/upload", formData, config);
      if (res.data !== null) {
        AdImages.push(res.data);
        var newImg = makeHTMLThumbnail(res.data.thumbnailURL);
        $("#upload-item").before(newImg);

        if (AdImages.length === 4) {
          $("#upload-item").hide();
        }
      }
    } catch (err) {
      console.log(err);
      alert("une erreur s'est produite");
    }
  }

  // handle images deletions click
  $(document).on("click", ".fileuploader-action-remove", function(e) {
    var thumbnailURL = $(e.currentTarget.closest("li"))
      .find("img")
      .attr("src");
    removeImageFromList(AdImages, thumbnailURL);
    removeFileOnServer(thumbnailURL);
    e.currentTarget.closest("li").remove();
    if (AdImages.length < 4) {
      $("#upload-item").show();
    }
    console.log(AdImages);
    $(".file-upload").val("");
  });

  // removeImageFromList remove imageURL object from imagesURL array
  function removeImageFromList(imagesURL, thumbnailURL) {
    for (var i = 0; i < imagesURL.length; i++) {
      if (imagesURL[i].thumbnailURL === thumbnailURL) {
        imagesURL.splice(i, 1);
        break;
      }
    }
  }

  // removeFileOnServer send delete request to delete uploaded image on server
  function removeFileOnServer(thumbnailURL) {
    var fileName = thumbnailURL.split("240x180")[1];
    var img = {fileName};
    console.log(img);
    axios
      .delete(
        "/upload",
        {data: img},
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then(res => {
        console.log(res.data);
      })
      .catch(err => {
        console.log(err.message);
      });
  }

  // makeHTMLThumbnail generate html representation of image thumbnail
  function makeHTMLThumbnail(src) {
    var imgHTML = `<li class="fileuploader-item file-has-popup file-type-image file-ext-jpg">
        <div class="fileuploader-item-inner">
          <div class="type-holder"></div>
          <div class="actions-holder">
            <a
              class="fileuploader-action fileuploader-action-remove"
              title="Supprimer cette photo"
              ><i></i
            ></a>
          </div>
          <div class="thumbnail-holder">
            <div class="fileuploader-item-image">
              <img
                src="${src}"
                draggable="false"
              />
            </div>
            <span class="fileuploader-action-popup"></span>
          </div>
          <div class="content-holder">
            <span>
            </span>
            </div>
          <div class="progress-holder"></div>
        </div>
      </li>`;
    return imgHTML;
  }
});
