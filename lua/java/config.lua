---@class java.Config
---@field root_markers string[]
---@field jdtls { version: string }
---@field java_test { enable: boolean, version: string }
---@field java_debug_adapter { enable: boolean, version: string }
---@field spring_boot_tools { enable: boolean, version: string }
---@field notifications { dap: boolean }
---@field verification { invalid_order: boolean, duplicate_setup_calls: boolean, }
local config = {
	--  list of file that exists in root of the project
	root_markers = {
		'settings.gradle',
		'settings.gradle.kts',
		'pom.xml',
		'build.gradle',
		'mvnw',
		'gradlew',
		'build.gradle',
		'build.gradle.kts',
		'.git',
	},

	jdtls = {
		version = 'v1.43.0',
	},

	-- load java test plugins
	java_test = {
		enable = true,
		version = '0.40.1',
	},

	-- load java debugger plugins
	java_debug_adapter = {
		enable = true,
		version = '0.58.1',
	},

	spring_boot_tools = {
		enable = true,
		version = '1.55.1',
	},

	notifications = {
		-- enable 'Configuring DAP' & 'DAP configured' messages on start up
		dap = true,
	},

	-- We do multiple verifications to make sure things are in place to run this
	-- plugin
	verification = {
		-- nvim-java checks for the order of execution of following
		-- * require('java').setup()
		-- * require('lspconfig').jdtls.setup()
		-- IF they are not executed in the correct order, you will see a error
		-- notification.
		-- Set following to false to disable the notification if you know what you
		-- are doing
		invalid_order = true,

		-- nvim-java checks if the require('java').setup() is called multiple
		-- times.
		-- IF there are multiple setup calls are executed, an error will be shown
		-- Set following property value to false to disable the notification if
		-- you know what you are doing
		duplicate_setup_calls = true,
	},

}

return config
