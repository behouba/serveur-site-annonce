Vue.options.delimiters = ["{", "}"];

const simple = 1;
const cars = 2;
const clothing = 3;
const shoes = 4;
const gender = 5;
const services = 6;
const housing = 7;
const moto = 8;

var optionT1 = [
  {id: 1, label: "Vente"},
  {id: 2, label: "Recherche"},
  {id: 3, label: "Troc"},
  {id: 4, label: "Don"},
];
var optionT2 = [{id: 1, label: "Vente"}, {id: 2, label: "Recherche"}];
var obj = {
  showAdTypes: false,
  typesOptions: optionT1,
  titleLabel: "Titre de l'annonce",
  description: "",
  showPrice: true,
  priceLabel: "Prix",
  clothingTypes: [
    {id: 1, label: "Femmes"},
    {id: 2, label: "Hommes"},
    {id: 3, label: "Enfants"},
  ],
  clothingSizes: [],
  shoesTypes: [
    {id: 1, label: "Femmes"},
    {id: 2, label: "Hommes"},
    {id: 3, label: "Enfants"},
  ],
  shoesSizes: makeShoesSizes(),
  genders: [{id: 1, label: "Feminin"}, {id: 2, label: "Masculin"}],
  services: [
    {id: 1, label: "Cours a domicile"},
    {id: 2, label: "Cours a domicile"},
    {id: 3, label: "Cours a domicile"},
  ],
  carsYears: makeYearsArray(),
  carsBrands: ["Toyota", "Tata", "Nissan", "Hyundai"],
  housingTypes: [
    {id: 1, label: "Maison"},
    {id: 2, label: "Appartement"},
    {id: 3, label: "Terrain"},
  ],
};

var createApp = new Vue({
  el: "#create",
  data: {
    propState: simple,
    prevPropState: simple,
    props: {simple, cars, clothing, shoes, gender, services, housing, moto},
    categories: [],
    form: obj,
    data: {},
    adTypeId: 1,
  },
  methods: {
    advertJSON: function() {
      console.log(this.data);
    },
  },
  created() {
    axios
      .get("/api/categories/")
      .then(res => {
        console.log(res.data);
        this.categories = res.data;
        $("#create").show();
        init();
      })
      .catch(err => {
        console.log(err.message);
      });
  },
});

function setClothingSize(c) {
  switch (c) {
    case 1:
      return ["taille", "dames", "ici"];
    case 2:
      return ["taille", "hommes", "ici"];
    case 3:
      return ["taille", "enfants", "ici"];
  }
}

function loadDropdown() {
  $(".ui.dropdown").dropdown();
}
function clearPropState() {
  $("#clothingTypes").dropdown("clear");
  $("#vSizes").dropdown("clear");
  $("#car-brand").dropdown("clear");
}
function init() {
  // $(".ui.dropdown").dropdown();
  $("#clothingTypes").dropdown();
  $("#vSizes").dropdown();
  $("#car-brand").dropdown();

  $("#clothingTypes").dropdown({
    onChange: function(value, text, $choice) {
      createApp.form.vTypeId = Number(value);
      createApp.form.clothingSizes = setClothingSize(createApp.form.vTypeId);
      console.log(createApp.form.clothingSizes);
      reload();
    },
  });

  $("#category-select").dropdown({
    onChange: function(value, text, $choice) {
      createApp.data.categoryId = Number(value);
      console.log(createApp.data.categoryId);
      createApp.form.typesOptions = optionT1;
      setPropState(createApp);
      reload();
    },
  });
  $("#adType").dropdown({
    onChange: function(value, text, $choice) {
      var adTypeId = Number(value);
      console.log(adTypeId);
      if (adTypeId == 2 || adTypeId == 4) {
        createApp.propState = 1;
        createApp.form.showPrice = false;
      } else {
        setPropState(createApp);
        createApp.form.showPrice = true;
      }
      createApp.data.adTypeId = adTypeId;
    },
  });
}

function reload() {
  setTimeout(() => {
    init();
  }, 200);
}

function makeYearsArray() {
  var arr = [];
  var d = 2019;
  for (var i = d; i > 1960; i--) {
    arr.push(i);
  }
  arr.push("avant 1960");
  return arr;
}

function makeShoesSizes() {
  var arr = [];
  for (var i = 16; i < 50; i++) {
    arr.push(i);
  }
  arr.push("50 et plus");
  return arr;
}

function setPropState(app) {
  switch (app.data.categoryId) {
    case 20: // moto
      app.propState = moto;
      app.form.typesOptions = optionT2;
      app.form.showAdTypes = true;
      break;
    case 19: // voitures
      app.propState = cars;
      app.form.typesOptions = optionT2;
      app.form.showAdTypes = true;
      break;
    case 30: // vetements
      app.propState = clothing;
      break;
    case 31: // chaussures
      app.propState = shoes;
      break;
    case 32:
    case 33:
    case 34:
      app.propState = gender;
      break;
    case 5:
      app.propState = services;
      app.form.showAdTypes = false;
      break;
    case 67:
    case 68:
      app.propState = housing;
      app.form.showAdTypes = false;
      break;
    case 58:
    case 60:
      app.propState = 1;
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
      app.form.showAdTypes = false;
      app.form.showPrice = false;
      break;
    case 69:
      app.form.showAdTypes = false;
      break;
    default:
      app.propState = 1;
      app.form.showAdTypes = true;
      app.form.showPrice = true;
      app.form.priceLabel = "Prix";
      break;
  }
}
