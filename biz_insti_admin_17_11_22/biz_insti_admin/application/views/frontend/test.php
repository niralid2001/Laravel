<html>
  <head>
    <title>Hls.js demo - basic usage</title>
  </head>

  <body>
    <script src="<?php echo base_url();?>assets/js/hls/hls.js"></script>

    <center>
      <h1>Hls.js demo - basic usage</h1>
      <video height="600" id="video" controls></video>
    </center>

    <script>
      var video = document.getElementById('video');
      if (Hls.isSupported()) {
        var hls = new Hls({
          debug: true,
        });
        hls.loadSource('http://localhost/bizzdevelopment/update/uploads/video/sample_3840x21601.mp4');
        hls.attachMedia(video);
        hls.on(Hls.Events.MEDIA_ATTACHED, function () {
          video.muted = true;
          video.play();
        });
      }
      // hls.js is not supported on platforms that do not have Media Source Extensions (MSE) enabled.
      // When the browser has built-in HLS support (check using `canPlayType`), we can provide an HLS manifest (i.e. .m3u8 URL) directly to the video element through the `src` property.
      // This is using the built-in support of the plain video element, without using hls.js.
      else if (video.canPlayType('application/vnd.apple.mpegurl')) {
        video.src = 'http://localhost/bizzdevelopment/update/uploads/video/sample_3840x21601.mp4';
        video.addEventListener('canplay', function () {
          video.play();
        });
      }
    </script>
  </body>
</html>