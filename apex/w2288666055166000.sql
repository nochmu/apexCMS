set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>2288666055166000
);
end;
/
prompt  WORKSPACE 2288666055166000
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   15:35 Monday November 13, 2017
--   Exported By:     DEMO
--   Export Type:     Workspace Export
--   Version:         5.1.3.00.05
--   Instance ID:     240168584283688
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_050100
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>2288666055166000);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace DEMO...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 2288840193166994
 ,p_provisioning_company_id => 2288666055166000
 ,p_short_name => 'DEMO'
 ,p_display_name => 'DEMO'
 ,p_first_schema_provisioned => 'DEMO'
 ,p_company_schemas => 'DEMO'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'DEMO'
 ,p_path_prefix => 'DEMO'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_api.create_user_groups (
  p_id => 1860858847428629,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 1860725787428629,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 1860691977428628,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '2288507283166000',
  p_user_name                    => 'CMU',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'CMU@demo.loc',
  p_web_password                 => 'EBF72CD2EAB2F12EED6C0198E45B895014C0C5747A64FE0D69C1776A51758E8EA335577EB28E5A7CE35E1317E1F210DBC00601A148AA84676B329F868C6A4C70',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'DEMO',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201711131447','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--App Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 2288918553167007,
    p_user_id => 2288507283166000,
    p_password => 'EBF72CD2EAB2F12EED6C0198E45B895014C0C5747A64FE0D69C1776A51758E8EA335577EB28E5A7CE35E1317E1F210DBC00601A148AA84676B329F868C6A4C70');
end;
/
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2345872375408880,
    p_user_id => 'CMU',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '346:false');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2345104062208684,
    p_user_id => 'CMU',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '500');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2345323173307223,
    p_user_id => 'CMU',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2345055554208663,
    p_user_id => 'CMU',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2344942945208647,
    p_user_id => 'CMU',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS');
end;
/
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'CMU',
    p_auth_method => 'APEX',
    p_app => 500,
    p_owner => 'DEMO',
    p_access_date => to_date('201711131520','YYYYMMDDHH24MI'),
    p_ip_address => '192.168.1.134',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'CMU',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_050100',
    p_access_date => to_date('201711131447','YYYYMMDDHH24MI'),
    p_ip_address => '192.168.1.134',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 5,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'CMU',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_050100',
    p_access_date => to_date('201711131447','YYYYMMDDHH24MI'),
    p_ip_address => '192.168.1.134',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'CMU',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_050100',
    p_access_date => to_date('201711131520','YYYYMMDDHH24MI'),
    p_ip_address => '192.168.1.134',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'DEMO';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA DEMO - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_050100
-- Exported 15:35 Monday November 13, 2017 by: 
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 15:35 Monday November 13, 2017 by: 
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'DEMO';
 
end;
/

begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
