/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global WelcomePrompt
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3a.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
WelcomePrompt:
/*Write your program here******************************************/
movea.l #0x2300000, %a2

pea Welcome
jsr iprintf
addq.l #4, %sp
jsr cr

dataloop:
pea DataPoints
jsr iprintf
addq.l #4, %sp
jsr cr

jsr getstring
move.l %d0, %d2
cmpi.l #3, %d2
bmi option1
cmpi.l #16, %d2
bmi continue1

option1:
pea InvalidEntry
jsr iprintf
addq.l #4, %sp
jsr cr
bra dataloop

continue1:
move.l %d2, 8(%sp)

divisorloop:
pea Divisor
jsr iprintf
addq.l #4, %sp
jsr cr

jsr getstring
move.l %d0, %d2
cmpi.l #2, %d2
bmi option2
cmpi.l #6, %d2
bmi continue2

option2:
pea InvalidEntry
jsr iprintf
addq.l #4, %sp
jsr cr
bra divisorloop

continue2:
move.l %d2, 4(%sp)

move.l 8(%sp), %d3

inputnext:
pea NextData
jsr iprintf
addq.l #4, %sp
jsr cr

jsr getstring
move.l %d0, %d2
bpl continue3
pea InvalidEntry
jsr iprintf
addq.l #4, %sp
jsr cr
bra inputnext
continue3:
move.l %d2, (%a2)+
sub.l #1, %d3
cmpi.l #1, %d3
ble inputlast
bra inputnext

inputlast:
pea LastData
jsr iprintf
addq.l #4, %sp
jsr cr

jsr getstring
move.l %d0, %d2
bpl continue4
pea InvalidEntry
jsr iprintf
addq.l #4, %sp
jsr cr
bra inputlast
continue4:
move.l %d2, (%a2)+
rts

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/
Welcome:
.string "Welcome to Calef's Stats Program"
DataPoints:
.string "Please enter the number(3min-15max) of entries followed by 'enter'"
Divisor:
.string "Please enter the divisor(2min-5max) followed by 'enter'"
NextData:
.string "Please enter a number(positive only)"
LastData:
.string "Please enter the last number(positive only)"
InvalidEntry:
.string "Invalid entry, please enter proper value"

/*End of Strings **************************************************/

