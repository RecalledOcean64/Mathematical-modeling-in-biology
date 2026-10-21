











import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 5, 400)


y = 2 / (1 + 19 * np.exp(-2 * x))


plt.figure(figsize=(8, 5))
plt.plot(x, y, label=r'$y(x) = \frac{2}{1 + 19e^{-2x}}$', color='blue', linewidth=2)


plt.title('Graf egzaktnog rješenja logističke diferencijalne jednadžbe', fontsize=12)
plt.xlabel('x', fontsize=12)
plt.ylabel('y(x)', fontsize=12)
plt.axhline(0, color='black', linewidth=0.5, linestyle='--')
plt.axvline(0, color='black', linewidth=0.5, linestyle='--')
plt.grid(True, linestyle=':', alpha=0.6)
plt.legend(fontsize=12)
plt.xlim(0, 5)
plt.ylim(0, 2.2)


plt.show()