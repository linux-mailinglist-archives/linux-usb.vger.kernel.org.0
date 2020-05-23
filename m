Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369781DFBB5
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbgEWXXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:07 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388010AbgEWXXH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLGUJ5a7JSGEvf/BFJ5epbZcnMoEwnjDLjGCJFJ759VbxMPbDvMn/6QZq/LZef9qfMgjQE6SkisObL11SULjud/y7DuwaWjOYbgrLp1V/BxaSDtCzCHCotz+Z/VCnuS2rIS9nbuP71egSy0j+GThH/tpB0QIcUNT9rBOXGAF18DXgjmy6zmCmORXq4id2BiYhN9mmwNENR4+3vztC5SmvCVt3vf7ZdxfRI3DFPm3tQJpgvX2hyiK4AgP8+PTUuSYLomjX+AEvq3gnvo7PH4au1vLwY9cj6uXUJejcgNprMNPNA93TFzYnVvteL4O8toWpdScbuuJxf/C6Mx+OBfgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWf+sEZnIKU+XEeDXp2XhnWdxSDkWIzISJWNdejQ5m0=;
 b=LwzbyFSotYNT2M1Lz3n906H/6EkXVy7L0VPillqRLzal8DyupKmkR8Tl2oe4i/Jk98w/Ez4SKnFtWiMMZSouhQdz7NJsmq97g/XtrHw3Z7pfxHkd6M/0zNJOMc39KOlcrwJA0/UmEH7Vms0QaWxtyckMNATk7C3lRkpMWOsf3TnJo99eGwHMNvm4BTSbxNstFmV67J0RqzZzBZDc0g/YCzDER3wr0yqoHt3SbsyUYRBINDtxCGVW6damoGIN1o0Evia9EX1fyuWSBdt1aukn7mIv6jJLoeHzmMh5CAZu8dTI/GnSTup1fEE+7K9Wuczr+GMwWa/8spRXKI3z8nlNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWf+sEZnIKU+XEeDXp2XhnWdxSDkWIzISJWNdejQ5m0=;
 b=NoVA5SR6s/tHiyVGOztwn/Q4wlXjULlaBUwoe8ofdX5HSk9oYufdetn/8SQYoCYIdPca3G+vNGsID/gPHerDqZWRRWW3pOCiJOgXwPDabA1Kd+8dgAKhnIY8Hq179VLBQcaFhJPlt0TbrhT9HM4ZczHtNfeAcolOB5nNTzKvtFE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:22:58 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:22:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/9] usb: cdns3: add runtime PM support
Date:   Sun, 24 May 2020 07:22:57 +0800
Message-Id: <20200523232304.23976-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:22:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 711a7cd9-47dd-4caf-f4d2-08d7ff703a6a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB691859FED652CFC740BC6DFD8BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShV/b0k0mSAduAQdYAFAuYtGgkqr6iT/dZzXMJTfXA1CvNywYkyIB1uQmEV8nnComYfxRxQqQ81DZ7BGskVTd/9iYoV9yK/KvCRlJpr39VA9GeWXFT4MHx/t4oPHHvkHfhP4X5h+yAdZP/kM9glJD8PzL6lYv0RyAE6lNMpaLSuem+Un0fhziGILADyuQdwp9eUNLrOzfenr94Wh4FY9jcdxKIIGIe98VbfKGqVSy91r/m/E8E1K70n6gs+VwBCkdWccmCL+gievxKifK89k1OUr77tJzjV7EjJBEpQ3HvuoZoJKkFbhGAWrPpBD8na3NQ8vMcBkcxXMeAt0rZoFSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xiniNINaCVNg/wUIudeAWiX6RGGLMEctJOdxg/ngevpka4Fl92l+8hFAKVnv78KW5vRWMtoqRZZd1ZsMRLfkO8bZWXgx36F8YjQE5Ej7LoAmgO7HwwaGNKJkvczmjHG/MwPWwctMOyUVUAb4T6gv+AVgFcOcsRMPoo9teT/GRjWB14m/lPYxXDNG0xjfvE+Cz2fvr184fSPdbezxppVWKkl6uWvgPxDzB5RHrivXOp9I94VcgK/dbcKGHBGLd/rkSLO4ydDImfsoHFzqD1pYt8iQQ0Cq1cDCSYffE/TyScev9IMXKdmLgtXV3+97GOmklYROa36ldvONZddkKUSrTkepR9Qw6B+yd1xayIEWbzj3QUaClqFkdHdoz6YJgmgy6ONYgawimmU1zJx9nXngEgg2jvgodQSQL0R7qrWVviMolvqN4hbDc6+tf8UWevYRTBIdKxRE2M0ck5sLJrm4ALECx3NSq+aJcWoVd8fUx3w=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a7cd9-47dd-4caf-f4d2-08d7ff703a6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:22:58.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVXCOiEqmg8vwH2YgbO2b/c4frsD8XV+lTR4fMBZsyJroDn8ILBZPfU1wTAYLUJoam7Kxv2MJomznOceYoflkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce runtime PM and wakeup interrupt handler for cdns3,
the runtime PM is default off since other cdns3 has not implemented
glue layer support for runtime PM.

When the controller is in low power mode, the lpm flag will be set.
The interrupt triggered later than lpm flag is set considers as
wakeup interrupt and handled at cdns_drd_irq. Once the wakeup
occurs, it first disables interrupt to avoid later interrupt
occurrence since the controller is in low power mode at that
time, and access registers may be invalid at that time. At wakeup
handler, it will call pm_runtime_get to wakeup controller, and
at runtime resume handler, it will enable interrupt again.

The API platform_suspend is introduced for glue layer to implement
platform specific PM sequence.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c   | 119 +++++++++++++++++++++++++++++++------
 drivers/usb/cdns3/core.h   |  14 +++++
 drivers/usb/cdns3/drd.c    |   7 +++
 drivers/usb/cdns3/gadget.c |   4 ++
 drivers/usb/cdns3/host.c   |   7 +++
 5 files changed, 134 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index bfd09aa98c12..5221c1306e64 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -432,6 +432,7 @@ static int cdns3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	cdns->dev = dev;
+	cdns->pdata = dev_get_platdata(dev);
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -525,9 +526,11 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err4;
 
+	spin_lock_init(&cdns->lock);
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
 
 	/*
 	 * The controller needs less time between bus and controller suspend,
@@ -574,52 +577,134 @@ static int cdns3_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
+#ifdef CONFIG_PM
 
-static int cdns3_suspend(struct device *dev)
+static int cdns3_set_platform_suspend(struct device *dev,
+		bool suspend, bool wakeup)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	int ret = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cdns->lock, flags);
+	if (cdns->pdata && cdns->pdata->platform_suspend)
+		ret = cdns->pdata->platform_suspend(dev, suspend, wakeup);
+
+	spin_unlock_irqrestore(&cdns->lock, flags);
+
+	return ret;
+}
+
+static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
 {
 	struct cdns3 *cdns = dev_get_drvdata(dev);
+	bool wakeup;
 	unsigned long flags;
 
-	if (cdns->role == USB_ROLE_HOST)
+	if (cdns->in_lpm)
 		return 0;
 
-	if (pm_runtime_status_suspended(dev))
-		pm_runtime_resume(dev);
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = false;
 
-	if (cdns->roles[cdns->role]->suspend) {
-		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
-		cdns->roles[cdns->role]->suspend(cdns, false);
-		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
-	}
+	cdns3_set_platform_suspend(cdns->dev, true, wakeup);
+	cdns3_set_phy_power(cdns, false);
+	spin_lock_irqsave(&cdns->lock, flags);
+	cdns->in_lpm = true;
+	spin_unlock_irqrestore(&cdns->lock, flags);
 
 	return 0;
 }
 
-static int cdns3_resume(struct device *dev)
+static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
 {
 	struct cdns3 *cdns = dev_get_drvdata(dev);
+	int ret;
 	unsigned long flags;
 
-	if (cdns->role == USB_ROLE_HOST)
+	if (!cdns->in_lpm)
 		return 0;
 
-	if (cdns->roles[cdns->role]->resume) {
-		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
+	ret = cdns3_set_phy_power(cdns, true);
+	if (ret)
+		return ret;
+
+	cdns3_set_platform_suspend(cdns->dev, false, false);
+
+	spin_lock_irqsave(&cdns->lock, flags);
+	if (cdns->roles[cdns->role]->resume && !PMSG_IS_AUTO(msg))
 		cdns->roles[cdns->role]->resume(cdns, false);
-		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
+
+	cdns->in_lpm = false;
+	spin_unlock_irqrestore(&cdns->lock, flags);
+	if (cdns->wakeup_int) {
+		cdns->wakeup_int = false;
+		if (cdns->role == USB_ROLE_HOST) {
+			/* Trigger xhci-plat.c runtime runtime */
+			pm_runtime_get(&cdns->host_dev->dev);
+			pm_runtime_mark_last_busy(&cdns->host_dev->dev);
+			pm_runtime_put_autosuspend(&cdns->host_dev->dev);
+			/* balence the pm_runtime_get at cdns3_drd_irq */
+			pm_runtime_mark_last_busy(cdns->dev);
+			pm_runtime_put_autosuspend(cdns->dev);
+		}
+
+		enable_irq(cdns->otg_irq);
+	}
+
+	return ret;
+}
+
+static int cdns3_runtime_suspend(struct device *dev)
+{
+	return cdns3_controller_suspend(dev, PMSG_AUTO_SUSPEND);
+}
+
+static int cdns3_runtime_resume(struct device *dev)
+{
+	return cdns3_controller_resume(dev, PMSG_AUTO_RESUME);
+}
+#ifdef CONFIG_PM_SLEEP
+
+static int cdns3_suspend(struct device *dev)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	if (pm_runtime_status_suspended(dev))
+		pm_runtime_resume(dev);
+
+	if (cdns->roles[cdns->role]->suspend) {
+		spin_lock_irqsave(&cdns->lock, flags);
+		cdns->roles[cdns->role]->suspend(cdns, false);
+		spin_unlock_irqrestore(&cdns->lock, flags);
 	}
 
+	return cdns3_controller_suspend(dev, PMSG_SUSPEND);
+}
+
+static int cdns3_resume(struct device *dev)
+{
+	int ret;
+
+	ret = cdns3_controller_resume(dev, PMSG_RESUME);
+	if (ret)
+		return ret;
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	return 0;
+	return ret;
 }
-#endif
+#endif /* CONFIG_PM_SLEEP */
+#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops cdns3_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
+	SET_RUNTIME_PM_OPS(cdns3_runtime_suspend, cdns3_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 1ad1f1fe61e9..9eb8aeea2d20 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -38,6 +38,12 @@ struct cdns3_role_driver {
 };
 
 #define CDNS3_XHCI_RESOURCES_NUM	2
+
+struct cdns3_platform_data {
+	int (*platform_suspend)(struct device *dev,
+			bool suspend, bool wakeup);
+};
+
 /**
  * struct cdns3 - Representation of Cadence USB3 DRD controller.
  * @dev: pointer to Cadence device struct
@@ -62,6 +68,10 @@ struct cdns3_role_driver {
  *           This field based on firmware setting, kernel configuration
  *           and hardware configuration.
  * @role_sw: pointer to role switch object.
+ * @in_lpm: indicate the controller is in low power mode
+ * @wakeup_int: wakeup interrupt occurs
+ * @pdata: platform data from glue layer
+ * @lock: spinlock structure
  */
 struct cdns3 {
 	struct device			*dev;
@@ -89,6 +99,10 @@ struct cdns3 {
 	struct mutex			mutex;
 	enum usb_dr_mode		dr_mode;
 	struct usb_role_switch		*role_sw;
+	bool				in_lpm;
+	bool				wakeup_int;
+	struct cdns3_platform_data	*pdata;
+	spinlock_t			lock;
 };
 
 int cdns3_hw_role_switch(struct cdns3 *cdns);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 58089841ed52..292ea248c0ec 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -278,6 +278,13 @@ static irqreturn_t cdns3_drd_irq(int irq, void *data)
 	struct cdns3 *cdns = data;
 	u32 reg;
 
+	if (cdns->in_lpm) {
+		disable_irq_nosync(irq);
+		cdns->wakeup_int = true;
+		pm_runtime_get(cdns->dev);
+		return IRQ_HANDLED;
+	}
+
 	if (cdns->dr_mode != USB_DR_MODE_OTG)
 		return ret;
 
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 559e5c01c2b0..ccb257d9daa6 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1766,9 +1766,13 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
 static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
 {
 	struct cdns3_device *priv_dev = data;
+	struct cdns3 *cdns = dev_get_drvdata(priv_dev->dev);
 	irqreturn_t ret = IRQ_NONE;
 	u32 reg;
 
+	if (cdns->in_lpm)
+		return ret;
+
 	/* check USB device interrupt */
 	reg = readl(&priv_dev->regs->usb_ists);
 	if (reg) {
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index ad788bf3fe4f..b579ef15f4e0 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -13,11 +13,13 @@
 #include "core.h"
 #include "drd.h"
 #include "host-export.h"
+#include <linux/usb/hcd.h>
 
 static int __cdns3_host_init(struct cdns3 *cdns)
 {
 	struct platform_device *xhci;
 	int ret;
+	struct usb_hcd *hcd;
 
 	cdns3_drd_switch_host(cdns, 1);
 
@@ -43,6 +45,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 		goto err1;
 	}
 
+	/* Glue needs to access xHCI region register for Power management */
+	hcd = platform_get_drvdata(xhci);
+	if (hcd)
+		cdns->xhci_regs = hcd->regs;
+
 	return 0;
 err1:
 	platform_device_put(xhci);
-- 
2.17.1

