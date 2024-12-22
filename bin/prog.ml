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
    Repeat (7, [Move (Translate {x = 1. ;y=1.})]);
    Repeat (7, [Move (Translate {x = (-1.) ;y=(-1.)})]);

    Repeat (7, [Move (Translate {x = (-1.) ;y=1.})]);
    Repeat (7, [Move (Translate {x = 1. ;y=(-1.)})]);

    Repeat (7, [Move (Translate {x = 1. ;y=(-1.)})]);
    Repeat (7, [Move (Translate {x = (-1.) ;y=1.})]);

    Repeat (7, [Move (Translate {x = (-1.) ;y=(-1.)})]);
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
    (*Carré*)
    Move (Translate {x = 1.0; y = 1.0});  
    Repeat (4, [
        Move (Translate {x = 0.5; y = 0.0}); 
        Move (Rotate ({x = 1.0; y = 1.0}, 90.0));
      ]);
    (*Reviens à l'origine*)
    Move (Translate {x = (-1.0); y = (-1.0)});  
    (* Dessine soit un carré soit un rectangle  *)
    Move (Translate {x = -4.0; y = -4.0}); 
    Either(
      [Repeat (4, [Move(Translate {x=0.5; y=0.});
                   Move (Rotate ({x=(-4.0); y= (-4.0)}, 90.))])] , 

      [Repeat(4, [Move(Translate {x=1.; y=0.}); 
                  Move(Rotate ({x=(-4.); y=(-4.)}, 90.))])]
    );
    (*Reviens à l'origine*)
    Move (Translate {x = 4.0; y = 4.0}); 
    (* Dessine soit un carré soit un triangle  *)
    Move (Translate {x = (-4.0); y = 5.0});
    Either(
      [Repeat (4, [Move(Translate {x=0.5; y=0.});
                   Move (Rotate ({x = (-4.0); y = 5.0}, 90.))])] , 
      [Repeat(3, [Move(Translate {x=0.5; y=0.}); 
                  Move(Rotate ({x = (-4.0); y = 5.0}, 120.))])]
    )
  ]
;;

