{
config, lib, pkgs, ... }:

{
   programs.git = {
      enable = true;
      config = [
         {
            user.name = "GalenYost";
            user.email = "brawlstarser086@gmail.com";
         }
         {
            core.compression = 9;
            core.whitespace = "error";
            core.preloadindex = true;
         }
         {
            advice.addEmptyPathspec = false;
            advice.pushNonFastForward = false;
            advice.statusHits = false;
         }
         {
            init.defaultBranch = "master";
         }
         {
            status.branch = true;
            status.showStash = true;
            status.showUntrackedFiles = "all";
         }
         {
            diff.context = 3;
            diff.renames = "copies";
            diff.interHunkContext = 10;
         }
         {
            pager.diff = "diff-so-fancy";
         }
         {
            "diff-so-fancy".markEmptyLines = false;
         }
         {
            color.diff.meta = "black bold";
            color.diff.frag = "magenta";
            color.diff.context = "white";
            color.diff.whitespace = "yellow reverse";
            color.diff.old = "red";
         }
         {
            interactive.diffFilter = "diff-so-fancy --patch";
            interactive.singlekey = true;
         }
         {
            push.autoSetupRemote = true;
            push.default = "current";
            push.followTags = true;
         }
         {
            pull.default = "current";
            pull.rebase = true;
         }
         {
            rebase.autoStash = true;
            rebase.missingCommitsCheck = "warn";
         }
         {
            color.branch.current = "magenta";
            color.branch.local = "default";
            color.branch.remote = "yellow";
            color.branch.upstream = "green";
            color.branch.plain = "blue";
         }
         {
            "url.git@github.com:GalenYost".insteadOf = "my:";
         }
         {
            "url.git@github.com:".insteadOf = "gh:";
         }
      ];
   };
}
