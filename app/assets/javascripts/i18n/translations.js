I18n.translations || (I18n.translations = {});
I18n.translations["en"] = {"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"many":"Cannot delete record because dependent %{record} exist","one":"Cannot delete record because a dependent %{record} exists"}}}},"cancel":"Cancel","date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes.","title":"Resend confirmation instructions"},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","last_attempt":"You have one more attempt before your account is locked.","locked":"Your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions","title":"You can confirm your account email through the link below:"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"edit":{"change_password":"Change my password","confirm_password":"Confirm new password","new_password":"New password","title":"Change your password"},"new":{"reset_password":"Reset password","title":"Forgot Your Password"},"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.","updated":"Your account has been updated successfully."},"sessions":{"already_signed_out":"Signed out successfully.","log_in":"Log In","remember_me":"Remember me","signed_in":"Signed in successfully.","signed_out":"Signed out successfully.","title":"Sign In"},"unlocks":{"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"errors":{"format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","already_confirmed":"was already confirmed, please try signing in","blank":"can't be blank","confirmation":"doesn't match %{attribute}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","expired":"has expired, please request a new one","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","not_a_number":"is not a number","not_an_integer":"must be an integer","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}}},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"destroy":{"alert":"%{resource_name} could not be destroyed.","notice":"%{resource_name} was successfully destroyed."},"update":{"notice":"%{resource_name} was successfully updated."}}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","update":"Update %{model}"}},"locations":{"edit":{"title":"Edit location"},"index":{"actions":"Actions","create":"Add a new location","create_notice":"Location was successfully created.","delete_confirm":"Are you sure to delete this location?","destroy_notice":"Location was successfully deleted.","latitude":"Latitude","longitude":"Longitude","name":"Name","title":"Locations","update_notice":"Location was successfully updated."},"new":{"title":"New location"}},"logout":"Log out","next":"Next","number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"gb":"GB","kb":"KB","mb":"MB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"qualifications":{"edit":{"title":"Edit qualification"},"index":{"actions":"Actions","assigned_to":"Assigned to","create":"Add a new qualification","create_notice":"Qualification was successfully created.","delete_confirm":"Are you sure to delete this qualification?","destroy_notice":"Qualification was successfully deleted.","from_date":"From date","name":"Name","status":"Status","title":"Qualifications","to_date":"To date","update_notice":"Qualification was successfully updated."},"new":{"title":"New qualification"}},"roles":{"edit":{"title":"Edit role"},"index":{"actions":"Actions","create":"Add a new role","create_notice":"Role was successfully created.","delete_confirm":"Are you sure to delete this role?","destroy_notice":"Role was successfully deleted.","name":"Name","title":"Roles","update_notice":"Role was successfully updated."},"new":{"title":"New role"}},"save":"Save","skill_categories":{"edit":{"title":"Edit skill category"},"index":{"actions":"Actions","create":"Add a new skill category","create_notice":"Skill category was successfully created.","delete_confirm":"Are you sure to delete this category?","destroy_notice":"Skill category was successfully deleted.","name":"Name","parent":"Parent category","title":"Skill categories","update_notice":"Skill category was successfully updated."},"new":{"title":"New skill category"}},"skills":{"edit":{"title":"Edit skill"},"index":{"actions":"Actions","create":"Add a new skill","create_notice":"Skill was successfully created.","delete_confirm":"Are you sure to delete this skill?","description":"Description","destroy_notice":"Skill was successfully deleted.","name":"Name","title":"Skills","update_notice":"Skill was successfully updated."},"new":{"title":"New skill"}},"support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"teams":{"edit":{"title":"Edit team"},"index":{"actions":"Actions","create":"Add a new team","create_notice":"Team was successfully created.","delete_confirm":"Are you sure to delete this team?","destroy_notice":"Team was successfully deleted.","name":"Name","parent":"Parent team","title":"Teams","update_notice":"Team was successfully updated."},"new":{"title":"New team"}},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"title":"Skills Management","users":{"custom_skill":{"title":"Custom Skill"},"edit":{"custom_skill":"You will specify the skill categories in the next step.","title":"Edit user"},"index":{"actions":"Actions","create":"Add a new user","create_notice":"User was successfully created.","delete_confirm":"Are you sure to delete this user?","destroy_notice":"User was successfully deleted.","email":"Email","first_name":"First name","location":"Location","password":"Password","password_confirmation":"Password confirmation","skill_set":"Skill set","status":"Status","sur_name":"Surname","team":"Team","title":"Users","update_notice":"User was successfully updated."},"new":{"title":"New user"}},"will_paginate":{"next_label":"Next \u0026#8594;","page_entries_info":{"multi_page":"Displaying %{model} %{from} - %{to} of %{count} in total","multi_page_html":"Displaying %{model} \u003cb\u003e%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003c/b\u003e of \u003cb\u003e%{count}\u003c/b\u003e in total","single_page":{"one":"Displaying 1 %{model}","other":"Displaying all %{count} %{model}","zero":"No %{model} found"},"single_page_html":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{model}","other":"Displaying \u003cb\u003eall\u0026nbsp;%{count}\u003c/b\u003e %{model}","zero":"No %{model} found"}},"page_gap":"\u0026hellip;","previous_label":"\u0026#8592; Previous"}};
