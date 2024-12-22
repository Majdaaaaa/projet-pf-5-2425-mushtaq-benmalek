exception Quit;;
open Graphics;;
open Format;;

let i = ref 0;;
let j = ref (-1);;


let drawing () = 
  Option.rc();
  Option.abs !j ();
  Option.ae !i ();
  Option.pc ();
  Option.cr !i  ();
  Option.fc ();
  i := !i+1;
  j := !j+1;
;;


let () =
  try
    Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
    condition();
    Option.size ();
    Option.bc ();
    Option.fc ();
    Init.init_graphics ();
    Option.not_detereministic !prog;
    while true do
      let eve = wait_next_event [Key_pressed] in
      if eve.key = 'q' then raise Quit;
      try
        if eve.key = 'n' then (
          drawing ();
        );
        if eve.key = 's' then ( 
          while true do
            drawing ();
          done
        );
      with
      | Cr.Fin -> set_color red;  moveto 2 70 ; draw_string "Fin du programme";
      | Option.Deter -> set_color red;  moveto 2 80 ; draw_string "Programme deterministe";
    done
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme a éxécuté\n"; close_graph ()
  | Not_in_rectangle -> Printf.printf "La coordonnée (0.0, 0.0) n'est pas dans le rectangle donnée.\n"
  | Abs_ae_exception -> Printf.printf "Les options -ae et -abs ne peuvent pas s'éxecuter en même temps.\n"
  | Rc_only -> Printf.printf "L'option -rc doit être utiliser avec l'option -abs ou -ae.\n"
  | Not_color -> Printf.printf "Ce n'est pas une couleur valide.\n"
