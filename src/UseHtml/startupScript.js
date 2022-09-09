HTMLContainer = document.getElementById("controlAddIn");


/*Conectamos con business central, en el triger le mandamos dos paramatros 
donde pasamos el nombre del metodo y el argumento */
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady");


