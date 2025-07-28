# Projet API MySQL

Une API Node.js Express avec intégration MySQL pour la gestion des utilisateurs. Ce projet fournit une API REST complète pour gérer les utilisateurs avec toutes les opérations CRUD.

## Fonctionnalités

- ✅ **API REST Express.js** - Serveur web moderne et performant
- ✅ **Intégration MySQL** - Base de données relationnelle avec pool de connexions
- ✅ **Opérations CRUD complètes** - Créer, lire, mettre à jour, supprimer des utilisateurs
- ✅ **Validation des entrées** - Validation robuste et gestion d'erreurs complète
- ✅ **Configuration par environnement** - Variables d'environnement sécurisées
- ✅ **Initialisation automatique** - Création automatique des tables de base de données
- ✅ **Documentation interactive** - Interface web élégante avec Tailwind CSS v3
- ✅ **Support CORS** - Communication cross-origin configurée
- ✅ **Logging des requêtes** - Suivi détaillé des requêtes API

## Prérequis

Avant d'exécuter cette application, assurez-vous d'avoir :

- **Node.js** (v14 ou supérieur)
- **MySQL** (v5.7 ou supérieur)
- **npm** ou **yarn**

## Installation

1. **Cloner ou télécharger le projet**
   ```bash
   cd mysql-api-project
   ```

2. **Installer les dépendances**
   ```bash
   npm install
   ```

3. **Configurer les variables d'environnement**
   ```bash
   cp .env.example .env
   ```

   Modifiez le fichier `.env` avec votre configuration MySQL :
   ```env
   DB_HOST=localhost
   DB_USER=votre_nom_utilisateur_mysql
   DB_PASSWORD=votre_mot_de_passe_mysql
   DB_NAME=nom_de_votre_base_de_donnees
   DB_PORT=3306
   PORT=3000
   NODE_ENV=development
   ```

## Configuration de la Base de Données

### Option 1 : Configuration Automatique (Recommandée)
L'application créera automatiquement la table `users` au démarrage. Assurez-vous simplement que votre base de données MySQL existe.

### Option 2 : Configuration Manuelle
Si vous préférez configurer la base de données manuellement :

1. **Créer une base de données MySQL**
   ```sql
   CREATE DATABASE nom_de_votre_base_de_donnees;
   ```

2. **Exécuter le script de schéma**
   ```bash
   mysql -u votre_nom_utilisateur -p nom_de_votre_base_de_donnees < database/schema.sql
   ```

## Exécution de l'Application

### Mode Développement
```bash
npm run dev
```

### Mode Production
```bash
npm start
```

Le serveur démarrera sur `http://localhost:3000` (ou le port spécifié dans votre fichier `.env`).

## Interface de Documentation

Une fois le serveur démarré, vous pouvez accéder à :

- **Documentation interactive** : `http://localhost:3000` - Interface web élégante avec Tailwind CSS
- **API de base** : `http://localhost:3000/users` - Points de terminaison JSON

## Points de Terminaison API

### URL de Base
```
http://localhost:3000
```

### Vérification de Santé
- **GET** `/health` - Vérifier si le serveur fonctionne

### API Utilisateurs

| Méthode | Point de Terminaison  | Description                  |
|---------|-----------------------|-------------------------------|
| GET     | `/users`              | Obtenir tous les utilisateurs |
| GET     | `/users/:id`          | Obtenir un utilisateur par ID |
| POST    | `/users`              | Créer un nouvel utilisateur   |
| PUT     | `/users/:id`          | Mettre à jour un utilisateur  |
| DELETE  | `/users/:id`          | Supprimer un utilisateur      |

### Exemples de Requête/Réponse

#### Obtenir Tous les Utilisateurs
```bash
GET /users
```
Réponse :
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john.doe@example.com",
      "created_at": "2024-01-01T12:00:00.000Z",
      "updated_at": "2024-01-01T12:00:00.000Z"
    }
  ],
  "count": 1
}
```

#### Créer un Utilisateur
```bash
POST /users
Content-Type: application/json

{
  "name": "Jane Smith",
  "email": "jane.smith@example.com"
}
```

#### Mettre à Jour un Utilisateur
```bash
PUT /users/1
Content-Type: application/json

{
  "name": "John Mis à Jour",
  "email": "john.updated@example.com"
}
```

## Gestion des Erreurs

L'API inclut une gestion d'erreurs complète :

- **400 Bad Request** - Données d'entrée invalides
- **404 Not Found** - Ressource non trouvée
- **409 Conflict** - Email déjà existant
- **500 Internal Server Error** - Erreurs serveur

Exemple de réponse d'erreur :
```json
{
  "success": false,
  "error": "Validation échouée",
  "details": ["Le nom est requis", "Le format de l'email est invalide"]
}
```

## Structure du Projet

```
mysql-api-project/
├── config/
│   └── database.js          # Connexion et configuration de la base de données
├── database/
│   └── schema.sql           # Schéma de la base de données
├── public/
│   └── index.html           # Documentation interactive avec Tailwind CSS
├── routes/
│   └── users.js             # Routes API utilisateurs
├── .env.example             # Modèle de variables d'environnement
├── package.json             # Dépendances du projet (inclut Tailwind CSS v3)
├── server.js                # Fichier principal de l'application
└── README.md                # Ce fichier
```

## Technologies Utilisées

- **Backend** : Node.js, Express.js
- **Base de données** : MySQL avec mysql2
- **Styling** : Tailwind CSS v3 (pour la documentation)
- **Outils** : Nodemon, CORS, dotenv
- **Documentation** : Interface web interactive

## Test de l'API

Vous pouvez tester l'API en utilisant des outils comme :
- **Postman**
- **curl**
- **Thunder Client** (extension VS Code)

Exemples de commandes curl :
```bash
# Obtenir tous les utilisateurs
curl http://localhost:3000/users

# Créer un utilisateur
curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Utilisateur Test","email":"test@example.com"}'

# Obtenir un utilisateur par ID
curl http://localhost:3000/users/1

# Mettre à jour un utilisateur
curl -X PUT http://localhost:3000/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Utilisateur Mis à Jour","email":"updated@example.com"}'

# Supprimer un utilisateur
curl -X DELETE http://localhost:3000/users/1
```

## Dépannage

### Problèmes Courants

1. **Échec de connexion à la base de données**
   - Vérifiez que votre serveur MySQL fonctionne
   - Vérifiez les identifiants de la base de données dans `.env`
   - Assurez-vous que la base de données existe

2. **Port déjà utilisé**
   - Changez le PORT dans le fichier `.env`
   - Tuez le processus utilisant le port : `lsof -ti:3000 | xargs kill`

3. **Module non trouvé**
   - Exécutez `npm install` pour installer les dépendances

## Licence

Licence MIT
