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
          move_left: Some(( code: Char('h'), modifiers: "")),
          move_right: Some(( code: Char('l'), modifiers: "")),
          move_up: Some(( code: Char('k'), modifiers: "")),
          move_down: Some(( code: Char('j'), modifiers: "")),
          popup_up: Some(( code: Char('k'), modifiers: "")),
          popup_down: Some(( code: Char('j'), modifiers: "")),
          focus_left: Some(( code: Char('h'), modifiers: "")),
          focus_right: Some(( code: Char('l'), modifiers: "")),
          page_up: Some(( code: Char('b'), modifiers: "CONTROL")),
          page_down: Some(( code: Char('f'), modifiers: "CONTROL")),
          shift_up: Some(( code: Char('K'), modifiers: "SHIFT")),
          shift_down: Some(( code: Char('J'), modifiers: "SHIFT")),
          home: Some(( code: Char('g'), modifiers: "")),
          end: Some(( code: Char('G'), modifiers: "SHIFT")),
          open_commit: Some(( code: Char('c'), modifiers: "")),
          open_branch: Some(( code: Char('b'), modifiers: "")),
          open_stash: Some(( code: Char('S'), modifiers: "SHIFT")),
          open_file: Some(( code: Enter, modifiers: "")),
          stage_unstage_item: Some(( code: Char('s'), modifiers: "")),
          enter: Some(( code: Char('o'), modifiers: "")),
          create_branch: Some(( code: Char('N'), modifiers: "SHIFT")),
          edit_file: Some(( code: Char('e'), modifiers: "")),
          diff_hunk_prev: Some(( code: Char('{'), modifiers: "")),
          diff_hunk_next: Some(( code: Char('}'), modifiers: "")),
          tags: Some(( code: Char('t'), modifiers: "")),
          exit: Some(( code: Char('q'), modifiers: "")),
          quit: Some(( code: Char('q'), modifiers: "")),
          exit_popup: Some(( code: Esc, modifiers: "")),
          escaping: Some(( code: Esc, modifiers: "")),
          open_help: Some(( code: Char('?'), modifiers: "")),
      )
    '';
  };
}
