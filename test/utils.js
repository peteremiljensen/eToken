exports.assertReverts = async (f) => {
    let res = false;
    try {
        await f;
    } catch (e) {
        assert(e.message === 'VM Exception while processing transaction: revert',
               "Got an error as expected, but it was of the wrong kind");
        res = true;
    }
    assert(res, "Expected an error");
}

const tokName = "eUSD";

/**
   Assumes a hexadecimal number encoded as a string (starting with 0x)
   containing ASCII values.

   @returns A string of ASCII characters
*/
exports.bytes32ToString = (str) => {
    if (str.substring(0, 2) !== "0x") {
        throw new Error("Expected a string representation of a hex number starting with 0x");
    }
    let rest = str.substring(2, str.length);
    if ((rest.length % 2) !== 0) {
        throw new Error("Hex string must be of even length");
    }
    let parts = [];
    for (let i = 0; (i + 2) < rest.length; i += 2) {
        let part = parseInt("0x" + rest.substring(i, i + 2));
        // Use null termination
        if (part === 0|0) {
            break;
        }
        parts.push(part);
    }
    return  parts.map((x) => String.fromCharCode(x)).join('');
}

//exports = {assertReverts: true, bytes32ToString: true}
//module.exports = [assertReverts, bytes32ToString]