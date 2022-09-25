{{ $zone := env "ZONE" }}
{{- key "mega-ops/global/prometheus"}}

scrape_configs:
    - job_name: prometheus
      static_configs:
        - targets: ['127.0.0.1:9090']      
{{ range $Key, $Value := tree (printf "/mega-ops/zone/%s/exporters/" $zone)| explode }}
{{$Value|indent 4}}
{{ end }}        
