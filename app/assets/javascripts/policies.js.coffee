Policy = () ->
Policy.prototype.count_collection = ->
  product_ids = []
  $('.product:checked').each( () ->
    product_ids.push $(this).val()
  )
  $.ajax({
    url: '/policies/count',
    data: "product_ids="+product_ids,
    method: "post"
  }).done( (result) ->
    console.debug result
    $("#collection").html(result+"zł")
  )


$ ->
  policy = new Policy()
  $(".product").change ->
    console.debug policy.count_collection()
