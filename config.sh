# ARCH will be auto-detected as the host if not specified
#ARCH=i486
#ARCH=x86_64
#ARCH=powerpc
#ARCH=arm
#ARCH=microblaze
#ARCH=mips
#ARCH=mipsel

export PATH=$HOME/cross-x86_64/x86_64-unknown-linux-musl/bin:$PATH

CC_BASE_PREFIX=$HOME/cross-static

# If you use arm, you may need more fine-tuning:
# arm hardfloat v7
TRIPLE=arm-linux-musleabihf
GCC_BOOTSTRAP_CONFFLAGS="--disable-lto-plugin --with-arch=armv7-a --with-float=hard --with-fpu=neon-vfpv4"
GCC_CONFFLAGS="--disable-lto-plugin --with-arch=armv7-a --with-float=hard --with-fpu=neon-vfpv4"
MUSL_CC_PREFIX="x86_64-unknown-linux-musl-"

# Disable these three lines when running build-gcc-deps.sh
CC="'"${MUSL_CC_PREFIX}gcc"' -Wl,-Bstatic -static-libgcc"
CXX="'"${MUSL_CC_PREFIX}g++"' -Wl,-Bstatic -static-libgcc"
export CC CXX

# arm softfp
#TRIPLE=arm-linux-musleabi
#GCC_BOOTSTRAP_CONFFLAGS="--with-arch=armv7-a --with-float=softfp"
#GCC_CONFFLAGS="--with-arch=armv7-a --with-float=softfp"

MAKEFLAGS=-j8

# Enable this to build the bootstrap gcc (thrown away) without optimization, to reduce build time
GCC_STAGE1_NOOPT=1

BINUTILS_VERSION=2.25
GCC_VERSION=4.9.2
MUSL_VERSION=1.1.6

GCC_BUILTIN_PREREQS=yes
GMP_VERSION=6.0.0
MPFR_VERSION=3.1.2
MPC_VERSION=1.0.2
