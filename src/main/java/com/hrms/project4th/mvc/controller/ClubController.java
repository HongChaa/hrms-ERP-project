package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardModifyRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubBoardSaveRequestDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ClubJoinRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubBoardResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.JoinedClubListResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.MyClubBoardResponseDTO;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.entity.Gender;
import com.hrms.project4th.mvc.service.ClubBoardService;
import com.hrms.project4th.mvc.service.ClubJoinService;
import com.hrms.project4th.mvc.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/hrms/club")
public class ClubController {

    private  final ClubBoardService clubBoardService;
    private final ClubJoinService clubJoinService;
    @Value("${clubFile.upload.root-path}")
    private  String clubRootPath;

    @GetMapping("/club-board-list")
    public String clubBoardList(HttpSession session, Model model) {

        EmployeeDetailResponseDTO exEmp = (EmployeeDetailResponseDTO) session.getAttribute("login");
        model.addAttribute("exEmp", exEmp);

        List<ClubBoardResponseDTO> dto = clubBoardService.findAllClubBoard();
        model.addAttribute("clubBoardList", dto);
        log.info("club-board-list-access-success");
        log.info("clubBoardListDto : {}", dto);

        for (ClubBoardResponseDTO clubBoardResponseDTO : dto) {
            System.out.println("clubBoardResponseDTO = " + clubBoardResponseDTO);
        }


        return "club/club";
    }

    @GetMapping("/joined-club-board-list")
    public String joinedClubBoardList(HttpSession session, Model model, Long empNo) {

        EmployeeDetailResponseDTO exEmp = (EmployeeDetailResponseDTO) session.getAttribute("login");

        List<ClubBoardResponseDTO> dto = clubBoardService.findByEmpNoClubBoard(empNo);
        model.addAttribute("clubBoardList", dto);

        model.addAttribute("exEmp", exEmp);
        log.info("exEmp : {}", exEmp);
        log.info("dto : {}", dto);
        return "club/club";
    }

    @ResponseBody
    @GetMapping("/myboardList/{empNo}")
    public ResponseEntity<?> myClubBoardList(@PathVariable Long empNo) {
        List<MyClubBoardResponseDTO> myClubBoardResponseDTOS = clubBoardService.myClubBoardList(empNo);
        log.info("good: {}",myClubBoardResponseDTOS);

        return ResponseEntity.ok().body(myClubBoardResponseDTOS);
    }

    @ResponseBody
    @GetMapping("/myclubList/{empNo}")
    public ResponseEntity<?> myClubList(@PathVariable Long empNo) {
        List<JoinedClubListResponseDTO> dtoList = clubJoinService.joinedClubList(empNo);
        log.info("dtoList: {}", dtoList);

        return ResponseEntity.ok().body(dtoList);
    }

    @ResponseBody
    @PostMapping("/clubJoin")
    public ResponseEntity<?> clubJoin(@RequestBody ClubJoinRequestDTO dto) {
        boolean b = clubJoinService.clubJoin(dto);
        log.info("동호회 가입성공여부: {}", b);

        return ResponseEntity.ok().body(b);
    }

    @ResponseBody
    @DeleteMapping("/leaveClub")
    public ResponseEntity<?> clubLeave(@RequestBody ClubJoinRequestDTO dto) {
        boolean b = clubJoinService.clubLeave(dto);
        log.info("동호회 탈퇴 성공여부: {}", b);

        return ResponseEntity.ok().body(b);
    }

    @ResponseBody
    @GetMapping("/detailClubBoard/{cbNo}")
    public ResponseEntity<?> detailClubBoard(@PathVariable Long cbNo) {
        ClubBoardResponseDTO clubBoardResponseDTO = clubBoardService.detailClubBoard(cbNo);
        log.info("detail DTO:{}", clubBoardResponseDTO);

        return ResponseEntity.ok().body(clubBoardResponseDTO);
    }

    @PostMapping("/clubBoardSave")
    public String clubBoardSave(ClubBoardSaveRequestDTO dto) {
        log.info("newClubBoard !!!!! dto: {}", dto);
        String savePath = FileUtil.uploadClubFile(dto.getEmpNo(), dto.getCbURL(), clubRootPath);
        log.info(clubRootPath);

        boolean b = clubBoardService.clubBoardSave(dto, savePath);
        log.info("동호회 새 게시글 작성 성공여부: {}", b);

        return "redirect:/hrms/club/club-board-list";
    }

    @DeleteMapping("/deleteClubBoard/{cbNo}")
    public ResponseEntity<?> deleteClubBoard(@PathVariable Long cbNo) {
        boolean b = clubBoardService.clubBoardDelete(cbNo);

        return ResponseEntity.ok().body(b);
    }

    @PutMapping("/modifyClubBoard")
    public ResponseEntity<?> modifyClubBoard(HttpSession session, ClubBoardModifyRequestDTO dto) {
        EmployeeDetailResponseDTO login = (EmployeeDetailResponseDTO)session.getAttribute("login");
        String savePath = FileUtil.uploadClubFile(login.getEmpNo(), dto.getCbURL(), clubRootPath);

        boolean b = clubBoardService.clubBoardModify(dto, savePath);

        return ResponseEntity.ok().body(b);

    }

}
