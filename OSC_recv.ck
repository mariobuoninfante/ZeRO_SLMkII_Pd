/*
    Open Sound Control receiver for "ZeRO_SLMkII.pd" 
    (https://github.com/mariobuoninfante/ZeRO_SLMkII_Pd)
    receives all the messages sent to port 3000
    and print them to the console
    
    Mario Buoninfante - 2019
*/

OscIn osc_in;
OscMsg msg;
3000 => osc_in.port;
osc_in.listenAll();   // listen to all the msg sent to this port

//--------MAIN--------
while ( true )
{
    osc_in => now;
    while ( osc_in.recv(msg) != 0 )
    {
        chout <= msg.address <= " ";
        for( int n; n < msg.numArgs(); n++ )
        {
            if( msg.typetag.charAt(n) == 'i' )
                chout <= msg.getInt(n) <= " ";
            else if( msg.typetag.charAt(n) == 'f' )
                chout <= msg.getFloat(n) <= " ";
            else if( msg.typetag.charAt(n) == 's' )
                chout <= msg.getString(n) <= " ";
        }
        
        chout <= IO.nl();
    }
}
  