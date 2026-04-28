#!/bin/sh

PASS="\033[32mPASS\033[0m"
FAIL="\033[31mFAIL\033[0m"

RESULT=0

check() {
    NAME="$1"
    CMD="$2"
    if python3 -c "$CMD" 2>/dev/null; then
        printf "  [${PASS}] %s\n" "$NAME"
    else
        printf "  [${FAIL}] %s\n" "$NAME"
        RESULT=1
    fi
}

echo ""
echo "=== ijson sanity check ==="

check "import ijson"        "import ijson"
check "C backend active"    "import ijson; assert 'c' in ijson.backend.lower(), ijson.backend"
check "basic parse works"   "import ijson, io; list(ijson.items(io.BytesIO(b'{\"k\": 1}'), ''))"

echo ""
if [ $RESULT -eq 0 ]; then
    printf "=== \033[32mALL PASSED\033[0m ===\n"
else
    printf "=== \033[31mFAILED\033[0m ===\n"
fi

exit $RESULT