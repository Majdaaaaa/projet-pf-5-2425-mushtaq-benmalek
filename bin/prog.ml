open Pf5.Geo;;
open Pf5.Interp;;

(* Coeur *)
let prog1 () =
  [
    Move(Translate{x = -1.0 ; y = 4.0});
    Repeat(2,[Move(Translate{x =  -1.0 ; y = 1.0})]);

    Repeat(2,[ Move(Translate{x = -1.0 ; y = 0.0})]);


    Repeat(2,[Move(Translate{x = -1.0 ; y = -1.0})]);


    Repeat(3,[Move(Translate{x = 0.0 ; y = -1.0})]);

    Repeat(6,[Move(Translate{x = 1.0 ; y = -1.0})]);


    Repeat(6,[Move(Translate{x = 1.0 ; y = 1.0})]);

    Repeat(3,[Move(Translate{x = 0.0 ; y = 1.0})]);

    Repeat(2,[Move(Translate{x = -1.0 ; y = 1.0})]);

    Repeat(2,[Move(Translate{x = -1.0 ; y = 0.0})]);

    Repeat(2,[Move(Translate{x = -1.0 ; y = -1.0})]);

  ]
;;

(* X *)
let prog2() = 
  [
    Repeat (9, [Move (Translate {x = 1. ;y=1.})]);
    Repeat (9, [Move (Translate {x = (-1.) ;y=(-1.)})]);

    Repeat (9, [Move (Translate {x = (-1.) ;y=1.})]);
    Repeat (9, [Move (Translate {x = 1. ;y=(-1.)})]);

    Repeat (9, [Move (Translate {x = 1. ;y=(-1.)})]);
    Repeat (9, [Move (Translate {x = (-1.) ;y=1.})]);

    Repeat (9, [Move (Translate {x = (-1.) ;y=(-1.)})]);
  ]
;;

(* Either *)
let prog3() = 
  [
    Either(
      [Move(Translate{ x = 1.0 ; y = 1.0})],
      [Move(Translate{ x = 2.0; y = 0.})]
    ); 

    Either(
      [Move(Rotate ({x = 0. ; y = 0. } , 90.0 ))],
      [
        Move(Rotate ({x = 0. ; y = 0. } , 30.0 ))
      ]
    )
  ]
;;

let prog4 () =
  [
    Move (Translate {x = 3.0; y = 3.0});  
    Repeat (4, [
        Move (Translate {x = 3.0; y = 0.0}); 
        Move (Rotate ({x = 3.0; y = 3.0}, 90.0))
      ]);
    Move (Translate {x = -3.0; y = -3.0});

    Move (Translate {x = -1.0; y = -1.0});  (* Centre du cercle *)
    Repeat (36, [
        Move (Translate {x = 0.5; y = 0.0}); 
        Move (Rotate ({x = -1.0; y = -1.0}, 10.0))
      ]);
    Either(
      [Repeat (4, [Move(Translate {x=(-3.); y=0.});
                   Move (Rotate ({x=(-3.0); y= (-3.0)}, 90.))])] , 
      [Repeat(36, [Move(Translate {x=(-1.); y=0.}); 
                   Move(Rotate ({x=1.; y=1.}, 10.))])]
    );
    Move (Translate {x = 3.0; y = -3.0});
    Either(
      [Repeat (4, [Move(Translate {x=(-2.0); y=0.});
                   Move (Rotate ({x=(-2.0); y= (-2.0)}, 90.))])] , 
      [Repeat(3, [Move(Translate {x=(-4.); y=(-2.)}); 
                  Move(Rotate ({x=(-4.); y=(-4.)}, 120.))])]
    )
  ]
;;

