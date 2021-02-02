Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D0630C714
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhBBRJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 12:09:51 -0500
Received: from mail-db8eur05on2063.outbound.protection.outlook.com ([40.107.20.63]:9184
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237043AbhBBRCe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 12:02:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si5fuNi9pwYgPzAWTQjuLs3d01app7VjNI7FbXxvIWzJbL/R4L7orWjR2Endnv1n50mMlzKupkJ3vB1AgLQoul3rovbictjxZPJJPULKRIFGO0f3BUiC6VkVP2gSv/w98w3tdv7PRm9f8dRmCYhN7crDPXmu06r4vNZGRNWTozuc9ZfkO6PfW+vvvn14+XIU7Ypie6GxPeAeLR4zP+9IDpJbeT2Urq7CRBDOzmhgVfDbIp/Ipd5d9X5kx6CqeUnDRSPluwAESXnNj8CuGRrFMQJdCuivrbsZNEZ6RucXT7382HnMPZjIGQ2cq+cJwaIks5iB91BlBGb8n77SCajMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4zI3FP+ef2u5dVGFSza/hpFI+RbgNnn2SiDm7nzjkc=;
 b=gTaYN1qHT3xPy3AVOh14Ut2XGo7dZ9EcUZ+Ct4c1+WZcXhvl7vQ2yo6aPbpWeA4MxdUaSpcbjzpDwbA+DtKLf4v2qv3K4RfC4jB1WnbhZe0iNxOVuNsD9jHweXhz09Y3vy886W3JPCCvMYMDsfH41T0RHcIxiJZZ7jA2IMmKpkoxKOIcyec0NsatAuWguMrcLP6FsT8hYK5bs+hZrsbXWWAx4uJ38BuJvoAMeRsM3dWlobOxOhHU8ISAdSSvvTZqkYIHKRpK2UkXnIXvSqn1tqfFebvwZbBqCU4iATulKwtpMCI+Pd8lOFXaBft3rzp8HycdXvx82zHk1acDz8DnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4zI3FP+ef2u5dVGFSza/hpFI+RbgNnn2SiDm7nzjkc=;
 b=spq6lvAusgGgHzyG1doRl8irnjM0mdReRM7P0Cy4eCefTMX80aCRvmUFd8AIQIH4q6Jm651p6N2NntqR/ojdwTqS0AX/HIZ52788hb8raINL5PwOBv0fpk3mXQLxzPf1/Jzzp4VBLpDGeFNUPaMXOAblf8S52mOfFkTu2wQC5LE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 by AM6PR04MB4103.eurprd04.prod.outlook.com (2603:10a6:209:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 17:01:41 +0000
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e]) by AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e%4]) with mapi id 15.20.3805.025; Tue, 2 Feb 2021
 17:01:41 +0000
From:   Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, lznuaa@gmail.com
Subject: [PATCH 1/1] usb: cdns3: add power lost support for system resume
Date:   Tue,  2 Feb 2021 11:01:21 -0600
Message-Id: <20210202170121.29777-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.24.0.rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [64.157.242.222]
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To AS8PR04MB8053.eurprd04.prod.outlook.com
 (2603:10a6:20b:2ad::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lizhi-Precision-Tower-5810.am.freescale.net (64.157.242.222) by BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 17:01:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eee2b113-1aa6-401e-882a-08d8c79c3615
X-MS-TrafficTypeDiagnostic: AM6PR04MB4103:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41033125DF0A807331FCE0EB88B59@AM6PR04MB4103.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9EVamjAfuIcW7r5fSWM6iL8muBtLCDX3T56OdWMhNrrGlYOLrEAVnFTwWmtwhgc3JbYnScxH1SOdbfYpAkkyDtZrjHVlgnD/Xt7PlnpzGwSlDp54oiaTkw2Y+M6vDA9x66tc8EHAJTXfC9UtWLMJolEutuFH8/jzo8wt22xZL0CJxMnl6v6yjVRSQNUIU9MTKziggkGdc9Mf3xgsVTeaIj78WswBkILZj1w4ZdL8PIrlaoYWqgVpz2fYVtzZTO+J0ZZodpDBt3bU4YZa++CYhkXDJ+skzeLo/Yw1N1DosdvDd7ryedxjH9vGPrIUl+7cvpkBqGMX1yvXT53W0wU7JUB5EPBsqjMdIROC5h97Uqj4S11Fp/9zNnEOz92yeIcCJB/yX7XOSLi20h/zMrCYqkk9CxEu8SbVP1mWsj1h1z1Ooc48h8kEQ1QPb+sDL16HY5ngJ6uZcvW0Z63n0rKeHrLurFIb2amhFN0VDjUnJBy/YmiZ5j7aRbLiazL6GaJ9gYeMQwHfEOcDEsrzbznfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(366004)(376002)(396003)(66556008)(66476007)(6512007)(956004)(26005)(52116002)(2616005)(83380400001)(5660300002)(2906002)(186003)(6666004)(316002)(16526019)(8936002)(6506007)(66946007)(8676002)(478600001)(36756003)(86362001)(6486002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?szXlKy2RQF/Mb9VITe6W/RXeliN43waTcnqXp0zr8GSKbjwGXVU5kREs9q0R?=
 =?us-ascii?Q?Yj2rB5ejBE3zT0uqXmLoUViPPlrgCseOVNTMRNRrQhQ4iLzNTync4V6HMUnX?=
 =?us-ascii?Q?WrkPTEMhwbjyFvBzYOwd8Wrs7gQxs9KOY1A+qgonpUX57J7wIr9oOjVbkdtd?=
 =?us-ascii?Q?M3eW4t56oU1bl3cpP0UXnZpbTnaCSBgI+rgN5g00TE/rL/lxtW9Nvs0gNWdJ?=
 =?us-ascii?Q?56v3ceYhYygOPKwHh4QX4cEHrwtx8Q4lpluY3obyBizJWgaXHCQRgYSpWn4T?=
 =?us-ascii?Q?hJcrn77+ZpU4kRL3KGOSflai/RxKYozZydDg2CsQtxxeEL+z7V/XqLmu7lA9?=
 =?us-ascii?Q?pKmVc3Iq6f7Vge5BuNnMy9Pv3Z1/umRorBNQs0ZL+Wh84cdDxjgnwyBOBaQq?=
 =?us-ascii?Q?b0V1lwygypKhRHQOncxXObRcw2Qlq1w5RoWFXtnYdmW6brDj4h79l1LS8OLg?=
 =?us-ascii?Q?k86S5blzsW3m2sOnZ6VP6fs5bltlv571hSHjNtt0OdsI/OxfTMxYBNMXw/Vd?=
 =?us-ascii?Q?kvsgxMkl5XjPl0sFPsbt8gCInCBtwaosYqggGye7D9BWTj6l6VorZ/+qXoym?=
 =?us-ascii?Q?/odnkUyyIo5Je8EcH5kqq7pXDGp0TzzP2Bgr4U7+aiwbF6rplqPiuekzDuR7?=
 =?us-ascii?Q?a1q4uc6VfFt1nQUWiKRd6VV6Uk+v5ALJe1WYqW4Lhgv8FZjeeEpxMDcDpliq?=
 =?us-ascii?Q?J0AloxuhiGi2eHuUvyr1D64A0RLFV4/epaIoQnn51Kl5ntAEqSWuOdMLx7AC?=
 =?us-ascii?Q?cTw0/gooxexByPvw4SBK0Kfp3CRQ7tV0QdB98BD0N7vKP7O/0RmcXnQHzY7E?=
 =?us-ascii?Q?K0N2bp8Q1lhy1UzDqZ/VzX5qGM7KLDpSma/yFHzeAC3ZEIETlRWJBU8aE8eu?=
 =?us-ascii?Q?dUqRK4Cn0CfStKBsaokknxfWFO08bWR40EkpUXRO/tLg9AMSsrL38seMIULs?=
 =?us-ascii?Q?aF77SLx17Le8RdjR1PwIlaZSz04/mMb9eDdvXIZuLBNBy3vsqHLDYU/6PvNX?=
 =?us-ascii?Q?j03uX/d3EbKCP5hiALzzVIuYIjYnadooztISIitAVyo+VNW6VZSlSLV6eP8o?=
 =?us-ascii?Q?cmfVERRk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee2b113-1aa6-401e-882a-08d8c79c3615
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 17:01:41.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ71ZS49nr6cF952bxTZRcJODMoV6EFrbVhFSph3a8vieJ9nWmsdJmmZT9eaaSvOTT1wTznTadc/vP9x2eX80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4103
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller lost its power during the system suspend, we need
to do all initialiation operations.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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
index 605a413db727..8b04e030df4d 100644
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
+	int ret = false;
+
+	if (cdns->version == CDNS3_CONTROLLER_V1) {
+		if (!(readl(&cdns->otg_v1_regs->simulate) & BIT(0)))
+			ret = true;
+	} else {
+		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
+			ret = true;
+	}
+	return ret;
+}
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

