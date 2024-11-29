module MainGitInstallWrongError exposing (..)

-- actually used, reported as unused
import Util.List as List

-- actually unused, not reported as unused
import UtilNotUsed as List
--  incorrect error


useImportAliasFromElmstuff x = List.test x


-- Here elm-review gives wrong error. it should have been the <import Util as List>:

-- -- ELM-REVIEW ERROR ------------------------------------------ src/Main.elm:4:21

-- (fix) NoUnused.Variables: Module alias `List` is not used

-- 3| -- actually used, reported as unused
-- 4| import Util.List as List