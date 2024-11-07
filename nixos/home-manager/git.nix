{
    programs.git = {
    enable = true;
    userName  = "Kenshin";
    userEmail = "nicolas.sedres.moreira@gmail.com";
    extraConfig = {
        credential = {helper = "store";};
        color = {
            diff = "auto";
            status = "auto";
            branch = "auto";
        };
    };
  };
}
