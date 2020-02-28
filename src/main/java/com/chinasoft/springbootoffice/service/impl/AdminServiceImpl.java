package com.chinasoft.springbootoffice.service.impl;

import com.chinasoft.springbootoffice.dao.AdminMapper;
import com.chinasoft.springbootoffice.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Map<String, Object>> selectUsers(Map<String, Object> map) {

        return adminMapper.selectUsers(map);
    }
}
