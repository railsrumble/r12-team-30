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
    subtotal = (quantity * price).toFixed(2)

    if $product.length
      console.log("Cart: updating existing product " + product_id)
      if quantity == 0
        $product.remove()
      else
        $product.find(".quantity").html(quantity)
        $product.find(".subtotal").html(subtotal + currency)
    else
      console.log("Cart: adding new product " + product_id)
      if quantity != 0
        $elem = $("<tr data-product=" + product_id + "/>").
          append("<td class='name'>" + name + "</td>").
          append("<td class='price'>" + price + currency + "</td>").
          append("<td class='quantity'>" + quantity  + "</td> ").
          append("<td class='subtotal'>" + subtotal + currency + "</td> ")

        $cart.find("table.products").append($elem)

    total = 0
    $.each($cart.find(".subtotal"), (index, elem) ->
      total += parseFloat($(elem).html()))
    $cart.find(".total .amount").html(total)

  $("td .add").click ->
    product_id = $(this).closest('[data-product]').data('product')
    console.log("Adding product " + product_id)
    changeProductQuantity(product_id, 1)

  $("td .remove").click ->
    product_id = $(this).closest('[data-product]').data('product')
    console.log("Removing product " + product_id)
    changeProductQuantity(product_id, -1)

  $("#new_order").submit ->
    product_ids = []
    product_quantities = []
    $.each($cart.find("[data-product]"), (index, elem) ->
      $elem = $(elem)
      product_ids.push($elem.data('product'))
      product_quantities.push(parseInt($elem.find('.quantity').html()))
    )

    console.log("Products ids: " + product_ids)
    console.log("P.Quantities: " + product_quantities)

    $("#order_products_ids").attr('value', product_ids)
    $("#order_products_quantities").attr('value', product_quantities)
