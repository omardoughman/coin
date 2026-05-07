import os
def run():
    print("Coin Manager Starting...")
    if os.path.exists("main.codec"):
        print("Codec loaded.")
run()
