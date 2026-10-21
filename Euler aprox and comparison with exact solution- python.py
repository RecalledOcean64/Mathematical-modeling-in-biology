import numpy as np
import matplotlib.pyplot as plt

# Parametri
h = 0.1
t = np.arange(0, 5 + h, h)
y_euler = np.zeros(len(t))
y_euler[0] = 0.1

# Funkcija f(t, y)
def f(y):
    return 2*y - y**2

# Egzaktno rješenje
def exact_solution(t):
    return 2 / (1 + 19 * np.exp(-2*t))

# Eulerova metoda - iteracija
for i in range(len(t) - 1):
    y_euler[i+1] = y_euler[i] + h * f(y_euler[i])

y_exact = exact_solution(t)

# Crtanje
plt.figure(figsize=(10, 6))
plt.plot(t, y_euler, 'bo--', label=f'Eulerova metoda (h={h})')
plt.plot(t, y_exact, 'r-', linewidth=2, label='Egzaktno rješenje')
plt.title("Usporedba Eulerove metode i egzaktnog rješenja")
plt.xlabel("t")
plt.ylabel("y(t)")
plt.legend()
plt.grid(True)
plt.show()