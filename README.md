# cuco_challenge

Desafio da CUCO para vaga de Desenvolvedor Flutter.

Obs: Não possuo MacOS de uso pessoal (É possível que algo não funcione devido as configs do XCode).
     Porém possuo bastante experiência desenvolvendo em Flutter para iOS.

## Requerimentos:

Flutter SDK version: 2.9.0-0.1.pre (beta)
Dart SDK version: 2.16.0-80.1.beta (beta)

## Features:
    Sign-in & Sign-out:

    Multi-theme:
        System & Dark & Light (com persistência utilizando shared-preferences).

    Localization (l10n):
        Português e Inglês.
        Não foram traduzidas todas as telas.

    Explore:
        Pagination (carrega resultados de 15 em 15)

    Following:
        É possivel seguir e deixar de seguir outros usuários na tela `Explore`.
        É possível visualizá-los e interagir com eles (seguir ou deixar de seguir) na tela `Account`.

    Followers:
        A cada 10 segundos o usuário ganha um follower aleatório.
        É possível visualizá-los e interagir com eles (seguir ou deixar de seguir) na tela `Account`.


## Outros Detalhes
    StateManagement:
        BLoC -> principal.
        setState -> utilizado para gerenciar estados de UI (loadings, snackbars, animações, etc).

    Exception Handling:
        São mockadas exceptions nas telas `SignIn` & `Explore` (50% de change).

    Tempo:
        aprox. 4h líquidas para completar o desafio.