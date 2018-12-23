// home page custom javascript code

// setting Vue delimiters
Vue.options.delimiters = ["{", "}"];

var slidesData = [
  {
    title: "",
    image: "https://cdn.wallpapersafari.com/98/81/sDm6AZ.jpg",
    link: "",
    desc: "",
  },
  {
    title: "",
    image:
      "https://cdn.allwallpaper.in/wallpapers/1680x1050/12708/nature-beach-palm-trees-palms-tropics-1680x1050-wallpaper.jpg",
    link: "",
    desc: "",
  },
];

var dumpImg = [
  "https://scontent-frt3-1.cdninstagram.com/vp/3f3221c8ef1499170f6fb4cf1fdc1b3a/5C921356/t51.2885-15/e35/45510151_2352295998132462_5450872102550480899_n.jpg",
  "https://svetofor.info/images/detailed/133/sony-ps4-igrovaya-pristavka-sony-playstation-4-pro-1tb-chernyy-igra-fifa-18-icon-edition-1.jpg",
  "http://pa1.narvii.com/6630/24663444ead34a17b3ed0031e183b0b16595dcc7_hq.gif",
  "https://i.ytimg.com/vi/9vx69Pe7Ncs/maxresdefault.jpg",
  "https://www.indiewire.com/wp-content/uploads/2015/07/soul-eater-1.jpg",
  "https://media.comicbook.com/2016/12/soul-eater-218746-1280x0.jpg",
  "https://www.gamepretty.com/wp-content/uploads/2018/10/nintendo-switch-6.01-update-01.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/51qiZgs22mL._SX425_.jpg",
];

// home vue instance
var VueApp = new Vue({
  el: "#home",
  data: {
    slides: slidesData,
    images: dumpImg,
    isViewGrid: true,
    loginState: 3,
    city: "",
    cities: "",
    eRegName: "",
    eRegEmail: "",
    eRegPass: "",
    requestErrorStatus: 0,
  },
  methods: {
    emaiRegistration: function() {
      $("#registrationBtn").prop("disabled", true);
      $("#registrationBtn").addClass("loading");
      const userData = {
        name: this.eRegName,
        email: this.eRegEmail,
        password: this.eRegPass,
      };
      axios
        .post("/api/auth/email", userData)
        .then(res => {
          $("#registrationBtn").prop("disabled", false);
          $("#registrationBtn").removeClass("loading");
          console.log(res);
          this.requestErrorStatus = 0;
        })
        .catch(err => {
          $("#registrationBtn").prop("disabled", false);
          $("#registrationBtn").removeClass("loading");
          console.log(err.response);
          switch (err.response.status) {
            case 400:
              this.requestErrorStatus = err.response.data.errCode;
              break;
            case 409:
              this.requestErrorStatus = 4;
              console.log("email address already in use");
              break;
            case 500:
              console.log("serveur side error");
              break;
          }
          //
        });
    },
    showEmailRegistraion: function() {
      this.loginState = 3;
    },
    showEmailLogin: function() {
      this.loginState = 2;
    },
    showMainLogin: function() {
      this.loginState = 1;
    },
    showPassRecovery: function() {
      this.loginState = 4;
    },
    showLoginModal: function() {
      $("#loginModal").modal("show");
    },
    setViewToGrid: function() {
      this.isViewGrid = true;
      $("#list-view-btn").removeClass("active");
      $("#grid-view-btn").addClass("active");
    },
    setViewToList: function() {
      this.isViewGrid = false;
      $("#grid-view-btn").removeClass("active");
      $("#list-view-btn").addClass("active");
    },
  },
  created: function() {
    $("#home").show();
    axios.get("/api/cities").then(res => {
      this.cities = res.data;
      initSemanticUI();
    });
  },
});

function initSemanticUI() {
  // categories selection
  $("#category-select").dropdown({
    allowCategorySelection: true,
    onChange: function(value, text, $choice) {
      console.log(value, text, $choice);
      var path =
        $choice[0].getAttribute("data-c-path") === null
          ? $choice[0].getAttribute("data-sc-path")
          : $choice[0].getAttribute("data-c-path");
      console.log(path);
      window.location.href = path;
    },
  });

  $("subcat-select").dropdown({
    onChange: function(value, text, $choice) {
      console.log(value, text, $choice);
      console.log($choice[0].attributes.data - sc - path.nodeValue);
    },
  });
  // navbar sticky part
  $("#sticky-navbar").sticky({
    context: "body",
    setSize: false,
  });

  // user menu dropdown
  $("#user-menu").dropdown({
    action: function(text, value, element) {
      element.click();
    },
    on: "hover",
  });

  // activation of card favoris popup
  $(".heart.icon").popup();
  $(".heart.icon").click(function() {
    console.log("add to favorite");
  });
  // advert sorting dropdown
  $("#sorting-drodown").dropdown();

  // location choice element
  $("#location-selector").click(function() {
    $("#location-modal").modal("show");
  });

  // location dropdown modal
  $("#location-modal .ui.dropdown").dropdown({
    values: VueApp.cities,
    onChange: function(value, text, $choice) {
      VueApp.city = value;
    },
  });

  // function to fire when user change location
  $("#validate-location").click(function() {
    window.location.href = "/" + VueApp.city;
    // $("#city-name").text(city);
  });

  $(".menu .item").tab();

  $("#loginModal").modal({
    onHidden: function() {
      VueApp.loginState = 1;
    },
  });
}
