open Graphics;;
open Pf5.Geo;;
open Pf5.Approx;;


  let draw_abs rect =
    let origine = ( size_x () / 2 , size_y () / 2) in
    let int_x_min = fst origine + (int_of_float rect.x_min * (size_x()/19)) in
    let int_y_min = snd origine + (int_of_float rect.y_min * (size_y()/19)) in
    let int_x_max = fst origine + (int_of_float rect.x_max * (size_x()/19)) in
    let int_y_max = snd origine + (int_of_float rect.y_max * (size_y()/19)) in
    let w = (int_x_max - int_x_min) in
    let h = (int_y_max - int_y_min ) in
    draw_rect int_x_min int_y_min w h
;;


let run_abs prog rect =
    rect := over_approximate prog !rect;
    draw_abs !rect
;;

(* let run_abs prog rect =
    let rec aux prog() rect =
        match prog with
            | [] -> draw_abs !rect;
            | a::w ->
                draw_abs !rect; 
                let val_rect = !rect in
                rect := over_approximate a val_rect;
                aux w rect
    in aux prog() rect
;; *)




(* let run_abs prog rect =
    let res = over_approximate prog rect
    in draw_abs res
;; *)


(* DEBUG *)
(* let printf_rect rect = 
    Printf.printf "de rect x_min = %f\n" !rect.x_min;
    Printf.printf "de rect y_min = %f\n" !rect.y_min;
    Printf.printf "de rect x_max = %f\n" !rect.x_max;
    Printf.printf "de rect y_max = %f\n" !rect.y_max;
;; 

(* printf_rect rect;
    Printf.printf "Origine : (%d, %d)\n" (fst origine) (snd origine);
    Printf.printf "int_x_min : %d (origine x: %d, rect.x_min: %f)\n" int_x_min (fst origine) !rect.x_min;
    Printf.printf "int_y_min : %d (origine y: %d, rect.y_min: %f)\n" int_y_min (snd origine) !rect.y_min;
    Printf.printf "int_x_max : %d (origine x: %d, rect.x_max: %f)\n" int_x_max (fst origine) !rect.x_max;
    Printf.printf "int_y_max : %d (origine y: %d, rect.y_max: %f)\n" int_y_max (snd origine) !rect.y_max;
    Printf.printf "Width (w) : %d (int_x_max: %d, int_x_min: %d)\n" w int_x_max int_x_min;
    Printf.printf "Height (h) : %d (int_y_max: %d, int_y_min: %d)\n" h int_y_max int_y_min; *)

*)