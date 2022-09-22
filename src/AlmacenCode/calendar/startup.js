
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnStartup')

window.SetCalendarData = function (data,workdate,dataSin) {
  try {    
    var div = document.getElementById('controlAddIn');    
    var noassigned = "";        
    //
    div.innerHTML += `<div id='wrap'>
    <div id='external-events'>      
      <div id='external-events-list'>
      ${noassigned}      
      </div>        
    </div>
    <div id='calendar-wrap'>
      <div id='calendar' style="max-width: 1100px;margin: 0 auto;"></div>`;
      var containerEl = document.getElementById('external-events-list');
      new FullCalendar.Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim(),
            color: eventEl.color
          }
        }
      });

      calendarEl = document.getElementById('calendar-wrap');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
          },
          initialDate: workdate,          
          locale: 'es',
          navLinks: true, // can click day/week names to navigate views
          nowIndicator: true,
          weekNumbers: true,
          weekNumberCalculation: 'ISO',
          editable: true,
          selectable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: data.eventos ,
          droppable: true, // this allows things to be dropped onto the calendar          
          drop: function(arg) {
           // is the "remove after drop" checkbox checked?
           //if (document.getElementById('drop-remove').checked) {
             // if so, remove the element from the "Draggable Events" list
             arg.draggedEl.parentNode.removeChild(arg.draggedEl);             
           //}
         },    
        
         eventClick: function(info) {  
          var mensaje = "¿Recibir envío ";
          var mensaje2 = mensaje.concat(info.event.title.toString());
          mensaje2 = mensaje2.concat("?");

          if (window.confirm(mensaje2)) {            
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EventReceived',[info.event.title.toString(),info.event.start.toISOString(),info.event.end.toISOString(),info.event.id.toString()]);
            try
            {
              info.event.remove();              
              calendar.render();        
            }
            catch(err)
            {
              console.log(err);
            }            
          }          
        },

          eventResize: function(info) {      
           //alert(info.event.title + " was resized on " + info.event.start.toISOString());         
           Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EventModified',[info.event.title.toString(),info.event.start.toISOString(),info.event.end.toISOString(),info.event.id.toString()])        
         },
         eventReceive: function(info) {      
          //alert(info.event.title + " was resized on " + info.event.start.toISOString());         
          Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EventModified',[info.event.title.toString(),info.event.start.toISOString(),"",info.event.id.toString()])          
        },
         eventDrop: function(info) {   
           //alert(info.event.title + " Allday " + info.event.start.toISOString() );
           if (info.event.allDay)
           {          
             //alert(info.event.title + " Allday " + info.event.start.toISOString() );
             Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EventModified',[info.event.title.toString(),info.event.start.toISOString(),"",info.event.id.toString()])          
           }
           else
           {         
             Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('EventModified',[info.event.title.toString(),info.event.start.toISOString(),info.event.end.toISOString(),info.event.id.toString()])        
           }
         }
        });   
    calendar.render();    
    console.log(calendar);
  } catch (err) {
      console.log(err);
  }
}





