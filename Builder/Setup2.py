from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize("TimeV1_0_0.pyx")
)