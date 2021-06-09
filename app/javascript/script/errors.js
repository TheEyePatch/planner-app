window.addEventListener('load', display_errors);
function display_errors(){
    document.querySelectorAll(".alert").forEach(function(alert){
        setTimeout(function(){
            alert.style.display = 'none';
        }, 3000)
    });
    document.querySelectorAll(".notice").forEach(function(notice){
        setTimeout(function(){
            notice.style.display = 'none';
        }, 3000)
    });
}