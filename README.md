# Proposal::Classifier
Essa é uma gem que consome a API do proposal classifier localizada nesse repositório [link](https://github.com/chaydson/proposal-classifier-api)

## Instalação
` gem install proposal-classifier `

## Uso
O endereço padrão da API é "http://0.0.0.0" porém, você pode mudar o endereço usando o comando:

` Proposal::Classifier::Model.base_url = "http://0.0.0.0 `

Atenção para não colocar uma barra depois do fim da URI pois isso irá quebrar a gem.

Para começar primeiro certifique-se de iniciar o modelo com o método init():

` Proposal::Classifier::Model.init() `

Depois, para realizar predições, basta chamar o método predict() acompanho da proposta desejada:

` Proposal::Classifier::Model.predict("Exempo de proposta") `

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
