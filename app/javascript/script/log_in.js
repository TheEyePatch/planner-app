window.addEventListener('load', function(){
   if(Array.from(document.querySelector('body').classList).includes('sessions-new')){
        const sign_up_form = document.querySelector("#sign-up-form");
        document.querySelector('#sign-up-btn').addEventListener('click', function(){
            sign_up_form.style.display = "flex";
        });
        
        document.querySelector('#login-btn').addEventListener('click', function(){
            sign_up_form.style.display = "none";
        });
   }
})

