// Diagnostics Script to Debug in Console
jQuery.d = function(item) {
  if (console.info && console.log) {
    if (typeof item == "object") {
      console.log(item)
    } else {
      var date = new Date();
      console.info(date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + " [" + item + "] ")
    }
  }
};