SELECT 
  estrutur.estproduto,   
  produto.pronome, 
 
  CASE 
  	WHEN LENGTH(produto.pronome) = 40 THEN  substring(produto.pronome, 29, 3)
	WHEN LENGTH(produto.pronome) = 41 THEN  substring(produto.pronome, 29, 3)
	WHEN LENGTH(produto.pronome) = 43 THEN  substring(produto.pronome, 29, 3)
	WHEN LENGTH(produto.pronome) = 44 THEN  substring(produto.pronome, 29, 3)
	WHEN LENGTH(produto.pronome) = 44 THEN  substring(produto.pronome, 36, 3)
	WHEN LENGTH(produto.pronome) = 48 AND produto.pronome like '%MLEC%' THEN  substring(produto.pronome, 36, 3)
	WHEN LENGTH(produto.pronome) = 48 and produto.pronome like '%MOD MLAC%' THEN  substring(produto.pronome, 33, 3)
	WHEN LENGTH(produto.pronome) = 48 and produto.pronome like '%MODELO MLAC%' THEN  substring(produto.pronome, 36, 3)
	WHEN LENGTH(produto.pronome) = 49 THEN  substring(produto.pronome, 36, 3)
  END as TN,
 produto.unimedida,
  estrutur.estfilho, 
  produtob.pronome, 
  produtob.unimedida,
  estrutur.fase, 
  estrutur.estqtduso
FROM 
  public.produto, 
  public.estrutur, 
  public.produto as produtob
WHERE 
  estrutur.estproduto = produto.produto AND
  produtob.produto = estrutur.estfilho AND
  estproduto like '360609%' AND
  produtob.proorigem = 'F'   order by 1
