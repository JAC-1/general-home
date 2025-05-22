let
  userName = "jac-1";
  email = "79427501+JAC-1@users.notreply.github.com";
in
{
    programs.git = {
        enable = true;
        userName = userName;
        userEmail = email;
        extraConfig = {
            core = {
                fileMode = false;
              };
          };
    };
    programs.gh.enable = true;
}
