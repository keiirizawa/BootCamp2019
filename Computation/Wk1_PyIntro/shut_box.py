import box
import random 
import time

def play_game(file_name, player_name, time_limit):
    
    remaining_list = list(range(1,10))
    
    start = time.time()
    while len(remaining_list) > 0:
        
        sum_rolls = random.randint(1,6) + random.randint(1,6)
        if not box.isvalid(sum_rolls, remaining_list):
            return "Best luck next time >:)"
        else:
            
        
        
        
        end = time.time()
        if end - start > time_limit:
            return False
    random.randint(1,6)

