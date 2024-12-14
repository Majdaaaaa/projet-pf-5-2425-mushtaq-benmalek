open Graphics;;
open Pf5.Geo;;
open Pf5.Interp;;


let prog () = 
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  (*Carré*)
  [
    Repeat (4, [
        Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
        Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
      ])
  ];;

let run prog scale = 

  (* let color = rgb !(Format.r) !(Format.v) !(Format.b) in set_color color; *)
  let mid_x = (float_of_int (size_x ())) /. 2. in 
  let mid_y =  (float_of_int (size_y ())) /. 2. in 
  let point = run prog {x=mid_x ; y=mid_y} in 
  List.iter (fun p -> Printf.printf "(%f, %f)\n" p.x p.y) point;
  List.iter (fun p ->
      let x = (int_of_float (p.x *. scale)) in 
      let y = (int_of_float (p.y *. scale))
      in Printf.printf "Plotting at: (%d, %d)\n" x y;
      fill_circle x y 3) point