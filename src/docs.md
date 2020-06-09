# Docs

---

### `GET /`
Just a ping endpoint.	

```
{
  "hi": 1590531060013
}
```

---

### `GET /search?q=[query]&category=[category1,category2,...]`
Search products using:

- `q`: query text (name)
- `category`: category of the product

#### Examples
- `GET http://localhost:3000/search`
    ```
    [
        {
            "name": "Papa",
            "price": 590,
            "category": "VERDURA"
        },
        {
            "name": "Leche Entera",
            "price": 12750,
            "category": "LACTEO"
        }
    ]
    ```
- `GET http://localhost:3000/search?q=pa`
    ```
    [
        {
            "name": "Papa",
            "price": 590,
            "category": "VERDURA"
        }
    ]
    ```

- `GET http://localhost:3000/search?category=VERDURA,CARNE`
    ```
    [
        {
            "name": "Papa",
            "price": 590,
            "category": "VERDURA"
        },
        {
            name: "Carne",
            "price": 2000,
            "category": "CARNE"
        }
    ]
    ```

- `GET http://localhost:3000/search?category=VERDURA,CARNE&q=papa`
    ```
    [
        {
            "name": "Papa",
            "price": 590,
            "category": "VERDURA"
        }
    ]
    ```
    
- `GET http://localhost:3000/search?category=VERDURA&q=pescado`
    ```
    [

    ]
    ```
#### Models
```
struct Product {
    name : string
    price : float64
    category : Category
}

enum Category {
    VERDURA
    LACTEO
    CARNE
    LIMPIEZA
    DESPENSA
    FRUTA
    SALUD
}
```

---
      
### `GET /docs`
Documentation

---
