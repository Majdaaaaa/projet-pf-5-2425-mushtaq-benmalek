open Graphics;;
open_graph " 800x1000";; 
open Repere;;
exception Quit;;
open Pf5.Geo
open Pf5.Interp



let () =
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  try
    repere () ;
    let prog =[
      Repeat (360, [
          Move (Translate {x = 1.0; y = 0.0});
          Move (Rotate ({x = mid_x; y = mid_y}, 1.0))
        ])
    ] in 
    Cr.run prog;

    (* Dessiner les axes *)
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with Quit ->
    close_graph ();;
