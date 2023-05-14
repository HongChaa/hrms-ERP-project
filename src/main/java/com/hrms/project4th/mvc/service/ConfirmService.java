package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.*;
import com.hrms.project4th.mvc.entity.Confirm;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.repository.ConfirmMapper;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ConfirmService {

    private final ConfirmMapper confirmMapper;
    private final EmployeesMapper employeesMapper;

    public List<SimpleDateConfirmDTO> getWaitingList(long empNo, @Nullable String roleCode) {
        return confirmMapper.getWaitingList(empNo, roleCode)
                .stream()
                .map(SimpleDateConfirmDTO::new)
                .collect(Collectors.toList());
    }

    public boolean requestConfirm(RequestConfirmDTO dto) {
        Confirm cnfm = Confirm.builder()
                .fromEmpNo(dto.getFromEmpNo())
                .toEmpNo(dto.getToEmpNo())
                .conTitle(dto.getConTitle())
                .conContent(dto.getConContent())
                .build();
        return confirmMapper.requestConfirm(cnfm);
    }

    public boolean checkConfirm(long conNo) {
        return confirmMapper.checkConfirm(conNo);
    }

    public List<SimpleDateConfirmDTO> getCheckedList(long empNo, String roleCode) {
        return confirmMapper.getCheckedList(empNo, roleCode)
                .stream()
                .map(SimpleDateConfirmDTO::new)
                .collect(Collectors.toList());
    }

    public boolean rejectConfirm(long conNo) {
        return confirmMapper.rejectConfirm(conNo);
    }

    public boolean modifyConfirm(ModifyConfirmDTO dto) {
        Confirm confirm = Confirm.builder()
                .conNo(dto.getConNo())
                .conTitle(dto.getConTitle())
                .conContent(dto.getConContent())
                .build();
        return confirmMapper.modifyConfirm(confirm);
    }

    public List<SimpleDateConfirmDTO> getRejectedList(long empNo, String roleCode) {
        return confirmMapper.getRejectedList(empNo, roleCode)
                .stream()
                .map(SimpleDateConfirmDTO::new)
                .collect(Collectors.toList());
    }

    public DeptBossDTO getDeptBoss(String deptCode) {
        return employeesMapper.getDeptBoss(deptCode);

    }
}
