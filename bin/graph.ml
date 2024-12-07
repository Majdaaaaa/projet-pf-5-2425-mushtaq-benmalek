open Graphics
open Repere
(* open Pf5.Geo
   open Pf5.Interp *)

let graphe =
  open_graph " 800x1000";
  repere () ;
  (* let mid_x = (float_of_int (size_x ())) /. 2. in 
     let mid_y =  (float_of_int (size_y ())) /. 2. in  *)
  (* try
    (* Dessine les axes *)
    repere () ;
    (* let prog = 
       (*Carré*)
       [
        Repeat (4, [
            Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
            Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
          ])
       ]
       in 
       Cr.run prog 1.; *)

    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with Quit ->
    close_graph ();; *)