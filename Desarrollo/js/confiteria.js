// JavaScript Document
$(document).ready(function() {
    getCategoria(1);
    getCategoria(2);
    getCategoria(3);
    getCategoria(4);
});

var url = 'api-rest-autocinema/public/';
// var url = 'http://api.autocinema33.com/';

function getCategoria(cat) {
    var html = '';
    var pos = 0;

    var data = {cantidad: 0, idCategoria: cat}

    $.post(url+'producto', data).done(function(rest) {
        rest.orders.forEach(respuesta => {
            var costo = parseFloat(respuesta.costo/1000);
            
            if (pos==0){
            	html += '<div class="combosprin"><h2>' + respuesta.categoria + '</h2></div>';
    			html += '<div class="slideshow-container5">';
                html += '<div class="mySlides' + cat + ' fade">';
                html += '<div class="combossec">';

                pos=1;
            } else if (pos==4){
                html += '</div>';
                html += '</div>';
                html += '<div class="mySlides' + cat + ' fade" style="display: none;" >';
                html += '<div class="combossec">';

                pos=1;
            }

            if (respuesta.subCatImagen) {
                var scimagen = url+'' + respuesta.subCatImagen;
            } else {
                var scimagen = '/img/confiteria/combo-duo.png';
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
        html += '<a class="prev5" onclick="plusSlides(' + cat + ',-1)">&#10094;</a>';
        html += '<a class="next5" onclick="plusSlides(' + cat + ',1)">&#10095;</a>';
        html += '</div>';
        
        $('#idcategoria'+cat).html(html);
    }).fail(function(err) {
        console.log('Error al traer los productos')
    });    
}  // getCategoria

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