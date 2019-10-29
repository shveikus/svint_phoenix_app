// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
// import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import 'bootstrap'
import 'bootstrap4-notify'
import $ from 'jquery'
import css from '../css/app.scss'
import '../../deps/phoenix_html'
window.jQuery = $
window.$ = $
function ajaxHandler(e) {
  e.preventDefault()
  var post_url = $(this).attr('action') //get form action url
  var form_data = $(this).serialize() //Encode form elements for submission
  $.post(post_url, form_data, function(response) {
    // use $.notify for Bootstrap-Notify
    $.notify({
      message: response.message,
      offset: 60,
      type: 'success',
    })
    $('.cart-count').text(response.cart_count)
  })
}
var ajaxCart = {
  init: function() {
    $(function() {
      $('.cart-form').on('submit', ajaxHandler)
    })
  },
}
// init ajax
ajaxCart.init()