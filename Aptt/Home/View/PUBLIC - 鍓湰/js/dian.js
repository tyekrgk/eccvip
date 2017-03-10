function cheusername(url,username,id){
    $.post(url, { username:username,id:id}, function(value) {
        //alert(value);
        var data = eval("("+value+")");
        $('#'+id).html(data['info']);
        color="red";
        if(data['error']==1) color="green";
        $('#'+id).css('color',color);
    });
}