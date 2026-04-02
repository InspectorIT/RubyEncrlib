# RubyEncrlib

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Ruby](https://img.shields.io/badge/Ruby-4.0.1-cc342d.svg)
![CI](https://github.com/fect1/RubyEncrlib/actions/workflows/test.yml/badge.svg)

Простая библиотека Ruby для **шифрования и дешифрования текста** как в **латинском**, так и в **кириллическом** алфавитах.

RubyEncrlib базируется на образовательных и практических классических шифрах с простым функциональным API.

---

## ✨ Фичи

- ✅ Шифр Цезаря (шифрование/дешифрование)
- ✅ Шифр Виженера (шифрование/дешифрование)
- ✅ Шифр Плейфера (шифрование/дешифрование)
- ✅ Шифр Атбаш
- ✅ Шифрование строки методом Железнодорожной изгороди (шифрование/дешифрование)
- ✅ Поддержка английских и русских букв
- ✅ Обработка цифр и символов там, где это поддерживается
- ✅ Набор тестов для каждого шифра
- ✅ Линтер Rubocop

---

## 📦 Установка

### 1) Склонируйте репозиторий

```bash
git clone https://github.com/fect1/RubyEncrlib.git
cd RubyEncrlib
```

### 2) Установите зависимости

```bash
bundle install
```

> В `Gemfile` указана версия Ruby `4.0.1`. Используйте соответствующую конфигурацию менеджера версий Ruby.

---

## 🚀 Быстрый старт

```ruby
require_relative 'lib/encrlib'

puts caesar_cipher('Hello, Мир 123', 3)
puts caesar_decipher('Khoor, Плу 456', 3)
```

---

## 🔐 Доступные шифры

### 1. Шифр Цезаря

```ruby
encrypted = caesar_cipher('Attack at dawn!', 5)
decrypted = caesar_decipher(encrypted, 5)
```

### 2. Шифр Виженера

```ruby
encrypted = viginere_cipher('DefendTheEastWall', 'Fort')
decrypted = viginere_decipher(encrypted, 'Fort')
```

### 3. Шифр Плейфера

```ruby
key = [
  %w[А Б В Г Д Е],
  %w[Ё Ж З И Й К],
  %w[Л М Н О П Р],
  %w[С Т У Ф Х Ц],
  %w[Ч Ш Щ Ъ Ы Ь],
  %w[Э Ю Я _ - .]
]

encrypted = playfair_cipher('ПРИВЕТ', key)
decrypted = playfair_decipher(encrypted, key)
```

### 4. Шифр Атбаш

```ruby
encrypted = atbash_cipher('Hello Привет')
decrypted = atbash_cipher(encrypted) # Atbash is symmetric
```

### 5. Шифрование строки методом Железнодорожной изгороди

```ruby
encrypted = rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 3)
# => "WECRLTEERDSOEEFEAOCAIVDEN"

decrypted = rail_fence_decipher(encrypted, 3)
# => "WEAREDISCOVEREDFLEEATONCE"
```

---

## 🧪 Разработка

### Запуск тестов

```bash
rake test
```

### Запуск RuboCop

```bash
bundle exec rubocop
```

---

## 🤝 Сотрудничество

1. Сделайте форк репозитория.
2. Создайте ветку feature.
3. Добавьте тесты для ваших изменений.
4. Запустите с помощью `rake test` и `bundle exec rubocop`.
5. Откройте pull request.

---

## 📄 License

MIT License. See [LICENSE](LICENSE).
