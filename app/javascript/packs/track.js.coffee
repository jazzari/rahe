jQuery ->
  $('#lap_car_id').parent().hide()
  cars = $('#lap_car_id').html()
  console.log(cars)

  $('#lap_track_id').change ->
    track = $('#lap_track_id :selected').text()
    
    options = $(cars).filter("optgroup[label='#{track}']").html()
    console.log(options)
    if options
      $('#lap_car_id').html(options)
      $('#lap_car_id').parent().show()
    else
      $('#lap_car_id').empty()
      $('#lap_car_id').parent().hide()
  
  