const loginTab=document.getElementById("loginTab");

const registerTab=document.getElementById("registerTab");

const loginForm=document.getElementById("loginForm");

const registerForm=document.getElementById("registerForm");

loginTab.onclick=function(){

loginTab.classList.add("active");

registerTab.classList.remove("active");

loginForm.style.display="block";

registerForm.style.display="none";

}

registerTab.onclick=function(){

registerTab.classList.add("active");

loginTab.classList.remove("active");

loginForm.style.display="none";

registerForm.style.display="block";

}