### nano ~/.config/gtk-3.0/gtk.css
### Паосле установки  xfce4-panel -r
## Синий 
```
.xfce4-panel .toggle {
  background: #268bd2; /* фон: голубой */
  color: #f9f9f9;      /* текст: почти белый */
  border-radius: 4px;
  margin-left: 6px;
  margin-right: 6px;
  padding: 4px 8px;
}

.xfce4-panel .toggle:checked {
  background: #005f87; /* активный фон: тёмно‑голубой */
  color: #fafafa;      /* текст: светло‑серый/белый */
}

.xfce4-panel .toggle:hover {
  background: #5dade2; /* фон при наведении: светло‑голубой */
  color: #282828;      /* текст: почти чёрный */
}

 
```
## Оранжевый
```

.xfce4-panel .toggle {
  background: #ff9800; /* фон: оранжевый */
  color: #f9f9f9;      /* текст: почти белый */
  border-radius: 4px;
  margin-left: 6px;
  margin-right: 6px;
  padding: 4px 8px;
}

.xfce4-panel .toggle:checked {
  background: #e65100; /* активный фон: тёмно‑оранжевый */
  color: #fafafa;      /* текст: светло‑серый/белый */
}

.xfce4-panel .toggle:hover {
  background: #ffb74d; /* фон при наведении: светло‑оранжевый */
  color: #282828;      /* текст: почти чёрный */
}
```

## Серый

```
.xfce4-panel .toggle {
  background: #6A7C6F; /* фон: серо‑зелёный (облака) */
  color: #FFFFFF;      /* текст: белый */
  border-radius: 4px;
  margin-left: 6px;
  margin-right: 6px;
  padding: 4px 8px;
}

.xfce4-panel .toggle:checked {
  background: #B80000; /* активный фон: глубокий красный (жар) */
  color: #FFFFFF;      /* текст: белый */
}

.xfce4-panel .toggle:hover {
  background: #8A9A8F; /* фон при наведении: светлее серо‑зелёный */
  color: #FFFFFF;      /* текст: белый */
}
```
## Прозрачный

```
.xfce4-panel .toggle {
  background-color: transparent;                   /* прозрачный фон */
  color: rgba(255, 255, 255, 0.7);                 /* белый текст с 70% непрозрачности */
  border: 1px solid rgba(244, 162, 97, 0.8);       /* оранжевая рамка */
  border-radius: 4px;
  margin-left: 6px;
  margin-right: 6px;
  padding: 4px 8px;
  box-shadow: none;
}

.xfce4-panel .toggle:checked {
  background-color: rgba(184, 0, 0, 0.2);          /* лёгкий красный оттенок при активации */
  color: rgba(255, 255, 255, 0.9);                 /* почти белый текст */
  border: 1px solid rgba(244, 162, 97, 1.0);       /* яркая оранжевая рамка */
}

.xfce4-panel .toggle:hover {
  background-color: rgba(244, 162, 97, 0.2);       /* лёгкий оранжевый при наведении */
  color: rgba(255, 255, 255, 1.0);                 /* чёткий белый текст */
  border: 1px solid rgba(244, 162, 97, 1.0);       /* яркая рамка */
}
```
