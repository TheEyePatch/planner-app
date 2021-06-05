window.addEventListener('load', function(){
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
   if(Array.from(document.querySelector('body').classList).includes('sessions-new')){
        const sign_up_form = document.querySelector("#sign-up-form");
        document.querySelector('#sign-up-btn').addEventListener('click', function(){
            sign_up_form.style.display = "flex";
        });
        
        document.querySelector('#login-btn').addEventListener('click', function(){
            sign_up_form.style.display = "none";
        });
        
        console.log(Array.from(document.querySelector('body').classList).includes('sessions-new'));
   }
})

