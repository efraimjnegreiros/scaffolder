
export type CategoriesControllerFindAllParams = {
/**
 * Número da página
 * @minimum 1
 */
page?: number;
/**
 * Itens por página
 * @minimum 1
 * @maximum 100
 */
pageSize?: number;
/**
 * Termo de busca
 * @maxLength 120
 */
search?: string;
};