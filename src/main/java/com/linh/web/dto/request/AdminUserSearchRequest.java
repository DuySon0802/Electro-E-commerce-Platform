package com.linh.web.dto.request;

import com.linh.web.model.Role;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AdminUserSearchRequest {
    private String keyword;
    private Role role;
    private String status;
    private Boolean verified;
    private String deleted;
    private String sortBy;
}
