package com.chinasoft.springbootoffice.dao;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public interface AdminMapper {
    public List<Map<String,Object>> selectUsers(Map<String, Object> map);
}
