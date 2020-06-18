// JavaScript Document
// A $( document ).ready() block.
$( document ).ready(function() {
    getMovie();
	console.log($("#peliculapasm").attr("idpelicula"));
});

function getMovie(){
	var data={
		'cantidad':3,
	}
	$.post('api-rest-autocinema/public/proyecciones',data).done(function(rest){
		console.log(rest)
		$("#peliculahoy").html('<h2>'+rest.proyecciones[0].titulo+'</h2><p>funciones '+rest.proyecciones[0].funciones[0]+'</p>')
		$("#peliculamanana").html('<h2>'+rest.proyecciones[1].titulo+'</h2><p>funciones '+rest.proyecciones[1].funciones[0]+'</p>')
		$("#peliculapasm").html('<h2>'+rest.proyecciones[2].titulo+'</h2><p>funciones '+rest.proyecciones[2].funciones[0]+'</p>')
		
	}).fail(function(err){
			
	});
}

function setMovie(id){
	console.log("cualquietexto");
	var idpelicula=$("#"+id).attr("idpelicula");
	localStorage.setItem("idpelicula",idpelicula);
	console.log($("#"+id).attr("idpelicula"));
}