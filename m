Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C061DE478
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgEVKcx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:32:53 -0400
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:48672
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728489AbgEVKcw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:32:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BV7uY51bkk7GTE9+Hc8/MHRTjEj7MShSkI7kcGgqFIdH/elmeBg3aC3CubWwpq9vSUTDvw+Aff7W+Nsbmtmkrjg7eIu8QwHkfajt21lV+hCn8UarEhSd8gzE+zl6f6WgenuUmFYxXIwQ/iD5eEKzfkZe/6kezaSHIU3pQGQmOXYj5rPU2ANwesUXtQnKhvuqQA5osx2lKejS2ku2ROfJazL9vM50twzPu44KPJ7FsH5o+bMFGjND/48ttpE6xvgT2N9xqn1VcSeabgA6sdflTQzUYwPdpnzzjLiVnd68bNOsnmK79b9Q1PctVwEozYaPveOz9xc4FIBKLciu1MSM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWxAKQiZlWT2as0dNVObnYfurRtCPh6FYbJM5rpI/wg=;
 b=IwSL3Fn1jNZTAKaO6lWs7JlmFX2N50w9w8AMMTG+VMQgkuH12ae/EoYsOqpjI9I5Sly1I/k4Q+VMClTOtNAKecPqqWmyGen0EOEnFmlfrjxbV7E6zRzYlNT0+cA3VYbGvSkm9wQudASwG/xJ5YQomeBE2yFUEUDfeGnBvmyRecuiP1JWN2/YI4tS5Ah2rUIvHov+aOn0uNGxNyYNKVVyKO+IbhhPcfEn9avr5VcQJuU4Vk2/VQ91i3AyEP08INoTPCkPjePxM0ZVuBqNmmC9K7f20PM1v+pSqKCNGYWKRQlmezaKj+sMn2FCj3qjMwfUfCYfjvS70ny7Kt3GxZHTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWxAKQiZlWT2as0dNVObnYfurRtCPh6FYbJM5rpI/wg=;
 b=Og5qSi6BhvWayDhLkpRMdW3+4G5cOvqjFPGm5RZZytIs1osT3qOQQGamPocNq+az4QON5s75x+dJKzK3NzNYX+yJvCwFlySdWcXG4umDu8THdDBzoaWHcIiPLkoU8jhWlu/43jdqXRPXd0uOJnO780Bq3rHAwmpRjvsM++PmkUk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7111.eurprd04.prod.outlook.com (2603:10a6:20b:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Fri, 22 May
 2020 10:32:48 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:32:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/8] usb: cdns3: add runtime PM support
Date:   Fri, 22 May 2020 18:32:49 +0800
Message-Id: <20200522103256.16322-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:32:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 935571b7-23c3-4d5a-9018-08d7fe3b7884
X-MS-TrafficTypeDiagnostic: AM7PR04MB7111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71117855493C7920326E3A3F8BB40@AM7PR04MB7111.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKAl3xfJz7xtc7B2xGxKtPk7czZbXsnKC859MJ/eY5seyFR2CoCcCditFNsoNNPgJmwdoR2lN3TO18SFeNKsM1z/c50xwlAcu5J//7kA/b667AFxx2KJ3JdzsR0eEvZwq7jNi3lC057EssEtrgJhLPOQn8MD3qnCxndmBP+6d9UDdvrBjxJOCFmBYtdbFaG/aQbU1v9dM9K4vjnobxNl8mZoZydmgT7al+MYACNR6b+Bv+rkOlyFgiayjGWlVtDLtT97WCkJL1v+9ew+7LbcRx40Cl/I/VX0e2GuGP77m8gPiHVJm20Nkv+flADTxcToMimrw1u3zT3tiFRRRZrrGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(8676002)(6506007)(1076003)(52116002)(26005)(6512007)(5660300002)(16526019)(86362001)(8936002)(66476007)(66556008)(36756003)(66946007)(186003)(6486002)(2616005)(44832011)(2906002)(478600001)(956004)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MqpsWpF5aFcwu9QlybDxsVgz4xv4/hUMBlLLWcK1T3CVQEfrSxnhBwvozyKJDD5oX+IPv9d8vN8AFahncfaU3WlSQd7Wru20DQ/PLOyNpQDhypnJkbcdM3jCADQIjdPxQ4h8bYNnr7FjX1opDO1HY6PSm8Z422kGlkXDi2t7sphiiatjA5ypu6YF1oxtZELUyeTYIGd/HCQdEtWhyAakYLA7uLKcV+uCHxZ4U88zfRn9dyxK2wh7Hhso0Ag8ZqN6iSd9+b5o2YP0IVQDXkBzHjPESkJYfsAw99zI3NqDZbVCZ/AVKsaBuN2pfABCA+XExPh4S4oZ/tR1asUbemaSbzOY1B6wXkOrwP9DiAWF3s0G35MIBtrbneaIydJZWGO8Qob3R6b1Pw62VzDmd1/DVx/xPZGcxnyhBQb3dhxXUpdyCYQviXin7dugpz/oM92vXZTETH1/Nk4eqY6RALYYWrmckDnNOEtadaF/1id9eRo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935571b7-23c3-4d5a-9018-08d7fe3b7884
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:32:47.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnYEiD/hFgI8SpbUn/16M0fkTDEppI7HPGMpF7/qmz+TZyVD+BnV/hnAP2So/JeJjC82p1FbU+CaIDLs8b5a7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7111
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
index a6723f46d509..2cee12195978 100644
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

