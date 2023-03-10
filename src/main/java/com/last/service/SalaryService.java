package com.last.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.SalaryDto;
import com.last.dto.SalaryContribution;
import com.last.dto.SalaryPeriodDto;
import com.last.mapper.SalaryMapper;
import com.last.vo.PayBankInfo;

@Service
public class SalaryService {
	
	@Autowired
	private SalaryMapper salaryMapper;
	
	// 급여대상 
	public List<SalaryDto> getSalaryDtos(String basemonth) {
		
		List<SalaryDto> salaryDtos = salaryMapper.getSalaryLists(basemonth);
		
		return salaryDtos;
	}

	// 사원 급여 정보 가져오기
	public SalaryDto getCalculatedSalaryDto(int empNo, String basemonth) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("basemonth", basemonth);
		SalaryDto salaryDto = salaryMapper.getCalculatedSalaryDto(param);
		
		return salaryDto;
	}
	
	// 급여내역 없는 사원의 기본정보 가져오기
	public PayBankInfo getBasicSalaryInfo(int empNo, String basemonth) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("basemonth", basemonth);
		PayBankInfo payBankInfo = salaryMapper.getBasicSalaryInfo(param);
		
		return payBankInfo;
	}
	
	// 급여저장
	public SalaryDto saveSalary (SalaryDto salaryDetail) {
		salaryMapper.insertSalary(salaryDetail);
		
		return salaryMapper.getCalculatedSalaryByNo(salaryDetail.getEmployeeNo(), salaryDetail.getBaseYearMonth());
	}
	
	// 급여수정
	public SalaryDto updateSalary (SalaryDto salaryDetail) {
		salaryMapper.updateSalary(salaryDetail);
		
		return salaryMapper.getCalculatedSalaryByNo(salaryDetail.getEmployeeNo(), salaryDetail.getBaseYearMonth());
	}
	
	// 급여삭제
	public SalaryDto deleteSalary(int empNo, String basemonth) {
		SalaryDto salaryDto = salaryMapper.getCalculatedSalaryByNo(empNo, basemonth);
		salaryMapper.deleteSalary(empNo, basemonth);
		
		return salaryDto;
	}
	
	// 급여조회
	public List<SalaryDto> getSalaryDtoLists(String basemonth, String opt, String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!basemonth.isBlank()) {
			param.put("basemonth", basemonth);			
		}
		if (!opt.isBlank() && !keyword.isBlank()) {
			param.put("opt", opt);
			param.put("keyword", keyword);			
		}
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryHistories(param);
		
		return salaryDtoLists;
	}
	
	// 급여조회 - 사원 급여 명세 가져오기
	public SalaryDto getSalaryDetailDto(int empNo, String paydate) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("paydate", paydate);
		SalaryDto salaryDto = salaryMapper.getSalaryDetailDto(param);

		return salaryDto;
	}
	
	// 급여대장
	public List<SalaryDto> getSalaryBookLists(String basemonth) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		if (!basemonth.isBlank()) {
			param.put("basemonth", basemonth);			
		}
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryHistories(param);
		
		return salaryDtoLists;
	}
	
	// 기간별 급여현황 - 급여총계
	public List<SalaryPeriodDto> getPeriodDtoLists(String startdate, String enddate) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!startdate.isBlank()) {
			param.put("startdate", startdate);			
		}
		if (!enddate.isBlank()) {
			param.put("enddate", enddate);			
		}
		List<SalaryPeriodDto> periodDtoLists = salaryMapper.getPeriodDtoLists(param);
		
		return periodDtoLists;
	}
	
	// 기간별 급여현황 - 급여 상세내역
	public List<SalaryDto> getPeriodDetails(String startdate, String enddate) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!startdate.isBlank()) {
			param.put("startdate", startdate);			
		}
		if (!enddate.isBlank()) {
			param.put("enddate", enddate);			
		}
		List<SalaryDto> periodDetailLists = salaryMapper.getPeriodDetails(param);
		
		return periodDetailLists;
	}
	
	// 국민연금, 건강보험, 고용보험 기본정보
	public List<SalaryDto> getSalaryDtoInfos(String baseYear, String opt, String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!baseYear.isBlank()) {
			param.put("baseYear", baseYear);
		}
		if (!opt.isBlank() && !keyword.isBlank()) {
			param.put("opt", opt);
			param.put("keyword", keyword);
		}
		
		List<SalaryDto> salaryDtoInfos = salaryMapper.getSalaryDtoInfos(param);
			
		return salaryDtoInfos;
	}
	
	// 국민연금, 건강보험, 고용보험 납입내역
	public List<SalaryContribution> getContributionDetails(int empNo, String baseYear) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("baseYear", baseYear);
		List<SalaryContribution> pensionDto = salaryMapper.getContributionDetails(param);
		
		return pensionDto;
	}
	
}
  