module MainLocalCorrectError exposing (..)

-- Here elm-review will give correct error:
-- ELM-REVIEW ERROR ------------------------------------- src/MainLocal.elm:4:16

-- (fix) NoUnused.Variables: Module alias `Local` is not used

-- 3| -- unused
-- 4| import Util as Local
--                   ^^^^^

-- You should either use this value somewhere, or remove it at the location I
-- pointed at.

-- unused, and reported as unused => OK
import UtilNotUsed as Local

-- used, and NOT reported as unused => OK
import UtilUsed as Local


useImportAliasFromLocalCode x = Local.test x

