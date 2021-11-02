test:
	dfx deploy
	dfx canister call profile whoami | egrep "principal" && echo 'PASS'
