{{ range $key, $domain := ls "domains" | explode }}
    {{ $name := $domain }}
#{{ $domain }}:
  - whitelist: 
    {{ range $key, $wlist := tree ($name | printf "whitelist/%s/") | explode }} - permit {{ $wlist }};
    {{ end }}
{{ end }}
