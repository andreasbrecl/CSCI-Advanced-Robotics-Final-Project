from maestro import Controller

def main():
    str = "/dev/serial/by-id/usb-Pololu_Corporation_Pololu_Mini_Maestro_12-Channel_USB_Servo_Controller_00280973-if00"
    cont = Controller(ttyStr=str)
    print(cont.getPosition(3))
    return 

if __name__ == "__main__":
    main()

