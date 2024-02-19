import presto
import chronos

proc validate(
  pattern: string,
  value: string): int
  {.gcsafe, raises: [Defect].} =
  0

var restServer: RestServerRef

var router = RestRouter.init(validate)

router.rawApi(
  MethodPatch,
  "/patch") do () -> RestApiResponse:
    return RestApiResponse.response(httputils.HttpCode.Http204)

router.rawApi(
  MethodGet,
  "/ping") do () -> RestApiResponse:
    echo "got ping"
    return RestApiResponse.response("pong")

restServer = RestServerRef.new(
      router,
      initTAddress("127.0.0.1", 8000),
      bufferSize = (1024 * 64),
      maxRequestBodySize = int.high)
      .expect("Should start rest server!")

restServer.start()

while true:
  waitFor(sleepAsync(20000))
