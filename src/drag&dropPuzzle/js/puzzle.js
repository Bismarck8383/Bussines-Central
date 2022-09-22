  const imagenes = [
            'imagen-0', 'imagen-1', 'imagen-2',
            'imagen-3', 'imagen-4', 'imagen-5',
            'imagen-6', 'imagen-7', 'imagen-8'
        ];

        const puzzle = document.getElementById('puzzle');
        const piezas = document.getElementById('piezas');
        const mensaje = document.getElementById('mensaje');

        let terminado = imagenes.length;
        
        //mientras tega imagenes
        while (imagenes.length > 0) {
            const index = Math.floor(Math.random() * imagenes.length);
            //Creamos unn div
            const div = document.createElement('div');
            //el div tenndra la clase pieza
            div.className = 'pieza';
            div.id = imagenes[index];
            div.draggable = true;
            div.style.backgroundImage = `url("recursos/${imagenes[index]}.jpg")`;
            //metemos el div creado en el  div piezas
            piezas.appendChild(div);
            //vamos eliminado un campo del array
            imagenes.splice(index, 1);
        }

        for (let i = 0; i < terminado; i++) {
            const div = document.createElement('div');
            div.className = 'placeholder';
            div.dataset.id = i;
            puzzle.appendChild(div);
        }


        piezas.addEventListener('dragstart', e => {
            e.dataTransfer.setData('id', e.target.id);
        });

        puzzle.addEventListener('dragover', e => {
            e.preventDefault();
            e.target.classList.add('hover');
        });

        puzzle.addEventListener('dragleave', e => {
            e.target.classList.remove('hover');
        });

        puzzle.addEventListener('drop', e => {
            e.target.classList.remove('hover');

            const id = e.dataTransfer.getData('id');
            const numero = id.split('-')[1];

            if (e.target.dataset.id === numero) {
                e.target.appendChild(document.getElementById(id));

                terminado--;

                if (terminado === 0) {
                    document.body.classList.add('ganaste');
                }
            }
        });