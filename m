Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60033313996
	for <lists+linux-usb@lfdr.de>; Mon,  8 Feb 2021 17:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhBHQgk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Feb 2021 11:36:40 -0500
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:19673
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234435AbhBHQgC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Feb 2021 11:36:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4itXiPqRddSb0FFp0oFc3pQW58IW7rdMrm8//GS9m8RpSMDO+sjjoIW34Pv/JJrkdUsHQbo9wOVVOsva3CKB4ZCk7+TNKD53HcU6dNysgXtVZh5W7M5791tcj132OWlT1haT6TAWsWPQJSz/FQv5BXlS35RBmHFND2WRVdU9xtP2cQd63FZlC6iJ4jyJBNjMXduMMCNONWHNYZy7cw1f69Qe784+qDVBMZaexO8GGbsvr7rtabwByDQ0ywBa2YYvnu6Va+su79i18wjfBW8+zcrhQZzbx5qauw23SsbHGnWlLRHBVvX8FCFNXBfz5vM6BueeXgtpUNh48mV9odoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXYy4hoYFnIglhiBQ1rZZDE5cy13CtNfQF5ycNXVATA=;
 b=mwzLrEfgHolSBRook63gAf2yNGyNjsdiOPqK+qEmkcPvgNJetkkYdr8zUZTlpvD38NeSdG58d+kDd3zfhYNbxwEjtAvK/tbzBM7ZeQL+sL92nMwbFLGCvx+MCGwCErPQbSKPcQMX3+gef6ADO+ebk0z8TO810+lQjOVvTHoL4SiD1OxPwUtm9I5HunOUVN8YewtMn9YkLnhM3iIHlTYJHx8upYc/SOUj7ktQtDWEaQbOrwmLr4azspBF+YeDdIpffN+zif4aY18/25GlCyivTRGZI2kzLyaI7ZCgOOpat6kp/JYsC/hDqQh3UJ44YlJNkvidfKWjqjqs5g9jS9IF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXYy4hoYFnIglhiBQ1rZZDE5cy13CtNfQF5ycNXVATA=;
 b=jnLGFf44BAgLkxCjfGQFI9jg27Wm7Os9Fu0VqZYuXAozE0TXRgYis3XLsAfXSvZtu70Bti/WI00P97JLXspmgbB3z8sTYbsYvamX3N6vHpmPPRnA+S9Va3oS35FcJTh9esxLeWG0Im26QGCp/8UwF3H9IGg4p0yiTKGJkIOC3C4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 by AM6PR0402MB3845.eurprd04.prod.outlook.com (2603:10a6:209:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Mon, 8 Feb
 2021 16:35:09 +0000
Received: from AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e]) by AS8PR04MB8053.eurprd04.prod.outlook.com
 ([fe80::b8d2:f45a:dfd2:588e%4]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 16:35:09 +0000
From:   Frank Li <Frank.Li@nxp.com>
To:     peter.chen@kernel.org, pawell@cadence.com, a-govindraju@ti.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, lznuaa@gmail.com
Subject: [PATCH v2 1/1] usb: cdns3: add power lost support for system resume
Date:   Mon,  8 Feb 2021 10:34:50 -0600
Message-Id: <20210208163450.30374-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.24.0.rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [64.157.242.222]
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To AS8PR04MB8053.eurprd04.prod.outlook.com
 (2603:10a6:20b:2ad::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lizhi-Precision-Tower-5810.am.freescale.net (64.157.242.222) by BY3PR10CA0016.namprd10.prod.outlook.com (2603:10b6:a03:255::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 16:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c53d285-e888-4e15-60ac-08d8cc4f7f8e
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB384588A2FA8C2B16648EE344888F9@AM6PR0402MB3845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlss+7O/YWk8SN6QQ+qcrj8L47atVXmI3Tfiq8xIE1yDfLG8FjIIW+m8kBCOm5fjnZI9rxiQSTNoK1RZIVusa8S1L+R77wmWf2LAQhfAnifbm2E+81sSD9aZzWlHJDuYc6fEpqkuuvfABVQ5R9buAwH8fOaGDGYpnv87im/MgwNg2Q47FlNYO2IRWk6DhLQFdoXlhjg4oLaeW0NOgbL5gMTnqrIXhn4C+C0awaZRSPwLfTupqIHUTR/efxOD68N8nMvTFIyQ2bGDjvtczLu51BuTyEc2x/PJf7ULQnG1G4Nlcp5fracj2DvI0/a9c2gwTii+KtaOOT48/DFN6OmWobBvoe4TPCDia+CYmOJ3sEe+UMxFDhvtGeDRfnVfWJpCXyalkIrW7z89xdqMTrp++gN0sMY8qZkY9/sShkfPR+H1oeG/aTv5n/OCk2paJG7rvExYtffE8o+Ha4kg9X1nZmxIdWuMaDVhl10V0pUoPkshakJIKGy5o1nJ5KkcfsFFhWBw6+mHLXB8+PxsL1u7Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(86362001)(478600001)(1076003)(26005)(6506007)(2906002)(8676002)(6486002)(6512007)(6666004)(2616005)(186003)(83380400001)(316002)(36756003)(52116002)(16526019)(8936002)(5660300002)(66946007)(956004)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bv/YW9OGAZI95mdFsSID+6Scnb3Hm7+onq39xwjqPdoFDbYaPN5cesgwv+yY?=
 =?us-ascii?Q?dlgsej2tWhNjF/r7DDRyTvhkwh0an2RmdC6tcOIp+NbMO11If/z8X4E1KKDZ?=
 =?us-ascii?Q?OddFYOAjR7a3ESbmBnGvmB+AAeUnyIL3DtJ10jsOPYkarmT1NxNp9aw4ti2X?=
 =?us-ascii?Q?muBKuD/C8HkV3FKJeU6RXyi/Sd9aQoEvRp0HLBxlxl0IACNaD1eOgSASVlMI?=
 =?us-ascii?Q?UMcqIhulexJuer0pfeVJx9r+YzLe5hCEo+QervGEH1SWODEKaMObSk9DGJAY?=
 =?us-ascii?Q?j3UvwAYB+NpQbITSk6otMrYfJW5WYeLTqiJRd5cI+s3x+rNpL5h6MABG6aet?=
 =?us-ascii?Q?yCsig+WOM0xJz/GXze2FpktDSp1hwOe/FB27EQtYPFvhxcU6gonnmIc2tWRa?=
 =?us-ascii?Q?Cun2UK8AxKLN7EJZWsAIYCzKL4CEqm+OFFDZkiFMqkHWE8AKCPacyNTRtSxU?=
 =?us-ascii?Q?U23rTKEPOOQd2ty5gB+udhMuURieluF45BDxhZg8b9xdAmIwArVccFzcKeTb?=
 =?us-ascii?Q?PCzHEsKY1/pjVJ2YLYXDNlGprMLLn2KXcOKIYAZclKRCx3a4UYLHAv7AVYSg?=
 =?us-ascii?Q?MUEHVruUUuOEP+C9QfEuWfPy4GdltxpWfsmUhytWifMGVTos1IJwT3fwzrMJ?=
 =?us-ascii?Q?bLKTlVN9B5SgfKjde7fnrQMPPXFyyR5efLsV36x1/ApV2NG1W043MblbPXMd?=
 =?us-ascii?Q?lwAimVBqitnaf9VI9Shm+cb7ATKj+HqeLlUHZ1KI9CBLOZiHtLuuFOpVAhQf?=
 =?us-ascii?Q?JfpEsBhdm7LWQ4O0Qm05BEGsMYkn9GxPELRhLTPNmRM8jnjgbfeEuibGC5qE?=
 =?us-ascii?Q?VPjgoRy6Oxx2YPzF7fXBOauEL1e/VC7l34f4LpDimCmW+uqV3WKuJ6DT6OuC?=
 =?us-ascii?Q?GUdNXQgpTyKm8v47jN7aosSM9JotwQLSeq4TcmpX3Us8k1ke8Zw6WrWknMD+?=
 =?us-ascii?Q?7y1tzmNd4YWtPQS+m7PyaEFvNWAWcpiNaSY1dn60ud4VtaB6woJI2njpLd/F?=
 =?us-ascii?Q?pwx9z1H/pYQgbOaI55kJXcot+6ZPMVEmt63ibsauyAv9i1Mdkjfm9SlGJ/ks?=
 =?us-ascii?Q?dwc1jfzGuxlyKRv9nxSJyUiwAx6tSwKcgn1wA2/02bcaFub9mHhtVOET6LAb?=
 =?us-ascii?Q?A3GK7QTzWzOEN44BcxyvANGI8V95WSNF7UnjTm3zAeEQlKaDbtAqm2DrWPAJ?=
 =?us-ascii?Q?HMrVUFmdNGS1Z7tx/Mwm678DMBrirN6F3qRqdhV7HbDHLn6uryhAHvYHGm0u?=
 =?us-ascii?Q?60CI5GOvNgKCRJcSib/n6c5EW+LErTf83w/010h6kVhJgdDUNfjqcMpwY6nx?=
 =?us-ascii?Q?ZzQelp9xDdIrtbs1DWFJAZRl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c53d285-e888-4e15-60ac-08d8cc4f7f8e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:35:08.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq5gFp7NafLpK7o0lz4dzgU0ykbQxFplJ2NxzOii0D4kkR+AAjmZuvRTLg7mmMDIdvl+HzNlq08UndcVreDm8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3845
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller lost its power during the system suspend, we need
to do all initialiation operations.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Change from v1 to v2:
 * Fix build error.
 * remove ret avariable in cdns_power_is_lost

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

