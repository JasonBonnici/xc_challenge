{{range $key, $pairs := tree "whitelist" | byKey}}{{$key}}:
- whitelist:
{{range $pair := $pairs}}  - permit {{.Value}};
{{end}}{{end}}
