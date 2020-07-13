// JavaScript Document
// A $( document ).ready() block.
$(document).ready(function() {

});
// var url = 'api-rest-autocinema/public/';
var url = 'http://api.autocinema33.com/';
/** funciones usadas para el paso 1 **/
function getProyeccion(fecha) {
    // console.log(fecha)
    data = {
        fechaProyeccion: fecha
    }
    $.post(url+'proyeccion', data).done(function(rest) {
        // console.log(rest)
        let html = '<div class="seleccion">';
        if (Array.isArray(rest.proyecciones_data)) {
            rest.proyecciones_data.forEach(proyeccion => {
                var imagenes = (proyeccion.imagen) ? 'api-rest-autocinema/' + proyeccion.imagen : 'img/index/poster-1.png';
                let disponibilidad = (proyeccion.disponibilidad) ? '' : '<span class="disponibilidad">Función no disponible</span>';
                html += '<section onclick="setFuncionLocal(' + proyeccion.idProyeccion + ')" class="seleccion2">' +
                    '<img class="seleccionpeliculas" src="' + imagenes + '">' +
                    '<h2>' + proyeccion.titulo + '<br><br>' +
                    '<span class="funciones">Función: ' + proyeccion.funcion + '</span><br>' +
                    disponibilidad +
                    '</h2>' +
                    '</section>'
            });
        } else {
            html += rest.proyecciones_data;
        }
        html += '</div>';
        $('#tabcontent').html(html);
    }).fail(function(err) {
        console.log('Error la traer la proyeccion')
    });
}

function setFuncionLocal(id) {
    // Se guarda el id de la funciones en el localstorage
    localStorage.setItem("idProyeccion", JSON.stringify(id));
}

function getFechas(days) {
    var html = '';
    for (var i = 0; i <= days; i++) {
        fecha = new Date();
        fecha.setDate(fecha.getDate() + i);
        proyecciones = devolverFechaFormateada(fecha).split("-");
        var mes = fecha.getMonth() + 1;
        html += '<li id="' + fecha.getFullYear() + '-' + mes + '-' + fecha.getDate() + '" >' +
            proyecciones[0] + ' ' + proyecciones[1] +
            '</li>';
    }
    console.log(html)
    $('#tabs').html(html)

}

function devolverFechaFormateada(fecha) {
    const meses = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    const day = fecha.getDate();
    const year = fecha.getFullYear();
    // el mes es devuelto entre 0 y 11
    const month = meses[fecha.getMonth()];
    return day + "-" + month + "-" + year;
}
/** fin funciones paso 1 **/

/**Funciones usadas para el paso 2 **/

function getAsientos() {
    var proyeccion = localStorage.getItem("idProyeccion")
    data = {
        idProyeccion: proyeccion
    }
    $.post(url+'asientos', data).done(function(rest) {
        var html = '';
        var ultimaColumna = '';
        i = 1;
        f = 0;
        console.log(rest)
        rest.asientos.forEach(asientos => {
            columna = asientos.nombre_asiento.slice(0, 1);
            if (columna != ultimaColumna) {
                html += '<div class="seatRow">';
                i = 0;
                f++;
            } else {
                html += (asientos.estado) ?
                    '<div id="' + f + '_' + i + '" role="checkbox" value="' + asientos.asiento_id + '" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber seatUnavailable" ><br><span class="ajuste">' + i + '</span></div>' :
                    '<div id="' + f + '_' + i + '" role="checkbox" value="' + asientos.asiento_id + '" aria-checked="false" focusable="true" tabindex="-1" class="seatNumber" onclick="setNumber(this.id)"><br><span class="ajuste" >' + i + '</span></div>';

            }
            i++;

            html += (columna != ultimaColumna) ? '</div><div class="seatRowNumber">' + columna + '</div>' : '';
            ultimaColumna = columna;
        });
        $('#divboletas').html(html)
    }).fail(function(err) {
        console.log('Error la traer los asientos', err)
    });
}

/** funcion usada para marcar los asientos seleccionados **/
function setNumber(txtId) {
    if (!$(txtId).hasClass("seatUnavailable")) {
        // If selected, unselect it
        if ($(txtId).hasClass("seatSelected")) {
            var txtId = $('#' + txtId).attr('id');
            var price = $('#seatsList .' + txtId).val();
            $(txtId).removeClass("seatSelected");
            $('#seatsList .' + txtId).remove();
            // Calling functions to update checkout total and seat counter.
            removeFromCheckout(price);
            refreshCounter();
        } else {
            // else, select it
            // getting values from Seat
            // var thisId = $(this).attr('id');
            var id = txtId.split("_");
            var price = $('#' + txtId).attr('value');
            var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;


            var freeSeats = parseInt($('.freeSeats').first().text());
            var selectedSeats = parseInt($(".seatSelected").length);

            // If you have free seats available the price of this one will be 0.
            if (selectedSeats < freeSeats) {
                price = 0;
            }

            // Adding this seat to the list
            var seatDetails = "Row: " + id[0] + " Seat:" + id[1] + " Price:CA$:" + price;
            $("#seatsList").append('<li value=' + price + ' class=' + txtId + '>' + seatDetails + "  " + "<button id='remove:" + txtId + "'+ class='btn btn-default btn-sm removeSeat' value='" + price + "'><strong>X</strong></button></li>");
            $('#' + txtId).addClass("seatSelected");
            $('#' + txtId).attr("onclick", "removerClick(this.id)");

            addToCheckout(price);
            refreshCounter();
        }
    }
}

/** funcion usada para desmarcar los asientos marcados **/
function removerClick(textId) {
    // var id = $('#' + textId).attr('id').split(":");
    var price = $('#' + textId).attr('value')
    $('#seatsList .' + textId).remove();
    $("#" + textId + ".seatNumber").removeClass("seatSelected");
    $('#' + textId).attr("onclick", "setNumber(this.id)");
    removeFromCheckout(price);
    refreshCounter();
}

function separarPuestos(id) {
    var arrAsientos = [];
    $('.seatSelected').each(function() {
        arrAsientos.push($(this).attr("value"))
    });
    proyeccion = localStorage.getItem("idProyeccion")
    data = {
        idProyeccion: proyeccion,
        idAsiento: JSON.stringify(arrAsientos)
    }
    $('ul.setup-panel li:eq(2)').removeClass('disabled');
    $('#' + id).html('Reservando Asientos...');
    $('#' + id).attr('disabled', true);
    $.post(url+'reservarAsiento', data).done(function(rest) {
        debugger;
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $('#' + id).html('Siguiente');
        $('#' + id).attr('disabled', false);
        // $(this).remove();
        console.log(rest)
    }).fail(function(err) {
        console.log('Error al crear la reservacion', err)
    });
}

function getConfiteria(idCategoria) {
    var data = {
        cantidad: 3,
        idCategoria: idCategoria
    }
    $.post(url+'productos', data).done(function(rest) {
        var html = '<li>';

        rest.orders.forEach(respuesta => {
            var costo = (parseInt(respuesta.costo) > 10000) ? respuesta.costo.slice(0, 2) + 'K' : respuesta.costo;
            console.log(respuesta);
            html += `
                <div class="combossec2">
                    <div class="combos2">
                        <img src="img/confiteria/combo.png" />
                        <div class="descripcioncombos2">
                            <div class="titulocombos2">
                                <div class="textcombos2">${respuesta.nombre}</div>
                                <div class="preciocombo2">${costo}</div>
                            </div>
                            <div class="subtextcombos3"></div>
                            <h3>Cantidad</h3>
                            <div class="number2">
                                <span class="minus">-</span>
                                <input class="input3" type="text" value="1" />
                                <span class="plus">+</span>
                            </div>
                        </div>
                        <button class="pedido2">Añadir al pedido</button>
                    </div>
                </div>
            `;
        });
        html += '</li>';
        console.log(html)
        $('#combosCrispetas').html(html);
    }).fail(function(err) {
        console.log('Error la traer los prouductos')
    });

}

/** fin funciones paso 2 **/