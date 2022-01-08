package main

import (
	. "github.com/ChaunceyShannon/golanglibs"
)

func main() {
	Http.PostRaw(
		Os.Getenv("PLUGIN_WEBHOOK_URL"),
		Os.Getenv("PLUGIN_TITLE")+`
		
REPO:`+Os.Getenv("DRONE_REPO")+`
BRAHCN:`+Os.Getenv("DRONE_COMMIT_BRANCH")+`
MESSAGE:`+String(Os.Getenv("DRONE_COMMIT_MESSAGE")).Strip().S+`
HASH:`+String(Os.Getenv("DRONE_COMMIT_SHA")).Sub(0, 10).S+`
LINK:`+Os.Getenv("DRONE_BUILD_LINK")+`

`+Os.Getenv("PLUGIN_TAG"),
		HttpConfig{TimeoutRetryTimes: -1},
	)
}
