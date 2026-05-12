{ pkgs, ... }:

{
  programs.gitui = {
    enable = true;
    package = pkgs.gitui;

    theme = ''
      (
        selected_tab: Some("#c099ff"),
        command_fg: Some("#636da6"),
        selection_bg: Some("#2f334d"),
        selection_fg: Some("#86e1fc"),
        cmdbar_bg: Some("#222436"),
        cmdbar_extra_lines_bg: Some("#222436"),
        disabled_fg: Some("#636da6"),
        diff_line_add: Some("#c3e88d"),
        diff_line_delete: Some("#ff757f"),
        diff_file_added: Some("#4fd6be"),
        diff_file_removed: Some("#c53b53"),
        diff_file_moved: Some("#ff007c"),
        diff_file_modified: Some("#ffc777"),
        commit_hash: Some("#c099ff"),
        commit_time: Some("#4fd6be"),
        commit_author: Some("#c3e88d"),
        danger_fg: Some("#ff757f"),
        push_gauge_bg: Some("#222436"),
        push_gauge_fg: Some("#c8d3f5"),
        tag_fg: Some("#ff007c"),
        branch_fg: Some("#ffc777"),
      )
    '';

    keyConfig = ''
      (
          move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),
          popup_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
          popup_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),
          focus_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
          focus_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
          page_up: Some(( code: Char('b'), modifiers: ( bits: 2,),)),
          page_down: Some(( code: Char('f'), modifiers: ( bits: 2,),)),
          shift_up: Some(( code: Char('K'), modifiers: ( bits: 0,),)),
          shift_down: Some(( code: Char('J'), modifiers: ( bits: 0,),)),
          home: Some(( code: Char('g'), modifiers: ( bits: 0,),)),
          end: Some(( code: Char('G'), modifiers: ( bits: 0,),)),
          open_commit: Some(( code: Enter, modifiers: ( bits: 0,),)),
          open_branch: Some(( code: Enter, modifiers: ( bits: 0,),)),
          open_stash: Some(( code: Enter, modifiers: ( bits: 0,),)),
          open_file: Some(( code: Enter, modifiers: ( bits: 0,),)),
          exit: Some(( code: Char('q'), modifiers: ( bits: 0,),)),
          quit: Some(( code: Char('q'), modifiers: ( bits: 0,),)),
          exit_popup: Some(( code: Esc, modifiers: ( bits: 0,),)),
          escaping: Some(( code: Esc, modifiers: ( bits: 0,),)),
          open_help: Some(( code: Char('?'), modifiers: ( bits: 0,),)),
      )
    '';
  };
}
