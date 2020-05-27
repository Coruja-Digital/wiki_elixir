%Doctor.Config{
  ignore_modules: [],
  ignore_paths: [~r(contrib/.*)],
  min_module_doc_coverage: 100,
  min_module_spec_coverage: 83,
  min_overall_doc_coverage: 100,
  min_overall_spec_coverage: 92,
  moduledoc_required: true,
  raise: false,
  reporter: Doctor.Reporters.Full,
  umbrella: false
}
