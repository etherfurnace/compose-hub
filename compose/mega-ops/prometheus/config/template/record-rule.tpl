groups:
{{ range $Key, $Value := tree "/mega-ops/global/record-rules/" | explode }}
{{$Value|indent 4}}
{{ end }}        