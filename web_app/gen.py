import random
import copy
from .Model import DaftarSidang as m_DaftarSidang, Room as m_Room, Penguji1 as m_Penguji1, Penguji2 as m_Penguji2, JadwalSidang as m_JadwalSidang
from math import ceil, log2
import math
import pandas as pd
import time
import matplotlib.pyplot as plt

start_time = time.time()

class GeneticAlgorithm:
    #inisiasi dataset
    def __init__(self, ds, rs, p1, p2, js):
        # prepare DaftarSidang
        self.ds = ds
        m_DaftarSidang.daftarSidang = []
        for _ds in ds:
            m_DaftarSidang.daftarSidang.append(
                m_DaftarSidang(_ds['id'], _ds['judul_indo'], _ds['kelompok_keahlian'], _ds['waktu_sidang'], _ds['hari_sidang'], _ds['pbb1'], _ds['pbb2']))

        # prepare RuangSidang
        self.rs = rs

        m_Room.rooms = []
        for _rs in rs:
            m_Room.rooms.append(
                m_Room(_rs['id'], _rs['nama_ruang']))

        # prepare Penguji1
        self.p1 = p1

        m_Penguji1.penguji = []
        for _p1 in p1:
            m_Penguji1.penguji.append(

                m_Penguji1(_p1['id'], _p1['kode_dosen'], _p1['kelompok_keahlian'], _p1['list_mengajar']))

        # prepare Penguji2
        self.p2 = p2

        m_Penguji2.penguji = []
        for _p2 in p2:
            m_Penguji2.penguji.append(
                m_Penguji2(_p2['id'], _p2['kode_dosen'], _p2['kelompok_keahlian'], _p2['list_mengajar']))

        self.js = js
        m_JadwalSidang.jadwalSidang = []
        for _js in js:
            m_JadwalSidang.jadwalSidang.append(
                m_JadwalSidang(_js['penguji1_id'], _js['penguji2_id'], _js['daftar_sidang_id'], _js['ruang_id']))
        
        self.ds_model = m_DaftarSidang
        self.room_model = m_Room
        self.penguji1_model = m_Penguji1
        self.penguji2_model = m_Penguji2
        self.js_model = m_JadwalSidang
        self.avg_fitness = 0
        
        self.cpg=[]
        self.bin_rooms=[]
        self.bin_penguji1=[]
        self.bin_penguji2=[]
        self.bits_needed_backup_store={}  # to improve performance
        self.best_result = None

    def bits_needed(self, x):
        # global bits_needed_backup_store
        r=self.bits_needed_backup_store.get(id(x))
        if r is None:
            r=int(ceil(log2(len(x))))
            self.bits_needed_backup_store[id(x)]=r
        return max(r, 1)
    # konversi input ke binary
    def convert_input_to_bin(self):

        self.cpg = []
        for i in range(len(self.ds_model.daftarSidang)):
            self.cpg.append((bin(i)[2:]).rjust(
                self.bits_needed(self.ds_model.daftarSidang), '0'))

        for r in range(len(self.room_model.rooms)):
            self.bin_rooms.append((bin(r)[2:]).rjust(
                self.bits_needed(self.room_model.rooms), '0'))

        for r in range(len(self.penguji1_model.penguji)):
            self.bin_penguji1.append((bin(r)[2:]).rjust(
                self.bits_needed(self.penguji1_model.penguji), '0'))

        for r in range(len(self.penguji2_model.penguji)):
            self.bin_penguji2.append((bin(r)[2:]).rjust(
                self.bits_needed(self.penguji2_model.penguji), '0'))

    def daftar_sidang_bits(self, chromosome):
        i = 0
        return chromosome[i:i + self.bits_needed(self.ds_model.daftarSidang)]
    
    def room_bits(self, chromosome):
        i = self.bits_needed(self.ds_model.daftarSidang)

        return chromosome[i:i + self.bits_needed(self.room_model.rooms)]
    
    def penguji1_bits(self, chromosome):
        i = self.bits_needed(self.ds_model.daftarSidang) + \
            self.bits_needed(self.room_model.rooms)
        return chromosome[i:i + self.bits_needed(self.penguji1_model.penguji)]
    
    def penguji2_bits(self, chromosome):
        i = self.bits_needed(self.ds_model.daftarSidang) + \
            self.bits_needed(self.room_model.rooms) + \
            self.bits_needed(self.penguji1_model.penguji)
        return chromosome[i:i + self.bits_needed(self.penguji2_model.penguji)]
    
    def penguji_sama(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p1 = self.penguji1_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            _p2 = self.penguji2_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            if _p1.id == _p2.id:
                scores += 1
        return scores
    
    
    def bentrok_jadwal_penguji1(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p1 = self.penguji1_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            for _lm in _p1.list_mengajar:
                if _ds.hari_sidang == _lm['hari'] and _ds.waktu_sidang == _lm['waktu']:
                    scores += 1
        return scores

    def bentrok_jadwal_penguji2(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p2 = self.penguji2_model.penguji[int(
                self.penguji2_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            for _lm in _p2.list_mengajar:
                if _ds.hari_sidang == _lm['hari'] and _ds.waktu_sidang == _lm['waktu']:
                    scores += 1
        return scores
    
    def bentrok_pbb_dan_penguji1(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p1 = self.penguji1_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            if _p1.kode_dosen == _ds.pbb1 or _p1.kode_dosen == _ds.pbb2:
                scores += 1
        return scores
    
    def bentrok_pbb_dan_penguji2(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p2 = self.penguji2_model.penguji[int(
                self.penguji2_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            if _p2.kode_dosen == _ds.pbb1 or _p2.kode_dosen == _ds.pbb2:
                scores += 1
        return scores
    
    def kesesuaian_keahlian_penguji1(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p1 = self.penguji1_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            if _p1.kelompok_keahlian == _ds.kel_keahlian or _p1.kelompok_keahlian == _ds.kel_keahlian:
                scores += 1
        return scores
    
    def kesesuaian_keahlian_penguji2(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p2 = self.penguji2_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            _ds = self.ds_model.daftarSidang[int(
                self.daftar_sidang_bits(chromosome[i]), 2)]
            if _p2.kelompok_keahlian == _ds.kel_keahlian or _p2.kelompok_keahlian == _ds.kel_keahlian:
                scores += 1
        return scores
    
    def bobot_penguji1(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p1 = self.penguji1_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            for _js in self.js_model.jadwalSidang:
                if _js.p1_id == _p1.id or _js.p2_id == _p1.id:
                    scores += 1
        return scores
    
    def bobot_penguji2(self, chromosome):
        scores = 0
        for i in range(len(chromosome) - 1):  # select one cpg pair
            _p2 = self.penguji2_model.penguji[int(
                self.penguji1_bits(chromosome[i]), 2)]
            for _js in self.js_model.jadwalSidang:
                if _js.p1_id == _p2.id or _js.p2_id == _p2.id:
                    scores += 1
        return scores

    # evaluasi nilai fitness
    def evaluate(self, chromosomes):
        # global max_score
        score=0
        score += self.bentrok_jadwal_penguji1(chromosomes)
        score += self.bentrok_jadwal_penguji2(chromosomes)
        score += self.bentrok_pbb_dan_penguji1(chromosomes)
        score += self.bentrok_pbb_dan_penguji2(chromosomes)
        score += self.kesesuaian_keahlian_penguji1(chromosomes)
        score += self.kesesuaian_keahlian_penguji2(chromosomes)
        score += self.bobot_penguji1(chromosomes)
        score += self.bobot_penguji2(chromosomes)
        #score += self.penguji_sama(chromosomes)
        return 1 / (1 + score)

    def cost(self, solution):
        return 1 / float(self.evaluate(solution))

    def init_population(self, n):
        # global cpg, lts, slots
        # TODO check population, chromosomes
        chromosomes=[]
        for _n in range(n):
            chromosome=[]
            for _c in self.cpg:
                chromosome.append(
                    _c + random.choice(self.bin_rooms) + random.choice(self.bin_penguji1) + random.choice(self.bin_penguji2))
            chromosomes.append(chromosome)
        # exit()
        return chromosomes

    # Modified Combination of Row_reselect, Column_reselect

    def mutate(self, chromosome):
        # print("Before mutation: ", end="")

        a=random.randint(0, len(chromosome) - 1)
        # self.print_chromosome(chromosome[a])
        chromosome[a] = self.daftar_sidang_bits(chromosome[a]) + random.choice(
            self.bin_rooms) + random.choice(self.bin_penguji1) + random.choice(self.bin_penguji2)
        
        # print("After mutation: ", end="")
        # self.print_chromosome(chromosome[a])

    def crossover(self, population):
        a=random.randint(0, len(population) - 1)
        b=random.randint(0, len(population) - 1)
        # assume all chromosome are of same len
        cut=random.randint(0, len(population[0]))
        population.append(population[a][:cut] + population[b][cut:])

    def selection(self, population, n):
        population.sort(key=self.evaluate, reverse=True)
        while len(population) > n:
            population.pop()

    def print_chromosome(self, chromosome):
        print(
            self.ds_model.daftarSidang[int(str(self.daftar_sidang_bits(chromosome)), 2)],"|",
            self.penguji1_model.penguji[int(str(self.penguji1_bits(chromosome)), 2)], "|",
            self.penguji2_model.penguji[int(str(self.penguji2_bits(chromosome)), 2) ], "|",
            self.room_model.rooms[int(str(self.room_bits(chromosome)), 2)], "|",
        )

    def ssn(self, solution):
        rand_p1 = random.choice(self.bin_penguji1)
        rand_p2 = random.choice(self.bin_penguji2)

        a=random.randint(0, len(solution) - 1)

        new_solution=copy.deepcopy(solution)
        new_solution[a]=self.daftar_sidang_bits(solution[a]) + self.room_bits(solution[a]) +\
            self.penguji1_bits(solution[a]) + rand_p1 + rand_p2
        return [new_solution]

    # It randomy selects two classes

    def swn(self, solution):
        a=random.randint(0, len(solution) - 1)
        b=random.randint(0, len(solution) - 1)
        new_solution=copy.deepcopy(solution)
        temp=self.penguji1_bits(solution[a])
        new_solution[a]=self.daftar_sidang_bits(solution[a]) + self.room_bits(solution[a]) +\
            self.penguji1_bits(solution[a]) + \
            self.penguji2_bits(solution[b])

        new_solution[b] = self.daftar_sidang_bits(solution[b]) + self.room_bits(solution[b]) +\
            temp + self.penguji2_bits(solution[b])
        return [new_solution]

    def acceptance_probability(self, old_cost, new_cost, temperature):
        if new_cost < old_cost:
            return 1.0
        else:
            return math.exp((old_cost - new_cost) / temperature)

    def simulated_annealing(self):
        print('##################### annealing process #####################')
        alpha=0.9
        T=1.0
        T_min=0.00001

        self.convert_input_to_bin()
        # as simulated annealing is a single-state method
        population=self.init_population(1)
        old_cost=self.cost(population[0])
        print("Cost of original random solution: ", old_cost)
        print("Original population:")
        print(population)

        for __n in range(500):
            new_solution=self.swn(population[0])
            new_solution=self.ssn(population[0])
            new_cost=self.cost(new_solution[0])
            ap=self.acceptance_probability(old_cost, new_cost, T)
            if ap > random.random():
                population=new_solution
                old_cost=new_cost
            T=T * alpha
        print("\n----------------------- Schedule -----------------------\n")
        for lec in population[0]:
            self.print_chromosome(lec)
        print("Score: ", self.evaluate(population[0]))

    #Memulai Algoritma Genetika
    def genetic_algorithm(self):
        generation=0
        self.convert_input_to_bin()
        population=self.init_population(3)
        avg_fitness_list = []

        print("Original population:")
        print(population)
        print("\n------------- Genetic Algorithm --------------\n")
        while True:

            # if termination criteria are satisfied, stop.
            # if self.evaluate(max(population, key=self.evaluate)) == 1 or generation == 1000:
            if generation == 100:
                print("Generations:", generation)
                print("Best Chromosome fitness value", self.evaluate(max(population, key=self.evaluate)))
                print("Best Chromosome: ", max(population, key=self.evaluate))
                print("Avg fitness Chromosome: ", sum([ self.evaluate(p) for p in population])/len(population))
                elapsed_time = time.time() - start_time
                print("Waktu yang dibutuhkan: ", elapsed_time, "detik")
                self.avg_fitness = sum([self.evaluate(p)
                                    for p in population]) / len(population)
                avg_fitness_list.append(self.avg_fitness)
                self.avg_fitness = sum([self.evaluate(p)
                                       for p in population])/len(population)
                for lec in max(population, key=self.evaluate):
                    self.print_chromosome(lec)
                    # pass
                break

                # Otherwise continue
            else:
                for _c in range(len(population)):
                    self.crossover(population)
                    self.selection(population, 5)
                    print(population)
                    self.mutate(population[_c])
            generation=generation + 1
            if generation % 1 == 0:
                avg_fitness = sum([self.evaluate(p) for p in population]) / len(population)
                avg_fitness_list.append(avg_fitness)

        # Plotting the avg fitness chromosome per 100 generations
        plt.plot(avg_fitness_list)
        plt.title("Avg Fitness Chromosome per Generations")
        plt.xlabel("Generation")
        plt.ylabel("Avg Fitness")
        plt.show()
            
        return population

    def main(self):
        random.seed()
        
        #if self.avg_fitness != 1:
            #self.simulated_annealing()
        results = self.genetic_algorithm()
        
        
        set_result = []
        for r in results[0]:
            data={
                'ds_id' : self.ds_model.daftarSidang[int(
                    str(self.daftar_sidang_bits(r)), 2)].id,
                'p1_id' : self.penguji1_model.penguji[int(
                    str(self.penguji1_bits(r)), 2)].id,
                'p2_id': self.penguji2_model.penguji[int(
                    str(self.penguji2_bits(r)), 2)].id,
                'r_id' : self.room_model.rooms[int(
                    str(self.room_bits(r)), 2)].id,
            }
            set_result.append(data)
        # print(set_result)
        self.best_result = set_result
        # return set_result
