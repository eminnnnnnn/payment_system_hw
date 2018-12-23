function confirm_payment(data) {
  var result = document.getElementById("check_list");
  let check_string = "<p> Payment Service: ePay <br/><br/> Payment Account: " + data.payment_account + "<br/><br/>" + "Total: " + data.payment_summa + "<br/><br/>";
  check_string += "Payment Status: " + data.payment_status + "<br/><br/>" + "Payment Date: " + Date() + "</p>";
  result.innerHTML = check_string;
  confirm_image();
}
$(document).ready(function(){
  $("#confirm_button").on("ajax:success",(event)=>{
    [data, status, xhr] = event.detail;
    console.log(data,status,xhr);
    confirm_payment(data);
  })
})
function confirm_image() {
  document.getElementById("confirm_button").setAttribute("hidden","hidden");
  document.getElementById("cancel_button").setAttribute("hidden","hidden");
  var div_with_image = document.getElementById("confirm_image");
  div_with_image.innerHTML = "<svg id='gal_image'><polyline points='0,55 50,100 110,0' stroke-width='3' fill='rgb(255,255,255)' stroke='rgb(3,188,59)'/></svg>"
}
