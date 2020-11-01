defmodule Service.PageTest do
  use HelloWeb.ConnCase
  import Service.Page

  test "countChar single" do
    assert countChar("a") == %{"a" => 1}
  end

  test "countChar multiple" do
    assert countChar("aavvv") == %{"a" => 2, "v" => 3}
  end
end
