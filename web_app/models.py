from django.db import models
from django.contrib.auth.models import User

class Angkatan(models.Model):
    nama = models.CharField(max_length=50, null=True)

    def __str__(self):
        return str(self.nama)

class Kelas(models.Model):
    angkatan = models.ForeignKey(Angkatan, null=True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=50, null=True)

    def __str__(self):
        return str(self.nama)

class User_Kelas(models.Model):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, blank=True, null=True)
    angkatan = models.ForeignKey(Angkatan, on_delete=models.SET_NULL, blank=True, null=True)
    kelas = models.ForeignKey(Kelas, on_delete=models.SET_NULL, blank=True, null=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.user)

class Lab(models.Model):
    nama = models.CharField(max_length=200, null=True)

    def __str__(self):
        return str(self.nama)

class Profil_Mahasiswa(models.Model):
    user = models.OneToOneField(User, null= True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=200, null=True)
    nim = models.IntegerField(null=True)
    email = models.CharField(max_length=200, null=True)
    bakat = models.CharField(max_length=200, null=True)
    foto_profil = models.ImageField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    berkas_nilai = models.FileField(upload_to='pdf/nilai', storage=None, max_length=200)
    nilai_proposal = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    individual_performance = models.IntegerField(null=True, blank=True)
    CD_1 = models.IntegerField(null=True, blank=True)
    CD_2 = models.IntegerField(null=True, blank=True)
    CD_3 = models.IntegerField(null=True, blank=True)
    presentation = models.IntegerField(null=True, blank=True)
    individual_performance_ta = models.IntegerField(null=True, blank=True)
    progress_report = models.IntegerField(null=True, blank=True)
    final_report = models.IntegerField(null=True, blank=True)
    presentasi_demo = models.IntegerField(null=True, blank=True)
    paper = models.IntegerField(null=True, blank=True)
    buku_ta = models.IntegerField(null=True, blank=True)
    sidang_ta = models.IntegerField(null=True, blank=True)
    nilai_ta = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    revisi = models.CharField(max_length=10000, blank=True, null=True)
    batas_revisi = models.CharField(max_length=200, blank=True, null=True)
    hari_ini = models.CharField(max_length=200, blank=True, null=True)
    judul_ta = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return str(self.nama)

class Profil_Staff(models.Model):
    labs = (
        ('Seculab', 'Seculab'),
        ('SEA', 'SEA'),
        ('Rnest', 'Rnest'),
        ('Magics', 'Magics'),
        ('I-Smile', 'I-Smile'),
        ('Evconn', 'Evconn'),
    )
    user = models.OneToOneField(User, null= True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=200, null=True)
    nip = models.CharField(max_length=200, null=True)
    kode_dosen = models.CharField(max_length=5, null=True)
    kelompok_keahlian = models.CharField(max_length = 200, choices=labs, null=True)
    email = models.CharField(max_length=200, null=True)
    foto_profil = models.ImageField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.kode_dosen)

class Proposal(models.Model):
    user = models.ForeignKey(User, null= True, on_delete=models.CASCADE)
    judul = models.CharField(max_length=200, null=True, blank=True)
    skill = models.CharField(max_length=200, null=True, blank=True)
    pbb1 = models.CharField(max_length=200, null=True, blank=True)
    pbb2 = models.CharField(max_length=200, null=True, blank=True)
    pengusul = models.CharField(max_length=200, null=True)
    lab = models.CharField(max_length=200, null=True, blank=True)
    jml_mhs = models.IntegerField(null=True, blank=True)
    penelitian_sebelumnya = models.CharField(max_length=200, null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.judul)

class Order(models.Model):
    user = models.OneToOneField(User, null= True, on_delete=models.CASCADE)
    proposal = models.OneToOneField(Proposal, null=True, on_delete=models.CASCADE)
    status = models.BooleanField(default=False)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    def __str__(self):
        return str(self.proposal)

class File(models.Model):
    user = models.OneToOneField(User, null= True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=200, null=True)
    nim = models.IntegerField(null=True)
    fakultas = models.CharField(max_length=200, null=True)
    revisi = models.FileField(upload_to='pdf/revisi',storage=None, max_length=200, blank=True)
    lembar_ta = models.FileField(upload_to='pdf/lembar_ta',storage=None, max_length=200, blank=True)
    jurnal = models.FileField(upload_to='pdf/jurnal',storage=None, max_length=200, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.nama)

class Sempro(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=200, null=True)
    nim = models.IntegerField(null=True)
    kelas = models.CharField(max_length=50, null=True)
    tanggal = models.CharField(max_length=200, null=True, blank=True)
    jam = models.CharField(max_length=200, null=True, blank=True)
    pbb1 = models.CharField(max_length=50, null=True)
    pbb2 = models.CharField(max_length=50, null=True)
    judul = models.CharField(max_length=200, null=True)
    cd1 = models.FileField(upload_to='pdf/CD1/', storage=None, null=True, max_length=200)
    cd2 = models.FileField(upload_to='pdf/CD2/', storage=None, null=True, max_length=200)
    cd3 = models.FileField(upload_to='pdf/CD3/', storage=None, null=True, max_length=200)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.nama)

# Tambahkan ruang sidang
class RuangSidang(models.Model):
    nama_ruang = models.CharField(max_length = 100)
    def __str__(self):
        return str(self.nama_ruang)

class DaftarSidang(models.Model):
    user = models.OneToOneField(User, null=True, on_delete=models.CASCADE)
    nama = models.CharField(max_length=200, null=True)
    nim = models.IntegerField(null=True)
    judul_indo = models.CharField(max_length=400, null=True)
    pbb1 = models.CharField(max_length=100, null=True)
    pbb2 = models.CharField(max_length=100, null=True)
    hari_sidang = models.CharField(max_length=200, null=True)
    waktu_sidang = models.CharField(max_length=100, null=True)
    kelompok_keahlian = models.CharField(max_length=100, null=True)
    email = models.CharField(max_length=200, null=True)
    kelas = models.CharField(max_length=100, null=True)
    prodi = models.CharField(max_length=100, null=True)
    tak = models.IntegerField(null=True)
    eprt = models.IntegerField(null=True)
    judul_inggris = models.CharField(max_length=400, null=True)
    whatsapp = models.BigIntegerField(null=True)
    persetujuan = models.CharField(max_length=50, null= True)
    berkas = models.FileField(upload_to='pdf/sidang/', storage=None, max_length=200)
    status = models.BooleanField(default=False)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return str(self.nama)

class JadwalKelasDosen(models.Model):
    day = (
        ('Senin', 'Senin'),
        ('Selasa', 'Selasa'),
        ('Rabu', 'Rabu'),
        ('Kamis', 'Kamis'),
        ('Jumat', 'Jumat'),
    )
    jam = (
        ('08:30 - 10.30', '08:30 - 10.30'),
        ('10:30 - 12.30', '10:30 - 12.30'),
        ('12:30 - 14.30', '12:30 - 14.30'),
        ('14:30 - 16.30', '14:30 - 16.30'),
    )
    dosen = models.ForeignKey(Profil_Staff, null=True, on_delete=models.CASCADE)
    hari = models.CharField(max_length=200, choices=day, null=True)
    waktu = models.CharField(max_length=200, choices=jam, null=True)
    def __str__(self):
        return str(self.dosen)
    
# Model untuk tabel hasil jadwal sidang
class JadwalSidang(models.Model):
    daftar_sidang = models.ForeignKey(DaftarSidang, null=True, on_delete=models.CASCADE)
    penguji1 = models.ForeignKey(Profil_Staff, null=True, on_delete=models.CASCADE, related_name='penguji1')
    penguji2 = models.ForeignKey(Profil_Staff, null=True, on_delete=models.CASCADE, related_name='penguji2')
    ruang = models.ForeignKey(RuangSidang, null=True, on_delete=models.CASCADE)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

class JadwalSemproDosen(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    tanggal = models.CharField(max_length=200, null=True)

class JamSemproDosen(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    jam_mulai = models.CharField(max_length=200, null=True)
    jam_selesai = models.CharField(max_length=200, null=True)
