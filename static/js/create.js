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
var carsBrands = [
  {
    value: "ACURA",
    label: "Acura",
  },
  {
    value: "ALFA",
    label: "Alfa Romeo",
  },
  {
    value: "AMC",
    label: "AMC",
  },
  {
    value: "ASTON",
    label: "Aston Martin",
  },
  {
    value: "AUDI",
    label: "Audi",
  },
  {
    value: "AVANTI",
    label: "Avanti",
  },
  {
    value: "BENTL",
    label: "Bentley",
  },
  {
    value: "BMW",
    label: "BMW",
  },
  {
    value: "BUICK",
    label: "Buick",
  },
  {
    value: "CAD",
    label: "Cadillac",
  },
  {
    value: "CHEV",
    label: "Chevrolet",
  },
  {
    value: "CHRY",
    label: "Chrysler",
  },
  {
    value: "DAEW",
    label: "Daewoo",
  },
  {
    value: "DAIHAT",
    label: "Daihatsu",
  },
  {
    value: "DATSUN",
    label: "Datsun",
  },
  {
    value: "DELOREAN",
    label: "DeLorean",
  },
  {
    value: "DODGE",
    label: "Dodge",
  },
  {
    value: "EAGLE",
    label: "Eagle",
  },
  {
    value: "FER",
    label: "Ferrari",
  },
  {
    value: "FIAT",
    label: "FIAT",
  },
  {
    value: "FISK",
    label: "Fisker",
  },
  {
    value: "FORD",
    label: "Ford",
  },
  {
    value: "FREIGHT",
    label: "Freightliner",
  },
  {
    value: "GEO",
    label: "Geo",
  },
  {
    value: "GMC",
    label: "GMC",
  },
  {
    value: "HONDA",
    label: "Honda",
  },
  {
    value: "AMGEN",
    label: "HUMMER",
  },
  {
    value: "HYUND",
    label: "Hyundai",
  },
  {
    value: "INFIN",
    label: "Infiniti",
  },
  {
    value: "ISU",
    label: "Isuzu",
  },
  {
    value: "JAG",
    label: "Jaguar",
  },
  {
    value: "JEEP",
    label: "Jeep",
  },
  {
    value: "KIA",
    label: "Kia",
  },
  {
    value: "LAM",
    label: "Lamborghini",
  },
  {
    value: "LAN",
    label: "Lancia",
  },
  {
    value: "ROV",
    label: "Land Rover",
  },
  {
    value: "LEXUS",
    label: "Lexus",
  },
  {
    value: "LINC",
    label: "Lincoln",
  },
  {
    value: "LOTUS",
    label: "Lotus",
  },
  {
    value: "MAS",
    label: "Maserati",
  },
  {
    value: "MAYBACH",
    label: "Maybach",
  },
  {
    value: "MAZDA",
    label: "Mazda",
  },
  {
    value: "MCLAREN",
    label: "McLaren",
  },
  {
    value: "MB",
    label: "Mercedes-Benz",
  },
  {
    value: "MERC",
    label: "Mercury",
  },
  {
    value: "MERKUR",
    label: "Merkur",
  },
  {
    value: "MINI",
    label: "MINI",
  },
  {
    value: "MIT",
    label: "Mitsubishi",
  },
  {
    value: "NISSAN",
    label: "Nissan",
  },
  {
    value: "OLDS",
    label: "Oldsmobile",
  },
  {
    value: "PEUG",
    label: "Peugeot",
  },
  {
    value: "PLYM",
    label: "Plymouth",
  },
  {
    value: "PONT",
    label: "Pontiac",
  },
  {
    value: "POR",
    label: "Porsche",
  },
  {
    value: "RAM",
    label: "RAM",
  },
  {
    value: "REN",
    label: "Renault",
  },
  {
    value: "RR",
    label: "Rolls-Royce",
  },
  {
    value: "SAAB",
    label: "Saab",
  },
  {
    value: "SATURN",
    label: "Saturn",
  },
  {
    value: "SCION",
    label: "Scion",
  },
  {
    value: "SMART",
    label: "smart",
  },
  {
    value: "SRT",
    label: "SRT",
  },
  {
    value: "STERL",
    label: "Sterling",
  },
  {
    value: "SUB",
    label: "Subaru",
  },
  {
    value: "SUZUKI",
    label: "Suzuki",
  },
  {
    value: "TESLA",
    label: "Tesla",
  },
  {
    value: "TOYOTA",
    label: "Toyota",
  },
  {
    value: "TRI",
    label: "Triumph",
  },
  {
    value: "VOLKS",
    label: "Volkswagen",
  },
  {
    value: "VOLVO",
    label: "Volvo",
  },
  {
    value: "YUGO",
    label: "Yugo",
  },
];
var obj = {
  showAdTypes: false,
  typesOptions: optionT1,
  titleLabel: "Titre de l'annonce",
  description: "",
  showPrice: true,
  priceLabel: "Prix",
  showHousingRoom: false,
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
  menClothingSizes: ["XS", "S", "M", "L", "XL", "XXL", "XXXL et plus"],
  womenClothingSizes: [32, 34, 36, 38, 40, 42, 44, 46, 48, "50 et plus"],
  childClothingSizes: [
    "3 ans",
    "4 ans",
    "5 ans",
    "6 ans",
    "8 ans",
    "10 ans",
    "12 ans",
    "14 ans",
    "16 ans",
  ],
  services: [
    {id: 1, label: "Cours a domicile"},
    {id: 2, label: "Cours a domicile"},
    {id: 3, label: "Cours a domicile"},
  ],
  carsYears: makeYearsArray(),
  carsBrands: carsBrands,
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
    categoryId: null,
    form: obj,
    data: {},
    adTypeId: 1,
  },
  methods: {
    advertJSON: function() {
      console.log(this.data);
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
        console.log(adTypeId, "cars");
      }
      this.data.adTypeId = adTypeId;
    },
    genderChange: function() {
      var genderId = Number($("#clothingGender").val());
      this.form.clothingSizes = this.setClothingSize(genderId);
      console.log(genderId, this.form.clothingSizes);
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

function resetPropsValues() {
  $(".propSelect").prop("selectedIndex", 0);
  createApp.data = {};
}

function init() {
  $("#category-select").dropdown({
    onChange: function(value, text, $choice) {
      createApp.categoryId = Number(value);
      createApp.form.typesOptions = optionT1;
      console.log(createApp.categoryId);
      setPropState(createApp);
      resetPropsValues();
    },
  });
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
  switch (app.categoryId) {
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
}
