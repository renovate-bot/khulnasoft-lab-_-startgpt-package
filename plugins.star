common = import_module("./src/common.star")

MAIN_BRANCH = "main"
MASTER_BRANCH = "master"
STDLIB_PLUGIN_REPO = "KhulnaSoft/Start-GPT-Plugins"
ZIP_EXTENSION = ".zip"
REQUIRED_ENV_VARS = "required_env_vars"
ENV_VARS_DEFAULT_VALUES = "env_vars_default_values"


plugins_map = {
    # begin standard plugins
    "StartGPTTwitter": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["TW_CONSUMER_KEY", "TW_CONSUMER_SECRET", "TW_ACCESS_TOKEN", "TW_ACCESS_TOKEN_SECRET", "TW_CLIENT_ID", "TW_CLIENT_ID_SECRET"]},
    "StartGPTEmailPlugin": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["EMAIL_ADDRESS", "EMAIL_PASSWORD"]},
    "StartGPTSceneXPlugin": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["SCENEX_API_KEY"]},
    "StartGPTBingSearch": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["BING_API_KEY"], ENV_VARS_DEFAULT_VALUES: {"SEARCH_ENGINE": "bing"}},
    "StartGPTNewsSearch": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["NEWSAPI_API_KEY"]},
    "PlannerPlugin": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH},
    "StartGPTWikipediaSearch": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH},
    "StartGPTApiTools": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH},
    "StartGPTRandomValues": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH},
    "StartGPTSpacePlugin": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH},
    "StartGPTBaiduSearch": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["BAIDU_COOKIE"], ENV_VARS_DEFAULT_VALUES: {"SEARCH_ENGINE": "baidu"}},
    "StartGPTBluesky": {"repository": STDLIB_PLUGIN_REPO, "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["BLUESKY_USERNAME", "BLUESKY_APP_PASSWORD"]},
    # end of standard plugins
    "StartGPTAlpacaTraderPlugin": {"repository": "danikhan632/Start-GPT-AlpacaTrader-Plugin", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS:["APCA_API_KEY_ID", "APCA_API_SECRET_KEY"], ENV_VARS_DEFAULT_VALUES: {"APCA_IS_PAPER": "True"}},
    "StartGPTUserInput": {"repository": "HFrovinJensen/Start-GPT-User-Input-Plugin", "branch": MASTER_BRANCH},
    "BingAI": {"repository": "gravelBridge/StartGPT-BingAI", "branch": MAIN_BRANCH, REQUIRED_ENV_VARS: ["BINGAI_COOKIES_PATH", "BINGAI_MODE"]},
    "StartGPTCryptoPlugin": {"repository": "isaiahbjork/Start-GPT-Crypto-Plugin", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["ETHERSCAN_API_KEY", "POLYSCAN_API_KEY", "ETH_WALLET_ADDRESS", "ETH_WALLET_PRIVATE_KEY", "LUNAR_CRUSH_API_KEY", "TELEGRAM_API_ID", "TELEGRAM_API_HASH", "FCS_API_KEY", "CMC_API_KEY", "EXCHANGES", "EXCHANGE_NAME_SECRET", "EXCHANGE_NAME_API_KEY"]},
    "StartGPTDiscord": {"repository": "gravelBridge/StartGPT-Discord", "branch": MAIN_BRANCH, REQUIRED_ENV_VARS: ["DISCORD_BOT_TOKEN", "AUTHORIZED_USER_IDS", "BOT_PREFIX", "CHANNEL_ID"], ENV_VARS_DEFAULT_VALUES: {"ASK_FOR_INPUT": "True"}},
    "StartGPTDollyPlugin": {"repository": "pr-0f3t/Start-GPT-Dolly-Plugin", "branch": MASTER_BRANCH},
    "StartGPTGoogleAnalyticsPlugin": {"repository": "isaiahbjork/Start-GPT-Google-Analytics-Plugin", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["GOOGLE_ANALYTICS_VIEW_ID"], ENV_VARS_DEFAULT_VALUES: {"GOOGLE_APPLICATION_CREDENTIALS": "firebase.json"}},
    "StartGPT_IFTTT": {"repository": "AntonioCiolino/StartGPT-IFTTT", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["IFTTT_WEBHOOK_TRIGGER_NAME", "IFTTT_KEY"]},
    "StartGPT_YouTube": {"repository": "jpetzke/StartGPT-YouTube", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["YOUTUBE_API_KEY"]},
    "StartGPTPMPlugin": {"repository": "minfenglu/StartGPT-PM-Plugin", "branch": MAIN_BRANCH, REQUIRED_ENV_VARS: ["TRELLO_API_KEY", "TRELLO_API_TOKEN", "TRELLO_CONFIG_FILE"]},
    "StartGPTWolframAlpha": {"repository":"gravelBridge/StartGPT-WolframAlpha", "branch": MAIN_BRANCH, REQUIRED_ENV_VARS: ["WOLFRAM_ALPHA_APP_ID"]},
    "StartGPTTodoistPlugin": {"repository": "danikhan632/Start-GPT-Todoist-Plugin", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["TODOIST_TOKEN"]},
    "StartGPTMessagesPlugin": {"repository": "danikhan632/Start-GPT-Messages-Plugin", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["IMESSAGE_PASSWORD_KEY", "IMESSAGE_BASE_URL"]},
    "StartGPTWebInteraction": {"repository": "gravelBridge/StartGPT-Web-Interaction", "branch": MAIN_BRANCH},
    "StartGPTNotion": {"repository": "doutv/Start-GPT-Notion", "branch": MASTER_BRANCH, REQUIRED_ENV_VARS: ["NOTION_TOKEN", "NOTION_DATABASE_ID"]},
    "SystemInformationPlugin": {"repository": "hdkiller/Start-GPT-SystemInfo", "branch": MASTER_BRANCH},
    "StartGPT_Zapier": {"repository": "AntonioCiolino/StartGPT-Zapier", "branch": MAIN_BRANCH, REQUIRED_ENV_VARS: ["ZAPIER_WEBHOOK_ENDPOINT"]},
}


def get_plugin_url(plugin_data, plugin_branch_to_use, plugin_repo_to_use):
    repo = plugin_data["repository"]
    if plugin_repo_to_use:
        repo = plugin_repo_to_use
    branch = plugin_data["branch"]
    if plugin_branch_to_use:
        branch = plugin_branch_to_use
    return "https://github.com/{0}/archive/refs/heads/{1}.zip".format(repo, branch)


def get_filename(plugin):
    author, actual_repo = plugin["repository"].split("/")
    return actual_repo + ZIP_EXTENSION


def areAllRequiredEnvVarsSet(env_vars, plugins_names):
    areAllRequiredEnvVarsSet = True
    missing_env_vars = {}
    all_required_env_vars = getAllRequiredEnvVarsFor(plugins_names)
    for plugin_name, plugin_env_vars in all_required_env_vars.items():
        plugin_missing_env_vars = []
        for required_env_var in plugin_env_vars:
            if required_env_var not in env_vars:
                areAllRequiredEnvVarsSet = False
                plugin_missing_env_vars.append(required_env_var)
        if len(plugin_missing_env_vars) > 0:
            missing_env_vars[plugin_name] = plugin_missing_env_vars

    return areAllRequiredEnvVarsSet, missing_env_vars


def validatePluginNames(plugins_names):
    for plugin_name in plugins_names:
        if plugin_name not in plugins_map:
            fail("Invalid plugin name {0}. The supported plugins are: {1}. You can add support for a new plugin by creating an issue or PR at {2}".format(plugin_name, ", ".join(plugins_map.keys()), common.KURTOSIS_STARTGPT_PACKAGE_URL))


def getAllRequiredEnvVarsFor(plugins_names):
    required_env_vars = {}
    for plugin_name in plugins_names:
        plugin_data = plugins_map.get(plugin_name)
        plugin_env_vars = plugin_data.get(REQUIRED_ENV_VARS)
        if plugin_env_vars == None:
            continue
        required_env_vars[plugin_name] = plugin_env_vars
    
    return required_env_vars


def getPluginsEnvVarsDefaultValues(plugins_names, user_env_vars):
    env_vars_set = []
    env_vars_set_by_plugin = {}
    env_vars_default_values = {}
    for plugin_name in plugins_names:
        plugin_data = plugins_map.get(plugin_name)
        plugin_env_vars = plugin_data.get(ENV_VARS_DEFAULT_VALUES)
        if plugin_env_vars == None:
            continue
        plugin_env_vars_names = plugin_env_vars.keys()
        for env_var_name in plugin_env_vars_names:
            if env_var_name in user_env_vars:
                continue
            env_var_value = plugin_env_vars.get(env_var_name)
            if env_var_name in env_vars_set:
                plugin_name_already_set_env_var = env_vars_set_by_plugin[env_var_name]
                already_set_env_var_value = env_vars_default_values[env_var_name]
                if env_var_value != already_set_env_var_value:
                    fail("You are trying to use '{0}', '{1}' both of which use the same environment variable '{2}' with different values. We recommend you use just one of '{0}' or '{1}'".format(plugin_name, plugin_name_already_set_env_var, env_var_name))
            env_vars_set.append(env_var_name)
            env_vars_set_by_plugin[env_var_name] = plugin_name
            env_vars_default_values[env_var_name] = env_var_value
    
    return env_vars_default_values
