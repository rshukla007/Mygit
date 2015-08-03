package net.crm.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import net.crm.dao.TaskManagerService;
import net.crm.model.Task;


@RestController
public class TaskManagerController {
	
	TaskManagerService taskmanagerservice=new TaskManagerService();
	
	 @RequestMapping(value="/user/MyTasks",method = RequestMethod.GET,headers="Accept=application/json")
	 public ModelAndView getTasks(){ 
		    ModelAndView mav = new ModelAndView("/user/MyTasks");
			Task smartlead = new Task();
			mav.addObject("sTasks", smartlead);
			return mav;	        	
	 }
	
	 @RequestMapping(value="/user/tasks",method = RequestMethod.GET,headers="Accept=application/json")
	 public List<Task> getAllTasks() {	 
	  List<Task> tasks=taskmanagerservice.getAllTasks();
	  return tasks;	
	 }
	 	 
	 @RequestMapping(value="/user/tasks/archive/{taskIds}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Task> archiveAllTasks(@PathVariable int[] taskIds) {	
		 for(int i=0;i<taskIds.length;i++){
			 taskmanagerservice.archiveTask(taskIds[i]);	
			 
		 }
	  List<Task> tasks=taskmanagerservice.getAllTasks();
	  return tasks;
	
	 }
	 
	 @RequestMapping(value="/user/tasks/{taskId}/{taskStatus}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Task> changeTaskStatus(@PathVariable int taskId,@PathVariable String taskStatus) throws ParseException {	
		 taskmanagerservice.changeTaskStatus(taskId,taskStatus);		 
		 return taskmanagerservice.getAllTasks();
		 
	 }
	 
	 @RequestMapping(value="/user/tasks/insert/{taskName}/{taskDesc}/{taskPriority}/{taskStatus}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Task> addTask(@PathVariable String taskName,@PathVariable String taskDesc,@PathVariable String taskPriority,@PathVariable String taskStatus) throws ParseException {	
		Task task = new Task();
		task.setTaskName(taskName);
		task.setTaskDescription(taskDesc);
		task.setTaskPriority(taskPriority);
		task.setTaskStatus(taskStatus);
		taskmanagerservice.addTask(task);
		return taskmanagerservice.getAllTasks();
		 
	 }	 	 	 	 
}