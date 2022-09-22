var colorPicker;

$("#controlAddIn").append("<input id='colorpicker'/>");

TriggerBusinessCentral('OnControlReady', null);

function InitializeSpectrum(color, isEditable) {
    colorPicker = $('#colorpicker');
    colorPicker.spectrum({
        color: color,
        beforeShow: () => {
            return isEditable; // return false doens't show the palette
        },
        change: function(color) {               
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnColorchange',[color.toHexString()]);            
        }
    });   
}

function ToggleSpectrum() {    
    colorPicker.spectrum('toggle');    
    return false;
}

function TriggerBusinessCentral(trigger, dataArray) {
    return Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(trigger, dataArray);
}