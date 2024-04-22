# up must be installed before invoking this

cd ..
. ./setup.sh

cd ~
base_dir=$(pwd)

mkdir ~/test && cd ~/test
mkdir one && cd one
mkdir two && cd two
mkdir three && cd three

if [[ "$PWD" != $base_dir/test/one/two/three ]]; then 
    echo "Current directory is not within the expected location."
    exit 1
fi

. /usr/local/lib/up one

if [[ "$PWD" != $base_dir/test/one ]]; then 
    echo "Expected: '$base_dir/test/one'; actual: '$PWD'"
    exit 1
else
    echo "✅ simple usage succeeds"
fi

output=$(. /usr/local/lib/up)

if [ -n "$output" ]; then
    exit 1
else
    echo "✅ \`up\` produces no output"
fi

rm -rf ~/test
echo "🥂 Test suite passed"