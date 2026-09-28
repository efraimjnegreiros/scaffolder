
export interface CreateCategoryDto {
  /**
     * Nome da categoria
     * @minLength 2
     * @maxLength 50
     */
  name: string;
  /** Cor da categoria em hexadecimal (#RRGGBB) */
  color?: string;
}