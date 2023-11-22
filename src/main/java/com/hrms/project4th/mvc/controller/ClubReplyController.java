package com.hrms.project4th.mvc.controller;

import com.hrms.project4th.mvc.dto.requestDTO.ClubReplySaveRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.ClubReplyListResponseDTO;
import com.hrms.project4th.mvc.service.ClubReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/hrms/club")
public class ClubReplyController {

    private final ClubReplyService clubReplyService;

    @GetMapping("/myClubReply/{empNo}")
    public ResponseEntity<?> myClubReplyList(@PathVariable Long empNo) {
        List<ClubReplyListResponseDTO> clubReplyMyList = clubReplyService.clubReplyMyList(empNo);

        return ResponseEntity.ok().body(clubReplyMyList);
    }

    @GetMapping("/boardReply/{cbNo}")
    public  ResponseEntity<?> clubBoardReplyList(@PathVariable Long cbNo) {
        List<ClubReplyListResponseDTO> clubReplyListResponseDTOS = clubReplyService.clubReplyListAll(cbNo);

        return ResponseEntity.ok().body(clubReplyListResponseDTOS);
    }

    @PostMapping("/clubReplySave")
    public ResponseEntity<?> clubReplySave(@RequestBody ClubReplySaveRequestDTO dto) {
        boolean b = clubReplyService.clubReplySave(dto);

        log.info("clubReplySave: {}", b);

        return ResponseEntity.ok().body(b);
    }

    @DeleteMapping("/{clubRepNo}")
    public ResponseEntity<?> clubReplyDelete(@PathVariable Long clubRepNo) {
        boolean b = clubReplyService.clubReplyDelete(clubRepNo);
        log.info("clubReplyDelete : {}", b);
        return ResponseEntity.ok().body(b);
    }

}
