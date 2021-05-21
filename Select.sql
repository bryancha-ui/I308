-- 1.Find all of the full names and phone numbers of parking users who got a violation in a given month.

SELECT CONCAT(u.fname, SPACE(1), u.lname) AS name , up.phone AS phone, vo.date AS date
FROM parking_user AS u
JOIN parking_users_phone AS up ON up.user_id = u.user_id
JOIN vehicle AS v ON v.user_id = u.user_id
JOIN violations AS vo ON vo.lp_num = v.lp_num
WHERE (MONTH(vo.date) = 04)
ORDER BY name;
 
-- 2.Find the number of parking users who bought a permit in 2020 and 2021

SELECT COUNT(p.user_id), YEAR(r.pdate) AS Year
FROM parking_user AS p
JOIN vehicle AS v ON v.user_id=p.user_id
JOIN receipt AS r ON r.lp_num=v.lp_num
WHERE YEAR(r.pdate)= '2020';
 
-- 3.Find the number of locations that a parking user cannot park at based on the type of permit

SELECT COUNT(l.lot_id) AS Unpermitted_Locations
FROM locations AS l
JOIN permits AS p ON p.permit_id=l.permit_id
WHERE p.permit_id NOT IN (
SELECT l.lot_id 
FROM locations AS l
JOIN permits AS p ON p.permit_id=l.permit_id
WHERE p.type = 'CH');
 
-- 4.Find the car make and name of the parking user who own a permit with () permitID.

SELECT v.make AS make, CONCAT(u.fname, ' ', u.lname) AS name 
FROM vehicle AS v 
JOIN parking_user AS u ON v.user_id = u.user_id 
JOIN receipt AS r ON v.lp_num = r.lp_num 
WHERE r.permit_id IS NOT NULL;

-- 5. Find the name of the employee who is the supervisor of every violation for the number of vehicles from Ohio and if it has been appealed, and provide the fine amount

SELECT CONCAT(e.nameFirst, SPACE(1), e.nameLast) AS name, e.position AS position, v.state AS state, vp.appeal AS appealed, COUNT(v.lp_num) AS number, vo.fine_amount AS amount
FROM employees AS e
JOIN violation_payments AS vp ON vp.empid = e.empid
JOIN vehicle AS v ON v.lp_num = vp.lp_num
JOIN violations AS vo ON vo.lp_num = vp.lp_num
WHERE  v.state = 'OH' AND e.position = 'supervisor';

-- 6. Allow the user to pick the function MIN, MAX, or AVG for the total number of tickets given for violations for all or a particular location and for all or a particular date

SELECT MAX(vo.violation_num) AS number_of_tickets, vo.date AS date, l.lot_id AS lot 
FROM violations AS vo
JOIN locations AS l ON l.lot_id = vo.lot_id
WHERE l.lot_id = 3;