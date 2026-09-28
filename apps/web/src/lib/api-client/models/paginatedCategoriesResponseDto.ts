
import type { CategoryDto } from './categoryDto';
import type { PaginationMetaDto } from './paginationMetaDto';

export interface PaginatedCategoriesResponseDto {
  /** Lista de categorias paginadas */
  data: CategoryDto[];
  /** Metadados de paginação */
  meta: PaginationMetaDto;
}