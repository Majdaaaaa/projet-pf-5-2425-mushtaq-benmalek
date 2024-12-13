exception Quit;;
open Graphics;;

let init_graphics () =
  (* Printf.printf "Début programme\n"; *)
  open_graph " 800x600";
  set_window_title "Interpreteur Graphique";
  Repere.repere ();
;;

let () =
  try
    let nbargs = Array.length Sys.argv in
    if nbargs <= 1 then ( 
      Printf.printf "Il manque des arguments\n";
      raise Quit;
    ) else 
      init_graphics ();
    
    Repere.repere ();
    (* try  *)
      Arg.parse Format.speclist Format.anon_fun Format.usage_msg;
    (* with *)
      (* | Arg.Bad s -> Printf.printf "mauvais argument donné %s" s; *)
      (* | exn -> Printf.printf "Une exception est survenue : %s\n" (Printexc.to_string exn); *)
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit
    done
  with 
  | Quit -> close_graph ();;