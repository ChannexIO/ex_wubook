defmodule ExWubook.Token do
  defstruct user: nil,
            password: nil,
            provider_key: nil,
            lcode: nil,
            token: nil,
            cc_password: nil
end
