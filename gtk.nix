{ pkgs }:

{
   gtk = {
      enable = true;
      theme = {
         name = "Adwaita-dark";
         package = pkgs.gnome-themes-extra;
      };
      iconTheme = {
         name = "Adwaita";
         package = pkgs.gnome-themes-extra;
      };
   };

   environment.sessionVariables = {
      GTK_THEME = "Adwaita:dark";
   };
}
