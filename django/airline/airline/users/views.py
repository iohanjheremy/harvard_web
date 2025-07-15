from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.urls import reverse
# Create your views here.
def index (request):
    if not request.user.is_autenticated:
        return HttpResponseRedirect(reverse("login"))
    
def login_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
    return render(request, "user/login.html")

def logout_view(request):
    pass