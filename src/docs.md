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

### `GET /search?q=[query]&category=[category]`
Search products using:

- `q`: query text (name)
- `category`: category of the product

#### Examples
- `GET http://localhost:3000/search`
    ```
    [
        {
            "name": "Papa Criolla",
            "price": 1100.0,
            "category": "VERDURA"
        },
        {
            "name": "Carne (Libra)",
            "price": 2300.0,
            "category": "CARNE"
        }
    ]
    ```
- `GET http://localhost:3000/search?q=pa`
    ```
    [
        {
            "name": "Papa Criolla",
            "price": 1100.0,
            "category": "VERDURA"
        }
    ]
    ```

- `GET http://localhost:3000/search?category=VERDURA`
    ```
    [
        {
            "name": "Papa Criolla",
            "price": 1100.0,
            "category": "VERDURA"
        }
    ]
    ```

- `GET http://localhost:3000/search?category=VERDURA&q=papa`
    ```
    [
        {
            "name": "Papa Criolla",
            "price": 1100.0,
            "category": "VERDURA"
        }
    ]
    ```
    
- `GET http://localhost:3000/search?category=VERDURA&q=carne`
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
    CARNE
    VERDURA
}
```

---
      
### `GET /docs`
Documentation

---
