# ExtensionSample
SwiftのExtension集です

## Description
### UIAlertController
- show(title: String, message: String?, okAction: (() -> Void)?)
  - OKボタンの付いたアラートを表示
- show(title: String, message: String?, okAction: (() -> Void)?, cancelAction: (() -> Void)?)
  - OKとキャンセルボタンの付いたアラートを表示
- show(title: String, message: String?, cancelAction: (() -> Void)?, defaultButton: [String], defaultAction: @escaping (String) -> Void)
  - ActionSheetを表示
