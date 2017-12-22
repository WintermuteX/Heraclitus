view: dt_locations {

    derived_table: {
      sql:
      SELECT order_items.id as order_item_id, inventory_items.id as inventory_item_id, products.id as product_id, u.id as user_id, u.latitude as user_latitude, u.longitude as user_longitude,
      d.id as distribution_id, d.latitude as distribution_latitude, d.longitude as distribution_longitude
      FROM
      users u, distribution_centers d, order_items, products, inventory_items
      where
      order_items.user_id = u.id
      and products.distribution_center_id = d.id
      and inventory_items.product_distribution_center_id = d.id
      and order_items.inventory_item_id = inventory_items.id
    }
    dimension: user_id {
      type: number
      primary_key: no
      sql: ${TABLE}.user_id ;;
    }
  dimension: distribution_center_id {
    type: number
    primary_key: no
    sql: ${TABLE}.distribution_id ;;
  }
    dimension: user_location {
      type: location
      sql_latitude:${TABLE}.user_latitude ;;
      sql_longitude:${TABLE}.user_longitude;;
    }
   dimension: distribution_location {
    type: location
    sql_latitude:${TABLE}.distribution_latitude ;;
    sql_longitude:${TABLE}.distribution_longitude;;
  }
  dimension: order_item_id {
    type: number
    primary_key: no
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: inventory_item_id {
    type: number
    primary_key: no
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: product_id {
    type: number
    primary_key: no
    sql: ${TABLE}.product_id ;;
  }
  }
