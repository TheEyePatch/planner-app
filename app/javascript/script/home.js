window.addEventListener('load', function(){
    if(Array.from(document.querySelector('body').classList).includes('home-index')){
        display_overdue_modal()
        document.querySelector('#close-pop-up').addEventListener('click', close_modal)
    }
});

function display_overdue_modal(){
    const num_overdue_tasks = document.getElementById('modal-overdue-notice').dataset.overdueTasks
    if(num_overdue_tasks >= 1){
        document.getElementById('overdue-container').style.display = "flex"
    }
}
function close_modal(){
    document.getElementById('overdue-container').style.display = "none"
}
