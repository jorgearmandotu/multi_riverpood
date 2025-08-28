# multi_riverpood

A new Flutter project.

Ejecuta el build runner
```
dart run build_runner watch
```

crear directori .env colo los archivos dev.josn. prod.json, stg.json cone lc ontenido de la url ademas en .vscode agregar la configuracion

{
    "BASE_URL": "url"
}

configuracion
"args": [
                "--dart-define-from-file=.env/stg.json"
            ]