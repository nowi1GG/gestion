//alertaPersonalizada('success', 'hola mensaje de prueba de login');

const frm = document.querySelector('#formulario');
const correo = document.querySelector('#correo');
const clave = document.querySelector('#clave');

const inputReset = document.querySelector('#inputReset');
const btnProcesar = document.querySelector('#btnProcesar');     
const btnreset = document.querySelector('#reset');
const myModal = new bootstrap.Modal(document.querySelector("#myModal"));


document.addEventListener('DOMContentLoaded', function () {
    frm.addEventListener('submit', function (e) {
        e.preventDefault();
        if (correo.value == '' || clave.value == '') {
            alertaPersonalizada('warning', 'Todos los campos con * son requeridos');
        } else {
            const data = new FormData(frm);
            const http = new XMLHttpRequest();

            const url = base_url + 'principal/validar';

            http.open("POST", url, true);

            http.send(data);

            http.onreadystatechange = function () {

                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    alertaPersonalizada(res.tipo, res.mensaje);
                    if (res.tipo == 'success') {
                        localStorage.setItem("rol", res.usuario)
                        let timerInterval;
                        Swal.fire({
                            title: res.mensaje,
                            html: "Sera redireccionado en <b></b> milliseconds.",
                            timer: 2000,
                            timerProgressBar: true,
                            didOpen: () => {
                                Swal.showLoading();
                                const timer = Swal.getPopup().querySelector("b");
                                timerInterval = setInterval(() => {
                                    timer.textContent = `${Swal.getTimerLeft()}`;
                                }, 100);
                            },
                            willClose: () => {
                                clearInterval(timerInterval);
                            }
                        }).then((result) => {
                            /* Read more about handling dismissals below */
                            if (result.dismiss === Swal.DismissReason.timer) {
                                window.location = base_url + 'admin';
                            }
                        });
                    }

                }

            };

        }
    })

    btnreset.addEventListener('click', function(){
        inputReset.value = '';
        myModal.show();
    })

    btnProcesar.addEventListener('click' , function(){
        if (inputReset.value == '') {
            alertaPersonalizada('warning', 'INGRESE EL CORREO');
        
        } else {
            const http = new XMLHttpRequest();
            const url = base_url + 'principal/enviarCorreo/' + inputReset.value;
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const res = JSON.parse(this.responseText);
                    alertaPersonalizada(res.tipo, res.mensaje);
                    if (res.tipo == 'success') {
                        inputReset.value = '';
                        myModal.hide();
                    }

                }

            };
  
        }

    })

})