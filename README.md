# ZK-Proof Membership Verifier 🛡️

An expert-grade implementation of Zero-Knowledge Proofs for privacy-preserving applications. This toolkit uses Merkle Trees and Groth16 proofs to verify that a "secret" belongs to a public set of commitments.

## Features
- **Circom Circuits**: Optimized R1CS constraints for membership checks.
- **Merkle Tree Integration**: On-chain verification of Merkle inclusions.
- **Privacy First**: Prover reveals zero information about which leaf they control.
- **SnarkJS Integration**: Seamless proof generation and export to Solidity verifiers.

## Workflow
1. **Compile**: Use Circom to generate the R1CS and WASM files.
2. **Setup**: Perform a "Powers of Tau" ceremony for the trusted setup.
3. **Prove**: Generate a ZK-proof locally using your secret and the Merkle path.
4. **Verify**: Submit the proof to the `Verifier.sol` contract on-chain.

## Tech Stack
- Circom 2.1.x
- SnarkJS
- Solidity ^0.8.20
