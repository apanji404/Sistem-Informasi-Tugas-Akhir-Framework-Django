from django.http import HttpResponse
from django.shortcuts import redirect

def laa_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        group = None
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
        if group == 'Mahasiswa':
            return redirect('error403')
        if group == 'Dosen_Fungsional':
            return redirect('error403')
        if group == 'Dosen_Pembimbing':
            return redirect('error403')
        if group == 'Dosen_Matkul':
            return redirect('error403')
        if group == 'LAA':
            return view_func(request, *args, **kwargs)
    return wrapper_function

def dosenpbb_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        group = None
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
        if group == 'Mahasiswa':
            return redirect('error403')
        if group == 'LAA':
            return redirect('error403')
        if group == 'Dosen_Fungsional':
            return redirect('error403')
        if group == 'Dosen_Matkul':
            return redirect('error403')
        if group == 'Dosen_Pembimbing':
            return view_func(request, *args, **kwargs)
    return wrapper_function

def dosenfungsional_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        group = None
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
        if group == 'Mahasiswa':
            return redirect('error403')
        if group == 'LAA':
            return redirect('error403')
        if group == 'Dosen_Matkul':
            return redirect('error403')
        if group == 'Dosen_Pembimbing':
            return redirect('error403')
        if group == 'Dosen_Fungsional':
            return view_func(request, *args, **kwargs)
    return wrapper_function

def dosenmatkul_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        group = None
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
        if group == 'Mahasiswa':
            return redirect('error403')
        if group == 'Dosen_Fungsional':
            return redirect('error403')
        if group == 'LAA':
            return redirect('error403')
        if group == 'Dosen_Pembimbing':
            return redirect('error403')
        if group == 'Dosen_Matkul':
            return view_func(request, *args, **kwargs)
    return wrapper_function

def mahasiswa_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        group = None
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
        if group == 'Dosen_Pembimbing':
            return redirect('error403')
        if group == 'LAA':
            return redirect('error403')
        if group == 'Dosen_Fungsional':
            return redirect('error403')
        if group == 'Dosen_Matkul':
            return redirect('error403')
        if group == 'Mahasiswa':
            return view_func(request, *args, **kwargs)
    return wrapper_function
