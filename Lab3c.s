/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Display
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3c.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Display:
/*Write your program here******************************************/
lea -12(%sp),%sp
movem.l %d5/%a2-%a3, (%sp)

move.l 20(%sp), %d5

pea Entries
jsr iprintf
addq.l #4, %sp
move.l 20(%sp), -(%sp)
jsr value
addq.l #4, %sp
jsr cr

displayloop:
move.l (%a2)+, -(%sp)
jsr value
addq.l #4, %sp
jsr cr
sub.l #1, %d5
bne displayloop

pea Min
jsr iprintf
addq.l #4, %sp
move.l (%a3), -(%sp)
jsr value
addq.l #4, %sp
jsr cr

pea Max
jsr iprintf
addq.l #4, %sp
move.l 4(%a3), -(%sp)
jsr value
addq.l #4, %sp
jsr cr

pea Mean
jsr iprintf
addq.l #4, %sp
move.l 8(%a3), -(%sp)
jsr value
addq.l #4, %sp
jsr cr

pea Divisible1
jsr iprintf
addq.l #4, %sp
move.l 24(%sp), -(%sp)
jsr value
addq.l #4, %sp
pea Divisible2
jsr iprintf
addq.l #4, %sp
move.l %d2, -(%sp)
jsr value
addq.l #4, %sp
jsr cr

pea Exit
jsr iprintf
addq.l #4, %sp
jsr cr


movem.l  (%sp), %d5/%a2-%a3
lea 12(%sp),%sp
rts 

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/
Entries:
.string "The number of entries was: "
Min:
.string "Min number= "
Max:
.string "Max number= "
Mean:
.string "Mean number= "
Divisible1:
.string "There are "
Divisible2:
.string " number(s) divisible by "
Exit:
.string "Program Ended."

/*End of Strings **************************************************/
