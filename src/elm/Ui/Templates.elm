module Ui.Templates exposing (mainTemplate)

import Html exposing (Html, div, header, footer)
import Html.Attributes exposing (id, class)



mainTemplateHeader : Html a -> Html a
mainTemplateHeader children = header [ class "header" ] [ children ]

mainTemplateFooter : Html a -> Html a
mainTemplateFooter children =  footer [ class "footer" ] [ children ]


mainTemplate : Html a -> Html a -> Html a -> Html a
mainTemplate header footer children =
  div
    [
      (id "main-template"),
      (class "main-container")
    ]
    [
      (mainTemplateHeader header),
      children,
      (mainTemplateFooter footer)
    ]
