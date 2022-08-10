local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup {
  keys = "asdfglkjhqwertyuiopzxcvbnm",
  quit_key = "<space>",
  jump_on_sole_occurance = false,
}
