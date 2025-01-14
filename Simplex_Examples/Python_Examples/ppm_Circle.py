#f = open("pyCircle.ppm", "w")

width = 256
height = 256

maxColourValue = 255
backgroundColour = [0, 0, 0]
#the "magic number" for file type
print("P3 \n")
print(f"{width} {height}\n")
print(f"{maxColourValue}\n")

image_matrix = [[backgroundColour for i in range(width)] for i in range(height)] #A three dimensional matrix

#adds the circle to the matrix
radius = 56 
thickness = 100 
center = [128,128] #[x,y]
colourRGB = [0, 255, 0]

for y in range(width):
    for x in range(height):
        num = (x-center[0])**2 + (y-center[1])**2
        if num > (radius**2 - thickness) and num < (radius**2 + thickness):
            image_matrix[y][x] = colourRGB 

#adds another circle to the matrix
radius = 32 
thickness = 100 
center = [192,64] #[x,y]
colourRGB = [255, 0, 205]

for y in range(width):
    for x in range(height):
        num = (x-center[0])**2 + (y-center[1])**2
        if num > (radius**2 - thickness) and num < (radius**2 + thickness):
            image_matrix[y][x] = colourRGB 

#adds another circle to the matrix
radius = 32 
thickness = 100 
center = [64,64] #[x,y]
colourRGB = [255, 0, 0]

for y in range(width):
    for x in range(height):
        num = (x-center[0])**2 + (y-center[1])**2
        if num > (radius**2 - thickness) and num < (radius**2 + thickness):
            image_matrix[y][x] = colourRGB 

#write to the file
for y in image_matrix:
    for x in y:
        for value in x:
            print(f"{value} ")
    print("\n")
