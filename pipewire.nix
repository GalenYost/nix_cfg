{
   services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      wireplumber = {
         enable = true;
         extraConfig = {
            "noise-suppressed-mic" = {
               "monitor.rules" = [
                  {
                     matches = [
                        {
                           "node.name" = "~alsa_input.*";
                        }
                     ];
                     actions = {
                        update_props = {
                           "node.nick" = "Mic (Noise Suppressed)";
                           "filter.graph-name" = "rnnoise";
                           "filter.media-role" = "Communication";
                        };
                     };
                  }
               ];
            };
         };
      };
   };
}
