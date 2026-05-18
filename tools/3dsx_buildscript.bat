3dstool -cvtf romfs "../romfs.bin" --romfs-dir "../romfs"
3dsxtool "../build/lpp-3ds.elf" "../build/lpp-3ds.3dsx" --romfs="../romfs.bin" --smdh="../build/lpp-3ds.smdh"