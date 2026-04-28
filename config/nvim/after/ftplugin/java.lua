vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local home = os.getenv("HOME")
local uv = vim.uv or vim.loop
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local mason_jdtls_dir = home .. "/.local/share/nvim/mason/packages/jdtls"
local mason_lombok_path = mason_jdtls_dir .. "/lombok.jar"

local function path_exists(path)
	return path ~= nil and uv.fs_stat(path) ~= nil
end

local function dirname(path)
	return vim.fn.fnamemodify(path, ":h")
end

local function find_lombok_path()
	if path_exists(mason_lombok_path) then
		return mason_lombok_path
	end

	local lombok_bin = vim.fn.exepath("lombok")
	if lombok_bin == "" then
		return nil
	end

	local lombok_root = dirname(dirname(lombok_bin))
	local candidates = {
		lombok_root .. "/share/java/lombok.jar",
		lombok_root .. "/lib/lombok.jar",
		lombok_root .. "/share/lombok/lombok.jar",
	}

	for _, candidate in ipairs(candidates) do
		if path_exists(candidate) then
			return candidate
		end
	end

	return nil
end

local function build_cmd()
	local lombok_path = find_lombok_path()

	if vim.fn.executable("jdtls") == 1 then
		local cmd = {
			"jdtls",
			"--jvm-arg=-Dlog.protocol=true",
			"--jvm-arg=-Dlog.level=ALL",
			"--jvm-arg=-Xmx1g",
			"-data",
			workspace_dir,
		}

		if path_exists(lombok_path) then
			table.insert(cmd, 5, "--jvm-arg=-javaagent:" .. lombok_path)
		end

		return cmd
	end

	local cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(mason_jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		mason_jdtls_dir .. "/config_linux",
		"-data",
		workspace_dir,
	}

	if lombok_path then
		table.insert(cmd, 13, "-javaagent:" .. lombok_path)
	end

	return cmd
end

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
	cmd = build_cmd(),
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			format = {
				enabled = false,
			},
		},
	},

	init_options = {
		bundles = {},
	},

	-- on_attach = function(client, bufnr)
	--   vim.diagnostic.disable(bufnr)
	-- end,
}
require("jdtls").start_or_attach(config)

vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
vim.keymap.set(
	"v",
	"<leader>crv",
	"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
	{ desc = "Extract Variable" }
)
vim.keymap.set("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
vim.keymap.set(
	"v",
	"<leader>crc",
	"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
	{ desc = "Extract Constant" }
)
vim.keymap.set(
	"v",
	"<leader>crm",
	"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
	{ desc = "Extract Method" }
)
