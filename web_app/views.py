import pandas as pd
import math
from math import ceil, log2

import subprocess
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib import messages
from .forms import NewUserForm, KelasForm, ProposalForm, FileForm, EditSidangForm, ProfilDosenPBBForm, JadwalSemproForm
from .forms import ApplyForm, NilaiForm, SemproForm, ProfilForm, SidangForm, JadwalDosenForm, RuangSidangForm, EditSemproForm
from .forms import NilaiTAForm, RevisiForm, JamSemproForm
from django.contrib.auth.models import Group, User
from .models import Profil_Staff, User_Kelas, Lab, Proposal, File, Order, Profil_Mahasiswa, Kelas, Sempro
from .models import DaftarSidang, RuangSidang, JadwalKelasDosen, JadwalSidang, JadwalSemproDosen, JamSemproDosen
from django.contrib.auth.decorators import login_required, permission_required
from .decorators import laa_only, dosenpbb_only, mahasiswa_only, dosenmatkul_only, dosenfungsional_only
from django.contrib.auth.forms import PasswordChangeForm
from django.http import HttpResponse, JsonResponse
from django.core.paginator import Paginator
from django.core import serializers
from django.db.models import Q, Count, Sum, Case, When, IntegerField
from django.core.exceptions import ObjectDoesNotExist


# from .Model import DaftarSidang as m_DaftarSidang, Room as m_Room, Penguji1 as m_Penguji1, Penguji2 as m_Penguji2, JadwalSidang as m_JadwalSidang
import random
import copy

from .gen import GeneticAlgorithm

# from rest_framework import serializers
# import sys
# import os
# sys.path.append('skripsipedia/web_app/GASchedule')


# Create your views here.

# Registrasi
def registrasi(request):
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            user_group = Group.objects.get(name='Mahasiswa')
            user.groups.add(user_group)
            # log the user in
            login(request, user)
            messages.success(request, "Registrasi Akun Telah Berhasil")
            return redirect('loginPage')
    form = NewUserForm()
    context = {'form': form}
    return render(request, 'auth/registrasi.html', context)

# Login


def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is None:
            messages.error(request, 'Username atau Password salah')
            return redirect('loginPage')
        else:
            login(request, user)
            group = None
            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
            if group == 'LAA':
                return redirect('dashboardLAA')
            if group == 'Dosen_Pembimbing':
                return redirect('dashboardDosen')
            if group == 'Dosen_Matkul':
                return redirect('dashboardDosenMatkul')
            if group == 'Dosen_Fungsional':
                return redirect('dashboardDosenFungsional')
            if group == 'Mahasiswa':
                try:
                    profil = Profil_Mahasiswa.objects.get(user=request.user)
                    return redirect('dashboardMahasiswa')
                except:
                    return redirect('lengkapiProfil')

    context = {}
    return render(request, 'auth/login.html', context)


@login_required(login_url='error')
def logoutUser(request):
    logout(request)
    messages.success(request, ("Logout berhasil"))
    return redirect('loginPage')

# Error
def error403(request):
    return render(request, 'error/error_unauthenticated.html')

def errorExist(request):
    return render(request, 'error/errorExist.html')


# LAA
@login_required(login_url='error')
@laa_only
def dashboardLAA(request):
    user_count = User.objects.count()
    mhs_count = Profil_Mahasiswa.objects.count()
    pbb_count = Profil_Staff.objects.count()
    req_sidang = DaftarSidang.objects.count()
    context = {'user_count': user_count, 'mhs_count': mhs_count,
               'pbb_count': pbb_count, 'req_sidang': req_sidang}
    return render(request, 'admin/home/dashboardAdmin.html', context)


@login_required(login_url='error')
@laa_only
def reqSidangTA(request):
    obj = DaftarSidang.objects.all()
    paginator = Paginator(obj, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj}
    return render(request, 'admin/home/reqSidangTA.html', context)


@login_required(login_url='error')
@laa_only
def hapusReqSidang(request, pk):
    hapus = DaftarSidang.objects.get(id=pk)
    hapus.delete()
    messages.success(request, "Data Telah Berhasil Dihapus")
    return redirect('reqSidangTA')

@login_required(login_url='error')
@laa_only
def terimaReqSidang(request, pk):
    terima = DaftarSidang.objects.get(id=pk)
    terima.status = not terima.status
    terima.save()
    messages.info(request, "Data Telah Berhasil Diubah")
    return redirect('reqSidangTA')


@login_required(login_url='error')
@laa_only
def jadwalSidangLAA(request):
    obj = JadwalSidang.objects.all()
    date = JadwalSidang.objects.prefetch_related('daftar_sidang').all()
    paginator = Paginator(obj, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj, 'date': date}
    return render(request, 'admin/home/jadwalSidang.html', context)


@login_required(login_url='error')
@laa_only
def pengaturanLAA(request):
    return render(request, 'admin/home/pengaturanAdmin.html')


@login_required(login_url='error')
@laa_only
def ubahPasswordLAA(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('ubahPasswordLAA')
    else:
        form = PasswordChangeForm(user=request.user)
    context = {'form': form}
    return render(request, 'admin/home/ubahPassword.html', context)

# Dosen Fungsional


@login_required(login_url='error')
@dosenfungsional_only
def dashboardDosenFungsional(request):
    user_count = User.objects.count()
    mhs_count = Profil_Mahasiswa.objects.count()
    pbb_count = Profil_Staff.objects.count()
    sidang = DaftarSidang.objects.count()
    context = {'user_count': user_count, 'mhs_count': mhs_count,
               'pbb_count': pbb_count, 'sidang': sidang}
    return render(request, 'dosen_fungsional/home/dashboard.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def ruangSidang(request):
    obj = RuangSidang.objects.all()
    context = {'obj': obj}
    return render(request, 'dosen_fungsional/home/ruangSidang.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def tambahRuangSidang(request):
    form = RuangSidangForm()
    if request.method == 'POST':
        form = RuangSidangForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('ruangSidang')
    context = {}
    return render(request, 'dosen_fungsional/home/tambahRuangSidang.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def hapusRuang(request, pk):
    hapus = RuangSidang.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Dihapus")
    return redirect('ruangSidang')


@login_required(login_url='error')
@dosenfungsional_only
def listRequest(request):
    obj = DaftarSidang.objects.all()
    paginator = Paginator(obj, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj}
    return render(request, 'dosen_fungsional/home/requestJadwal.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def generateJadwal(request):

    obj = DaftarSidang.objects.count()
    if request.method == 'POST':
        json_res = []
        gs_result = generate_schedule()
        print(gs_result)
        ds = list(DaftarSidang.objects.values())
        rs = list(RuangSidang.objects.values())
        js = list(JadwalSidang.objects.values())
        p1 = list(Profil_Staff.objects.values())
        for gs in gs_result:
            new_js = JadwalSidang(
                daftar_sidang=DaftarSidang.objects.get(id=gs['ds_id']),
                penguji1=Profil_Staff.objects.get(id=gs['p1_id']),
                penguji2=Profil_Staff.objects.get(id=gs['p2_id']),
                ruang=RuangSidang.objects.get(id=gs['r_id']))
            new_js.save()
        return HttpResponse([gs_result], content_type="application/json")
    context = {'obj': obj}
    return render(request, 'dosen_fungsional/home/generateJadwal.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def hasilJadwal(request):
    obj = JadwalSidang.objects.all()
    date = JadwalSidang.objects.prefetch_related('daftar_sidang').all()
    paginator = Paginator(obj, 100)  # Show 10 proposals per page
    if request.method == 'POST':
        hapus = JadwalSidang.objects.all()
        hapus.delete()
        return redirect('hasilJadwal')

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj, 'date': date}
    return render(request, 'dosen_fungsional/home/hasilJadwal.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def editJadwal(request, pk):
    obj = JadwalSidang.objects.get(id=pk)
    penguji = Profil_Staff.objects.all()
    ruangan = RuangSidang.objects.all()
    date = JadwalSidang.objects.prefetch_related('daftar_sidang').get(id=pk)
    penguji1 = JadwalSidang.objects.prefetch_related('penguji1').get(id=pk)
    penguji2 = JadwalSidang.objects.prefetch_related('penguji2').get(id=pk)
    form = EditSidangForm(instance=obj)
    if request.method == 'POST':
        form = EditSidangForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('hasilJadwal')

    context = {'obj': obj, 'penguji': penguji, 'ruangan': ruangan, 'date': date,
               'penguji1': penguji1, 'penguji2': penguji2, 'form': form}
    return render(request, 'dosen_fungsional/home/editJadwal.html', context)


@login_required(login_url='error')
@dosenfungsional_only
def pengaturanDF(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('pengaturanDF')
    else:
        form = PasswordChangeForm(user=request.user)
    context = {'form': form}
    return render(request, 'dosen_fungsional/home/pengaturan.html', context)

# Dosen Pembimbing


@login_required(login_url='error')
@dosenpbb_only
def dashboardDosen(request):
    user_count = User.objects.count()
    mhs_count = Profil_Mahasiswa.objects.count()
    pbb_count = Profil_Staff.objects.count()
    proposal = Proposal.objects.count()
    context = {'user_count': user_count, 'mhs_count': mhs_count,
               'pbb_count': pbb_count, 'proposal': proposal}
    return render(request, 'dosen/home/dashboardDosen.html', context)

@login_required(login_url='error')
@dosenpbb_only
def profilDosen(request):
    return render(request, 'dosen/home/profil.html')

@login_required(login_url='error')
@dosenpbb_only
def inputProposal(request):
    form = ProposalForm()
    data_sender = Profil_Staff.objects.all
    labs = Lab.objects.all
    if request.method == "POST":
        form = ProposalForm(request.POST)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.user = request.user
            obj.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('listProposal')

    context = {'form': form, 'data_sender': data_sender, 'labs': labs}
    return render(request, 'dosen/home/inputProposal.html', context)


@login_required(login_url='error')
@dosenpbb_only
def daftarMahasiswa(request):
    data1 = Order.objects.filter(proposal__user=request.user).order_by('-date_created')
    proposals = Proposal.objects.annotate(
    jumlah_pendaftar=Count('order'),
    sisa_kuota=Case(
        When(jumlah_pendaftar__isnull=True, then='jml_mhs'),
        default='jml_mhs' - Count('order')
    )
    )

    paginator = Paginator(data1, 10)  # Show 10 proposals per page
    page = request.GET.get('page')
    data1 = paginator.get_page(page)
    context = {'data1': data1, 'proposals':proposals}
    return render(request, 'dosen/home/daftarMahasiswa.html', context)


@login_required(login_url='error')
@dosenpbb_only
def listProposal(request):
    proposals = Proposal.objects.filter(user=request.user)

    context = {'proposals': proposals}
    return render(request, 'dosen/home/listProposal.html', context)


@login_required(login_url='error')
@dosenpbb_only
def editProposal(request, pk):
    proposals = Proposal.objects.get(id=pk)
    proposal = get_object_or_404(Proposal, id=pk)
    data_sender = Profil_Staff.objects.all()
    labs = Lab.objects.all()

    form = ProposalForm(instance=proposals)
    if request.method == "POST":
        form = ProposalForm(request.POST, instance=proposal)
        if form.is_valid():
            proposal = form.save(commit=False)
            proposal.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('listProposal')
    context = {'proposals': proposals, 'form': form,
               'data_sender': data_sender, 'labs': labs}
    return render(request, 'dosen/home/editProposal.html', context)


@login_required(login_url='error')
@dosenpbb_only
def hapusProposal(request, pk):
    hapus = Proposal.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Diubah")
    return redirect('listProposal')


@login_required(login_url='error')
@dosenpbb_only
def hapusApply(request, pk):
    hapus = Order.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Diubah")
    return redirect('daftarMahasiswa')

@login_required(login_url='error')
@dosenpbb_only
def updateStatus(request, pk):
    terima = Order.objects.get(id=pk)
    terima.status = not terima.status
    terima.save()
    messages.info(request, "Data Telah Berhasil Diubah")
    return redirect('daftarMahasiswa')

@login_required(login_url='error')
@dosenpbb_only
def lihatProfil(request, pk):
    obj = User.objects.get(id=pk)

    context = {'obj': obj}
    return render(request, 'dosen/home/profilMahasiswa.html', context)


@login_required(login_url='error')
@dosenpbb_only
def view_pdf(request):

    return render(request, 'dosen/home/lihatNilai.html')


@login_required(login_url='error')
@dosenpbb_only
def jadwalKuliah(request):
    obj = JadwalKelasDosen.objects.filter(dosen=request.user.profil_staff)
    paginator = Paginator(obj, 5)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj}
    return render(request, 'dosen/home/jadwalKuliah.html', context)


@login_required(login_url='error')
@dosenpbb_only
def hapusJadwalKuliah(request, pk):
    hapus = JadwalKelasDosen.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Dihapus")
    return redirect('jadwalKuliah')


@login_required(login_url='error')
@dosenpbb_only
def inputJadwalKuliah(request):
    form = JadwalDosenForm()
    if request.method == 'POST':
        form = JadwalDosenForm(request.POST)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.dosen = request.user.profil_staff
            obj.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('jadwalKuliah')

    context = {'form': form}
    return render(request, 'dosen/home/inputJadwal.html', context)

@login_required(login_url='error')
@dosenpbb_only
def revisiTA(request, pk):
    obj = Profil_Mahasiswa.objects.get(id=pk)
    form = RevisiForm(instance=obj)
    if Profil_Mahasiswa.objects.filter(revisi=obj.revisi, batas_revisi=obj.batas_revisi).exists():
        if obj.revisi is None or obj.batas_revisi is None:
            messages.info(request, "Anda belum Mengisi Revisi Untuk Mahasiswa Ini")
        else:
            messages.info(request, "Anda Sudah Mengisi Revisi Untuk Mahasiswa Ini")
    if request.method == 'POST':
        form = RevisiForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('jadwalSidangTA')

    context = {'form': form}
    return render(request, 'dosen/home/revisi.html', context)

@login_required(login_url='error')
@dosenpbb_only
def inputNilaiTA(request, pk):
    obj = Profil_Mahasiswa.objects.get(id=pk)
    form = NilaiTAForm(instance=obj)
    if Profil_Mahasiswa.objects.filter(nilai_ta=obj.nilai_ta).exists():
        if obj.nilai_ta is None:
            messages.info(request, "Anda belum Mengisi Nilai Untuk Mahasiswa Ini")
        else:
            messages.info(request, "Anda Sudah Mengisi Nilai Untuk Mahasiswa Ini")
    if request.method == 'POST':
        form = NilaiTAForm(request.POST, instance=obj)
        if form.is_valid():
            individual_performance_ta = form.cleaned_data['individual_performance_ta']
            progress_report = form.cleaned_data['progress_report']
            final_report = form.cleaned_data['final_report']
            presentasi_demo = form.cleaned_data['presentasi_demo']
            paper = form.cleaned_data['paper']
            buku_ta = form.cleaned_data['buku_ta']
            sidang_ta = form.cleaned_data['sidang_ta']

            # Calculate the value of Nilai
            total = (individual_performance_ta * 0.25) + (progress_report * 0.05) + (final_report * 0.05) + \
                (presentasi_demo * 0.10) + (paper * 0.10) + (buku_ta * 0.25) + (sidang_ta * 0.20)

            # Simpan Nilai
            simpan = form.save(commit=False)
            simpan.nilai_ta = total
            simpan.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('jadwalSidangTA')

    context = {'form': form}
    return render(request, 'dosen/home/nilai.html', context)


@login_required(login_url='error')
@dosenpbb_only
def jadwalSidangTADP(request):
    user = request.user.profil_staff
    pbb = request.user.profil_staff.kode_dosen
    obj = JadwalSidang.objects.filter(Q(daftar_sidang__pbb1=pbb) | Q(daftar_sidang__pbb2=pbb) | Q(penguji1=user) | Q(penguji2=user))
    paginator = Paginator(obj, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj, 'pbb':pbb}
    return render(request, 'dosen/home/jadwalSidangTA.html', context)


@login_required(login_url='error')
@dosenpbb_only
def pengaturanDosen(request):
    laboratorium = Lab.objects.all()
    user=request.user
    obj = Profil_Staff.objects.get(user=user)
    form = ProfilDosenPBBForm(instance=obj)
    if request.method == "POST":
        form = ProfilDosenPBBForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('pengaturanDosen')
    context = {'obj': obj, 'laboratorium': laboratorium}
    return render(request, 'dosen/home/pengaturanDosen.html', context)


@login_required(login_url='error')
@dosenpbb_only
def ubahPasswordDosen(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('ubahPasswordDosen')
    else:
        form = PasswordChangeForm(user=request.user)
    context = {'form': form}
    return render(request, 'dosen/home/ubahPassword.html', context)


# Dosen Kelas Proposal
@login_required(login_url='error')
@dosenmatkul_only
def dashboardDosenMatkul(request):
    user_count = User.objects.count()
    mhs_count = Profil_Mahasiswa.objects.count()
    pbb_count = Profil_Staff.objects.count()
    kelas = request.user.user_kelas.kelas
    daftar = User_Kelas.objects.filter(kelas=kelas).exclude(user=request.user)
    jml_mhs_kelas = daftar.count()
    context = {'user_count': user_count, 'mhs_count': mhs_count,
               'pbb_count': pbb_count, 'jml_mhs_kelas': jml_mhs_kelas}
    return render(request, 'dosen_matkul/home/dashboard.html', context)


@login_required(login_url='error')
@dosenmatkul_only
def nilai(request):
    kelas = request.user.user_kelas.kelas
    daftar = User_Kelas.objects.filter(kelas=kelas).exclude(user=request.user)
    paginator = Paginator(daftar, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    daftar = paginator.get_page(page)
    context = {'daftar': daftar}
    return render(request, 'dosen_matkul/home/nilai.html', context)


@login_required(login_url='error')
@dosenmatkul_only
def inputNilai(request, pk):
    obj = Profil_Mahasiswa.objects.get(id=pk)
    form = NilaiForm(instance=obj)
    if request.method == 'POST':
        form = NilaiForm(request.POST, instance=obj)
        if form.is_valid():
            cd1 = form.cleaned_data['CD_1']
            cd2 = form.cleaned_data['CD_2']
            cd3 = form.cleaned_data['CD_3']
            presentation = form.cleaned_data['presentation']
            individual_performance = form.cleaned_data['individual_performance']

            # Calculate the value of Nilai
            total = (cd1 * 0.15) + (cd2 * 0.15) + (cd3 * 0.20) + \
                (presentation * 0.20) + (individual_performance * 0.3)

            # Simpan Nilai
            simpan = form.save(commit=False)
            simpan.nilai_proposal = total
            simpan.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('nilai')

    context = {'obj': obj}
    return render(request, 'dosen_matkul/home/inputNilai.html', context)


@login_required(login_url='error')
@dosenmatkul_only
def jadwalSempro(request):
    kelas = request.user.user_kelas.kelas
    daftar = Sempro.objects.filter(kelas=kelas).exclude(user=request.user)
    paginator = Paginator(daftar, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    daftar = paginator.get_page(page)

    context = {'daftar': daftar}
    return render(request, 'dosen_matkul/home/jadwalSempro.html', context)


@login_required(login_url='error')
@dosenmatkul_only
def ubahJadwalSempro(request, pk):
    obj = Sempro.objects.get(id=pk)
    user=request.user
    form = EditSemproForm(instance=obj)
    gelas = JadwalSemproDosen.objects.values_list('tanggal', flat=True).filter(user=user)
    gelas = list(gelas)
    gelas = ','.join([str(i) for i in gelas])
    if request.method == "POST":
        form = EditSemproForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('jadwalSempro')
    context = {'obj': obj, 'form': form,'gelas':gelas}
    return render(request, 'dosen_matkul/home/editSempro.html', context)

@login_required(login_url='error')
@dosenmatkul_only
def pengaturanJadwalSempro(request):
    user = request.user
    obj = JadwalSemproDosen.objects.filter(user=user)
    obj2 = JamSemproDosen.objects.filter(user=user)

    context = {'obj':obj, 'obj2':obj2}
    return render(request, 'dosen_matkul/home/pengaturanJadwalSempro.html', context)

@login_required(login_url='error')
@dosenmatkul_only
def hapusJadwalSempro(request, pk):
    hapus = JadwalSemproDosen.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Dihapus")
    return redirect('pengaturanJadwalSempro')

@login_required(login_url='error')
@dosenmatkul_only
def hapusJamSempro(request, pk):
    hapus = JamSemproDosen.objects.get(id=pk)
    hapus.delete()
    messages.info(request, "Data Telah Berhasil Dihapus")
    return redirect('pengaturanJadwalSempro')

@login_required(login_url='error')
@dosenmatkul_only
def inputJadwalSempro(request):
    form1 = JadwalSemproForm()
    form2 = JamSemproForm()
    if request.method == "POST":
            form1 = JadwalSemproForm(request.POST)
            if form1.is_valid():
                sempro = form1.save(commit=False)
                sempro.user = request.user
                sempro.save()
                messages.success(request, "Data Berhasil Diinput")
                return redirect('pengaturanJadwalSempro')
            form2 = JamSemproForm(request.POST)
            if form2.is_valid():
                jam_sempro = form2.save(commit=False)
                jam_sempro.user = request.user
                jam_sempro.save()
                messages.success(request, "Data Berhasil Diinput")
                return redirect('pengaturanJadwalSempro')
    context = {'form1': form1, 'form2': form2}
    return render(request, 'dosen_matkul/home/inputJadwalSempro.html', context)


@login_required(login_url='error')
@dosenmatkul_only
def fileProposal(request):
    kelas = request.user.user_kelas.kelas
    daftar = Sempro.objects.filter(kelas=kelas).exclude(user=request.user)
    paginator = Paginator(daftar, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    daftar = paginator.get_page(page)

    context = {'daftar': daftar}
    return render(request, 'dosen_matkul/home/fileProposal.html', context)

@login_required(login_url='error')
@dosenmatkul_only
def ubahPasswordDM(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('ubahPasswordDM')
    else:
        form = PasswordChangeForm(user=request.user)
    context = {'form': form}
    return render(request, 'dosen_matkul/home/ubahPassword.html', context)


# Mahasiswa
@login_required(login_url='error')
@mahasiswa_only
def dashboardMahasiswa(request):
    user_count = User.objects.count()
    mhs_count = Profil_Mahasiswa.objects.count()
    pbb_count = Profil_Staff.objects.count()
    proposals = Proposal.objects.count()
    context = {'user_count': user_count, 'mhs_count': mhs_count,
               'pbb_count': pbb_count, 'proposals': proposals}
    return render(request, 'mahasiswa/home/dashboardMahasiswa.html', context)


@login_required(login_url='error')
@mahasiswa_only
def proposal(request):
    proposals = Proposal.objects.all()
    hitung = Proposal.objects.annotate(jumlah_pendaftar=Count('order')).filter(order__status=1)
    paginator = Paginator(proposals, 10)  # Show 10 proposals per page
    page = request.GET.get('page')
    proposals = paginator.get_page(page)
    try:
        hitung = Proposal.objects.annotate(jumlah_pendaftar=Count('order')).filter(order__status=1)

        for proposal in proposals:
            try:
                jumlah_pendaftar = hitung.get(id=proposal.id).jumlah_pendaftar
                proposal.sisa_kuota = proposal.jml_mhs - jumlah_pendaftar
            except ObjectDoesNotExist:
                proposal.sisa_kuota = proposal.jml_mhs

    except ObjectDoesNotExist:
        hitung = []
    context = {'proposals': proposals,'hitung': hitung}
    return render(request, 'mahasiswa/home/proposal.html', context)


@login_required(login_url='error')
@mahasiswa_only
def detailProposal(request, id):
    obj = Proposal.objects.get(pk=id)
    user = request.user
    orders = Order.objects.filter(user=user)

    if orders.exists():
            messages.info(request, "Anda sudah mendaftar proposal")
    if request.method == "POST":
        if orders.exists():
            return redirect('errorExist')
        else:
            order = Order(user=user, proposal=obj)
            order.save()
            messages.info(request, "Anda berhasil mendaftar proposal")
            return redirect('proposal')

    try:
        kapasitas = obj.jml_mhs
        terdaftar = Order.objects.filter(proposal=obj, status=True).count()
        sisa_kuota = kapasitas - terdaftar
    except ObjectDoesNotExist:
        sisa_kuota = obj.jml_mhs

    context = {'obj': obj,'sisa_kuota':sisa_kuota}
    return render(request, 'mahasiswa/home/detailProposal.html', context)


@login_required(login_url='error')
@mahasiswa_only
def sidangTA(request):
    obj = Profil_Staff.objects.all().order_by('kode_dosen')
    labs = Lab.objects.all
    form = SidangForm()
    user = request.user
    data = DaftarSidang.objects.filter(user=user)
    if data.exists():
            messages.info(request, "Anda Sudah Mendaftar Sidang")
    if request.method == 'POST':
        form = SidangForm(request.POST, request.FILES)
        if data.exists():
            return redirect('errorExist')
        if form.is_valid():
            sidang = form.save(commit=False)
            sidang.user = request.user
            sidang.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('dashboardMahasiswa')

    context = {'obj': obj, 'form': form, 'labs': labs}
    return render(request, 'mahasiswa/home/sidangTA.html', context)


@login_required(login_url='error')
@mahasiswa_only
def pengaturanMahasiswa(request):
    user = request.user
    obj = Profil_Mahasiswa.objects.get(user=user)
    form = ProfilForm(instance=obj)
    if request.method == "POST":
        form = ProfilForm(request.POST, request.FILES, instance=obj)
        if form.is_valid():
            form.save()
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('pengaturanMahasiswa')
    context = {'obj': obj}
    return render(request, 'mahasiswa/home/pengaturanMahasiswa.html', context)


@login_required(login_url='error')
@mahasiswa_only
def ubahPasswordMahasiswa(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.info(request, "Data Telah Berhasil Diubah")
            return redirect('ubahPasswordMahasiswa')
    else:
        form = PasswordChangeForm(user=request.user)
    context = {'form': form}
    return render(request, 'mahasiswa/home/ubahPassword.html', context)


@login_required(login_url='error')
@mahasiswa_only
def lengkapiProfil(request):
    form = ProfilForm()
    if request.method == "POST":
        form = ProfilForm(request.POST, request.FILES)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.user = request.user
            obj.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('tambahKelas')
    context = {'form': form}
    return render(request, 'mahasiswa/home/lengkapiProfil.html', context)


@login_required(login_url='error')
@mahasiswa_only
def seminarProposal(request):
    form = SemproForm()
    pbb = Profil_Staff.objects.all()
    kelas = User_Kelas.objects.filter(user=request.user)
    user_kelas_data = User_Kelas.objects.filter(kelas=request.user.user_kelas.kelas)
    gelas = JadwalSemproDosen.objects.filter(user__user_kelas__in=user_kelas_data).values_list('tanggal', flat=True)
    gelas = list(gelas)
    gelas = ','.join([str(i) for i in gelas])
    waktu = JamSemproDosen.objects.filter(user__user_kelas__in=user_kelas_data)
    user = request.user
    sempros = Sempro.objects.filter(user=user)
    if request.method == "POST":
        if sempros.exists():
            messages.info(request, "Anda sudah mendaftar sempro")
        else:
            form = SemproForm(request.POST, request.FILES)
            if form.is_valid():
                obj = form.save(commit=False)
                obj.user = request.user
                obj.save()
                messages.success(request, "Data Telah Berhasil Ditambahkan")
                return redirect('jadwalSemproMhs')
    context = {'form': form, 'pbb': pbb, 'kelas': kelas, 'gelas':gelas, 'waktu':waktu}
    return render(request, 'mahasiswa/home/seminarProposal.html', context)

@login_required(login_url='error')
@mahasiswa_only
def uploadRevisi(request):
    form = FileForm()
    Files = File.objects.all()
    data = File.objects.filter(user=request.user)
    if data.exists():
            messages.info(request, "Anda Sudah Mengirim Revisi")
    if request.method == "POST":
        form = FileForm(request.POST, request.FILES)
        if data.exists():
            return redirect('errorExist')
        if form.is_valid():
            obj = form.save(commit=False)
            obj.user = request.user
            obj.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('dashboardMahasiswa')

    context = {'form': form, 'Files': Files}
    return render(request, 'mahasiswa/home/uploadRevisi.html', context)


@login_required(login_url='error')
@mahasiswa_only
def statusDiterima(request):
    orders = Order.objects.filter(user=request.user)
    context = {'orders': orders}
    return render(request, 'mahasiswa/home/statusDiterima.html', context)


@login_required(login_url='error')
@mahasiswa_only
def profilMahasiswa(request):
    return render(request, 'mahasiswa/home/profile.html')


@login_required(login_url='error')
@mahasiswa_only
def nilaiProposal(request):
    return render(request, 'mahasiswa/home/nilai.html')

@login_required(login_url='error')
@mahasiswa_only
def nilaiTA(request):
    return render(request, 'mahasiswa/home/nilaiTA.html')


@login_required(login_url='error')
@mahasiswa_only
def jadwalSemproMhs(request):
    return render(request, 'mahasiswa/home/jadwalSempro.html')


@login_required(login_url='error')
@mahasiswa_only
def tambahKelas(request):
    form = KelasForm()
    if request.method == "POST":
        form = KelasForm(request.POST)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.user = request.user
            obj.save()
            messages.success(request, "Data Telah Berhasil Ditambahkan")
            return redirect('dashboardMahasiswa')

    context = {'form': form}
    return render(request, 'mahasiswa/home/tambahKelas.html', context)

# AJAX


def load_kelas(request):
    angkatan_id = request.GET.get('angkatan_id')
    kelas = Kelas.objects.filter(angkatan_id=angkatan_id).all()
    return render(request, 'mahasiswa/includes/kelas_dropdown_lists_options.html', {'kelas': kelas})
    # return JsonResponse(list(cities.values('id', 'name')), safe=False)


@login_required(login_url='error')
@mahasiswa_only
def tutorial(request):
    return render(request, 'mahasiswa/home/tutorial.html')

@login_required(login_url='error')
@mahasiswa_only
def jadwalSidangMhs(request):
    obj = JadwalSidang.objects.all()
    date = JadwalSidang.objects.prefetch_related('daftar_sidang').all()
    paginator = Paginator(obj, 10)  # Show 10 proposals per page

    page = request.GET.get('page')
    obj = paginator.get_page(page)
    context = {'obj': obj, 'date': date}
    return render(request, 'mahasiswa/home/jadwalSidangTA.html', context)


def generate_schedule():
    ds = list(DaftarSidang.objects.values())
    rs = list(RuangSidang.objects.values())
    js = list(JadwalSidang.objects.values())
    p1 = list(Profil_Staff.objects.values())
    p2 = list(Profil_Staff.objects.values())

    for i in range(len(p1)):
        p1[i]['list_mengajar'] = list(
            JadwalKelasDosen.objects.filter(dosen=p1[i]['id']).values())
        p2[i]['list_mengajar'] = p1[i]['list_mengajar']

    ga = GeneticAlgorithm(ds, rs, p1, p2, js)
    ga.main()
    return ga.best_result