from django.urls import URLPattern, path
from web_app import views

urlpatterns = [
    #login
    path('', views.loginPage, name='loginPage'),
    path('', views.logoutUser, name='logoutUser'),

    #registrasi
    path('registrasi', views.registrasi, name='registrasi'),
    
    #laa
    path('laa/dashboard', views.dashboardLAA, name='dashboardLAA'),
    path('laa/permintaan-sidang', views.reqSidangTA, name='reqSidangTA'),
    path('laa/permintaan-sidang/hapus/<str:pk>', views.hapusReqSidang, name='hapusReqSidang'),
    path('laa/permintaan-sidang/terima/<str:pk>', views.terimaReqSidang, name='terimaReqSidang'),
    path('laa/jadwal-sidang', views.jadwalSidangLAA, name='jadwalSidangLAA'),
    path('akun/laa/pengaturan', views.pengaturanLAA, name='pengaturanLAA'),
    path('akun/laa/ubah-password', views.ubahPasswordLAA, name='ubahPasswordLAA'),
    
    #dosen
    path('dosen-pembimbing/dashboard', views.dashboardDosen, name='dashboardDosen'),
    path('dosen-pembimbing/input-proposal', views.inputProposal, name='inputProposal'),
    path('dosen-pembimbing/daftar-mahasiswa', views.daftarMahasiswa, name='daftarMahasiswa'),
    path('akun/dosen-pembimbing/profil-dosen', views.profilDosen, name='profilDosen'),
    path('akun/dosen-pembimbing/pengaturan-dosen', views.pengaturanDosen, name='pengaturanDosen'),
    path('akun/dosen-pembimbing/ubah-password', views.ubahPasswordDosen, name='ubahPasswordDosen'),
    path('profil/mahasiswa/<str:pk>', views.lihatProfil, name='lihatProfil'),
    path('media/', views.view_pdf, name='lihatNilai'),
    path('dosen-pembimbing/list-proposal', views.listProposal, name='listProposal'),
    path('editProposal/<str:pk>', views.editProposal, name='editProposal'),
    path('tolakMahasiswa/<str:pk>', views.hapusApply, name='tolakMahasiswa'),
    path('dosen-pembimbing/jadwal-kuliah', views.jadwalKuliah, name='jadwalKuliah'),
    path('hapusJadwalKuliah/<str:pk>', views.hapusJadwalKuliah, name='hapusJadwalKuliah'),
    path('dosen-pembimbing/input-jadwal-dosen', views.inputJadwalKuliah, name='inputJadwalDosen'),
    path('dosen-pembimbing/jadwal-sidang', views.jadwalSidangTADP, name='jadwalSidangTA'),
    path('hapusProposal/<str:pk>', views.hapusProposal, name='hapusProposal'),
    path('updateStatus/<str:pk>', views.updateStatus, name='updateStatus'),
    path('dosen-pembimbing/input-nilai-ta/<str:pk>', views.inputNilaiTA, name='inputNilaiTA'),
    path('dosen-pembimbing/input-revisi-ta/<str:pk>', views.revisiTA, name='inputRevisiTA'),

    #Dosen Fungsional
    path('dosen-fungsional/dashboard', views.dashboardDosenFungsional, name='dashboardDosenFungsional'),
    path('dosen-fungsional/list-permintaan-sidang', views.listRequest, name='listRequestJadwal'),
    path('generateJadwal', views.generateJadwal, name='generateJadwal'),
    path('dosen-fungsional/hasil-jadwal', views.hasilJadwal, name='hasilJadwal'),
    path('dosen-fungsional/ruang-sidang', views.ruangSidang, name='ruangSidang'),
    path('editJadwal/<str:pk>', views.editJadwal, name='editJadwal'),
    path('dosen-fungsional/tambah-ruang-sidang', views.tambahRuangSidang, name='tambahRuangSidang'),
    path('hapusRuangSidang/<str:pk>', views.hapusRuang, name='hapusRuangSidang'),
    path('akun/dosen-fungsional/pengaturan', views.pengaturanDF, name='pengaturanDF'),

    #Dosen Matkul
    path('dosen-matkul/dashboard', views.dashboardDosenMatkul, name='dashboardDosenMatkul'),
    path('dosen-matkul/nilai', views.nilai, name='nilai'),
    path('inputNilai/<str:pk>', views.inputNilai, name='inputNilai'),
    path('dosen-matkul/jadwal-sempro', views.jadwalSempro, name='jadwalSempro'),
    path('editSempro/<str:pk>', views.ubahJadwalSempro, name='editSempro'),
    path('dosen-matkul/file-proposal', views.fileProposal, name='fileProposal'),
    path('dosen-pembimbing/pengaturan-jadwal-sempro', views.pengaturanJadwalSempro, name='pengaturanJadwalSempro'),
    path('input-jadwal-sempro', views.inputJadwalSempro, name='inputJadwalSempro'),
    path('hapusJadwalSempro/<str:pk>', views.hapusJadwalSempro, name='hapusJadwalSempro'),
    path('hapusJamSempro/<str:pk>', views.hapusJamSempro, name='hapusJamSempro'),
    path('akun/dosen-matkul/ubah-password', views.ubahPasswordDM, name='ubahPasswordDM'),
   
    #mahasiswa
    path('mahasiswa/dashboard', views.dashboardMahasiswa, name='dashboardMahasiswa'),
    path('mahasiswa/proposal', views.proposal, name='proposal'),
    path('detail-proposal/<int:id>', views.detailProposal, name='detailProposal'),
    path('mahasiswa/sidangTA', views.sidangTA, name='sidangTA'),
    path('mahasiswa/seminar-proposal', views.seminarProposal, name='seminarProposal'),
    path('mahasiswa/upload-revisi', views.uploadRevisi, name='uploadRevisi'),
    path('mahasiswa/status-proposal', views.statusDiterima, name='statusDiterima'),
    path('akun/mahasiswa/pengaturan-mahasiswa', views.pengaturanMahasiswa, name='pengaturanMahasiswa'),
    path('akun/mahasiswa/ubah-password-mahasiswa', views.ubahPasswordMahasiswa, name='ubahPasswordMahasiswa'),
    path('akun/mahasiswa/tambah-kelas', views.tambahKelas, name='tambahKelas'),
    path('mahasiswa/nilai-proposal', views.nilaiProposal, name='nilaiProposal'),
    path('mahasiswa/nilai-tugas-akhir', views.nilaiTA, name='nilaiTA'),
    path('tutorial', views.tutorial, name='tutorial'),
    path('akun/mahasiswa/profil-mahasiswa', views.profilMahasiswa, name='profilMahasiswa'),
    path('akun/mahasiswa/lengkapi-profil', views.lengkapiProfil, name='lengkapiProfil'),
    path('mahasiswa/jadwal-sidang', views.jadwalSidangMhs, name='jadwalSidangMhs'),
    path('mahasiswa/jadwal-sempro', views.jadwalSemproMhs, name='jadwalSemproMhs'),

    #404 Error
    path('error403', views.error403, name='error403'),
    path('error', views.errorExist, name='errorExist'),

    #Ajax
    path('ajax/load-kelas/', views.load_kelas, name='ajax_load_kelas'),
]