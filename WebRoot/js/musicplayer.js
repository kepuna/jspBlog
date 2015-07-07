 var audio;

    //1. Hide Pause BUtton
    $('#pause').hide();

    // 5. Initialize Audio
    initAudio($('#playlist li.active'));

    // 2. Initialize function
    function initAudio(element){
        var song = element.attr('song');
        var title = element.text();
        var cover = element.attr('cover');
        var artist = element.attr('artist');

        //3. Create Audio Object
        audio = new Audio('./images/musicplayer/media/'+song);
       
        $('#audio-info .title').text(title);
        $('#audio-info .artist').text(artist);

        // 4. Insert Cover
        $('img.cover').attr('src','./images/musicplayer/cover/'+ cover);
        $('#playlist li.active').removeClass('active');
        element.addClass('active');
    }

    //6 Play button
    $('#play').click(function(){
        audio.play();
        $('#play').hide();
        $('#pause').show();
    });
    //7 Pause button
    $('#pause').click(function(){
        audio.pause();
        $('#pause').hide();
        $('#play').show();
    });
    //9 Next BUtton
    $('#next').click(function(){
    	$('#play').hide();
        $('#pause').show();
        audio.pause();
        var next = $('#playlist li.active').next();
        if(next.length === 0){
            next=$('#playlist li:first-child');
        }
        initAudio(next);
        audio.play();
    });
    //10 Prev Button
    $('#prev').click(function(){
    	audio.pause();
    	$('#play').hide();
        $('#pause').show();
        
        var prev =  $('#playlist li.active').prev();
        if(prev.length === 0){
            prev=$('#playlist li:last-child');
        }
        initAudio(prev);
        audio.play();
    });
    // 11 Volume Control
    $('#volume').change(function(){
        audio.volume = parseFloat(this.value / 10);
    });