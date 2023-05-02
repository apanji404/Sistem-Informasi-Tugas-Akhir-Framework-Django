class DaftarSidang:
    daftarSidang = None

    def __init__(self, id, judul_indo, kel_keahlian, waktu_sidang, hari_sidang, pbb1, pbb2):
        self.id = id
        self.judul_indo = judul_indo
        self.kel_keahlian = kel_keahlian
        self.waktu_sidang = waktu_sidang
        self.hari_sidang = hari_sidang
        self.pbb1 = pbb1
        self.pbb2 = pbb2

    @staticmethod
    def find(id):
        for i in range(len(DaftarSidang.daftarSidang)):
            if DaftarSidang.daftarSidang[i].id == id:
                return i
        return -1

    def __repr__(self):
        return  "ID : " + str(self.id) + "| Waktu :"+ self.hari_sidang + ", " + self.waktu_sidang +" | Pbb1 : " + self.pbb1 + " | Pbb2 : " + self.pbb2


class Room:
    rooms = None

    def __init__(self, id, nama_ruang):
        self.id = id
        self.nama_ruang = nama_ruang

    @staticmethod
    def find(id):
        for i in range(len(Room.rooms)):
            if Room.rooms[i].id == id:
                return i
        return -1

    def __repr__(self):
        return "Ruangan:  " + self.nama_ruang


class Penguji1:
    penguji = None

    def __init__(self, id, kode_dosen, kelompok_keahlian, list_mengajar):
        self.id = id
        self.kode_dosen = kode_dosen
        self.kelompok_keahlian = kelompok_keahlian
        self.list_mengajar = list_mengajar

    @staticmethod
    def find(kode_dosen):
        for i in range(len(Penguji1.penguji)):
            if Penguji1.penguji[i].kode_dosen == kode_dosen:
                return i
        return -1

    def getListMengajar(self):
        for lm in self.list_mengajar:
            print(lm)

    def __repr__(self):
        return "Penguji1 : " + self.kode_dosen


class Penguji2:
    penguji = None

    def __init__(self, id, kode_dosen, kelompok_keahlian, list_mengajar):
        self.id = id
        self.kode_dosen = kode_dosen
        self.kelompok_keahlian = kelompok_keahlian
        self.list_mengajar = list_mengajar

    @staticmethod
    def find(kode_dosen):
        for i in range(len(Penguji2.penguji)):
            if Penguji2.penguji[i].kode_dosen == kode_dosen:
                return i
        return -1

    def __repr__(self):
        return "Penguji2 : " + self.kode_dosen


class JadwalSidang:
    jadwalSidang = None

    def __init__(self, p1_id, p2_id, ds_id, room_id):
        self.p1_id = p1_id
        self.p2_id = p2_id
        self.ds_id = ds_id
        self.room_id = room_id

    def __repr__(self):
        return "Jadwal Tercatat :" + str(self.p1_id) + ":" + str(self.p2_id) + ":" + str(self.ds_id) + ":" + str(self.room_id)


