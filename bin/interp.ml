(* open Graphics;;
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

   open Format;;

   open_graph " 500x500";;

   (* exception Quit;; *)
   (* 
   let rec loop t =
   let eve = wait_next_event [Mouse_motion;Key_pressed]
   in
   if eve.keypressed
   then 
    match eve.key with
      | 'b'  -> set_color black; loop t
      | 'r'  -> set_color red; loop t
      | 'g'  -> set_color green; loop t
      | 'q'  -> raise Quit
      | '0'..'9' as  x -> loop (int_of_string (String.make 1 x))
      | _    -> loop t
   else begin
    fill_circle (eve.mouse_x-t/2) (eve.mouse_y-t/2) t;
    loop t
   end *)

   (* le nom du fichier compte pour un argmument *)

   (* let () =
   let nbargs = Array.length Sys.argv in
   if nbargs < 1 then Printf.printf "Il manque des arguments \n"
   else
    (* format_complet Sys.argv(1) Sys.argv(2) Sys.argv(3); *)
    (* format_option Sys.argv(1); *)
    (* let res = [] in
    for i=0 to nbargs-1 do
      Sys.argv(i)::res
    done *)
    (* format_l (List.rev res); *)

   Arg.parse speclist anon_fun usage_msg;
    (* try loop 5
   with Quit -> close_graph () *)

   ;; *)


   (* let () =
   let nbargs = Array.length Sys.argv in
   if nbargs < 1 then Printf.printf "Il manque des arguments \n"
   else
    try
      Arg.parse speclist anon_fun usage_msg
    with 
   | Arg.Bad msg -> Printf.printf "_____________________________________ %s" msg  
   ;; *)


   (* let () =
   try loop 5
   with Quit -> close_graph ();; *)




   (* format_complet Sys.argv.(1) Sys.argv.(2); *)
    (* if nbargs = 2 then format_complet Sys.argv.(1)
    else format_complet  Sys.argv.(2); *)
    (* Printf.printf "Il y a %d arguments \n" nbargs; *)






   let () =
   let nbargs = Array.length Sys.argv in
   if nbargs < 1 then Printf.printf "Il manque des arguments \n"
   else
      Arg.parse speclist anon_fun usage_msg
   ;; *)

(* open Graphics *)
(* open Repere *)
open Format;;
(* exception Quit *)
(* open Pf5.Geo *)
(* open Pf5.Interp *)


(* let graphe =
   open_graph " 800x1000";
   let mid_x = (float_of_int (size_x ())) /. 2. in 
   let mid_y =  (float_of_int (size_y ())) /. 2. in 
   try
    (* Dessine les axes *)
    repere () ;
    let prog = 
      (*Carré*)
      [
        Repeat (4, [
            Move (Translate {x = 1.0*.42.10526316; y = 0.0*.52.63157895});  
            Move (Rotate ({x = mid_x; y = mid_y}, 90.0))  
          ])
      ]
    in 
    Cr.run prog 1.;

    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
   with Quit ->
    close_graph ();; *)
open Graphics;;
exception Quit;;

let () =
  (* let mid_x = (float_of_int (size_x ())) /. 2. in 
     let mid_y =  (float_of_int (size_y ())) /. 2. in  *)
  try
    let nbargs = Array.length Sys.argv in
    if nbargs < 1 then Printf.printf "Il manque des arguments \n"
    else
      Arg.parse speclist anon_fun usage_msg;
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with Quit ->
    close_graph ();;
;;