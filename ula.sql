package com.example.model;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_list", schema = "irobo_ula")
public class UserList implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_list_uid_seq")
    @SequenceGenerator(name = "user_list_uid_seq", sequenceName = "irobo_ula.user_list_uid_seq", allocationSize = 1)
    private Long uid;

    @Column(name = "account_name", nullable = false, length = 100)
    private String accountName;

    @Column(name = "account_owner", nullable = false, length = 11)
    private String accountOwner;

    @Column(name = "account_type", nullable = false, length = 20)
    private String accountType;

    @Column(name = "account_status", nullable = false, length = 8)
    private String accountStatus;

    @Column(name = "is_privileged", length = 3)
    private String isPrivileged;

    @Column(name = "account_description", length = 255)
    private String accountDescription;

    @Column(name = "last_login", nullable = false)
    private LocalDateTime lastLogin;

    @Column(name = "expiry_date")
    private LocalDateTime expiryDate;

    @ManyToOne
    @JoinColumn(name = "entitlement_name", referencedColumnName = "uid", insertable = false, updatable = false)
    private EntitlementList entitlement;

    @Column(name = "entitlement_name")
    private Long entitlementName;

    // Getters and Setters
}


package com.example.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "entitlement_list", schema = "irobo_ula")
public class EntitlementList implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "entitlement_list_uid_seq")
    @SequenceGenerator(name = "entitlement_list_uid_seq", sequenceName = "irobo_ula.entitlement_list_uid_seq", allocationSize = 1)
    private Long uid;

    @Column(name = "entitlement_name", nullable = false, length = 255)
    private String entitlementName;

    @Column(name = "entitlement_description", length = 500)
    private String entitlementDescription;

    @Column(name = "entitlement_owner", length = 255)
    private String entitlementOwner;

    @Column(name = "is_privileged")
    private Boolean isPrivileged;

    // Getters and Setters
}
