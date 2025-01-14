def findFibonnaci(found, num_terms):
    count = 2
    while count < num_terms:
        found.append(found[count-2] + found[count-1])
        count += 1
    return found
num_terms = 30
found = [1,1]

match num_terms:
    case 0:
        print("Zero terms of fibonnaci is: ")
    case 1:
        print (f"One term of fibonnaci is: {found[0]}")
    case _:
        print(f"Finding {num_terms} of fibonnaci")
        found = findFibonnaci(found, num_terms)
        print(found)
