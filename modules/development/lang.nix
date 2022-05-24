{pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
		clang
		python
    ruby
	];
}
