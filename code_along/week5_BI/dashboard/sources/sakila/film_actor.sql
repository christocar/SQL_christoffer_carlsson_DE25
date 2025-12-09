SELECT 
    a.first_name || a.last_name AS actor,
    f.title AS film,
    f.rating
FROM staging.actor a
LEFT JOIN staging.film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN staging.film f ON f.film_id = fa.film_id;