SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

function pack {
    paket pack output bin version $1
}

function depends {
    project_name=$1
    cp $project_name/paket.template.tpm $project_name/paket.template
    
    shift
    echo "dependencies" >>  $project_name/paket.template
    while test ${#} -gt 0
    do
        echo "      $1" >>  $project_name/paket.template
        shift
    done
}

cd $SCRIPT_DIR/package_A
rm -fr bin/*
paket update
pack 1.0.0
pack 1.1.0-alpha
pack 1.1.0-beta
pack 1.1.0-rc
pack 2.0.0
pack 3.0.0


cd $SCRIPT_DIR/package_B
rm -fr bin/*
paket update
depends "B" "package_A ~> 1"
pack 1.0.0

depends "B" "package_A ~> 1 alpha"
pack 1.0.1-alpha
pack 1.0.1-alpha2

depends "B" "package_A ~> 1 beta"
pack 1.0.1-beta

depends "B" "package_A ~> 1 rc"
pack 1.0.1-rc
pack 1.0.1-rc2

pack 1.1.0-rc

depends "B" "package_A ~> 2"
pack 1.2.0
