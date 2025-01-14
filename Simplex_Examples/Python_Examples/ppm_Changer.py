f = open("image1.ppm", "w")

width = 256
height = 256

maxColourValue = 255

#the "magic number" for file type
f.write("P3 \n")
f.write(f"{width} {height}\n")
f.write(f"{maxColourValue}\n")

for x in range(width):
    for y in range(height):
        f.write(f"{255} {x} {y} ")
    f.write("\n")
print("done!")
