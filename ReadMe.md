
# compile

~~~ { .bash}
make
ls tools/i2c*
~~~

# help

~~~ { .bash }
./tools/i2cdetect
Usage: i2cdetect [-y] [-a] [-q|-r] I2CBUS [FIRST LAST]
       i2cdetect -F I2CBUS
       i2cdetect -l
  I2CBUS is an integer or an I2C bus name
  If provided, FIRST and LAST limit the probing range.
~~~


~~~ { .bash }
./tools/i2cget 
Usage: i2cget [-f] [-y] I2CBUS CHIP-ADDRESS [DATA-ADDRESS [MODE]]
  I2CBUS is an integer or an I2C bus name
  ADDRESS is an integer (0x03 - 0x77)
  MODE is one of:
    b (read byte data, default)
    w (read word data)
    c (write byte/read byte)
    Append p for SMBus PEC
~~~

# use

~~~ { .bash }
./tools/i2cdetect -l
i2c-3	i2c       	3.i2c                           	I2C adapter
i2c-1	i2c       	bcm2835 (i2c@7e804000)          	I2C adapter
~~~

~~~ { .bash }
./tools/i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- 04 -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- 18 19 1a 1b 1c 1d -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         
~~~

~~~ { .bash }
./tools/i2cget -y 1 0x18 0x05 w
0x56c1
~~~

~~~ { .bash }
for i in 18 19 1a 1b 1c 1d; do ./tools/i2cget -y 1 0x$i 0x05 w; done
0x78c1
0x77c1
0x7bc1
0x7ec1
0x81c1
0x7ec1
~~~

~~~ { .bash }
ub=0xc1
#remove flag bits
ubc=`~/bin/bitset -s 8 -x $ub --and -X 0x1F | tail -n 1`
echo 'UpperByte: '$ub' -> '$ubc
UpperByte: 0xc1 -> 0x1

units
((0x1*16)+(0x7e/16))

23.875
~~~

