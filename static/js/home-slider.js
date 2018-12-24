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

var HomeSliderApp = new Vue({
  el: "#eventsSlide",
  data: {
    slides: slidesData,
  },
  methods: {},
  created: function() {
    $("#eventsSlide").css("visibility", "visible");
    $("#eventsSlide").skdslider({
      slideSelector: ".slide",
      delay: 5000,
      animationSpeed: 2000,
      animationType: "fading",
    });
  },
});
