module Juliagoda exposing (main)

import Sections exposing (..)
import Browser
import Css.Animations exposing (..)
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, class, id)
import Html.Styled.Events exposing (onClick)


type alias Section =
    { numberPage : Int
    , navigationLeftColor : Color
    , navigationRightColor : Color
    }


type Site
  = Next
  | Previous

  
initialModel : Section
initialModel = 
   { numberPage = 1
   , navigationLeftColor = hex "000000"
   , navigationRightColor = hex "FFFFFF"
   }


update : Site -> Section -> Section
update msg model =
  case msg of
    Next -> case model.numberPage + 1 > 18 of
       True -> { model | numberPage = model.numberPage, navigationLeftColor = hex "FFFFFF", navigationRightColor = hex "000000" }
       False -> { model | numberPage = model.numberPage + 1, navigationLeftColor = hex "FFFFFF", navigationRightColor = hex "FFFFFF" }
    Previous -> case model.numberPage - 1 < 1 of
       True -> { model | numberPage = model.numberPage, navigationLeftColor = hex "000000", navigationRightColor = hex "FFFFFF" }
       False -> { model | numberPage = model.numberPage - 1, navigationLeftColor = hex "FFFFFF", navigationRightColor = hex "FFFFFF" }

    
navigatebtn : String -> String -> Site -> Color -> Html Site
navigatebtn str navid skip col = div [ class "navigations", id navid, onClick skip, css [ color col ] ] [ text str ]


view : Section -> Html Site
view model =
        div [ id "slides-center-site", class "reveal default center" ]
            [ div [ id "slides-id", class "slides", css [Css.opacity (int 0), Css.property "animation-fill-mode" "forwards", Css.animationName (Css.Animations.keyframes [ ( 25, [Css.Animations.property "opacity" "0"] ), ( 50, [Css.Animations.property "opacity" "0.4"] ), ( 75, [Css.Animations.property "opacity" "0.7"] ), ( 100, [Css.Animations.property "opacity" "1"] ) ]), Css.animationDuration (sec 2)] ] [ chooseSection model.numberPage
                    ],
                   navigatebtn "<" "navigation-left" Previous model.navigationLeftColor, 
                   navigatebtn ">" "navigation-right" Next model.navigationRightColor
                ]
                
                

chooseSection : Int -> Html Site
chooseSection numbPage = case numbPage of
   1 -> section1
   2 -> section2
   3 -> section3
   4 -> section4
   5 -> section5
   6 -> section6
   7 -> section7
   8 -> section8
   9 -> section9
   10 -> section10
   11 -> section11
   12 -> section12
   13 -> section13
   14 -> section14
   15 -> section15
   16 -> section16
   17 -> section17
   18 -> section18
   _ -> case numbPage < 1 of
      True -> section1
      False -> section18

                        


main : Program () Section Site
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> toUnstyled
        , update = update
        }
