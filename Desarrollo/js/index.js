// JavaScript Document
// A $( document ).ready() block.
$(document).ready(function() {
    getMovie();
    getConfiteria();
});

var url = 'api-rest-autocinema/public/';
// var url = 'http://api.autocinema33.com/';

function getMovie() {
    var pos = 0;

    var data = {'cantidad': 1000}

    $.post(url+'proyecciones', data).done(function(rest) {
        // $.post('http://127.0.0.1:8000/proyecciones',data).done(function(rest){
        // console.log(rest);
        var i = 1;
        var html = '';
        rest.proyecciones.forEach(element => {
            if (pos==0){
                html += '<div class="mySlides2 fade">';
                html += '<div class="peliculassec">';

                pos=1;
            } else if (pos==4){
                html += '</div>';
                html += '</div>';
                html += '<div class="mySlides2 fade" style="display: none;" >';
                html += '<div class="peliculassec">';

                pos=1;
            }
            
            if (element.imagen) {
                var imagenes = url+'' + element.imagen;
            } else {
                var imagenes = 'img/index/poster-1.png';
            }

            var funcion = '';
            element.funciones.forEach(funciones => {
                funcion = funcion + funciones + ' ';
            });

            html = html +
            '<div class="peliculas" id="'+i+'" idpelicula="' + element.idPelicula + '" onClick="setMovie(this.id)">  ' +
                '<img src="' + imagenes + '" id="myImg'+i+'" onClick = "mostrarModal('+i+')"/>' +
                '<div class="diapeli2" id="fechahoy'+i+'">' +
                    '<p>' + element.fechaProyeccion + '</p>' +
                '</div>' +
                '<div class="horarios">' +
                    '<div class="nombrepeli" id="peliculahoy'+i+'">' +
                        '<h2>' + element.titulo + '</h2><p> Funciones ' + funcion + '</p>' +
                    '</div>' +
                    '<div class="diapeli" id="fechahoy2'+i+'">' +
                        '<p>' + element.fechaProyeccion + '</p>' +
                    '</div>' +
                '</div>' +
            '</div>'+
            '<div id="myModal'+i+'" class="modal">'+
                '<span class="closemodal">&times;</span>'+
                '<div class="modal-content" id="img0'+i+'">'+
                    '<div class="sinopsis">'+
                        '<div class="sinopsis1" id="idmarcoimagen'+i+'" >'+
                            '<div class="marcorojo">'+
                                '<img src="'+imagenes+'">'+
                            '</div>'+
                        '</div>'+

'<div class="sinopsis1" style="display: none;" id="idmarcotrailer'+i+'" >'+
'<div class="marcorojo">'+
'<iframe src="https://www.youtube.com/embed/3No2ro4xfo4" frameborder="0" allowfullscreen></iframe>' +
'</div>'+
'</div>'+ 

                        '<div class="sinopsis2">'+
                            '<img src="img/logo.png" width="15%" style="float:right; margin-right:10%; margin-top:3%;"/>'+
                            '<div class="titulosin" id="sinopsishoy'+i+'">'+
                                '<p>' + element.sinopsis + '</p><br>'+
                                '<p><b>Duración: </b>' + element.duracion + ' min</p><br>'+
                                '<p><b>Fecha de estreno: ' + element.fechaProyeccion + '</b></p><br>'+
                            '</div>'+
                            '<div class="trailer">'+                                
                                    '<div class="trailerbutton" onclick="mostrar_trailer('+i+');"></div>'+
                                    '<a href="' + element.trailer + '" target="_blank">'+
                                    '<p>ver trailer</p>'+
                                '</a>'+
                            '</div>'+
                            '<a href="compra.html"><div class="compraboleta"> Comprar Boletas</div></a>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>';
            
            i++;
            pos++;
        });

        html += '</div>';
        html += '</div>';

        $('#proyecciones1').html(html);
    }).fail(function(err) {

    });
}

function getConfiteria() {
    var html = '';
    var pos = 0;

    var data = {cantidad: 0, idCategoria: 0}

    $.post(url+'productos', data).done(function(rest) {
        rest.orders.forEach(respuesta => {
            var costo = parseFloat(respuesta.costo/1000);
            
            if (pos==0){
                html += '<div class="mySlides5 fade">';
                html += '<div class="combossec">';

                pos=1;
            } else if (pos==4){
                html += '</div>';
                html += '</div>';
                html += '<div class="mySlides5 fade" style="display: none;" >';
                html += '<div class="combossec">';

                pos=1;
            }

            if (respuesta.subCatImagen) {
                var scimagen = url+'' + respuesta.subCatImagen;
            } else {
                var scimagen = '/img/confiteria/combo.png';
            }

            html += '<div class="combos">' +
                '<img src="' + scimagen + '" />' +
                '<div class="descripcioncombos">' +
                '<div class="titulocombos">' +
                '<div class="textcombos">' + respuesta.subCategoria + '</div>' +
                '<div class="preciocombo">';

            if ((respuesta.costo % 1000) > 0) {
                html += formato_numero(costo, 1, ",",".");
            } else {
                html += costo;
            }

            html += 'K</div>' +
                '</div>' +
                '<div class="subtextcombos">' + respuesta.desProducto + '</div>' +
                '</div>' +
                '</div>';

            pos++;
        });
        
        html += '</div>';
        html += '</div>';
        
        $('#confiteria').html(html);
    }).fail(function(err) {
        console.log('Error al traer los productos')
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

function formato_numero(numero, decimales, separador_decimal, separador_miles) {
    numero=parseFloat(numero);
    if(isNaN(numero)){
        return "";
    }

    if(decimales!==undefined){
        // Redondeamos
        numero=numero.toFixed(decimales);
    }

    // Convertimos el punto en separador_decimal
    numero=numero.toString().replace(".", separador_decimal!==undefined ? separador_decimal : ",");

    if(separador_miles){
        // Adicionamos los separadores de miles
        var miles=new RegExp("(-?[0-9]+)([0-9]{3})");
        while(miles.test(numero)) {
            numero=numero.replace(miles, "$1" + separador_miles + "$2");
        }
    }

    return numero;
}

function mostrar_trailer(id) {
    var divimag = document.getElementById("idmarcoimagen"+id);
    var divtrai = document.getElementById("idmarcotrailer"+id);

    divimag.style.display = "none";
    divtrai.style.display = "block";
}