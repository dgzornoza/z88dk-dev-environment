SECTION code_user

PUBLIC _neg_and_triple_a  ; export C name "neg_and_triple_a"

EXTERN _a                 ; access global C variable "a"
EXTERN _negate_odd_a      ; access global C function "negate_odd_a"

_neg_and_triple_a:

   call _negate_odd_a     ; call C function "negate_odd_a()"

   ; triple contents of array a[]

   ld b,5               ; array a[] has five members
   ld hl,_a             ; hl = &a[0]

loop:

   push hl              ; save address in array a[]

   ld e,(hl)
   inc hl
   ld d,(hl)            ; de = int member of a[]

   ld l,e
   ld h,d
   add hl,hl
   add hl,de
   ex de,hl             ; de = int * 3

   pop hl               ; hl = address in array a[] of int read

   ld (hl),e
   inc hl
   ld (hl),d            ; replace int with its value tripled
   inc hl               ; hl points to next array entry

   djnz loop            ; do it for all five members of array a[]
   ret