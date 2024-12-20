const tableCreate = [
  '''
  CREATE TABLE routine (

    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200),
    code VARCHAR(50) NOT NULL,
    isActive INT NOT NULL
  );
  ''',
  '''
  CREATE TABLE task (

    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200),
    priority CHAR(1) NOT NULL,
    isActive INT NOT NULL
  );
  ''',
  '''
  CREATE TABLE times_a_day (

    id_times_a_day INTEGER NOT NULL PRIMARY KEY,
    week_day VARCHAR(50) NOT NULL,
    time TIME NOT NULL,
    task_id INT NOT NULL,
    FOREIGN KEY (task_id) REFERENCES task(id_task)
  );
  ''',
];

/*
const tableInsert = [
  
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "14:30:00", 1)',
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "17:30:00", 1)',
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "20:30:00", 1)',
];
*/