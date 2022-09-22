var SVG_NS = 'http://www.w3.org/2000/svg';
const svg = document.getElementById("CreaRectangulo");
console.log(svg);
 
var svgRaton = {x:0, y:0};// la posición del ratón relativo al lienzo SVG
var rectRaton = {x:0, y:0};// la posición del ratón relativo al rectángulo
var distInicial = {x:0, y:0};// la posición inicial del rectángulo
var arrastrar = false;

function oMousePos(elemento, evt) {
  var ClientRect = elemento.getBoundingClientRect();
   console.log(ClientRect);
  return { //objeto
    x: Math.round(evt.clientX - ClientRect.left),
    y: Math.round(evt.clientY - ClientRect.top)
  }
}

function Rect() {
  this.att = {};
  this.elemento;

  this.dibujar = function(elementoPadre) {
    var elmt = document.createElementNS(SVG_NS, "rect");
    for (var name in this.att) {
      if (this.att.hasOwnProperty(name)) {
        elmt.setAttributeNS(null, name, this.att[name]);
      }
    }
    elementoPadre.appendChild(elmt);
    this.elemento = elmt;
  }
  
  this.actualizar = function(x,y){
    this.elemento.setAttributeNS(null, "transform", "translate("+x+","+y+")");

  }  
}//function Rect()

  var oRect = new Rect();
  // los atributos del rectángulo
  oRect.att = {x:80,y:94,width:120,height:75, transform:"translate(0,0)",fill:"black"};
 
  console.log(oRect);
  
  // dibuja el rectángulo
  oRect.dibujar(svg);
 

  var rectangulo = svg.querySelector("rect");
  

     var num = 0;
     rectangulo.addEventListener("mousedown", function(evt){
       num++
       svgRaton = oMousePos(svg, evt); 
       rectRaton = oMousePos(this, evt);
       
       if(num == 1){       // calculado solo una vez, en el primer clic
       // recupera la posición inicial del trazado
       distInicial.x = svgRaton.x - rectRaton.x;
       distInicial.y = svgRaton.y - rectRaton.y;
       }
       arrastrar = true;
     }, false);
      
     rectangulo.addEventListener("mousemove", function(evt) {
       if (arrastrar) {
        svgRaton = oMousePos(svg, evt);
         var x = svgRaton.x - rectRaton.x - distInicial.x;
         var y = svgRaton.y - rectRaton.y - distInicial.y;
        oRect.actualizar( x, y);  
       }
       }, false);
       
       rectangulo.addEventListener("mouseup", function(evt) {
       arrastrar = false;
       }, false);

       rectangulo.addEventListener("mouseout", function(evt) {
       arrastrar = false;
       }, false); 
       var nuevaClase = document.getElementsByClassName("rect");
for(var i = 0; i < nuevaClase.length; i++)
    nuevaClase[i].className += "posicion ";

console.log(nuevaClase);


/*
sortable
*/
let lista = document.getElementById('CreaRectangulo2');
Sortable.create(lista,{
  animation : 155,



  onEnd: () =>{
    console.log('Insertado en el nuevo lugar');
  },
  group: "lista-personas",
  store :{
    //Guardamos el orden de la lista
    set : (sortable) =>{
      //lo guardamos en un array
      const orden = sortable.toArray();
      //el array lo convertimos en una cadena de texto para guardarlo en localstarage
      localStorage.setItem(sortable.options.group.name, orden.join('-'));
     // Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('fichamovida',[orden.join('-')]);
      console.log(orden);
    },
      get : (sortable) =>{
      //Retomamos los ultimos valores guardados en localstarage
      const orden = localStorage.getItem(sortable.options.group.name);
      //a la inversa convertimos la cadena de texto a un array
      return orden ? orden.split('-') : [];
      console.log(orden);
    },

  }


});