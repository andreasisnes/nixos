{ pgks, ... }:

{
  environment.systemPackages = with pgks; [
    claude-code
  ];
}