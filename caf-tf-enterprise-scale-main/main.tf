# Declare the Terraform Module for Cloud Adoption Framework
# Enterprise-scale and provide a base configuration.
module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~> 1.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  # Base module configuration settings.
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
  default_location = local.default_location
  library_path     = "./lib"

  # Control deployment of the core landing zone hierachy.
  deploy_core_landing_zones   = false
  deploy_corp_landing_zones   = local.deploy_corp_landing_zones
  deploy_online_landing_zones = local.deploy_online_landing_zones
  deploy_sap_landing_zones    = local.deploy_sap_landing_zones

  custom_landing_zones = {

    "${local.root_id}" = {
      display_name               = "MHB-Root"
      parent_management_group_id = ""
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_root"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-platform" = {
      display_name               = "Platform"
      parent_management_group_id = "${local.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-identity" = {
      display_name               = "Identity"
      parent_management_group_id = "${local.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-connectivity" = {
      display_name               = "Connectivity"
      parent_management_group_id = "${local.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-management" = {
      display_name               = "Management"
      parent_management_group_id = "${local.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-devops" = {
      display_name               = "DevOps"
      parent_management_group_id = "${local.root_id}-platform"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-landingzones" = {
      display_name               = "Landing Zones"
      parent_management_group_id = "${local.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-sandboxes" = {
      display_name               = "Sandboxes"
      parent_management_group_id = "${local.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-decommissioned" = {
      display_name               = "Decommissioned"
      parent_management_group_id = "${local.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app" = {
      display_name               = "Banyan-App"
      parent_management_group_id = "${local.root_id}-landingzones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-connectivity-dev" = {
      display_name               = "Connectivity-Dev"
      parent_management_group_id = "${local.root_id}-connectivity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-connectivity-qa" = {
      display_name               = "Connectivity-QA"
      parent_management_group_id = "${local.root_id}-connectivity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-connectivity-stage" = {
      display_name               = "Connectivity-Stage"
      parent_management_group_id = "${local.root_id}-connectivity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-connectivity-prd" = {
      display_name               = "Connectivity-Prd"
      parent_management_group_id = "${local.root_id}-connectivity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-management-dev" = {
      display_name               = "Management-Dev"
      parent_management_group_id = "${local.root_id}-management"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-management-qa" = {
      display_name               = "Management-QA"
      parent_management_group_id = "${local.root_id}-management"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-management-stage" = {
      display_name               = "Management-Stage"
      parent_management_group_id = "${local.root_id}-management"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-management-prd" = {
      display_name               = "Management-Prd"
      parent_management_group_id = "${local.root_id}-management"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-identity-dev" = {
      display_name               = "Identity-Dev"
      parent_management_group_id = "${local.root_id}-identity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-identity-qa" = {
      display_name               = "Identity-QA"
      parent_management_group_id = "${local.root_id}-identity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-identity-stage" = {
      display_name               = "Identity-Stage"
      parent_management_group_id = "${local.root_id}-identity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-identity-prd" = {
      display_name               = "Identity-Prd"
      parent_management_group_id = "${local.root_id}-identity"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app-dvl" = {
      display_name               = "Banyan-App-DVL"
      parent_management_group_id = "${local.root_id}-banyan-app"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "default_empty"          
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app-dev" = {
      display_name               = "Banyan-App-Dev"
      parent_management_group_id = "${local.root_id}-banyan-app"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "banyan_app_dev"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app-qa" = {
      display_name               = "Banyan-App-QA"
      parent_management_group_id = "${local.root_id}-banyan-app"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app-stage" = {
      display_name               = "Banyan-App-Stage"
      parent_management_group_id = "${local.root_id}-banyan-app"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.root_id}-banyan-app-prd" = {
      display_name               = "Banyan-App-Prd"
      parent_management_group_id = "${local.root_id}-banyan-app"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }    
  }
}
