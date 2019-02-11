$(document).ready ->
    $('header .alert button').click ->
        $(this).parent().fadeOut(300)
