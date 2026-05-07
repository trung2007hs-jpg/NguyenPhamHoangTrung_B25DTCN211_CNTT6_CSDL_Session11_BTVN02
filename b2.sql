DROP PROCEDURE IF EXISTS AddInventory;
DELIMITER $$
CREATE PROCEDURE AddInventory(IN p_item_id INT, IN p_quantity INT)
BEGIN
    -- Số lượng nhập phải lớn hơn 0
    IF p_quantity > 0 THEN
        -- Thực hiện cộng dồn kho
        UPDATE Inventory
        SET stock_quantity = stock_quantity + p_quantity
        WHERE item_id = p_item_id;
        SELECT 'Đã cập nhật số lượng nhập kho.' AS Message;
    ELSE
        -- Thông báo lỗi nếu số lượng không hợp lệ
        SELECT 'Số lượng nhập kho phải lớn hơn 0!' AS Message;
    END IF;
END $$
