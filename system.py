import os

def check_system_status():
    if os.path.exists("main.codec"):
        print("System Codec detected. Processing binary data...")

if __name__ == "__main__":
    check_system_status()
