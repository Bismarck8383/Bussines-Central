const imagenes = [
    'imagen-0', 'imagen-1', 'imagen-2',
    'imagen-3', 'imagen-4', 'imagen-5',
    'imagen-6', 'imagen-7', 'imagen-8',
   'imagen-9', 'imagen-10', 'imagen-11'
];
const ubicacion = document.getElementById('ubicacion');//puzle
const palets = document.getElementById('palets');//piezas
const mensaje = document.getElementById('mensaje');

console.log('total',imagenes.length);
let terminado = imagenes.length;
while(imagenes.length > 0){
    const index = Math.floor(Math.random() * imagenes.length);

    //creamos los palets
    const div = document.createElement('div');
    //asignamos una clase al div
    div.className= "palet";
    //le diremos que es dragable
    div.draggable = true;
    //asignamos un id en este caso tendra como nombre el
    div.id= imagenes[index];
    div.style.backgroundImage = `url("img/${imagenes[index]}.jpg")`; 
    //agregamos los palets a la zona de palets
    palets.appendChild(div);
  //  console.log(index);
  //quitamos de palets el palet que hizo drag an drop
    imagenes.splice(index,1);


}


for (let i = 0; i < terminado; i++){
    const div = document.createElement('div');
    div.className = 'placeholder';
    //Guardara una referencia de que palet podria recibir
    div.dataset.id = i;
    //agregamos los espacion en la ubicacion
    ubicacion.appendChild(div);
}

/* Cuando empieza a mover el palet se tranfiere informacion de ese palet
que varecibir la ubicacion*/
palets.addEventListener('dragstart', e => {
    e.dataTransfer.setData('id', e.target.id);
});
 
   
/*
evento cuando arrastramos el palet sobre una ubicacion se mostrara de un color
*/
ubicacion.addEventListener('dragover', e =>{
    e.preventDefault();
    e.target.classList.add('libre');
    let ubi = e.target.dataset.id;
    console.log("La ubicacion que pasa "+ubi);
 

}); 



ubicacion.addEventListener('dragleave', e =>{
    e.target.classList.remove('libre');
});
/* eventos del drop */
ubicacion.addEventListener('drop', e =>{
    e.target.classList.remove('libre');
    const id = e.dataTransfer.getData('id');
    const idNumero = id.split('-')[1];
    const caja = e.target.dataset.id;

    console.log('palet insertado ID : '+idNumero);
    console.log('caja receptora numero : '+ caja);

    /*Condicionales para gragar los palet */
 
    if(caja === idNumero){
        e.target.appendChild(document.getElementById(id));
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


/*============================
Leeremos los movimientos
===========================*/
//tomamos el id del elemento clickeado

document.querySelectorAll(".palet").forEach(el => {
    el.addEventListener("click", e => {
      const id = e.target.getAttribute("id");
      console.log("seleccionado palet ID :  "+id);
    });
    el.addEventListener('dragstart', e =>{
  
        const idPalet = e.target.getAttribute("id");
 
        console.log("Moviendo palet Id : "+idPalet);
      });
      ubicacion.addEventListener('dragenter', e =>{
        const PaleteId = e.dataTransfer.getData('id');
        console.log("On Over ID : " +PaleteId);
    }); 
  });




  /*funcion que lee donde esta el mouse  */
    /*Cordenadas del windows*/
    function mousemove(event){
      console.log("pageX: ",event.pageX, 
      "pageY: ", event.pageY, 
      "clientX: ", event.clientX, 
      "clientY:", event.clientY)
  }
  const leerUbi = document.getElementById("palets");
  leerUbi.addEventListener('mousemove', mousemove);
 