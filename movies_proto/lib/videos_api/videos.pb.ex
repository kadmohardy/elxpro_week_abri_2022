defmodule VideosApi.GetVideoRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }

  defstruct id: 0

  field(:id, 1, type: :int32)
end

defmodule VideosApi.GetVideoResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          video: VideosApi.Video.t() | nil
        }

  defstruct video: nil

  field(:video, 1, type: VideosApi.Video)
end

defmodule VideosApi.Video do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          title: String.t(),
          description: String.t()
        }

  defstruct id: 0,
            title: "",
            description: ""

  field(:id, 1, type: :int32)
  field(:title, 2, type: :string)
  field(:description, 3, type: :string)
end

defmodule VideosApi.VideoService.Service do
  @moduledoc false
  use GRPC.Service, name: "videos_api.VideoService"

  rpc(:Get, VideosApi.GetVideoRequest, VideosApi.GetVideoResponse)
end

defmodule VideosApi.VideoService.Stub do
  @moduledoc false
  use GRPC.Stub, service: VideosApi.VideoService.Service
end
