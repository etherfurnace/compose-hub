groups:
{{ range $Key, $Value := tree "/mega-ops/global/alert-rules/" | explode }}
{{$Value|indent 4}}
{{ end }}        