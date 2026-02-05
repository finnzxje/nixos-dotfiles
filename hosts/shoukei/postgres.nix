{
  config,
  pkgs,
  ...
}:
{
  # https://wiki.nixos.org/wiki/PostgreSQL
  # https://search.nixos.org/options?channel=unstable&query=services.postgresql.
  # https://www.postgresql.org/docs/
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    # Ensures that the specified databases exist.
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    extensions =
      ps: with ps; [
        # postgis
        # pg_repack
      ];
  };
}
