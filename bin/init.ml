open Graphics;;
(**[init_graphics] affiche des informations sur les actions possibles, change le titre de la fenêtre, 
   et appel [repere] pour dessiner le repère 
*)
let init_graphics () =
  set_window_title "Interpreteur Graphique";
  set_text_size 40;
  moveto 2 5;
  draw_string "Appuyez sur <N> pour avancer dans l'execution.";
  moveto 2 20;
  draw_string "Appuyez sur <Q> pour quitter.";
  moveto 2 35;
  draw_string "Appuyez sur <S> pour afficher toute l'execution.";
  moveto 2 50;
  Repere.repere ();
;;