{ buildGo118Module, fetchFromGitHub, lib, installShellFiles, version }:

buildGo118Module {
  pname = "golangci-lint-langserver";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "nametake";
    repo = "golangci-lint-langserver";
    rev = "v${version}";
    sha256 = "sha256-VsS0IV8G9ctJVDHpU9WN58PGIAwDkH0UH5v/ZEtbXDE=";
  };

  vendorSha256 = "sha256-tAcl6P+cgqFX1eMYdS8vnfdNyb+1QNWwWdJsQU6Fpgg=";

  doCheck = false;

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
    "-X main.commit=v${version}"
    "-X main.date=19700101-00:00:00"
  ];

  meta = with lib; {
    description = "Fast linters Runner for Go";
    homepage = "https://golangci-lint.run/";
    license = licenses.mit;
    # maintainers = with maintainers; [ anpryl manveru mic92 ];
  };
}
