qBinding = {}

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            qBinding.Close();
            break;
    }
});

$(document).ready(function(){

    window.addEventListener('message', function(event){
        var eventData = event.data;

        if (eventData.action == "openBinding") {
            qBinding.Open(eventData);
        }
    });
});

$(document).on('click', '.save-bindings', function(e){
    e.preventDefault();

    var keyData = {}
    keyData['F5'] = [$("#command-F5").val(), $("#argument-F5").val()]
    keyData['F6'] = [$("#command-F6").val(), $("#argument-F6").val()]
    keyData['F7'] = [$("#command-F7").val(), $("#argument-F7").val()]

    

    $.post('https://qb-commandbinding/save', JSON.stringify({
        keyData: keyData
    }));
});

qBinding.Open = function(data) {
    $(".container").fadeIn(150);

    $.each(data.keyData, function(id, keyData){
        var commandString = $(".keys").find("[data-key='" + id + "']").find('#command-'+id)
        var argumentString = $(".keys").find("[data-key='" + id + "']").find('#argument-'+id)

        if (keyData.command != null) {
            $(commandString).val(keyData.command)
        }
        if (keyData.argument != null) {
            $(argumentString).val(keyData.argument)
        }
    });
}

qBinding.Close = function() {
    $(".container").fadeOut(150);
    $.post('https://qb-commandbinding/close');
}