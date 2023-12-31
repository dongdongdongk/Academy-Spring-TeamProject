package com.ac.home.member.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ac.home.member.MemberDTO;

@Service
public class FindMemberService {
    
    @Autowired
    private FindMemberDAO findMemberDAO;

    public MemberDTO getMemberId(MemberDTO memberDTO) throws Exception {
        return findMemberDAO.getMemberId(memberDTO);
    }
    
    public MemberDTO findMemberByIdAndEmail(MemberDTO memberDTO) throws Exception {
        return findMemberDAO.findMemberByIdAndEmail(memberDTO);
    }
    
    public void updatePassword(MemberDTO memberDTO) throws Exception {
    	findMemberDAO.updatePassword(memberDTO);
    }
}