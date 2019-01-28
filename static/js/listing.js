var ListingApp = new Vue({
  el: "#listing",
  data: {
    isViewGrid: true,
  },
  methods: {
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
  created: function() {},
});

// advert sorting dropdown
$("#sorting-drodown").dropdown();
