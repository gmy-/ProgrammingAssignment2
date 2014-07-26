library('RUnit')

source("cachematrix.R")

test_suite <- defineTestSuite("All Cache Matrix Tests",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

test_result <- runTestSuite(test_suite)

printTextProtocol(test_result)