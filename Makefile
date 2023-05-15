AIR := ${GOPATH}/air

local-server:
		${AIR} -c config/.air.toml
		