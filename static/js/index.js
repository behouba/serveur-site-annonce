// home page custom javascript code
Vue.options.delimiters = ["{", "}"];
// setting Vue delimiters

// home vue instance
var HeaderApp = new Vue({
  el: "#header",
  data: {
    loginState: 1,
    city: "",
    cities: "",
    eRegName: "",
    eRegEmail: "",
    eRegPass: "",
    requestErrorStatus: 0,
    loginEmail: "",
    loginPass: "",
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
        .post("/api/auth/email_reg", userData)
        .then(res => {
          $("#registrationBtn").prop("disabled", false);
          $("#registrationBtn").removeClass("loading");
          console.log(res);
          this.requestErrorStatus = 0;
          window.location.reload();
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
    emailLogin: function() {
      $("#loginBtn").prop("disabled", true);
      $("#loginBtn").addClass("loading");
      const userData = {
        email: this.loginEmail,
        password: this.loginPass,
      };
      axios
        .post("/api/auth/email_login", userData)
        .then(res => {
          $("#loginBtn").prop("disabled", false);
          $("#loginBtn").removeClass("loading");
          console.log(res);
          this.requestErrorStatus = 0;
          window.location.reload();
        })
        .catch(err => {
          $("#loginBtn").prop("disabled", false);
          $("#loginBtn").removeClass("loading");
          console.log(err.response);
          switch (err.response.status) {
            case 401:
              $("#loginForm").addClass("error");
              break;
            case 500:
              console.log("serveur side error");
              break;
          }
          //
        });
      console.log(this.loginEmail, this.loginPass);
    },
    logout: function() {
      axios
        .delete("/api/auth/logout")
        .then(res => {
          console.log(res);
          window.location.reload();
        })
        .catch(err => {
          console.log(err.response);
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
  },
  created: function() {
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

  // location choice element
  $("#location-selector").click(function() {
    $("#location-modal").modal("show");
  });

  // location dropdown modal
  $("#location-modal .ui.dropdown").dropdown({
    values: HeaderApp.cities,
    onChange: function(value, text, $choice) {
      HeaderApp.city = value;
    },
  });

  // function to fire when user change location
  $("#validate-location").click(function() {
    window.location.href = "/" + HeaderApp.city;
  });

  $(".menu .item").tab();

  $("#loginModal").modal({
    onHidden: function() {
      HeaderApp.loginState = 1;
    },
  });
}
