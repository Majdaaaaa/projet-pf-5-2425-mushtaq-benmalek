open Graphics;;
open Format;;

open_graph " 500x500";;

exception Quit;;

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
  end

  (* le nom du fichier compte pour un argmument *)

let () =
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
    try loop 5
  with Quit -> close_graph ()
    
;;



(* let () =
  try loop 5
  with Quit -> close_graph ();; *)
    



  (* format_complet Sys.argv.(1) Sys.argv.(2); *)
    (* if nbargs = 2 then format_complet Sys.argv.(1)
    else format_complet  Sys.argv.(2); *)
    (* Printf.printf "Il y a %d arguments \n" nbargs; *)