# Paket Dependency Playground

A small repo with a sample package structure to test different `nuget` package versions.
This helps to illustrate pakets version channels and version specifier (alpha, beta, rc)

## Install

- You need paket installed on your machine to run the scripts.
- Adjust the [`generate_test_packages.sh`](generate_test_packages.sh) and run it. It will generate sample `Nuget` packages for `package_A` and `package_B`.

- Adjust `paket.dependcies` it contains multiple groups to illustrate different dependency conditions
- run `paket install`/`paket update`
- check the generated `paket.lock` file
