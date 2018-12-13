$(document).on('turbolinks:load',function(){
  $('.add-song-to-playlist').on('submit',function(e){
    e.preventDefault();
    song_id = $('#song_id').val();
    playlist_id = $('#playlist_id').val();
    user_id = $('#user_id').val();
    url = $('.add-song-to-playlist form').attr('action');

    $.ajax({
      type: 'post',
      url: url,
      data: {song_id: song_id, playlist_id: playlist_id, user_id: user_id},
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $('.notice').html(data.status);
        setTimeout(function(){
          $('#add_playlist').modal('hide')
          $('.notice').html('');
        },1000);
      },
      error: function(data) {
        $('.notice').html(data);
      }
    });
  });
});
