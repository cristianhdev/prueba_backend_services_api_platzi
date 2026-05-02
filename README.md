# prueba_backend_services_api_platzi

### - Ejecutar automatización:
```bash
./gradlew clean test
```


## 🏷️ Tags disponibles

| Tag | Descripción |
|-----|------------|
| @get-all-categories | Obtener todas las categorías |
| @get-categorie-by-id | Obtener categoría por ID |
| @get-categorie-by-id-not-doesnt-exist | Obtener categoría por ID inexistente |
| @get-categories-by-slug | Obtener categoría por slug |
| @get-categorie-by-slug-not-doesnt-exist | Obtener categoría por slug inexistente |
| @create-new-categories | Crear una nueva categoría |
| @update-categorie | Actualizar una categoría |
| @delete-categorie-by-id | Eliminar categoría por ID |
| @delete-categorie-by-id-not-doesnt-exist | Intentar eliminar categoría inexistente |

---

### 👤 Users

| Tag | Descripción |
|-----|------------|
| @get-all-users | Obtener todos los usuarios |
| @get-user-by-id | Obtener usuario por ID |
| @create-new-user | Crear un nuevo usuario |
| @update-user | Actualizar un usuario |
| @delete-user-by-id | Eliminar usuario por ID |
| @email-input-validate | Validación de formato de email |
| @password-input-valid | Validación de contraseña válida |

---

### 🛍️ Products

| Tag | Descripción |
|-----|------------|
| @get-all-products | Obtener todos los productos |
| @get-product-by-id | Obtener producto por ID |
| @create-new-product | Crear un nuevo producto |
| @delete-product-by-id | Eliminar producto por ID |

---

### 🔍 Filters (Products)

| Tag | Descripción |
|-----|------------|
| @filter-by-categoty-id | Filtrar productos por categoría |
| @filter-find-by-category-id-not-exist | Filtrar por categoría inexistente |
| @filter-find-by-price | Filtrar productos por precio |
| @filter-find-by-price-not-product-exist | Filtrar por precio sin resultados |
| @filter-find-by-price-range-top | Filtrar por rango alto de precios |
| @filter-find-by-price-range-border | Filtrar por rango límite de precios |
| @filter-find-by-price-range-border-negative | Validar rango negativo de precios |
| @filter-find-by-price-range-cross | Validar rango cruzado (min > max) |
| @filter-find-by-title | Filtrar productos por título |
| @filter-find-by-title-not-exist | Filtrar por título inexistente |

## 📝 Bitácora

| Día | Actividad |
|----|----------|
|  1 | Plan de prueba, análisis y revisión de documentación del servicio BackEnd |
|  2 | Automatización de casos de usuario, productos y categorías |
|  3 | Automatización de casos de filtros de productos (title, price, price_min, price_max, categoryId) e integración de reporte Cucumber |
|  4 | Refactorización de código |