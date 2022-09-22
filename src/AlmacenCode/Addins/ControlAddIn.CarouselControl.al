controladdin "calendario"
{
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 600;
    Scripts = './src/AlmacenCode/calendar/main.js';
    StartupScript = './src/AlmacenCode/calendar/startup.js';
    StyleSheets = './src/AlmacenCode/calendar/main.css';
    event OnStartup();
    procedure SetCalendarData(Data: JsonObject; workDate: Text; dataSin: JsonObject);
    event EventModified(evento: text; inicio: text; fin: Text; eventId: Text);
    event EventReceived(evento: text; inicio: text; fin: Text; eventId: Text);
}
controladdin "Color Picker"
{
    RequestedHeight = 200;
    MinimumHeight = 200;
    MaximumHeight = 200;
    RequestedWidth = 400;
    MinimumWidth = 400;
    MaximumWidth = 400;
    VerticalShrink = true;
    VerticalStretch = true;
    HorizontalShrink = true;
    HorizontalStretch = true;
    Scripts =
        './src/AlmacenCode/ColorPicker/js/.lib/jquery.min.js',
        './src/AlmacenCode/ColorPicker/js/.lib/spectrum.js',
        './src/AlmacenCode/ColorPicker/js/colorPicker.js';

    StyleSheets = './src/AlmacenCode/ColorPicker/css/spectrum.css';
    StartupScript = './src/AlmacenCode/ColorPicker/js/colorPicker.js';

    event OnControlReady();
    event OnColorchange(Color: text);

    procedure InitializeSpectrum(color: Text; isEditable: Boolean);

    procedure ToggleSpectrum()
}
controladdin "BarcodeScanner"
{
    HorizontalStretch = true;
    VerticalStretch = true;
    RequestedHeight = 320;

    Scripts = './src/AlmacenCode/BarcodeScanner/quagga.min.js';

    StartupScript = './src/AlmacenCode/BarcodeScanner/startup.js';
    event OnStartup();
    procedure InitScanner();
    event Scanner(Barcode: text);
}
controladdin "CreateSound"
{
    HorizontalShrink = true;
    HorizontalStretch = true;
    MinimumHeight = 1;
    MinimumWidth = 1;
    RequestedHeight = 1;
    RequestedWidth = 1;
    VerticalShrink = true;
    VerticalStretch = true;
    Scripts = './src/AlmacenCode/sound/sound.js';

    procedure CreateSound(Frequency: Integer; Duration: Integer);

    procedure beep();

    event ControlAddInReady();
}
controladdin "almacen"
{
    RequestedHeight = 700;
    RequestedWidth = 850;

    Scripts = './src/AlmacenCode/almacen/jspanel.hint.js', './src/AlmacenCode/almacen/jspanel.js', './src/AlmacenCode/almacen/jspanel.hint.min.js', './src/AlmacenCode/almacen/TweenMax.min.js', './src/AlmacenCode/almacen/Draggable.min.js', './src/AlmacenCode/almacen/sweetalert2.all.min.js';
    StartupScript = './src/AlmacenCode/almacen/startup.js';
    StyleSheets = './src/AlmacenCode/almacen/main.css', './src/AlmacenCode/almacen/jspanel.css';

    event iniciaplano();
    event binclick(ubicacion: text);
    event dropped(palert: text; ubicacion: text);
    procedure drawmap(data: text);
    procedure showpanel(headerdata: text; contentdata: text);
    procedure drawbackground(data: text);
    procedure metezoom();
}

controladdin "Voice read"
{
    MaximumHeight = 1;
    MinimumHeight = 1;
    MaximumWidth = 1;
    MinimumWidth = 1;
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = './src/AlmacenCode/voice/script.js';

    event ReadyVoice()
    procedure stoprecording();
    procedure startrecording();
    procedure speak(listenTxt: Text);

    event voice(listenedText: Text)
}
