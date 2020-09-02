Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE7D25A903
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgIBJ60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:58:26 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:13312
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726490AbgIBJ6Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 05:58:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA6oKOdIDmpFpTVZ/DaFcADNGm+VHJ+u+3NOqKmg7Oda/uPc9RJBV8i7T5+UJKS4ow/B5i5KhaBOHKXveW7qFMtHVv64PzHMrixfLyQbsRQA/4HEhMB58rH2fiEPysCbgxsUuNfqLwr9HkRSaJ2X+XzDLDMaIdB3bCVFbbf7BR1MzSsLnhTFtY2YCmcjGM9tznR7B+EV95IJ2n6NR0P4CZwH1isjgyvpnwJaqLj/x/KViRF6I4Ub6TsqyI0Kpa/cVcrb0XSdLJYGjlxzQzunInoFQ7IzvXbi7YyReYfSoK6b0lHUWEvgtB6f5Kkaaro8ngJHGc2nt7EdMnpeuncoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11RcKbxVViS0EnSBckxO57D0mEQ5RiOrSjDYP4A62EY=;
 b=fr47KOxlX6Q6BJHi9dJe3LiNG/nDGyvX1M3BFlANZ5/PAktxAA7hlFezkytoaS0QLlLreMoElbnAWnZk8QMgmA/QvPhzbEXsmNk3lAgXph30hbU3lSLh7oRKHj6qtP9jdBvzCFfvMfonoqLWjHyWz6KmAr9yQTFAKtZaO6FYbStNK+W2c2tRhABG4T2Zz5gIDdr4als84lZmTc9vmdjLZdQGup/dYG51/EHcVh8lLV6VWtd92k9Qtua2LbyQozTVXnzWYq2RuhX17VuC0tJ/d/xAqGuccSZNb8jGOMHSBqgIkNCZxwSWJIU9buPE4DhUxs62x+s+be9EqpOAFl4/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11RcKbxVViS0EnSBckxO57D0mEQ5RiOrSjDYP4A62EY=;
 b=rlDQzkIlFcnp7DfiSEdbfiVxz5HxB7NuVCt40ZOJArI9m9t5KRQAmqJ4XManLBE/76zlnkw3DilUWJONB4GQKj3cAK6hKSfK/wbd1EBC1KKE34bqrjcPQOQBx0821KHJbc4zGN5pfxJQKIKq37ApAHTRiM5vVg+cdItVl1AG/Ik=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2484.eurprd04.prod.outlook.com (2603:10a6:203:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 09:58:11 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 09:58:11 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v8 2/3] usb: cdns3: add runtime PM support
Date:   Wed,  2 Sep 2020 17:57:32 +0800
Message-Id: <20200902095733.3453-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902095733.3453-1-peter.chen@nxp.com>
References: <20200902095733.3453-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SG2PR01CA0164.apcprd01.prod.exchangelabs.com (2603:1096:4:28::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 09:58:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50f0f7b9-ee86-461c-aa4c-08d84f26b3a5
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2484EF01ABBB684A7DE5E3198B2F0@AM5PR0401MB2484.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4esLd7B+GtKKDosqp3ceSSyVRcAV/YDQPx84pbEWl8RzTIIKw7kVuLRT5hHjcrc+BmhdKllrsIM22KzwDtZjVYaVDTYgS0eUFP8P67MQ1jyTAKB7gb3g6YhMmpKRAm2S31b4HEkyQ8CWOSq8Yi3c2AYRMSgFqL416Jml+pvz13SxDm7lxAU1/nxLFjcXtA328Mi+392ulS886FZnmS1MrUXVSM9UvCo5lqrS4XIRLbYg+U8gQkDE/QoxN18T88xpS7JcdEFYYSWNA88oCDAS97hBDyb2ZL5rbiriEuM9gDkH+K0Taag99RcWXuwZIxaN1v9G0jkxrbVnQwVigJ0LSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(1076003)(956004)(26005)(30864003)(8936002)(8676002)(36756003)(52116002)(2616005)(86362001)(44832011)(498600001)(16576012)(66556008)(4326008)(6486002)(83380400001)(6916009)(66946007)(66476007)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QxcHccpnU5fhpqd0eJpU/xmc4UXKiujWMWtmIJLPEniwi/SMou6ba21bhRhg1VlyxHgtuKnXtoX8xN/lqP8QY6XO12es+//X2kgh4x7FM4XStXKYa3N4D9HY5HNciZHDLScTsevvAfyN79wEPUpcQagqP1+rnmmeU4IJOXeu8MGgp21w8ZzGpl2H9M9JiMtwl6tx9tqtj9X2pka89gbe+aIXJHUwpAzWCfglikL1/fkwNuyPuzlOmOnGIKcbr4yiz07LrU1Ovedp793kiMTbcppi6R7lJZnaDBRk5I1evRSln8oPtdayavqdql7YRYBS0w+8JEymy2FfeghNze+KKD6PIjhk7GLjZSDzITh76NiLxdDMPt54vMDRgUOEjnEEdkWyTSm032dS9GGhMiRvpqGAiAH4bOufVYcioBahMLwmMtJzj4Est9lug68tfjDQs0k28+FREn7TxHQY6NW/KDkg7ApoTOpapqsYO1TM86KWnBy54zOdQTgeTehatC46AktolhWIICI+hmdlfjlJsTM1YmPaRImwCAZvkEFQoa6d8VtmlVKApcpd2pKLvYZ00S1SO7sRebGYXTSdzW1JsdYwoFg+GLXiy2e3CQTJyH6Cdu/evDhb3KEEGY//WJMN8wZ76EAmWKREeLsf/a/76A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f0f7b9-ee86-461c-aa4c-08d84f26b3a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:58:11.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrWyUzBlbl9gU1EZaInObVXvxl/oqG8hAvXRWB3rTh4hEVGXQO8OcCrApEcnvKnZ4qakaiHqf1OdO0ocZhTo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2484
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

Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c   | 153 ++++++++++++++++++++++++++++++++-----
 drivers/usb/cdns3/core.h   |  16 ++++
 drivers/usb/cdns3/drd.c    |   3 +
 drivers/usb/cdns3/gadget.c |   4 +
 drivers/usb/cdns3/host.c   |   7 ++
 5 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index e56dbb6a898c..4cf815882c5f 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -392,6 +392,29 @@ static void set_phy_power_off(struct cdns3 *cdns)
 	phy_power_off(cdns->usb2_phy);
 }
 
+/**
+ * cdns3_wakeup_irq - interrupt handler for wakeup events
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
@@ -418,6 +441,7 @@ static int cdns3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	cdns->dev = dev;
+	cdns->pdata = dev_get_platdata(dev);
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -466,6 +490,17 @@ static int cdns3_probe(struct platform_device *pdev)
 
 	cdns->otg_res = *res;
 
+	cdns->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
+	if (cdns->wakeup_irq == -EPROBE_DEFER)
+		return cdns->wakeup_irq;
+	else if (cdns->wakeup_irq == 0)
+		return -EINVAL;
+
+	if (cdns->wakeup_irq < 0) {
+		dev_dbg(dev, "couldn't get wakeup irq\n");
+		cdns->wakeup_irq = 0x0;
+	}
+
 	mutex_init(&cdns->mutex);
 
 	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
@@ -502,6 +537,18 @@ static int cdns3_probe(struct platform_device *pdev)
 		goto err3;
 	}
 
+	if (cdns->wakeup_irq) {
+		ret = devm_request_irq(cdns->dev, cdns->wakeup_irq,
+						cdns3_wakeup_irq,
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
@@ -510,9 +557,11 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err4;
 
+	spin_lock_init(&cdns->lock);
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
 
 	/*
 	 * The controller needs less time between bus and controller suspend,
@@ -559,52 +608,122 @@ static int cdns3_remove(struct platform_device *pdev)
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
+	set_phy_power_off(cdns);
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
+	ret = set_phy_power_on(cdns);
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
index 6234bcd6158a..5f2685cadf5e 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -293,6 +293,9 @@ static irqreturn_t cdns3_drd_irq(int irq, void *data)
 	if (cdns->dr_mode != USB_DR_MODE_OTG)
 		return IRQ_NONE;
 
+	if (cdns->in_lpm)
+		return ret;
+
 	reg = readl(&cdns->otg_regs->ivect);
 
 	if (!reg)
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index dea649ee173b..8bbb38cd560b 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1769,9 +1769,13 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
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
index 36c63d9ecd37..b3e2cb69762c 100644
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
 
 	cdns3_drd_host_on(cdns);
 
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

