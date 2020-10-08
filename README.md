# Iniciando o projeto:
- Para a realização do projeto foi utliziado o SO Windows 10 e o pacotes necessários no [RailsInstaller](http://railsinstaller.org/pt-BR).
- Utilize os seguintes comandos:
  - bundle install -> Instala as dependências necessárias.
  - rails db:migrate -> Cria a tabela necessária para salvar os dados. Foi utilizado o SQLite 3.
  - rails server -> Inicia o servidor para acessar os endpoints.

# Rotas
## POST /parking
- A placa deve estar no formado **AAA-9999**.

- O body da requisição deve ter o seguinte formato:
```json
{
  "plate": "FAA-1234"
}
```

- Se a placa não estiver no formato correto, retorna um status http 401 e a seguinte mensagem:
```json
{
  "message": "Plate Format Invalid"
}
```

- Se tudo estiver correto, retorna o status http 201 e a identificação do veículo:
```json
{
  "vehicle_identification": 1
}
```

## PUT out/:id

- Caso tente sair sem realizar o pagamento, retorna o status http 401 e a seguinte mensagem:
```json
{
  "message": "Pay First"
}
```

- Se o pagamento foi realizado, retorna o status http 200 e a seguinte mensagem:
```json
{
  "message": "You can go out. Thanks!"
}
```

## PUT pay/:id

- Caso tente realizar o pagamento pela segunda vez ou mais, retorna o status http 401 e a seguinte mensagem:
```json
{
  "message": "Payment has already been made!"
}
```

- Ao realizar o pagamento, retorna um status 200 e a mensagem:
```json
{
  "message": "Payment Accepted"
}
```

## GET /parking/:plate

- Retorna um status http 200 e o histórico da placa desejada:
```json
{
  "vehicle_information": [
      {
        "id": 1,
        "plate": "ABC-5555",
        "time": "55.03 minutes",
        "paid": true,
        "left": true,
        "created_at": "2020-10-08T00:02:19.918Z",
        "updated_at": "2020-10-08T00:28:39.851Z"
      }
  ]
}
```