/*****************************/
/* KIPR Wombat factory_test  */
/* By Zachary Sasser         */
/* 10/25/2016                */
/*****************************/

#include <kipr/botball.h>
#include <math.h>

void wait_next()//waits for 'C'
{
	while(!c_button_clicked()) msleep(20);
}

int is_done()
{
	return c_button_clicked();
}

void next(const char *text)
{
	console_clear();
  	//Sets text as current Test
	printf("%s\n", text);
	printf("Press \"C\" to begin.\n");
  	//waits for 'C'
	wait_next();
	printf("Starting...\n");
	msleep(1000);
}

void done_message(int small)
{
  	//clears screen
	console_clear();
	if(!small) printf("Press \"C\" once finished.\n");
}

void servoTest()
{
	next("Servo Test");
	double theta = 0.0;
  	//enables all servos
	enable_servo(0);
	enable_servo(1);
	enable_servo(2);
	enable_servo(3);
  	//oscillates the servos back and forth
	while(!is_done()) {
		done_message(0);
		theta += 0.2;
		const int pos = sin(theta) * 450 + 512;
		printf("Servo position: %d\n", pos);
		set_servo_position(0, pos);
		set_servo_position(1, pos);
		set_servo_position(2, pos);
		set_servo_position(3, pos);
		msleep(20);
	}
  	//disables all servos
	disable_servo(0);
	disable_servo(1);
	disable_servo(2);
	disable_servo(3);
}

void motorTest()
{
	next("Motor Test");
	double theta = 0.0;
  	//oscillates all motors back and forth
	while(!is_done()) {
		done_message(0);
		theta += 0.2;
		const int vel = sin(theta) * 100;
		printf("Motor velocity: %d\n", vel);
		motor(0, vel);
		motor(1, vel);
		motor(2, vel);
		motor(3, vel);
		msleep(20);
	}
  	//turns off all motors
	ao();
}

void analogTest()
{
	next("Analog Test");
  	int i=0;
  	//prints out 'Digital 0-9:'
  	for(;i<10;++i){
      	display_printf(0,i,"Digital %d: ",i);
    }
  	i=0;
  	//prints out 'Analog 0-5:'
  	for(;i<6;++i){
      	display_printf(15,i,"Analog %d: ",i);
    }
  	//prints out 'Accel X:        Y:      Z: '    
  	display_printf(0,11,"Accel X: ");
  	display_printf(15,11," Y: ");
  	display_printf(23,11," Z: ");
  	//prints out 'Left:   Right: '
  	display_printf(15,8,"Button: ");


	while(!is_done()) {
		done_message(1);
		publish();
      	i=0;
      	//prints out all digital values
      	for(;i<10;++i){
      		display_printf(11,i,"%d",digital(i));
    	}
      	i=0;
      	//prints out all analog values
      	for(;i<6;++i){
      		display_printf(25,i,"%d   ",analog(i));
    	}
      	//prints out all accelerometer values
      	display_printf(8,11,"%d  ",accel_x());
  		display_printf(18,11,"%d  ",accel_y());
  		display_printf(26,11,"%d  ",accel_z());
      	//prints out Left and Right button values
        display_printf(24,8,"%d",push_button());
	}
	ao();
}



int main()
{
  	servoTest();//runs servo test
	motorTest();//runs motor test
	analogTest();//runs sensor test
  	
  	return 0;
}
