module Ui.Templates exposing (mainTemplate)

import Html exposing (Html, div, header, footer, text)
import Html.Attributes exposing (id, class)



mainTemplateHeader : Html msg -> Html msg
mainTemplateHeader children = header [ class "header" ] [ children ]

mainTemplateFooter : Html msg -> Html msg
mainTemplateFooter children =  footer [ class "footer" ] [ children ]


mapMaybeHtml : (Html msg -> Html msg) -> Maybe (Html msg) -> Html msg
mapMaybeHtml f maybeHtml =
  case maybeHtml of
      Just html -> f html
      Nothing -> text ""
          

mainTemplate : Maybe (Html msg) -> Maybe (Html msg) -> Html msg -> Html msg
mainTemplate maybeHeader maybeFooter children =
  div
    [
      (id "main-template"),
      (class "main-container")
    ]
    [
      mapMaybeHtml (\header -> mainTemplateHeader header) maybeHeader,
      children,
      mapMaybeHtml (\footer -> mainTemplateFooter footer) maybeFooter
    ]
