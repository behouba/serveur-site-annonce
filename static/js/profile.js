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

var myAccountApp = new Vue({
  el: "#my-account",
  data: {
    images: dumpImg,
    adToRemove: "",
    showActivesAds: true,
  },
  methods: {
    showRemoveAdModal(ad) {
      this.adToRemove = ad;
      $("#removeAdModal").modal("show");
    },
    showActiv() {
      $("#offlineAds").removeClass("active");
      $("#onlineAds").addClass("active");
      this.showActivesAds = true;
    },
    showNonActiv() {
      $("#onlineAds").removeClass("active");
      $("#offlineAds").addClass("active");
      this.showActivesAds = false;
    },
    showAdReactivationModal() {
      $("#adReactivationModal").modal("show");
    },
  },
});
$("#removeAdModal").modal();

$(".ui.rating")
  .rating({
    initialRating: 5,
    maxRating: 5,
  })
  .rating("disable");
$(".ui.checkbox").checkbox();

$("#selectAllMsg").checkbox();
$("#removeAdModal").modal();

$("#selectLocation").dropdown();
$("#profilePicUpdate").dropdown();
$(".ui.checkbox").checkbox();
