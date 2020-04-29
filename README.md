# README

Hello, this is my test task approach.
App is deployed to Heroku — http://protected-stream-47706.herokuapp.com/
existing user: email: artem@artem2.com, password: password

Scope of work:
1. Working authentication system based on session cookies, no Devise or something similar.
2. Each user has his own set of todo lists and todo items
3. User can interact with todo's from different lists on the same page
4. There is unit and integration testing, using MiniTest, but not for the whole functionality.
5. I did redesign a UI, felt that it would benefit the end product.
6.  SQL task (below)

What's left:
1. Proper Ajax or integration with SPA
2. Deadlines assignment for tasks
3. Drag'n'drop for priority


## SQL Task
1. get all statuses, not repeating, alphabetically ordered

⋅⋅⋅**SELECT DISTINCT status FROM  tasks ORDER BY status ASC**

2. get the count of all tasks in each project, order by tasks count descending

...**SELECy COUNT(id) from tasks GROUP by project_id ORDER BY COUNT(id) DESC*

3. get the count of all tasks in each project, order by projects names

...**SELECT COUNT(tasks.id) FROM tasks,projects WHERE tasks.project_id=projects.id GROUP by projects.name ORDER BY projects.name*

4. get the tasks for all projects having the name beginning with "N" letter

...**SELECT tasks.name FROM tasks,projects 
WHERE tasks.project_id=projects.id 
AND projects.name LIKE 'N%'*

5. get the list of all projects containing the 'a' letter in the middle of the name, and show the tasks count near each project.

...**SELECt projects.name, count(tasks.id) FROM tasks,projects 
WHERE tasks.project_id=projects.id AND projects.name LIKE '%a%' GROUP BY projects.name *

6. get the list of tasks with duplicate names. Order alphabetically

...**SELECT name FROM tasks GROUP BY name HAVING COUNT(name)> 1*

7. get list of tasks having several exact matches of both name and status, from the project 'Garage'. Order by matches count

...**SELECT name FROM tasks 
WHERE project_id=(SELECT id FROM projects WHERE name='Garage')
GROUP BY name HAVING COUNT(name)> 1 and COUNT(status)>1 ORDER BY COUNT(name),COUNT(status)*

8. get the list of project names having more than 10 tasks in status
'completed'. Order by project_id

...**SELECT projects.name FROM projects, tasks 
GROUP by projects.name 
HAVING COUNT(tasks.id)> 10 AND status="Completed" ORDER by project_id*
