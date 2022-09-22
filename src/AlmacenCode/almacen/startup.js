Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('iniciaplano');

// create a demo jsPanel			
function binclick(ubicacion){ 
	Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('binclick',[ubicacion]);					
};	




window.showpanel = function(headerdata,contentdata){
	console.log(headerdata);
	console.log(contentdata);
	jsPanel.create({
		headerTitle: headerdata,
		theme: 'dark',
		animateIn: 'jsPanelFadeIn',
		animateOut: 'jsPanelFadeOut',
		content: contentdata,
		headerControls: 'closeonly xs', // shorthand
		panelSize: '350 300',
		position: {
			my: 'left-top',
			at: 'left-top',
			offsetX: 5,
			offsetY: 69
		},				
		callback: function() {
			this.content.style.padding = '10px';
		}
	});
};

window.drawmap = function(data)
{    
  try {      
    var div = document.getElementById('controlAddIn');
	div.innerHTML = `<body></body>`;   
	div = document.getElementById('controlAddIn');
    div.innerHTML += `<body>${data}</body>`;   

	function applyevents() {
    document.querySelectorAll('.zonas').forEach(item => {		
		item.addEventListener('click', event => {
		
			console.log("seleccionada ubicación :  "+item.id);
		//handle click
		binclick(item.id)
		});
		
	});			
	};

	/*==========================
		Zona de palets
============================*/
const imagenes = [
    'patatas-0', 'cervezas-1', 'zumos-2',
    'lacteos-3', 'huevos-4', 'agua-5',
    'frutas-6', 'vinos-7', 'panMolde-8','jamones-9'
];

const palets = document.getElementById('palets');
console.log("Tomando" +palets);
  while(imagenes.length > 0){
	const index = Math.floor(Math.random() * imagenes.length);
	
	//creamos los palets
	const div = document.createElement('div');
	div.className= "palet";

    //le diremos que es dragable
    div.draggable = true;
	 //asignamos un id en este caso tendra como nombre el
	 div.id= imagenes[index];
	   //agregamos los palets a la zona de palets
	   palets.appendChild(div);
	     //quitamos de palets el palet que hizo drag an drop
		 imagenes.splice(index,1);
  }

  /* Cuando empieza a mover el palet se tranfiere informacion de ese palet
que varecibir la ubicacion*/
palets.addEventListener('dragstart', e => {
    e.dataTransfer.setData('id', e.target.id);
});
 const gubi = document.getElementById("g");
gubi.addEventListener('dragover', e =>{
    e.preventDefault();
    let ubi = e.target.dataset.id;
    console.log("La ubicacion que pasa desde dragover :  "+ubi); 

}); 

/*===========
evento drop
=========*/
gubi.addEventListener('drop', e =>{
	const id = e.dataTransfer.getData('id');
	const idNumero = id.split('-')[1];
	const caja = e.target.dataset.id;
	const lleno = e.target.getAttribute("lleno");
	console.log(lleno);
	console.log('palet insertado ID : '+idNumero);
    console.log('caja receptora numero : '+ caja);

	
	
    if(lleno === 'false'){
        e.target.appendChild(document.getElementById(id));
		Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('dropped',[id,caja]);	
        Swal.fire({
            icon: 'success',
            title: 'Correcto',
            text: 'Palet insertado en su ubicación correctamente'
          });
        
    }else{

        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'La ubicacioón no es la asignada!',
            footer: '<a href="">Intentelo nuevamente!!</a>'
          });
    }
});

//tomamos el id del elemento clickeado
document.querySelectorAll(".palet").forEach(el => {
    el.addEventListener("click", e => {
      const id = e.target.getAttribute("id");
		let newID= id.split('-')[1];
		let contenido= id.split('-')[0];
		 
      console.log("seleccionado palet ID :  "+newID+" Contiene : "+contenido);
    });
    el.addEventListener('dragstart', e =>{
  
        const idPalet = e.target.getAttribute("id");
		let newID= idPalet.split('-')[1]; 
        console.log("Moviendo palet Id : "+newID);
      });
  
  });

  //position mouse

  function mousemove(event){
    console.log("pageX: ",event.pageX, 
    "pageY: ", event.pageY);
}

let mousePos = document.getElementById('warehouse');
mousePos.addEventListener('click', mousemove);




	applyevents();		
  } catch (err) {
      console.log(err);
  }
};

window.drawbackground = function(data)
{    
  try {       
	var div = document.getElementById('warehouse');   
	div.style.backgroundImage = data;	
			
  } catch (err) {
      console.log(err);
  }
};






  