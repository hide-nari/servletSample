CREATE TABLE `users`
(
    `id`       int NOT NULL AUTO_INCREMENT,
    `uid`      varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `roles`
(
    `id`   int NOT NULL AUTO_INCREMENT,
    `uid`  varchar(255) DEFAULT NULL,
    `role` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;