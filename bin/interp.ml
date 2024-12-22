exception Quit;;
open Graphics;;
open Format;;
open Prog;;
open Pf5.Geo;;

let i = ref 0;;
let j = ref (-1);;
let copie_rect = ref {x_min = 0.; y_min = 0. ; x_max = 0. ; y_max = 0.};;
let continue = ref true;;

(** [drawing] appelle toutes les fonctions qui servent à afficher les affichages des options demandées par l'utilisateur.
*)
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

(** [choix_abs] Affiche un message si l'option -abs est spécifiée et que le programme est déterministe.
*)
let  choix_abs  () = 
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme deterministe.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <1> ou <2> ou <3> ou <4> pour choisir un nouveau programme a executer." ;
  moveto 10 (size_y ()-50);
  draw_string "Les programmes <3> et <4> ne sont pas deterministe.";
  Option.fc ()
;;

(** [prog_fini] Affiche un message lorsque le programme est fini.
*)
let prog_fini () =
  set_color red;
  moveto 10 (size_y ()-20);
  draw_string "Programme fini.";
  moveto 10 (size_y ()-35);
  draw_string "Appuyez sur <U> ou <D> ou <T> ou <F> pour choisir un nouveau programme a executer." ;
  moveto 10 (size_y ()-50);
  draw_string "Appuyez sur n'importe quelle touche pour re-executer le meme programme." ;
  Option.fc ();;

(** [main] appelle toute les fonctions des options, du repère et [drawing], ainsi que le parsing.
    Attend une entrée par le clavier : 
    - <q> : pour fermer la fenêtre.
    - <n> : passer à l'étape suivant.
    - <s> : affiche toute l'exécution du programme en une seule fois.
      Rattrape les exceptions [Cr.Fin] et [Option.Deter] fait un affichage approprié et laisse le choix à l'utilisateur pour
      un autre programme à exécuter.
      Lève l'exception [Quit].
*)
let rec main () = 
  Arg.parse Format.speclist Format.anon_fun Format.usage_msg; 
  condition();
  copie_rect := {x_min = (!rect).x_min ; y_min = (!rect).y_min ; x_max = (!rect).x_max ; y_max = (!rect).y_max };
  Option.size ();
  Option.bc ();
  Option.fc ();
  Init.init_graphics ();
  Option.not_detereministic !prog;
  while !continue do
    let eve = wait_next_event [Key_pressed] in 
    if eve.key = 'q' then raise Quit;
    try (
      if eve.key = 'n' then (
        drawing ();
      );
      if eve.key = 's' then ( 
        while true do
          drawing ();
        done
      );)
    with 
    | Cr.Fin -> (
        prog_fini ();
        handler_ex ();
        continue := false;
      )
    | Option.Deter -> (
        choix_abs ();
        handler_ex ();
        continue := false;
      )
  done

(** [handler_ex] gestionnaire de fin de programme.*)
and handler_ex () = 
  let eve = wait_next_event [Key_pressed] in 
  choix_prog  eve.key

(** [choix_prog] attends une entrée au clavier pour spécifier un nouveau programme à exécuter.
    @param key l'entrée clavier. 
*)
and choix_prog key = 
  rect := !copie_rect;
  i := 0;
  j := (-1);
  match key with
  | 'u' -> prog := prog1 (); clear_graph (); continue := true ;main ()
  | 'd' -> prog := prog2 (); clear_graph (); continue := true ;main ()
  | 't' -> prog := prog3 (); clear_graph (); continue := true ;main ()
  | 'f' -> prog := prog4 (); clear_graph (); continue := true ;main ()
  | 'q' -> raise Quit 
  | _ -> continue := true ; main ()
;;

let () =
  try
    main ()
  with 
  | Quit -> close_graph ()
  | Arg -> Printf.printf "Il faut un programme à éxécuter\n"; close_graph ()
  | Not_in_rectangle -> Printf.printf "La coordonnée (0.0, 0.0) n'est pas dans le rectangle donnée.\n"
  | Abs_ae_exception -> Printf.printf "Les options -ae et -abs ne peuvent pas s'éxecuter en même temps.\n"
  | Rc_only -> Printf.printf "L'option -rc doit être utiliser avec l'option -abs ou -ae.\n"
  | Not_color -> Printf.printf "Ce n'est pas une couleur valide.\n"
