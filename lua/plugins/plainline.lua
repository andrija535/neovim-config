return {
  'eduardo-antunes/plainline',
  opts = {
    sections = {
      left  = {
	"mode",
	"tabpage",
	"branch",
	"name",
	"diagnostics",
      },
      right = {
	"macro",
	"filetype",
	"fileformat",
	"percentage",
	"position",
      },
    },
    inactive_sections = {
      left  = { "name" },
      right = { "percentage" },
    },
    separator = "│",
    formatter = function(str)
      return string.format(" %s ", str)
    end,
    winbar = nil, -- no winbar by default
  }
}
