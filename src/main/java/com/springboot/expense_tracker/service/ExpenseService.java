package com.springboot.expense_tracker.service;

import java.util.List;
import java.util.Optional;

import com.springboot.expense_tracker.dao.ICostAndDateQuery;
import com.springboot.expense_tracker.dao.ICostAndMonthQuery;
import com.springboot.expense_tracker.dao.ICostAndYearQuery;
import com.springboot.expense_tracker.entity.ExpenseStorage;

public interface ExpenseService {

	public List<ExpenseStorage> getListByMonth(String MONTH, String YEAR);
	
	public void save(ExpenseStorage theExpense);
	
	public Optional<ExpenseStorage> findById(int id);
	
	public boolean existById(int id);
	
	public void deleteById(int id);
	
	public ExpenseStorage retreiveForUpdate(int id);
	
	public boolean expenseEntryIsPresent(ExpenseStorage theExpenseStorage);
	
	public List<ICostAndDateQuery>  getCostByDateList(String Month, String Year);
	
	public List<ICostAndMonthQuery> getCostByMonthList();
	
	public List<ICostAndYearQuery> getCostByYearList();
}
