/* DO NOT MODIFY THIS --------------------------------------------*/
.text
.global Stats
.extern iprintf
.extern cr
.extern value
.extern getstring
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab3b.s **************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/
Stats:
/*Write your program here******************************************/

/*preserve registers*/

/*initialize used registers: a2 is array, a3 is stats destination*/
move.l (%a2), %d2 /*min register*/
move.l (%a2), %d3 /*max register*/
clr.l %d4 /* mean register*/
move.l 8(%sp), %d5 /* counter or # of entries*/
clr.l %d7
/*main loop*/
loop:
move.l (%a2)+, %d6
add.l %d6, %d4
cmp.l %d2, %d6
bgt continue1
move.l %d6, %d2
continue1:cmp.l %d6, %d3
bgt continue2
move.l %d6, %d3
continue2:move.l %d7, -(%sp)
move.l 8(%sp), %d7
divs.w %d7, %d6
move.l (%sp)+, %d7
lsr.l #8, %d6
lsr.l #8, %d6
bne continue3
add.l #1, %d7
move.l -4(%a2), %d6
move.l %d6, 8(%a3,%d7*4)
continue3:
sub.l #1, %d5
bne loop

move.l %d7, 12(%sp)
move.l %d2, (%a3)+
move.l %d3, (%a3)+
divs.l 8(%sp), %d4
move.l %d4, (%a3)
rts 

/*End of Subroutine **************************************************/ 
.data
/*All Strings placed here **************************************************/



/*End of Strings **************************************************/
