module Styles exposing (..)

import Html
import Css.Animations exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


firstStyle : Duration {} -> Attribute msg
firstStyle time = css [Css.opacity (int 0), Css.property "animation-fill-mode" "forwards", Css.animationName (Css.Animations.keyframes [ ( 25, [Css.Animations.property "opacity" "0"] ), ( 50, [Css.Animations.property "opacity" "0.4"] ), ( 75, [Css.Animations.property "opacity" "0.7"] ), ( 100, [Css.Animations.property "opacity" "1"] ) ]), Css.animationDuration time]


secondStyle : Attribute msg
secondStyle = css [Css.width (pct 0), Css.height (pct 0), Css.property "animation-fill-mode" "forwards", Css.animationName (Css.Animations.keyframes [( 0, [Css.Animations.property "width" "0%", Css.Animations.property "height" "0%"] ), ( 7, [Css.Animations.property "width" "7%", Css.Animations.property "height" "7%"] ), ( 15, [Css.Animations.property "width" "15%", Css.Animations.property "height" "15%"] ), ( 25, [Css.Animations.property "width" "25%", Css.Animations.property "height" "25%"] ), ( 35, [Css.Animations.property "width" "35%", Css.Animations.property "height" "35%"] ), ( 50, [Css.Animations.property "width" "50%", Css.Animations.property "height" "50%"] ), ( 60, [Css.Animations.property "width" "60%", Css.Animations.property "height" "60%"] ), ( 75, [Css.Animations.property "width" "75%", Css.Animations.property "height" "75%"] ), ( 85, [Css.Animations.property "width" "85%", Css.Animations.property "height" "85%"] ), ( 100, [Css.Animations.property "width" "100%", Css.Animations.property "height" "100%"] ) ]), Css.animationDuration (ms 500)] 
