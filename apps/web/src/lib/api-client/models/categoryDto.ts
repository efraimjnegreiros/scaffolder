
export interface CategoryDto {
  /** Identificador único da categoria */
  id: string;
  /** Nome da categoria */
  name: string;
  /** Cor da categoria (#RRGGBB) */
  color: string;
  /** Identificador do usuário proprietário */
  ownerId: string;
  /** Quantidade de tarefas ativas nesta categoria */
  taskCount: number;
  /** Data de criação */
  createdAt: string;
  /** Data de última atualização */
  updatedAt: string;
}