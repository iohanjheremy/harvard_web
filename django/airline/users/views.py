from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.urls import reverse
# Create your views here.
def index (request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect(reverse("login"))
    return render(request, "users/user.html")
    
def login_view(request):
    if request.method == "POST":
        username = request.POST["username"].strip()
        password = request.POST["password"]
        print("Usuário:", request.POST["username"])
        print("Senha:", request.POST["password"])

        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            print("Login bem-sucedido")
        else:
            print("Falha na autenticação")


        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, "users/login.html",{
                "message": "Invalid credentials."
            })
            
    return render(request, "users/login.html")

def logout_view(request):
    if request.method == "POST":
        logout(request)
        return redirect("user_login")
    return redirect("index")