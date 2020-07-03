Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B1B21341D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgGCG1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:07 -0400
Received: from mail-eopbgr150049.outbound.protection.outlook.com ([40.107.15.49]:37606
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG1H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndMCHcb72uxzLLDA6t67PJ8EfbEKrSKZlIo1bF0B9ndkVIIIUMb3FnlHU4jurPBBgUD5gIJHDOZUpQQuxc2OTxuBXJM7ZHXbZ4KHcARQlyb1tOZddBXvQhkjWEFOaXcXhAQo4cz144mqQCMaWVZ9Y+airtHoB9CJckSWQZn3wE6iculujVag3jznIk6JsZsBs5zxZgyaYGq8ozmKI2uAfAD9/S5BSWYfAPFG7tSLt+Gw/SkaSuwmnfez27+alndCFQOqb02wmm3ssPXs0ja2A5F+MjFMVdMpeCAAxpnOmKiWk9WjGiw5DGKXl9As8wS4Be9CKyb1gF6fQn8kMKPolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9GYIe22OKl6mSqjFonDLm2mLpzCtfIAr1QSaRBCvEQ=;
 b=WHge1SVsgsefsf1Zq6FyvSnXAhsJdT3fC8oPcGbpilbYu6iK5G8E+uDnpcl5NrEywZFOgwxgE6I2eVuhe4yLa7ANIX6i+dh1hGw8F08WGhy1nfRofcTJjZeystgEZfDcXjskLOy2+IuWJfFpyej7cYHI9jmr+NQGtc/qJnkN0SeoglyJpIZDde4E9LX8ij9Jw4Kz3+dc38fzr45tibXacOGw10pFRuwSg94/3VGtOuG+CoMFFMy/3wdKtDf6PndKzD5MBXzRr39wdyd7M1m3EVQtYsWxSq3ziYGy+TQMSqOEBkv1GSaKcf84iyIrmwNzle9ikqbjGT5XasyzhKgOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9GYIe22OKl6mSqjFonDLm2mLpzCtfIAr1QSaRBCvEQ=;
 b=PvhmLKnJZef7jbk/DbQ97b3nFhA0tWXEIg6jMqcXf8RonCUkTfNvKlwKVdtI/u2HIzGqxxKt2/L7B6FNvfVmLGcZGUAq8ttIMgtKjKRXgaDFE+d95PoxKmScLpP69gduWTmDwv/zwJ573HCvPx/wZhUKuGgwE0SMlhWzN1zg2ws=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 2/9] usb: cdns3: add runtime PM support
Date:   Fri,  3 Jul 2020 14:26:46 +0800
Message-Id: <20200703062653.29159-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:26:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0bf0096-0a4e-40ce-b7e4-08d81f1a187b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41666D016F5BEFC69644F7BE8B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYs5HW1ZJF5wa/t4Wm7rpYN+S+ywikQawINbaSyO3J0LH2nhQXHlrGimc6EHc/zC7jOW4Zp4pQMF54e31TVFYip9MJNhHsW8xzkjtQg4OfMB5ntdHCODOKFkXPAT8pgcsyviuonPJUGB3GdzFYagiKMMXCcszM+Qxq+ARBexCCo+r5ldk8jcKevD5ZD2cx1D2etWnP4cLnYQlC60s1OJNMIN/e3+55AlZnKiUHXJ35Y0yogqvMbE8rSaFe0Yxgo/jtD6nDeN16EvYRKrKraiSNNvGU9d4uZpLyoH2I7ubSMIinuAY8xyAuHG5/KL4kqukjhGJQSmo3YaHSIY7mrZtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(30864003)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5IvKuDzUsO04vOtS7y06IYWJK6WUsadg/dqxBhyGU+s8X7f9Akixl1z6C+tnKeBuyD628VdzbWuqhdjPreGQmF69sTMapNgid5Ay38FLJIuptogU4+/TRuHI7XfmI6pfw4Qck5/9J1imt2gBbuntOfrMIo20g45rHHbPFhjMpR+ebNq2yGV0R1kpdZjj1dRsCN2O2a3NoDEUP+WgVNvfumtvMsgkSuhQ2rnGRR8A0lbLGBWeanvrZlydSuv2xyfPcJzvr/vjj65ugMUM6KBVhXWacnurMBqFvwB+bRFUEy5gg7cxJRtnDz5xDv+91+QbgQQc7Xnez5ZYDV1K3ytCg+qgtO2scIxt6vWvKQqzDfMXDqBoJHaV227/555v0QkvpkWycHSbs4bWue5cuBfAnM0+eHGNKmF9YmYqIXOzkZ18pzbS2CsEupxifSzPpmaCXcM1q91rpNpj+Z9tFMjT1fpRQabKK8p+IRsDzv3TmFE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bf0096-0a4e-40ce-b7e4-08d81f1a187b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:01.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCGv3/HkfB9rypb2vBMncRo0BbldCKvs61tXQl19N6rBRyWjkJ4GMaFV5E/Y44NR4anpWIL5e2wcAyBic773oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
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
 drivers/usb/cdns3/core.c   | 153 ++++++++++++++++++++++++++++++++-----
 drivers/usb/cdns3/core.h   |  16 ++++
 drivers/usb/cdns3/drd.c    |   3 +
 drivers/usb/cdns3/gadget.c |   4 +
 drivers/usb/cdns3/host.c   |   7 ++
 5 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index bfd09aa98c12..2fedb8044d8f 100644
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
+		cdns->wakeup_pending = true;
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
 
+	cdns->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
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
@@ -574,52 +623,122 @@ static int cdns3_remove(struct platform_device *pdev)
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
+
+	if (cdns->pdata && cdns->pdata->platform_suspend)
+		ret = cdns->pdata->platform_suspend(dev, suspend, wakeup);
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
+	dev_dbg(cdns->dev, "%s ends\n", __func__);
 
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
+	if (cdns->wakeup_pending) {
+		cdns->wakeup_pending = false;
+		enable_irq(cdns->wakeup_irq);
+	}
+	dev_dbg(cdns->dev, "%s ends\n", __func__);
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
index 1ad1f1fe61e9..1b1707796db2 100644
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
+ * @wakeup_irq: irq number for wakeup event, it is optional
  * @roles: array of supported roles for this controller
  * @role: current role
  * @host_dev: the child host device pointer for cdns3 core
@@ -62,6 +69,10 @@ struct cdns3_role_driver {
  *           This field based on firmware setting, kernel configuration
  *           and hardware configuration.
  * @role_sw: pointer to role switch object.
+ * @in_lpm: indicate the controller is in low power mode
+ * @wakeup_pending: wakeup interrupt pending
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
+	bool				wakeup_pending;
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
index 7c2913bc8bd7..0111fba95797 100644
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

