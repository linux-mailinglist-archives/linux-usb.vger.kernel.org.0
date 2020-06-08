Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328BD1F1341
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgFHHKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:10:51 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728953AbgFHHKv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:10:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7o9sFzeg4XHmGsbs8efJhexzr1MhRgHponvfY/dRt4gNj953M6LKRg4BuxabQYa12zTdpmIPDYpGnhqZ1fE+CTO31JZ1gJcb6DBNpcd5IBEf2dUW08JJJmI84BeZFqpIqaiB8GpjyThg9k2nIynJFVnx+73aSSsasjqnJgmMoJc1C7x3Owl4sqsnOkaznjNmK0gzctCWCFRwN4anjai4d33PIpaPWaGTjj9gYX/V4ksufAmVxOFuwqhoWLT0DJz7n9dDaNILTMWyltsyTTnBPZZnQS7x9t4c8sIQ4XUHwgGqhDX18Yl3t7Mk/QmE02GoMpsHME+fI1FCJ9x+muaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFsdOWC2RtuvlH+SmYxO0nQFscdERANrW+YKeb0rwNA=;
 b=Bg8mgHSIEiPBXLOWspoYlK4Cz9/knUM1B96+EH+stnt1rxAt42SAfOBTuxSnl2Ve0i1Ty8NdWBPBOS5iNCpnGoEzflivJjOg+4wrbL+FPkQg6tniTXz8gHfbFrT1W/RxI7VzRayB2Zno3PVEJQEsHqoUwJpeIdNIVG74Gq6RA7QtnPcjS1m7JoJpR9EypXYiFd9JIZWLEH+boLqP44AWn6Ch5pvnBQjUbRGFBbcWWEJaWYqoYUVYTOQIiEN3zVV9AnehoIDyu9keCKLmwGM0Gjzf1wEhXeFYD1M/KvGPSKIWbTHB+RBoCmFuBXB8qtWGZeEv5Eo3vq7ESLt7veeDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFsdOWC2RtuvlH+SmYxO0nQFscdERANrW+YKeb0rwNA=;
 b=pG5ehIk45JPmmjcrBJngn5KY9wC4Y21+Q/s4648ovMxsQlTjAAwimJrcuSnCGT8pTq9nH/s75SIi1VpgQgUcPt6kdwEOasOALJOqESAUfEnV2DjH2BTL9QoN5rOUvFnBbZlKns0z4SYY216sRPBJiAsqAlqsYPlq/ZEjjBNPpDI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:46 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 2/9] usb: cdns3: add runtime PM support
Date:   Mon,  8 Jun 2020 15:10:45 +0800
Message-Id: <20200608071052.8929-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bab14727-106a-4e72-f47e-08d80b7b1070
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB687003A85F4A1D6B210BF4628B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nHgMV/HK2E6d1FFCM47l2AZe5u/LfbMirjkSBgLRgLpWikJtIqzgCwO0YsVzUJcLxAZHSCqYQ+BXEkupTh2AcKvVD2zfelKWyAFPV1QcbBL6Us7CKC8HWfHfsutXEI3Lbc8cPSPpY9NEvvcRLS7wg4eYOUfLsNVQ8zT1lIJY4zKO4bfoB+RpDvdvCatQKmOAzIGeuIG/8BbZ/z8d5Ml8r7FuJajGEdpMgfLv2USYF3qawdH33JIV2A7qkXDRPaFq0wd0IoKmamMP0p4UqYYv5U+EpPXZRSXuNEBWL5SuHYKPl7YIrn7AwqLD5BO8uEOZo9RDZWGtl5BfJTeymrxpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(30864003)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: THaa9g5aFAvfoWfL029lX1jjfRL7fNwDU2zs0mSFEpvU/bCBzAGIr/UcExnXOTjNIy1UC0Gdf/eMi/UGq4XkmzwkHjVt2Q+uyo4lG3ZghOZaKMdRTa2WLbszh2Yrr3GUNt2Z0F2YYrWZUDvR6k0rPPiUD+gpet2O0Tq5ba077oDKcbGOzCrve79uV6fcHbgQ6QusQhvHpwWgloEe/EJGQ3oLpsx239SXx0Y6+9uLM8Nl3q7xuM7wEen4tH5z4J1BY8tI4C6hypExtFT6WZ2Qlc8A1lfnqWGIbSxoyNGD49cNzCua8HjUIv8KDq3tQs7PWvhfjNdjzdZsNo4UX4WByexj8ivEW51HZLLY22caity/59MNImgSibOkGytkjGeTUeEUFNu8a0JJ/w1thpBy3yicr7Mz6A9TMJGUgGdscUnxNQoiXO7In5fafwA1dvYieotQRfVgJw0GZYmNQtJstM2DtpJlmmMl2z/HyVhr7fk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab14727-106a-4e72-f47e-08d80b7b1070
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:46.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msf9u5AdoCz2rlZf1c1qogN2JQwP1z0gR0dgdqY9PJvDWWBZ0FjIq3+APxwdSj0fFIaULyKVkuPYJB3aS+qLFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce runtime PM and wakeup interrupt handler for cdns3,
the runtime PM is default off since other cdns3 may not
implement glue layer support for runtime PM.

One typical wakeup event use case is xHCI runtime suspend will clear
USBCMD.RS bit, after that the xHCI will not trigger any interrupts,
so its parent (cdns core device) needs to resume xHCI device when
any (wakeup) events occurs at host port.

When the controller is in low power mode, the lpm flag will be set.
The interrupt triggered later than lpm flag is set considers as
wakeup interrupt and handled at cdns_wakeup_irq. Once the wakeup
occurs, it first disables interrupt to avoid later interrupt
occurrence since the controller is in low power mode at that
time, and access registers may be invalid at that time. At wakeup
handler, it will call pm_request_resume to wakeup xHCI device, and
at runtime resume handler, it will enable interrupt again.

The API platform_suspend is introduced for glue layer to implement
platform specific PM sequence.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c   | 155 +++++++++++++++++++++++++++++++++----
 drivers/usb/cdns3/core.h   |  16 ++++
 drivers/usb/cdns3/drd.c    |   3 +
 drivers/usb/cdns3/gadget.c |   4 +
 drivers/usb/cdns3/host.c   |   7 ++
 5 files changed, 168 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index bfd09aa98c12..97fb082ed3b4 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -406,6 +406,30 @@ static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
 	return 0;
 }
 
+/**
+ * cdns3_wakeup_irq - interrupt handler for wakeup events
+ *
+ * @irq: irq number for cdns3 core device
+ * @data: structure of cdns3
+ *
+ * Returns IRQ_HANDLED or IRQ_NONE
+ */
+static irqreturn_t cdns3_wakeup_irq(int irq, void *data)
+{
+	struct cdns3 *cdns = data;
+
+	if (cdns->in_lpm) {
+		disable_irq_nosync(irq);
+		cdns->wakeup_int = true;
+		if ((cdns->role == USB_ROLE_HOST) && cdns->host_dev)
+			pm_request_resume(&cdns->host_dev->dev);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
 /**
  * cdns3_probe - probe for cdns3 core device
  * @pdev: Pointer to cdns3 core platform device
@@ -432,6 +456,7 @@ static int cdns3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	cdns->dev = dev;
+	cdns->pdata = dev_get_platdata(dev);
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -481,6 +506,15 @@ static int cdns3_probe(struct platform_device *pdev)
 
 	cdns->otg_res = *res;
 
+	cdns->wakeup_irq = platform_get_irq_byname(pdev, "wakeup");
+	if (cdns->wakeup_irq == -EPROBE_DEFER)
+		return cdns->wakeup_irq;
+
+	if (cdns->wakeup_irq < 0) {
+		dev_dbg(dev, "couldn't get wakeup irq\n");
+		cdns->wakeup_irq = 0x0;
+	}
+
 	mutex_init(&cdns->mutex);
 
 	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
@@ -517,6 +551,19 @@ static int cdns3_probe(struct platform_device *pdev)
 		goto err3;
 	}
 
+	if (cdns->wakeup_irq) {
+		ret = devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
+						cdns3_wakeup_irq,
+						NULL,
+						IRQF_SHARED,
+						dev_name(cdns->dev), cdns);
+
+		if (ret) {
+			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
+			goto err3;
+		}
+	}
+
 	ret = cdns3_drd_init(cdns);
 	if (ret)
 		goto err4;
@@ -525,9 +572,11 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err4;
 
+	spin_lock_init(&cdns->lock);
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
 
 	/*
 	 * The controller needs less time between bus and controller suspend,
@@ -574,52 +623,124 @@ static int cdns3_remove(struct platform_device *pdev)
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
+		wakeup = device_may_wakeup(dev);
 
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
+		enable_irq(cdns->otg_irq);
 	}
 
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
+	}
+
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
index 1ad1f1fe61e9..fdbcf557a61f 100644
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
@@ -50,6 +56,7 @@ struct cdns3_role_driver {
  * @otg_regs: pointer to base of otg registers
  * @otg_irq: irq number for otg controller
  * @dev_irq: irq number for device controller
+ * @dev_irq: irq number for wakeup event
  * @roles: array of supported roles for this controller
  * @role: current role
  * @host_dev: the child host device pointer for cdns3 core
@@ -62,6 +69,10 @@ struct cdns3_role_driver {
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
@@ -79,6 +90,7 @@ struct cdns3 {
 
 	int				otg_irq;
 	int				dev_irq;
+	int				wakeup_irq;
 	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
 	enum usb_role			role;
 	struct platform_device		*host_dev;
@@ -89,6 +101,10 @@ struct cdns3 {
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
index 58089841ed52..ac90a484e63c 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -281,6 +281,9 @@ static irqreturn_t cdns3_drd_irq(int irq, void *data)
 	if (cdns->dr_mode != USB_DR_MODE_OTG)
 		return ret;
 
+	if (cdns->in_lpm)
+		return ret;
+
 	reg = readl(&cdns->otg_regs->ivect);
 
 	if (!reg)
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 7babba9dd916..eac01b1a4958 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1765,9 +1765,13 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
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

