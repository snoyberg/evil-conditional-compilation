{-# LANGUAGE TemplateHaskell #-}
module THHelper where

import Language.Haskell.TH

evil :: Name -> Q Exp
evil name = do
    VarI _ typ _ _ <- reify name
    case typ of
        AppT (AppT ArrowT (ConT _)) (ConT _) ->
            return $ VarE name
        AppT (AppT ArrowT (ConT _)) (AppT (AppT ArrowT (ConT _)) (ConT _)) ->
            [|flip $(return $ VarE name) 'x'|]
        _ -> error $ "Unknown type: " ++ show typ