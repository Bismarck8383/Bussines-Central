controladdin HTML
{
    //RequestedHeight = 400;
    //  MinimumHeight = 300;
    //MaximumHeight = 300;
    //RequestedWidth = 700;
    //MinimumWidth = 700;
    //MaximumWidth = 700;
    VerticalStretch = true;
    HorizontalStretch = true;

    Scripts = 'src/UseHTML/js/Sortable.min.js';

    StyleSheets = 'src/UseHtml/css/estilos.css';
    StartupScript = 'src/UseHTML/js/main.js';
    //RecreateScript = 'recreateScript.js';
    //RefreshScript = 'refreshScript.js';
    // Images = 
    //   'image1.png',
    // 'image2.png';

    event ControlReady();
    event fichamovida(nuevoorden: Text);
    procedure createpage(data: Text);

    //procedure Render(HTML: Text);
}