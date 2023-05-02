from django.contrib import admin
from .models import Kelas, User_Kelas, Profil_Mahasiswa, Profil_Staff, RuangSidang
from .models import Proposal, Lab, File, Order, Sempro, Angkatan, DaftarSidang, JadwalKelasDosen

# Register your models here.

admin.site.register(Kelas)
admin.site.register(Angkatan)
admin.site.register(Profil_Mahasiswa)
admin.site.register(Profil_Staff)
admin.site.register(Proposal)
admin.site.register(File)
admin.site.register(Order)
admin.site.register(Sempro)
admin.site.register(DaftarSidang)
admin.site.register(RuangSidang)
admin.site.register(JadwalKelasDosen)
admin.site.register(User_Kelas)