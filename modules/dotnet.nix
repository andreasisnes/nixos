{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    (with dotnetCorePackages; combinePackages [
      # SDKs
      sdk_9_0_3xx-bin
      sdk_10_0_2xx-bin
      sdk_11_0_1xx-bin

      # Aspnet core
      aspnetcore_9_0-bin
      aspnetcore_10_0-bin
      aspnetcore_11_0-bin

      # Runtime
      runtime_9_0-bin
      runtime_10_0-bin
      runtime_11_0-bin
    ])
  ];
}