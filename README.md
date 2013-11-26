What we changed:

 - added audited GEM for logging changes ( rails generate audited:install after bundle)
 - added service
 - in controllers we call policy_service.process_create or policy_service.process_update instead of repeating the same code in both controller
 - in service we log changes, and check privilages to change commission, also set the notices/alerts
 - controller is now only responsable for getting request and respond to it - what is done with data is in service
