PHONY: develop
develop:
	swift package generate-xcodeproj --xcconfig-overrides Settings.xcconfig
	xed Example.xcodeproj
