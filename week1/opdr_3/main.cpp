#include "hwlib.hpp"

extern "C" void application();
extern "C" void uart_put_char(char s);
extern "C" char upper_lower(char c);

char upper_lower( char c ){
	if(c <= 90 && c >= 65){
		c += 32;
	}else if(c <= 122 && c >= 97){
		c -= 32;
	}
	return c;
}

void uart_put_char( char s ){
   hwlib::cout << s;
}

int main( void ){	
   
   namespace target = hwlib::target;   
    
   // wait for the PC console to start
   hwlib::wait_ms( 2000 );

   application();
}