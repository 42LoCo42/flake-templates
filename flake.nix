{
  description = "My collection of flake templates";

  outputs = { self }: {
    templates = let
      mkTemplates = names: builtins.listToAttrs (map (name: {
        inherit name;
        value = {
          description = "A flake template for ${name}";
          path = ./. + "/${name}";
        };
      }) names);
    in mkTemplates [
      "go"
      "haskell"
    ];
  };
}
