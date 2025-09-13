# Wallet App UI

**Proyecto:** Wallet App UI

**Descripción breve:**
Aplicación de interfaz (UI) en Flutter que simula una pantalla principal de billetera digital (Wallet). Incluye un carrusel de tarjetas (cards) con saldo, acciones principales (Send/Pay/Bill), indicadores visuales y list tiles para estadísticas y transacciones. El proyecto está pensado como plantilla UI y base para integrar lógica y backend más adelante.

---

## Tabla de contenidos

1. Visión general
2. Características principales
3. Requisitos y dependencias
4. Estructura del proyecto (archivo por archivo)
5. Componentes y comportamiento (explicación detallada)
6. Instalación y puesta en marcha
7. Ejecución y pruebas
8. Assets y `pubspec.yaml`
9. Buenas prácticas y recomendaciones (mejoras sugeridas)
10. Personalización y extensibilidad
11. Resolución de problemas comunes
12. Contribuir
13. Licencia

---

## 1. Visión general

Esta aplicación es una **UI de ejemplo** para una billetera digital construida con Flutter. Está pensada para uso educativo, prototipado o como punto de partida para agregar lógica real (autenticación, pagos, comunicación con APIs, etc.).

El diseño está organizado en componentes reutilizables: `MyCard`, `MyButton`, `MyListTile` y una `HomePage` que organiza el layout general.

---

## 2. Características principales

* Carrusel horizontal de tarjetas (PageView) con indicador de páginas (`smooth_page_indicator`).
* Tarjetas con saldo, número parcial/visible y fecha de expiración.
* Botón flotante central para acción principal (ej. nueva transacción).
* Barra de navegación inferior con íconos.
* Tres botones de acción (Send, Pay, Bill) como componentes reutilizables.
* List tiles para acceder a estadísticas y transacciones.
* Uso de fuentes personalizadas con `google_fonts`.
* Test de widget básico incluido (archivo `test/widget_test.dart`).

---

## 3. Requisitos y dependencias

**Requisitos previos**

* Flutter SDK (canal estable). Tener instalado Flutter y configurado el entorno (`flutter doctor`).
* Un emulador/dispositivo físico o entorno de ejecución compatible.

**Dependencias principales** (decláralas en `pubspec.yaml`):

* `google_fonts` — para usar fuentes de Google (ej. Poppins, Roboto).
* `smooth_page_indicator` — para indicadores animados en el carrusel.
* `flutter_test` — para pruebas unitarias/ widget tests (ya incluido en el SDK).

> Nota: verifica `pubspec.yaml` del proyecto para ver las versiones exactas usadas. Si falta alguna dependencia, agrega: `flutter pub add google_fonts smooth_page_indicator`.

---

## 4. Estructura del proyecto (archivo por archivo)

A continuación se describe la estructura relevante que corresponde al código que has compartido.

```
lib/
├─ main.dart                # Entrada principal (MyApp)
├─ page/
│  └─ home_page.dart        # Pantalla principal (HomePage) con Scaffold, PageView, etc.
├─ util/
│  ├─ my_button.dart        # Widget MyButton (icon + texto)
│  ├─ my_card.dart          # Widget MyCard (tarjeta con saldo, número y expiración)
│  └─ my_list_tile.dart     # Widget MyListTile (fila con icono, título, subtítulo)

test/
└─ widget_test.dart        # Test de widgets (ejemplo: contador)

assets/
└─ icons/                  # Iconos usados: send.png, pay.png, bill.png, statistics.png, transaction.png

pubspec.yaml               # Declaración de assets y dependencias
```

### Descripción de archivos

* **`main.dart`**: Punto de entrada. Construye `MyApp` que envuelve la app en `MaterialApp` y define `HomePage` como la pantalla inicial.
* **`home_page.dart`**: Widget `HomePage` (Stateful) que contiene la estructura principal: `Scaffold`, `floatingActionButton`, `bottomNavigationBar`, `PageView` con controlador `_controller`, `SmoothPageIndicator`, botones principales y la sección de estadísticas.
* **`my_button.dart`**: `StatelessWidget` que renderiza un ícono (desde assets) dentro de un `Container` y un texto debajo. Parámetros: `iconPath`, `txtButton`.
* **`my_card.dart`**: `StatefulWidget` que muestra información de la tarjeta: `balance`, `expireMonth`, `expireYear`, `color`. Contiene lógica mínima para ocultar/mostrar el número con `isObsecure` y `IconButton` que llama `setState`.
* **`my_list_tile.dart`**: `StatelessWidget` que muestra un ícono con fondo, un título, subtítulo y una flecha (indicador de navegación).
* **`widget_test.dart`**: Test básico que verifica un contador (ejemplo generado por defecto de proyecto Flutter). Si tu app no muestra explícitamente un contador, este test debe ajustarse o eliminarse.

---

## 5. Componentes y comportamiento (explicación detallada)

A continuación explico el propósito y comportamiento de cada componente, y las partes críticas de `HomePage`.

### `HomePage` (lib/page/home\_page.dart)

* **Tipo:** `StatefulWidget` (porque mantiene estado interno: `PageController` para el carrusel).
* **Elementos clave:**

  * `Scaffold`: estructura base.
  * `floatingActionButton`: botón circular centrado con ícono `Icons.monetization_on`.
  * `bottomNavigationBar`: `BottomAppBar` con `IconButton` (Home y Settings). Actualmente sin lógica en `onPressed`.
  * `PageView` (controlado por `_controller`): muestra instancias de `MyCard` en horizontal.
  * `SmoothPageIndicator`: enlazado al `_controller` para mostrar 3 puntos (uno por tarjeta).
  * `MyButton` row: tres botones (Send, Pay, Bill). Son `Stateless` y reciben `iconPath` y `txtButton`.
  * `MyListTile`: dos entradas — Statistics y Transactions.

**Comportamiento del carrusel:**

* El `PageController` permite desplazar entre tarjetas y el `SmoothPageIndicator` muestra la página activa.

### `MyCard` (lib/util/my\_card.dart)

* **Props:** `balance`, `expireMonth`, `expireYear`, `color`.
* **Estado:** `isObsecure` controla si el número de tarjeta se muestra parcial (`"****3456"`) o completo (`"12343456"`).
* **Interactividad:** `IconButton` invoca `setState()` para alternar `isObsecure` y actualizar la UI.
* **Recomendación:** agregar `dispose()` en `_MyCardState` solo si se usan controladores o listeners; en `HomePage` sí es importante `dispose()` para el `PageController`.

### `MyButton` (lib/util/my\_button.dart)

* Renderiza un `Container` con `Image.asset(iconPath)` y un `Text` con `txtButton`.
* Se puede extender para aceptar `onPressed` y envolver el `Container` en `InkWell` o `GestureDetector`.

### `MyListTile` (lib/util/my\_list\_tile.dart)

* Representa una fila de navegación: icono dentro de `Container`, títulos en `Column` y `Icon` de flecha al final.

---

## 6. Instalación y puesta en marcha

*Estos pasos asumen que ya tienes instalado Flutter y configurado el entorno.*

1. **Clonar el repositorio**

```bash
git clone <URL-del-repo>
cd <nombre-del-proyecto>
```

2. **Instalar dependencias**

```bash
flutter pub get
```

3. **Asegurar assets en `pubspec.yaml`**

* Verifica que la sección `assets:` incluya `assets/icons/`.

4. **Ejecutar la app**

```bash
flutter run
# o para un dispositivo específico
flutter run -d <device-id>
```

5. **Construir release (APK)**

```bash
flutter build apk --release
```

> Nota: para construir iOS necesitas macOS y Xcode configurado correctamente.

---

## 7. Ejecución y pruebas

* **Ejecutar pruebas unitarias/widget:**

```bash
flutter test
```

* El proyecto incluye un test de widget básico (`test/widget_test.dart`). Dependiendo de la UI actual, este test podría necesitar ajustes (p. ej. si `MyApp` no contiene un contador visible con texto '0' y '1').

---

## 8. Assets y `pubspec.yaml`

Asegúrate de declarar los assets en `pubspec.yaml`. Ejemplo:

```yaml
flutter:
  assets:
    - assets/icons/send.png
    - assets/icons/pay.png
    - assets/icons/bill.png
    - assets/icons/statistics.png
    - assets/icons/transaction.png
    # o incluir todo el folder
    - assets/icons/
```

Si las imágenes no aparecen en tiempo de ejecución, ejecuta `flutter pub get` y reinicia la aplicación.

---

## 9. Buenas prácticas y recomendaciones (mejoras sugeridas)

Lista de mejoras que podrías aplicar sin romper la UI existente:

* **Dispose del PageController:** en `HomePageState` agregar `@override void dispose() { _controller.dispose(); super.dispose(); }` para evitar fugas de memoria.
* **Separar responsabilidades:** mover lógica y datos (lista de tarjetas) a un `ChangeNotifier`/Provider o BLoC si la app crece.
* **Hacer `MyButton` interactivo:** aceptar un callback `VoidCallback? onPressed` y envolver el `Container` en `InkWell` para respuesta visual.
* **Accesibilidad:** agregar `semanticsLabel` en imágenes y `tooltip` en botones para lectores de pantalla.
* **Soporte para temas:** usar `ThemeData` centralizado en `MaterialApp` para colores y tipografías en lugar de colores hardcodeados.
* **Internacionalización (i18n):** preparar strings para traducción usando `flutter_localizations`.
* **Pruebas:** agregar widget tests que verifiquen el comportamiento del `PageView`, la alternativa de visibilidad y el renderizado de `MyListTile`.

---

## 10. Personalización y extensibilidad

Algunas ideas para ampliar el proyecto:

* Integrar un backend (Firebase, REST API) para obtener tarjetas y transacciones reales.
* Implementar autenticación (email, OAuth, biométricos).
* Añadir animaciones y feedback táctil en botones.
* Guardar estado local (SharedPreferences, Hive) para preferencias del usuario.
* Agregar gráficas en la sección de estadísticas (usar `charts_flutter`, `fl_chart` o `recharts`).

---

## 11. Resolución de problemas comunes

* **Problema:** `Unable to load asset` al usar `Image.asset`.

  * **Solución:** verifica `pubspec.yaml`, ruta del asset y que se ejecutó `flutter pub get`.
* **Problema:** el `PageView` no responde o lanza excepciones al cambiar de página.

  * **Solución:** confirma que el `PageController` esté correctamente inicializado y que no se llame a métodos después de que el widget fue destruido (usar `dispose`).
* **Problema:** dependencia no encontrada o conflicto de versiones.

  * **Solución:** revisa `pubspec.lock`, actualiza paquetes con `flutter pub upgrade` y ajusta versiones en `pubspec.yaml`.

---

## 12. Contribuir

Si quieres contribuir:

1. Crea una rama: `git checkout -b feat/nueva-funcion`
2. Haz commits pequeños y claros.
3. Abre un PR explicando cambios y por qué son necesarios.

Agradece solicitudes de mejora que respeten el diseño y no rompan la compatibilidad.

---

## Apéndice — Acciones rápidas y snippets útiles

* **Agregar `onPressed` a `MyButton`** (ejemplo):

```dart
class MyButton extends StatelessWidget {
  final String iconPath;
  final String txtButton;
  final VoidCallback? onPressed; // nuevo
  // ... constructor y build ...
  // envolver el Container con InkWell o GestureDetector y llamar onPressed
}
```

* **Dispose del PageController** (en `HomePage`):

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```
