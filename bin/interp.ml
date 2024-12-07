open Graphics;;
open Repere;;
exception Quit;;
open Pf5.Geo
open Pf5.Interp

let () =
  open_graph " 800x1000";
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  try
    (* Dessine les axes *)
    repere () ;
    let prog = 
      (*Cercle*)
      (* [
         Repeat (360, [
            Move (Translate {x = -1.0; y = 1.0});
            Move (Rotate ({x = mid_x; y = mid_y}, 1.0))
          ])
         ] *)

      (*Carré*)
      [
        Repeat (4, [
            Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
            Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
          ])
      ]

    (*Pas deterministe*)
    (* [
       Either (
        [Repeat (100, [Move (Translate {x = -1.0; y = 1.0})])],
        [Repeat (100, [Move (Translate {x = 4.0; y = 1.0})])]
       )
       ]  *)

    (*Juste un point*)
    (* [
       Move (Translate {x = (-2.0*.42.10526316) ; y = (1.0*.52.63157895)})
       ] *)
    in 
    Cr.run prog 1.;

    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with Quit ->
    close_graph ();;
