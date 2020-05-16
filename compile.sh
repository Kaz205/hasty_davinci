export ARCH=arm64 SUBARCH=arm32
make O=out clean
make O=out mrproper
make O=out vendor/hasty_davinci_defconfig
export KBUILD_COMPILER_STRING="$(/home/kazuki/proton-clang/bin/clang --version | head -n 1 | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')";
export USE_CCACHE=1
export PATH="/home/kazuki/proton-clang/bin:$PATH"
PATH="/home/kazuki/proton-clang/bin:$PATH"
make O=out -j$(nproc) \
	ARCH=arm64 \
	CC="clang" \
	CLANG_TRIPLE="aarch64-linux-gnu-" \
	CROSS_COMPILE="aarch64-linux-gnu-" \
	CROSS_COMPILE_ARM32="arm-linux-gnueabi-"
cp /home/kazuki/toxic/out/arch/arm64/boot/Image.gz-dtb /home/kazuki/AnyKernel3
cd /home/kazuki/AnyKernel3
zip -FSr /home/kazuki/AnyKernel3/Kaz205Kernel.zip .
