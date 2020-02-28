package com.chinasoft.springbootoffice.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
    public List<Map<String,Object>> selectUsers(Map<String, Object> map);
}
