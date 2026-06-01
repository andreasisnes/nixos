{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_9
    dotnet-sdk_10
    dotnet-aspnetcore_9
    dotnet-aspnetcore_10
    dotnet-runtime_9
    dotnet-runtime_10
  ];
}