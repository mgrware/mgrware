CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...
  config.height = '600'
  config.extraPlugins = 'video';
  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript",],
  ];
  config.toolbar = "simple";

  // ... rest of the original config.js  ...
}