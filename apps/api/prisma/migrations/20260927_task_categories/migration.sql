-- Migration: 20260927_task_categories
-- Description: Categorias de tarefas (por usuário) com ownership, soft delete e vínculo opcional em tasks.
-- Segue o mesmo padrão de consultas numeradas da migration 20260831_reference_tasks_module.

-- Consulta 001: Criação da tabela task_categories
-- Mesmas colunas-padrão do template: UUID, ownerId, deletedAt (soft delete) e timestamps.
CREATE TABLE "task_categories" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "color" TEXT NOT NULL DEFAULT '#3B82F6',
    "ownerId" UUID NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "task_categories_pkey" PRIMARY KEY ("id")
);

-- Consulta 002: Índices por dono e por soft delete (as duas colunas mais usadas nos filtros)
CREATE INDEX "task_categories_ownerId_idx" ON "task_categories"("ownerId");
CREATE INDEX "task_categories_deletedAt_idx" ON "task_categories"("deletedAt");

-- Consulta 003: Foreign key relacionando a categoria ao perfil do usuário
-- (se o usuário for apagado, as categorias dele também são)
ALTER TABLE "task_categories" ADD CONSTRAINT "task_categories_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- Consulta 004: Nova coluna OPCIONAL em tasks apontando para a categoria
-- (NULL = tarefa sem categoria; por isso tarefas antigas continuam válidas)
ALTER TABLE "tasks" ADD COLUMN "categoryId" UUID;

-- Consulta 005: Índice para o filtro de tarefas por categoria
CREATE INDEX "tasks_categoryId_idx" ON "tasks"("categoryId");

-- Consulta 006: Foreign key de tasks -> task_categories
-- ON DELETE SET NULL: se a categoria for removida fisicamente, a tarefa apenas perde a categoria.
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "task_categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;
