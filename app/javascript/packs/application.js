// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).on('turbolinks:load', function () {
  let $search_form = $('#search_form')
  let $genre_select = $('select#genre_id', $search_form)
  let $title_select = $('select#title', $search_form)

  function updateTitleSelect(genre_id) {
    $.ajax({
      url: '/api/books',
      data: { genre_id },
      success: function (data) {
        console.log(data)
        $('option', $title_select).remove() // 最初にoptionを空にする

        // APIからのレスポンス（本の情報の配列）を処理する
        data.forEach((book) => {
          let option = $('<option/>') // 新しくoptionタグを生成
          option.attr({ value: book.title })
          option.text(book.title) // 必要な情報を更新
          $title_select.append(option)
        })
      }
    })
  }

  $genre_select.on('change', function() {
    const option = $('option:selected', this)

    if (option) {
      updateTitleSelect(option.val())
    }
  })
})