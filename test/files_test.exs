defmodule FilesTest do
  use ExUnit.Case
  doctest Files

  test "test example of CSV" do
    assert Files.sort_csv_columns("Beth,Charles,Danielle,Adam,Eric,Aaaaa,Bbbbbb,Ccccc,Dddddd,Eeeeee,Ffffff,Gggggg,hhhhhhh,iiiiiii,jjjjjjjjjjjjjjjjjjjj  jjjjjjjjjjjj j jjjjjjjjjjjjjjjj\n17945,10091,10088,3907,10132,1111,22222,3333,444,5555,666,777,888,999,100\n2,12,13,48,11,1,2,3,4,5,6,7,8,9,10") ==
      "Aaaaa,Adam,Bbbbbb,Beth,Ccccc,Charles,Danielle,Dddddd,Eeeeee,Eric,Ffffff,Gggggg,hhhhhhh,iiiiiii,jjjjjjjjjjjjjjjjjjjj  jjjjjjjjjjjj j jjjjjjjjjjjjjjjj\n1111,3907,22222,17945,3333,10091,10088,444,5555,10132,666,777,888,999,100\n1,48,2,2,3,12,13,4,5,11,6,7,8,9,10"
  end
end
