
jQuery ->

  emptyOption = $('<option />').attr('value', '')

  $('#lap_track_id').parent().hide()
  tracks = $('#lap_track_id').html()
  console.log(tracks)
  console.log(gon.sim)

  $('#lap_simulator_id').change ->
    simulator = $('#lap_simulator_id :selected').text()
    $('#lap_track_id').show()

    options = $(tracks).filter("optgroup[label='#{simulator}']").prepend(emptyOption).html()
    console.log(options)
    if options
      $('#lap_track_id').html(options)
      $('#lap_track_id').parent().show()
    else
      $('#lap_track_id').empty()
      $('#lap_track_id').parent().hide()
  
  
  $('#lap_car_id').parent().hide()
  cars = $('#lap_car_id').html()
  console.log(cars)

  $('#lap_track_id').change ->
    track = $('#lap_track_id :selected').text()
    
    options = $(cars).filter("optgroup[label='#{track}']").prepend(emptyOption).html()
    console.log(options)
    if options
      $('#lap_car_id').html(options)
      $('#lap_car_id').parent().show()
    else
      $('#lap_car_id').empty()
      $('#lap_car_id').parent().hide()


  if gon.sim
    $('#lap_simulator_id').change ->
    simulator = gon.sim
    $('#lap_track_id').show()
    options = $(tracks).filter("optgroup[label='#{simulator}']").prepend(emptyOption).html()
    console.log(options)
    if options
      $('#lap_track_id').html(options)
      $('#lap_track_id').parent().show()
    else
      $('#lap_track_id').empty()
      $('#lap_track_id').parent().hide()

  if gon.track 
    $('#lap_track_id').change ->
    track = gon.track
    
    options = $(cars).filter("optgroup[label='#{track}']").prepend(emptyOption).html()
    console.log(options)
    if options
      $('#lap_car_id').html(options)
      $('#lap_car_id').parent().show()
    else
      $('#lap_car_id').empty()
      $('#lap_car_id').parent().hide()

