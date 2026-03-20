pragma circom 2.1.0;

include "node_modules/circomlib/circuits/poseidon.circom";

// Verifies that a secret leaf exists in a Merkle Tree of depth 2
template MembershipCheck() {
    signal input secret;          // Private: The user's secret key
    signal input pathElements[2]; // Private: Merkle path neighbors
    signal input pathIndices[2];  // Private: Binary path (0 for left, 1 for right)
    signal input root;            // Public: The Merkle Root

    signal leaf;
    
    // Hash the secret to get the leaf
    component hasher = Poseidon(1);
    hasher.inputs[0] <== secret;
    leaf <== hasher.out;

    // Layer 1
    component hash1 = Poseidon(2);
    hash1.inputs[0] <== leaf + pathIndices[0] * (pathElements[0] - leaf);
    hash1.inputs[1] <== pathElements[0] + pathIndices[0] * (leaf - pathElements[0]);

    // Layer 2
    component hash2 = Poseidon(2);
    hash2.inputs[0] <== hash1.out + pathIndices[1] * (pathElements[1] - hash1.out);
    hash2.inputs[1] <== pathElements[1] + pathIndices[1] * (hash1.out - pathElements[1]);

    // Verify the calculated root matches the public root
    root === hash2.out;
}

component main {public [root]} = MembershipCheck();
