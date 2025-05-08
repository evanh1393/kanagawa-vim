vim.filetype.add({
  extension = {
    edge = "html",
  },
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

