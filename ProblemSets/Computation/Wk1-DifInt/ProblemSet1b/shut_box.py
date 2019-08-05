import box
import numpy as np
import random
import time
import sys


if len(sys.argv) == 3:
    player_name = sys.argv[1]
    time_limit = float(sys.argv[2])

else:
    print("Need three arguments!")


def simulate_roll(numbers_left):
    if sum(numbers_left) <= 6:
        return random.randint(1,6)
    else:
        return random.randint(1,6) + random.randint(1,6)


numbers_left =  list(range(1,10))
start_time = time.time()
end_time = start_time + time_limit 

no_choice = False

while (time.time() < end_time) & (len(numbers_left) != 0):

    print("Numbers left: ", numbers_left)
    rolls = simulate_roll(numbers_left)
    print("Roll: ", rolls)
    print("Seconds left: ", round(end_time - time.time()))

    # Numbers cannot match roll. 
    if not box.isvalid(rolls, numbers_left):
        print("Numbers left: ", numbers_left)
        print("Roll: ", rolls)
        print("Game Over!")
        print("\n")
        no_choice = True
        break

    else:
        player_input = input("Numbers to eliminate: ")
        print("\n")
        list_integers = box.parse_input(player_input, numbers_left)
        
        for integer in list_integers:
            numbers_left.remove(integer)


final_time = round(time.time() - start_time, 2)


if no_choice:
    print("Score for player {}: ".format(player_name), sum(numbers_left))
    print("Time played: {} seconds".format(round(final_time)))
    print("Better luck next time >:)")

# No numbers_left:
elif len(numbers_left) == 0:
    print("Score for player {}: ".format(player_name), sum(numbers_left))
    print("Time played: {} seconds".format(round(final_time)))
    print("Congratulations!! You shut the box!")

# Time is Up!
else:
    print("Score for player {}: ".format(player_name), sum(numbers_left))
    print("Time played: {} seconds".format(round(final_time)))
    print("Better luck next time >:)")





