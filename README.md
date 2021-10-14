# react-ic-ii-auth

> React components to use DFINITY Internet Identity Authentication

[![NPM](https://img.shields.io/npm/v/@identity-labs/react-ic-ii-auth.svg)](https://www.npmjs.com/package/@identity-labs/react-ic-ii-auth) [![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)

## Install

```bash
npm install --save @identity-labs/react-ic-ii-auth
```

## Usage

```tsx
import React from 'react'

import {
  InternetIdentityProvider,
  useInternetIdentity
} from '@identity-labs/react-ic-ii-auth'

const AuthButthon = () => {
  const { authenticate, isAuthenticated, identity } = useInternetIdentity()
  console.log('>> initialize your actors with', { identity })
  return (
    <button onClick={authenticate}>
      {isAuthenticated ? 'Logout' : 'Login'}
    </button>
  )
}

const App = () => {
  return (
    <InternetIdentityProvider
      authClientOptions={{
        onSuccess: (identity) => console.log(
          ">> initialize your actors with", {identity}
        )
        // NOTE: Overwrite identityProvider in dev mode
        // defaults to "https://identity.ic0.app/#authorize"
        identityProvider: `http://${process.env.II_CANISTER_ID}.localhost:8000/#authorize`
      }}
    >
      <AuthButthon />
    </InternetIdentityProvider>
  )
}

export default App
```

## Inspired by:

- https://github.com/dfinity/cancan/blob/031f31c0f45af72e42416043e1a2415642844d4e/src/utils/auth.tsx
- https://github.com/krpeacock/ic-avatar/blob/main/src/avatar_assets/src/hooks.ts

## License

[MIT © 2021 Internet Identity Labs, Inc](./LICENSE)
