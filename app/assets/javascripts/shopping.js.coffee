$ ->

  changeProductQuantity = (product_id, delta) ->
    $product_container = $('table.products [data-product=' + product_id + ']')
    $quantity = $product_container.find('.quantity')
    price = $product_container.find('.price').html()
    name = $product_container.find('.name').html()

    quantity = parseInt($quantity.html())
    quantity += delta
    quantity = 0 if quantity < 0

    updateCart(product_id, name, price, quantity)
    $quantity.html(quantity)

  $cart = $("section.cart")

  updateCart = (product_id, name, price, quantity) ->
    $product = $cart.find("[data-product=" + product_id + "]")
    currency = $('.total span.currency').html()

    if $product.length
      if quantity == 0
        $product.remove()
      else
        $product.find(".quantity").html(quantity)
        $product.find(".subtotal").html(quantity * price + currency)
    else
      if quantity != 0
        $elem = $("<tr data-product=" + product_id + "/>").
          append("<td class='name'>" + name + "</td>").
          append("<td class='price'>" + price + currency + "</td>").
          append("<td class='quantity'>" + quantity  + "</td> ").
          append("<td class='subtotal'>" + quantity * price + currency+ "</td> ")

        $cart.find("table.products").append($elem)

    total = 0
    $.each($cart.find(".subtotal"), (index, elem) ->
      total += parseFloat($(elem).html()))
    $cart.find(".total .amount").html(total)

  $("td .add").click ->
    console.log("add")
    product_id = $(this).closest('[data-product]').data('product')
    changeProductQuantity(product_id, 1)

  $("td .remove").click ->
    console.log("remove")
    product_id = $(this).closest('[data-product]').data('product')
    changeProductQuantity(product_id, -1)
