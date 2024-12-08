exception Quit;;
open Graphics;;
open_graph " 800x600";;

let () =
  try
    let nbargs = Array.length Sys.argv in
    if nbargs <= 1 then ( 
      Printf.printf "Il manque des arguments\n";
      raise Quit;
    )
    else 
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg;
      (* Init.init_graphics (); *)
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with 
  | Quit -> close_graph ();;
