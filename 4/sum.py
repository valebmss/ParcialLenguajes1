import time

n = 100000000 # 100 millones
sum = 0

start = time.time()
for i in range(1, n + 1):
    sum += i
end = time.time()

print(f"Suma: {sum}")
print(f"Tiempo de ejecución en Python: {end - start} segundos")
