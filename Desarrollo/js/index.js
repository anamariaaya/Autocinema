// JavaScript Document
// A $( document ).ready() block.
$(document).ready(function() {
    getMovie();
    getConfiteria();
    
    
});
var url = 'api-rest-autocinema/public/';
// var url = 'http://api.autocinema33.com/';
function getMovie() {
    var data = {
        'cantidad': 3,
    }
    $.post(url+'proyecciones', data).done(function(rest) {
        // $.post('http://127.0.0.1:8000/proyecciones',data).done(function(rest){
        // console.log(rest);
        var i = 1;
        var html = '';
        rest.proyecciones.forEach(element => {

            var funcion = '';
            if (element.imagen) {
                var imagenes = url+'' + element.imagen;
            } else {
                var imagenes = 'img/index/poster-1.png';
            }
            element.funciones.forEach(funciones => {
                funcion = funcion + funciones + ' ';
            });
            html = html +
            '<div class="peliculas" id="' + i + '" idpelicula="' + element.idPelicula + '" onClick="setMovie(this.id)">  ' +
                '<img src="' + imagenes + '" id="myImg'+i+'" onClick = "mostrarModal('+i+')"/>' +
                '<div class="diapeli2" id="fechahoy">' +
                    '<p>' + element.fechaProyeccion + '</p>' +
                '</div>' +
                '<div class="horarios">' +
                    '<div class="nombrepeli" id="peliculahoy">' +
                        '<h2>' + element.titulo + '</h2><p> Funciones ' + funcion + '</p>' +
                    '</div>' +
                    '<div class="diapeli" id="fechahoy2">' +
                        '<p>' + element.fechaProyeccion + '</p>' +
                    '</div>' +
                '</div>' +
            '</div>'+
            '<div id="myModal'+i+'" class="modal">'+
                '<span class="closemodal">&times;</span>'+
                '<div class="modal-content" id="img0'+i+'">'+
                    '<div class="sinopsis">'+
                        '<div class="sinopsis1">'+
                            '<div class="marcorojo">'+
                                '<img src="img/index/poster-2.png">'+
                            '</div>'+
                        '</div>'+
                        '<div class="sinopsis2">'+
                            '<img src="'+imagenes+'" width="15%" style="float:right; margin-right:10%; margin-top:3%;"/>'+
                            '<div class="titulosin" id="sinopsishoy">'+
                                '<h2></h2>'+
                                '<p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p><br>'+
                                '<p><b>Duración: </b>121 min</p><br>'+
                                '<p><b>País: </b>121 min</p><br>'+
                                '<p><b>Fecha de estreno: 01 de agosto 2020</b></p><br>'+
                                '<p><b>Reparto: </b>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet</p><br>'+
                            '</div>'+
                            '<div class="trailer">'+
                                '<div class="trailerbutton"></div><p>ver trailer</p>'+
                            '</div>'+
                            '<div class="compraboleta"> Comprar Boletas</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>';
            $('#proyecciones1').html(html);
            i++;
        });


    }).fail(function(err) {

    });
}

function getConfiteria() {
    var data = {
        cantidad: 3,
        idCategoria: 4
    }
    $.post(url+'productos', data).done(function(rest) {
        var html = '';

        rest.orders.forEach(respuesta => {
            var costo = (parseInt(respuesta.costo) > 10000) ? respuesta.costo.slice(0, 2) + 'K' : respuesta.costo;
            html += '<div class="combos">' +
                '<img src="img/confiteria/combo.png" />' +
                '<div class="descripcioncombos">' +
                '<div class="titulocombos">' +
                '<div class="textcombos">' + respuesta.nombre + '</div>' +
                '<div class="preciocombo">' + costo + '</div>' +
                '</div>' +
                '<div class="subtextcombos">' + respuesta.desProducto + '</div>' +
                '</div>' +
                '</div>';
            $('#confiteria').html(html);
        })
    }).fail(function(err) {
        console.log('Error la traer los prouductos')
    });

}

function setMovie(id) {
    var idpelicula = $("#" + id).attr("idpelicula");
    localStorage.setItem("idpelicula", idpelicula);
}

function mostrarModal(i) {
    eval("modal"+i+"=document.getElementById('myModal"+i+"')");

    eval("img"+i+"=document.getElementById('myImg"+i+"')");

    eval("modalImg"+i+"=document.getElementById('img0"+i+"')");

    eval("img"+i+".onclick = function(){modal"+i+".style.display = 'block';modalImg"+i+".innerHTML}");

    span = document.getElementsByClassName("closemodal")[i-1];

    eval("span.onclick = function(){ modal"+i+".style.display = 'none';}");
    eval("img"+i+".click()");
}
