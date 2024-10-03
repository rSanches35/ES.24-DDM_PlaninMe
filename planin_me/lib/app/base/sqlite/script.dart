const tableCreate = [
  '''
  CREATE TABLE task (

    id_task INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(200),
    priority CHAR(1) NOT NULL,
    is_active BOOL NOT NULL
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

const tableInsert = [
  
  'INSERT INTO task (name, priority, is_active) VALUES ("Wake Up", "1", true)',
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "14:30:00", 1)',
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "17:30:00", 1)',
  'INSERT INTO times_a_day (week_day, time, task_id) VALUES ("Sunday", "20:30:00", 1)',
];
