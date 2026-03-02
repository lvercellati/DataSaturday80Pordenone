DECLARE @v AS VECTOR(3) = '[1, 2, 3]';

SELECT VECTOR_NORM(@v, 'norm2') AS norm2,
       VECTOR_NORM(@v, 'norm1') AS norm1,
       VECTOR_NORM(@v, 'norminf') AS norminf;