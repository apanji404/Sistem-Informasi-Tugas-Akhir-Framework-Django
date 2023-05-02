from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import User_Kelas, Proposal, File, Order, Profil_Mahasiswa, JadwalKelasDosen, JadwalSemproDosen
from .models import Sempro, DaftarSidang, Kelas, Angkatan, JadwalSidang, Profil_Staff, RuangSidang, JamSemproDosen
from django.forms import ModelForm


# Create your forms here.

class NewUserForm(UserCreationForm):
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ["first_name", "last_name", "username", "email", "password1", "password2"]

	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False)
		user.email = self.cleaned_data['email']
		if commit:
			user.save()
		return user

class KelasForm(ModelForm):
	class Meta:
		model = User_Kelas
		fields = ["angkatan", "kelas"]
		widgets = {
            'angkatan': forms.Select(attrs={

                'class': 'form-control'
            }),
            'kelas': forms.Select(attrs={
                'class': 'form-control'
            })
        }
	
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)
		self.fields['kelas'].queryset = Kelas.objects.none()

		if 'angkatan' in self.data:
			try:
				angkatan_id = int(self.data.get('angkatan'))
				self.fields['kelas'].queryset = Kelas.objects.filter(angkatan_id=angkatan_id).order_by('nama')
			except (ValueError, TypeError):
				pass  # invalid input from the client; ignore and fallback to empty City queryset
		elif self.instance.pk:
			self.fields['kelas'].queryset = self.instance.angkatan.kelas_set.order_by('nama')

class ProposalForm(ModelForm):
	class Meta:
		model = Proposal
		fields = ["judul", "skill", "pbb1", "pbb2", "pengusul", "lab", "penelitian_sebelumnya", "jml_mhs"]

class FileForm(ModelForm):
	class Meta:
		model = File
		fields = ["nama", "nim", "fakultas", "revisi", "lembar_ta", "jurnal"]


class ApplyForm(ModelForm):
	class Meta:
		model = Order
		fields = ["proposal"]

class SemproForm(ModelForm):
	class Meta:
		model = Sempro
		fields = ["nama", "nim", "kelas", "tanggal", "jam", "pbb1", "pbb2", "judul", "cd1", "cd2", "cd3"]
class EditSemproForm(ModelForm):
	class Meta:
		model = Sempro
		fields = ["tanggal", "jam"]

class ProfilForm(ModelForm):
	class Meta:
		model = Profil_Mahasiswa
		fields = ["nama", "nim", "email", "bakat","berkas_nilai", "foto_profil"]

class ProfilDosenPBBForm(ModelForm):
	class Meta:
		model = Profil_Staff
		fields = ["nama", "nip", "email", "kelompok_keahlian", "kode_dosen"]

class SidangForm(ModelForm):
	class Meta:
		model = DaftarSidang
		fields = ["nama", "nim", "email", "kelas", "prodi", "pbb1", "pbb2", "hari_sidang", "waktu_sidang", "tak", "eprt", "judul_indo", "judul_inggris", "whatsapp", "persetujuan", "kelompok_keahlian", "berkas"]

class NilaiForm(ModelForm):
	class Meta:
		model = Profil_Mahasiswa
		fields = ["CD_1", "CD_2", "CD_3", "presentation", "individual_performance"]

class EditSidangForm(ModelForm):
	class Meta:
		model = JadwalSidang
		fields = ["penguji1", "penguji2", "ruang"]
		ps = Profil_Staff.objects.all()
		widgets = {
            'penguji1': forms.Select(attrs={
                'class': 'form-control'
            }, choices=[(penguji1.kode_dosen, penguji1.kode_dosen) for penguji1 in ps]),
            'penguji2': forms.Select(attrs={
                'class': 'form-control'
            }, choices=[(penguji2.kode_dosen, penguji2.kode_dosen) for penguji2 in ps]),
			'ruang': forms.Select(attrs={
                'class': 'form-control'
            })
        }

class JadwalDosenForm(ModelForm):
	class Meta:
		model = JadwalKelasDosen
		fields = ["hari", "waktu"]
		widgets = {
            'hari': forms.Select(attrs={

                'class': 'form-control'
            }),
            'waktu': forms.Select(attrs={
                'class': 'form-control'
            })
        }

class RuangSidangForm(ModelForm):
	class Meta:
		model = RuangSidang
		fields = ["nama_ruang"]

class JadwalSemproForm(ModelForm):
	class Meta:
		model = JadwalSemproDosen
		fields = ["tanggal"]

class JamSemproForm(ModelForm):
	class Meta:
		model = JamSemproDosen
		fields = ["jam_mulai", "jam_selesai"]

class RevisiForm(ModelForm):
	class Meta:
		model = Profil_Mahasiswa
		fields = ["revisi", "batas_revisi", "hari_ini", "judul_ta"]
		
class NilaiTAForm(ModelForm):
	class Meta:
		model = Profil_Mahasiswa
		fields = ["individual_performance_ta", "progress_report", "final_report", "presentasi_demo", "paper", "buku_ta", "sidang_ta", "nilai_ta"]