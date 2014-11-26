prefix = fn prefix -> (
    fn suffix -> "#{prefix} #{suffix} "end
  ) 
end

mrs = prefix.("Mrs")

IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
