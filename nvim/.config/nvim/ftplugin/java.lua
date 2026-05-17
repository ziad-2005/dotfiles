local jdtls = require("jdtls")

local root = require("jdtls.setup").find_root({
  ".git", "pom.xml", "build.gradle", "mvnw", "gradlew"
})

local workspace = vim.fn.stdpath("data") .. "/jdtls/" ..
  vim.fn.fnamemodify(root, ":p:h:t")

jdtls.start_or_attach({
  cmd = {
    "java",
    "-jar",
    vim.fn.stdpath("data")
      .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
  },
  root_dir = root,
  data_dir = workspace,
})

