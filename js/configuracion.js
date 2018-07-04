function actualizar(tema){
$.get('actualizartema/'+tema,function(res){
location.reload();
});
}