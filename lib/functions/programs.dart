Map<String, String> programs = {
  "11111111111111111111111111111111": "System Program",
  "MoveLdr111111111111111111111111111111111111": "Move Loader",
  "NativeLoader1111111111111111111111111111111": "Native Loader",
  "BPFLoader1111111111111111111111111111111111": "BPF Loader",
  "BPFLoader2111111111111111111111111111111111": "BPF Loader 2",
  "BPFLoaderUpgradeab1e11111111111111111111111": "BPF Upgradeable Loader",
  "1nc1nerator11111111111111111111111111111111": "Incinerator",
  "Sysvar1111111111111111111111111111111111111": "SYSVAR",
  "SysvarC1ock11111111111111111111111111111111": "Sysvar: Clock",
  "SysvarEpochSchedu1e111111111111111111111111": "Sysvar: Epoch Schedule",
  "SysvarFees111111111111111111111111111111111": "Sysvar: Fees",
  "SysvarRecentB1ockHashes11111111111111111111": "Sysvar: Recent Blockhashes",
  "SysvarRent111111111111111111111111111111111": "Sysvar: Rent",
  "SysvarRewards111111111111111111111111111111": "Sysvar: Rewards",
  "SysvarS1otHashes111111111111111111111111111": "Sysvar: Slot Hashes",
  "SysvarS1otHistory11111111111111111111111111": "Sysvar: Slot History",
  "SysvarStakeHistory1111111111111111111111111": "Sysvar: Stake History",
  "Sysvar1nstructions1111111111111111111111111": "Sysvar: Instructions",
  "AddressLookupTab1e1111111111111111111111111": "Address Lookup Table Program",
  "ComputeBudget111111111111111111111111111111": "Compute Budget Program",
  "Config1111111111111111111111111111111111111": "Config Program",
  "Stake11111111111111111111111111111111111111": "Stake Program",
  "Vote111111111111111111111111111111111111111": "Vote Program",
  "KeccakSecp256k11111111111111111111111111111":
      "Secp256k1 SigVerify Precompile",
  "Ed25519SigVerify111111111111111111111111111": "Ed25519 SigVerify Precompile",
  "ATokenGPvbdGVxr1b2hvZbsiqW5xWH25efTNsLJA8knL": "Associated Token Program",
  "Feat1YXHhH6t1juaWF74WLcfv4XoNocjXA6sPWHNgAse": "Feature Proposal Program",
  "LendZqTs7gn5CTSJU1jWKhKuVpjJGom45nnwPb2AMTi": "Lending Program",
  "Memo1UhkJRfHyvLMcVucJwxXeuD728EqVDDwQDxFMNo": "Memo Program",
  "MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr": "Memo Program v2",
  "namesLPneVptA9Z5rqUDD9tMTWEJwofgaYwp8cawRkX": "Name Service Program",
  "SPoo1Ku8WFXoNDMHPsrGSTSG1Y47rzgn41SLUNakuHy": "Stake Pool Program",
  "SwaPpA9LAaLfeLi3a68M4DjnLqgtticKg6CnyNwgAC8": "Swap Program",
  "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA": "Token Program",
  "metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s": "Token Metadata Program",
  "vau1zxA2LbssAUEF7Gpw91zMM1LvXrvpzJtmZ58rPsn": "Token Vault Program",
  "C64kTdg1Hzv5KoQmZrQRcm2Qz7PkxtFBgw7EpFhvYn8W": "Acumen Program",
  "WvmTNLpGMVbwJVYztYL4Hnsy82cJhQorxjnnXcRm3b6": "Serum Pool",
  "BrEAK7zGZ6dM71zUDACDqJnekihmwF15noTddWTsknjC": "Break Solana Program",
  "cjg3oHmg9uuPsP8D6g29NWvhySJkdYdAo9D25PRbKXJ":
      "Chainlink OCR2 Oracle Program",
  "HEvSKofvBgfaexv23kMabbYqxasxU3mQ4ibBMEmJWHny": "Chainlink Store Program",
  "GqTPL6qRf5aUuqscLh8Rg2HTxPUXfhhAXDptTLhp1t2J": "Mango Governance Program",
  "7sPptkymzvayoSbLXzBsXEF8TSf3typNnAWkrKrDizNb": "Mango ICO Program",
  "JD3bq9hGdy38PuWQ4h2YJpELmHVGPPfFSuFkpzAd9zfu": "Mango Program v1",
  "5fNfvyp5czQVX77yoACa3JJVEhdRaWjPuazuWgjhTqEH": "Mango Program v2",
  "mv3ekLzLbnVPNxjSKvqBpU3ZeZXPQdEC3bp5MDEBG68": "Mango Program v3",
  "MarBmsSgKXdrN1egZf5sqe1TMai9K1rChYNDJgjq7aD": "Marinade Staking Program",
  "MERLuDFBMmsHnsBPZw2sDQZHvXFMwp8EdjudcU2HKky":
      "Mercurial Stable Swap Program",
  "p1exdMJcjVao65QdewkaZRUnU6VPSXhus9n2GzWfh98": "Metaplex Program",
  "auctxRXPeJoc4817jDhf4HbjnhEcr1cCXenosMhK5R8": "NFT Auction Program",
  "cndyAnrLdpjq1Ssp1z8xxDsB8dxe7u4HL5Nxi2K5WXZ": "NFT Candy Machine Program",
  "cndy3Z4yapfJBmL3ShUp5exZKqR3z33thTzeNMm2gRZ": "NFT Candy Machine Program V2",
  "DjVE6JNiYqPL2QXyCUUh8rNjHrbz9hXHNYt99MQ59qw1": "Orca Swap Program v1",
  "9W959DqEETiGZocYWCQPaJ6sBmUzgfxXfqGeTEdp3aQP": "Orca Swap Program v2",
  "82yxjeMsvaURa4MbZZ7WZZHfobirZYkH1zF8fmeGtyaQ": "Orca Aquafarm Program",
  "Port7uDYB3wk6GJAw4KT1WpTeMtSu9bTcChBHkX2LfR": "Port Finance Program",
  "gSbePebfvPy7tRqimPoVecS2UsBvYv46ynrzWocc92s": "Pyth Oracle Program",
  "8tfDNiaEyrV6Q1U4DEXrEigs9DoDtkugzFbybENEbCDz": "Pyth Oracle Program",
  "FsJ3A3u2vn5cTVofAjvy6y5kwABJAqYWpe4975bi2epH": "Pyth Oracle Program",
  "QMMD16kjauP5knBwxNUJRZ1Z5o3deBuFrqVjBVmmqto": "Quarry Merge Mine",
  "QMNeHCGYnLVDn1icRAfQZpjPLBNkfGbSKRB83G5d8KB": "Quarry Mine",
  "QMWoBmAyJLAsA1Lh9ugMTw2gciTihncciphzdNzdZYV": "Quarry Mint Wrapper",
  "QRDxhMw1P2NEfiw5mYXG79bwfgHTdasY2xNP76XSea9": "Quarry Redeemer",
  "QREGBnEj9Sa5uR91AV8u3FxThgP5ZCvdZUW2bHAkfNc": "Quarry Registry",
  "675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8": "Raydium AMM Program",
  "9HzJyW1qZsEiSfMUf6L2jo3CcTKAyBmSyKdwQeYisHrC": "Raydium IDO Program",
  "RVKd61ztZW9GUwhRbbLoYVRE5Xf1B2tVscKqwZqXgEr":
      "Raydium Liquidity Pool Program v1",
  "27haf8L6oxUeXrHrgEgsexjSY5hbVUWEmvv9Nyxg8vQv":
      "Raydium Liquidity Pool Program v2",
  "EhhTKczWMGQt46ynNeRX1WfeagwwJd7ufHvCDjRxjo5Q": "Raydium Staking Program",
  "Crt7UoUR6QgrFrN7j8rmSQpUTNWNSitSwWvsWGf1qZ5t": "Saber Router Program",
  "SSwpkEEcbUqx4vtoEByFjSkhKdCT862DNVb52nZg1UZ": "Saber Stable Swap Program",
  "BJ3jrUzddfuSrZHXSCxMUUQsjKEyLmuuyZebkcaFp2fg": "Serum Dex Program v1",
  "EUqojwWA2rd19FZrzeBncJsm38Jm1hEhE3zsmX3bRc2o": "Serum Dex Program v2",
  "9xQeWvG816bUx9EPjHmaT23yvVM2ZWbrrpZb9PusVFin": "Serum Dex Program v3",
  "22Y43yTVxuUkoRKdm9thyRhQ3SdgQS7c7kB6UNCiaczD": "Serum Swap Program",
  "So1endDq2YkqhipRh3WViPa8hdiSpxWy6z3Z6tMCpAo": "Solend Program",
  "CrX7kMhLC3cSsXJdT7JDgqrRVWGnUpX3gfEfxxU2NVLi": "Lido for Solana Program",
  "SSwpMgqNDsyV7mAgN9ady4bDVu5ySjmmXejXvy2vLt1": "Step Finance Swap Program",
  "SWiMDJYFUGj6cPrQ6QYYYWZtvXQdRChSVAygDZDsCHC": "Swim Swap Program",
  "DtmE9D2CSB4L5D6A15mraeEjrGMm6auWVzgaD8hK2tZM": "Switchboard Oracle Program",
  "WormT3McKhFJ2RkiGpdw9GKvNCrB2aB54gb2uV9MfQC": "Wormhole",
  "worm2ZoG2kUd4vFXhvjh93UUH596ayRfgQ2MgjNMTth": "Wormhole Core Bridge",
  "3u8hJUVTA4jH1wYAyUur7FFZVQ8H635K3tSHHF4ssjQ5": "Wormhole Core Bridge",
  "wormDTUJ6AWPNvk59vGQbDvGJmqbDTdgWgAqcLBCgUb": "Wormhole Token Bridge",
  "DZnkkTmCiFWfYTfT41X3Rd1kDgozqzxWaHqsw6W4x2oe": "Wormhole Token Bridge",
  "WnFt12ZrnzZrFZkt2xsNsaNWoQribnuQ5B5FrDbwDhD": "Wormhole NFT Bridge",
  "2rHhojZ7hpu1zA91nvZmT8TqWWvMcKmmNBCr2mKTtMq4": "Wormhole NFT Bridge",
  "CJsLwbP1iu5DuUikHEJnLfANgKy6stB2uFgvBBHoyxwz": "Solanart",
  "5ZfZAwP2m93waazg8DkrrVmsupeiPEvaEHowiUP7UAbJ": "Solanart - Global offers",
  "Dooar9JkhdZ7J3LHN3A7YCuoGRUggXhQaG4kijfLGU2j": "STEPN Dex",
  "srmqPvymJeFKQ4zGQed1GFppgkRHL9kaELCbyksJtPX": "OpenBook Dex"
};
