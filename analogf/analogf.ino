int senorValue = 0;//10 bit

void setup(){//the inputs and outputs
    pinMode(A0, INPUT);
    pinMode(0, OUTPUT);
    pinMode(1, OUTPUT);
    pinMode(2, OUTPUT);
    pinMode(3, OUTPUT);
    pinMode(4, OUTPUT);
    pinMode(5, OUTPUT);
    pinMode(6, OUTPUT);
    pinMode(7, OUTPUT);
    pinMode(8, OUTPUT);
    pinMode(9, OUTPUT);
}

void loop(){//loop forever
    // each port can only send out one byte
    senorValue = analogRead(A0);
    //int right = senorValue & 255;
    //int left = (senorValue >> 8) & 3;
    for(int i =0; i < 10; i++)
      digitWrite(i,bitRead(senorValue, i));
    



    
    // Analog signal getting output to the FPGA
    //analogWrite(11, senorValue);
    delay(10); // Delay a little bit to improve simulation performance
}
