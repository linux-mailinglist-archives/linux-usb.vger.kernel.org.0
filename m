Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71FC313B85
	for <lists+linux-usb@lfdr.de>; Mon,  8 Feb 2021 18:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbhBHRvK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Feb 2021 12:51:10 -0500
Received: from mail-eopbgr140080.outbound.protection.outlook.com ([40.107.14.80]:42412
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233081AbhBHRt2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Feb 2021 12:49:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XowGShi/gyeex5b6WHDnekRR2mBBGd8HHxFaOOF8SagtWN+eESfPwfRgf8+1CUvDPM/DGwGKsm0HwX0t+IdAr8iF0PB7qb2BOijtE70ZsmTcWp3Q36sHkO3MIX5uj8uAR2vAYFmZoxIk/PFobW0oC/Vu9cwhfQjq5KgIp6w4oSdTRWVgOcPZ+R0OrlhYzWcWDDJZql/MOCIZNNgESD12MdHoRXy1TGmPtmU8IIIIH33NqWzewzdM7rypXoYUyj2O0o45iG9csBTtPKszx/445PjFBkz/USckhbCys3qJGlte+9cbcWpQFLItgg5worNW1gjlyAPZasWBx8/jeRQkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKSREzY20kZL9INo8xoATmZVlrwdVY0sAu0MYtJPISI=;
 b=bGydEWnZp7Xlz5Be3BmIBHmzT7Rj3dNQRrD07EFDqtnvYYrP30GRizPhv92Ok+1Phk4CRdXaDoJopY8xIyWtBvbp3hSX7gQZNiJ9EReRMw/vZR51Q1100endwjnuMr1xrheQvZgeoDBz9KTtm6EStW/FvWpoVw69gzLeMSXwlju+Yws+i2cyYy6MvygICWP7q12YmPUgGJSq2y7sC1Mbu4BrYjytbveXGaasmy2BQ7LQZS9wWzagXRaIZiCBf0+QAAL3Dz3c/29JBl1LoGy+wkkBdouPXb6+QmuRoel08SkoDhKUG6Mnl2qs3CGOzJy6VLE/VwQH4zBu5F2JgEEOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKSREzY20kZL9INo8xoATmZVlrwdVY0sAu0MYtJPISI=;
 b=IJIJT0CD7vJml/BRgWuaXVE7tmK5m43r+VnunS4avrup5nfoCQKQDLcfVaIxP/TLzkr48jhmv+PDrINrO12o8XiPfg0WlBmscZZZLH3gVNuYHhtGyrOVrt/6vRh3PAB37WZri2EMLK4qffpub1gyajIuiHCz0Qpy/w4uaOtP634=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 by AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 17:48:38 +0000
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e]) by AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e%4]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 17:48:37 +0000
From:   Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, lznuaa@gmail.com
Subject: [PATCH v3 1/1] usb: cdns3: add power lost support for system resume
Date:   Mon,  8 Feb 2021 11:48:20 -0600
Message-Id: <20210208174820.31182-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.24.0.rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [64.157.242.222]
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To AS8PR04MB8053.eurprd04.prod.outlook.com
 (2603:10a6:20b:2ad::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lizhi-Precision-Tower-5810.am.freescale.net (64.157.242.222) by BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 17:48:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5be71763-ccda-4c8d-68e9-08d8cc59c37e
X-MS-TrafficTypeDiagnostic: AS8PR04MB7928:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB79280E0EBF02F0C6BFD55C24888F9@AS8PR04MB7928.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etv/+zjZXvXt/gUQQDEm3fS1zOl611ZVJJgSFc6MSCLa+QUK6uz+IAVcy4TdrxEWsc7iRhuhb5uji1X6QCGxNHJAP8Evgfr1FkWENSxPSnuOSC0Qivzoqe/yzFGvT6Oqn20oVsn+1HeJ/QPkxAiokPkzB5pKD4F+pIZUwiICt9VWaKWF8qKUKSNHGPQ5+Y3cU2ZfPJFY/loBOwk45nMmJUOIqWEYwwmUkBo9qjCLJ6WYwtImeEUaLsM7WYKa8S0itzYQO/qLu8bPsGzIapqkOBnAEbW6Bhz7FQcgQrwjt5e1V99CdSvDbSRac2mtURmRBbeLC9ULLKwGz4lL6EZyBmTd+zMqGEx7oZiuB1gJUebj6in7qL5SPAevk/QsSMsJ6nLdLXoGD5xB7HhVMBpyQItDZOG8AI1gJK83/M3YtjPSKaifaAAO4TEvyFBEut4Bhb6T7Wv0l3NpIhMYo9bcFLGN17pdN/cMKSoD0Mq9Mpuz7YbHUTJJY/nveYT149hhP83Kw9D2t/vJhAr3UrvR5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(1076003)(6666004)(8676002)(52116002)(16526019)(6486002)(2906002)(5660300002)(186003)(8936002)(478600001)(6506007)(2616005)(956004)(6512007)(86362001)(26005)(83380400001)(66946007)(36756003)(66556008)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q4zkM2s0P0Z76NP2bCwi2/6UNW4Q2ALZAfnCtvxW7YXYKcLVheMIfQoHkHM+?=
 =?us-ascii?Q?JH6bOqASGEPTMHn74yMfZDTzGuCQ4xSrlE/71hc8qYFQfMg28O+m+VS/tSD4?=
 =?us-ascii?Q?R0RflfLHF7J3+TJxdKDEjkNFeJQHymfwDc3vkOaT6HnOOmMzRZWFSO4qpVf7?=
 =?us-ascii?Q?kAK9WW3VariacJ8mR+bJoO3bkHCwCYyVxE9Hex4+6k1T060quxk5rckID+RH?=
 =?us-ascii?Q?dhWESUOniuI4ZHvRSYjxcsAa9JEGRyjOC4sqli26tQ2gr1Q5K5+s73gEahWg?=
 =?us-ascii?Q?OXBW7DGBoUB4LWTrtUULPo5Of0/mxTr+Uph22jBknOf39Q5WtMZsljU7k+2d?=
 =?us-ascii?Q?UQFUH0ERw0UohOpXhRrfpC+EhwqUhw/GeZSaXrMJOIfSN9L7Ve5SGaeOnGms?=
 =?us-ascii?Q?KtjeTaYgp3BbOlrSKsiVW1cMc1+RR3chd/DkJaoG93UqZWMAGKamRzDH/Rk5?=
 =?us-ascii?Q?h8BXEE2fD1Pte5AwHg9wUWKSLy1YsQKIv53++7kcmnkS0i2wXCFh+D6RgA1p?=
 =?us-ascii?Q?7BDhka42dPtFZz63vm8sei4hyDr+e/S6h7jKfIro7KOYioAi9K0FpR8u0Ybi?=
 =?us-ascii?Q?o/r/OMlcXCNCZ3GeuLlLqFhlcCDhTbJo8vTxUeCfmezC66K4deyu3YbnJ0fX?=
 =?us-ascii?Q?9ho+n361/+g7SaW6IxPOyHYeU75g4s+ig+PiOl0CwLTf6pbJOcZAlNXPC1WD?=
 =?us-ascii?Q?DOwKioL6GkxXK5Mu1oWcJEsZUplrnYS0Eaw9rkuyzg6dTG5bRC4v7Zsw9S2V?=
 =?us-ascii?Q?+a0Gw/h2b3Xnqj/t90FxjHfB6T72epq+de8OXVBkDz7I6u0LM0eL1DNXLScv?=
 =?us-ascii?Q?lI/74ZZlkROzqDAYnBJhij9sQ8atxcorKf6FxilHYYi/7YWjxNvRiItZNZ1l?=
 =?us-ascii?Q?m6f4ZHGI8EKnImqhdQOWQtKotAS13lkIEzi+RW4obnbJiK9P6ZtZzJPobYt+?=
 =?us-ascii?Q?tAvwU0rLPvBAn2fpU3WezbXTIT2vtlqmJAz0vI/f8zDfPuWIwIda5n5835rw?=
 =?us-ascii?Q?amhiMKxdk4tEoNZpEOMtmhx5Ec+l2o09JFrYDLIKitU+Z3A7qA/NLzbtcjAt?=
 =?us-ascii?Q?EQO7z7GicwzlRQNjf/5X1s2y5aQFkvH7qgcJSOHlFPNueX9Bv5xuxQqIMN2K?=
 =?us-ascii?Q?I2U4KBDHIney7ZkMJZrmEZppFhM0xnIo1vJC75Sbj2axr73dLUNWBL0r4b3w?=
 =?us-ascii?Q?Omkr4teMpR1pe1o3/r3CKB72Iyz9YGpYM1Gv0PKqbR2Xhqwq1GwVATn8ZJ7S?=
 =?us-ascii?Q?yXiPUO3n1hnBTbMQ6Yty8UnKZsouOArZpdr5d1qw2FXV+0wgJOxF86tlltl/?=
 =?us-ascii?Q?45DzxcvB/jHnRtwlzZdamwGj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be71763-ccda-4c8d-68e9-08d8cc59c37e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 17:48:37.8604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnkvcL4pUhlZ+sJ0VAXsj1GmxcgR0cADWvFOVXXiE4xt25YHQnMuzofsIFv2UC8k4Q1dprHBo939ZjY6Gf/LQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7928
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller lost its power during the system suspend, we need
to do all initialiation operations.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Change from v1 to v3. 
 - fix build error
 - remove ret variable at cdns_is_power_lost

 drivers/usb/cdns3/cdns3-gadget.c |  2 ++
 drivers/usb/cdns3/cdns3-imx.c    | 34 ++++++++++++++++++++++++++++++++
 drivers/usb/cdns3/cdns3-plat.c   | 22 ++++++++++++++++++++-
 drivers/usb/cdns3/core.c         | 29 ++++++++++++++++++++++++++-
 drivers/usb/cdns3/drd.c          | 16 +++++++++++++++
 drivers/usb/cdns3/drd.h          |  2 +-
 6 files changed, 102 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 582bfeceedb4..44b7301b1888 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3304,6 +3304,8 @@ static int cdns3_gadget_resume(struct cdns *cdns, bool hibernated)
 		return 0;
 
 	cdns3_gadget_config(priv_dev);
+	if (hibernated)
+		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
 
 	return 0;
 }
diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 8f88eec0b0ea..708b51cc5844 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -361,6 +361,39 @@ static int cdns_imx_suspend(struct device *dev)
 
 	return 0;
 }
+
+
+/* Indicate if the controller was power lost before */
+static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
+{
+	u32 value;
+
+	value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+	if ((value & SW_RESET_MASK) == ALL_SW_RESET)
+		return true;
+	else
+		return false;
+}
+
+static int cdns_imx_system_resume(struct device *dev)
+{
+	struct cdns_imx *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cdns_imx_resume(dev);
+	if (ret)
+		return ret;
+
+	if (cdns_imx_is_power_lost(data)) {
+		dev_dbg(dev, "resume from power lost\n");
+		ret = cdns_imx_noncore_init(data);
+		if (ret)
+			cdns_imx_suspend(dev);
+	}
+
+	return ret;
+}
+
 #else
 static int cdns_imx_platform_suspend(struct device *dev,
 	bool suspend, bool wakeup)
@@ -372,6 +405,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 
 static const struct dev_pm_ops cdns_imx_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
 };
 
 static const struct of_device_id cdns_imx_of_match[] = {
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 4b18e1c6a4bb..e61da57fe31a 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -19,6 +19,7 @@
 
 #include "core.h"
 #include "gadget-export.h"
+#include "drd.h"
 
 static int set_phy_power_on(struct cdns *cdns)
 {
@@ -236,6 +237,17 @@ static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 	if (!cdns->in_lpm)
 		return 0;
 
+	if (cdns_power_is_lost(cdns)) {
+		phy_exit(cdns->usb2_phy);
+		ret = phy_init(cdns->usb2_phy);
+		if (ret)
+			return ret;
+		phy_exit(cdns->usb3_phy);
+		ret = phy_init(cdns->usb3_phy);
+		if (ret)
+			return ret;
+	}
+
 	ret = set_phy_power_on(cdns);
 	if (ret)
 		return ret;
@@ -270,10 +282,18 @@ static int cdns3_plat_runtime_resume(struct device *dev)
 static int cdns3_plat_suspend(struct device *dev)
 {
 	struct cdns *cdns = dev_get_drvdata(dev);
+	int ret;
 
 	cdns_suspend(cdns);
 
-	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
+	ret = cdns3_controller_suspend(dev, PMSG_SUSPEND);
+	if (ret)
+		return ret;
+
+	if (device_may_wakeup(dev) && cdns->wakeup_irq)
+		enable_irq_wake(cdns->wakeup_irq);
+
+	return ret;
 }
 
 static int cdns3_plat_resume(struct device *dev)
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 199713769289..5d486c8a9d99 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -525,9 +525,36 @@ EXPORT_SYMBOL_GPL(cdns_suspend);
 int cdns_resume(struct cdns *cdns, u8 set_active)
 {
 	struct device *dev = cdns->dev;
+	enum usb_role real_role;
+	bool role_changed = false;
+	int ret;
+
+	if (cdns_power_is_lost(cdns)) {
+		if (cdns->role_sw) {
+			cdns->role = cdns_role_get(cdns->role_sw);
+		} else {
+			real_role = cdns_hw_role_state_machine(cdns);
+			if (real_role != cdns->role) {
+				ret = cdns_hw_role_switch(cdns);
+				if (ret)
+					return ret;
+				role_changed = true;
+			}
+		}
+
+		if (!role_changed) {
+			if (cdns->role == USB_ROLE_HOST)
+				ret = cdns_drd_host_on(cdns);
+			else if (cdns->role == USB_ROLE_DEVICE)
+				ret = cdns_drd_gadget_on(cdns);
+
+			if (ret)
+				return ret;
+		}
+	}
 
 	if (cdns->roles[cdns->role]->resume)
-		cdns->roles[cdns->role]->resume(cdns, false);
+		cdns->roles[cdns->role]->resume(cdns, cdns_power_is_lost(cdns));
 
 	if (set_active) {
 		pm_runtime_disable(dev);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 605a413db727..1213c540deb3 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -478,3 +478,19 @@ int cdns_drd_exit(struct cdns *cdns)
 
 	return 0;
 }
+
+
+/* Indicate the cdns3 core was power lost before */
+bool cdns_power_is_lost(struct cdns *cdns)
+{
+	if (cdns->version == CDNS3_CONTROLLER_V1) {
+		if (!(readl(&cdns->otg_v1_regs->simulate) & BIT(0)))
+			return true;
+	} else {
+		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
+			return true;
+	}
+	return false;
+}
+
+EXPORT_SYMBOL_GPL(cdns_power_is_lost);
diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
index 9724acdecbbb..cbdf94f73ed9 100644
--- a/drivers/usb/cdns3/drd.h
+++ b/drivers/usb/cdns3/drd.h
@@ -215,5 +215,5 @@ int cdns_drd_gadget_on(struct cdns *cdns);
 void cdns_drd_gadget_off(struct cdns *cdns);
 int cdns_drd_host_on(struct cdns *cdns);
 void cdns_drd_host_off(struct cdns *cdns);
-
+bool cdns_power_is_lost(struct cdns *cdns);
 #endif /* __LINUX_CDNS3_DRD */
-- 
2.24.0.rc1

