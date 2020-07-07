Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B022167C1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgGGHtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:49:55 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:36064
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728125AbgGGHty (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:49:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt5mAm+SqmvVp/Ntdf05ck5i7ipawhGs3Cf2FfcxUbjny1K6FxVZ9aHEsQt9zJzbR0Cbaq4tm+wilrGBINdIK2ilwn1RQyf0O7Dy4SEt0dzeFEohIxA2gY1b3UNttI9+Vuxrgc77wUdKyqMc6vcZL3KZrYr7k7UbUzdZJqS4mMny5y97+lliwf/PUqeupTM3+C6EuISxwClZfVpYBYZjjMsLXUdtzNumvCHIe5Lv+DjXX2N1b/HdMewLtDu2jOz9AaMtFWgFfB8M/zkHkqIgkAZUFMgp9odZVd5KkIaMTQMc12+oG4o/myNWsrRotmvfodgsBtDadxfmesmLGpz2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApXsb0MtkkiPYdTG8cVDMsjsOMKWGpa+ezkXlrfV8sQ=;
 b=DPCGZCTztuB2sWc3QsPiBL39eG/FIb1WcZXRX+TaldG06N4ZscxPvKJgBhXgkL1cmIwiXCR3A/57Y5uVCmmRvkwE3kGfaghD8RU7nn7pB3uvzPbXgr9iD3ZLh+TZeR1kswUmVP3tJWGAv8nR5z51JLbyDOxcfKvECK3fqp3/jBLbFCIWCKwHGfSqhgo+Ii9N2/+Up8G6JVORPMYrlsezahBr8TlVcy0YM3YNvJJjc0h3z7aazogYVEXYIGqRbtb/KoglhFlj7saV6ZCAkeTaXChmi/TSnDhGBazDVMSwTdqChPdxCBuhJjhGH/ll1vMRH8mN0TYJNKRtC7VbDfKfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApXsb0MtkkiPYdTG8cVDMsjsOMKWGpa+ezkXlrfV8sQ=;
 b=Pr0+RbB9WjfBj7q5wCyRR+oAmPNOLKTnULGD8+h3pMqnzpoeb/3wTxl81c/18ScslcCF2iCC+RTzsgp/6Y6R7mQigiA2hwy/I6VekEx9D1Z8gfwvr+R0HKqeOFdkemEWO9DDB86/K5saBCEQmq0JlDhX0x7WZ6df9isv/mXVSm4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:49:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:49:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 2/9] usb: cdns3: add runtime PM support
Date:   Tue,  7 Jul 2020 15:49:34 +0800
Message-Id: <20200707074941.28078-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:49:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1486df5-d116-48a1-ae44-08d8224a53db
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608A85556A99526DE6A5ED38B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7y5TDDKwROxRTn3YvGtvlC4p9rz7nx0RzYk1+bL0gmztGvH6NSFepTCTBqct5gyovHbwwz56ffMQrqvRXCMrp/6o4HX5VXgBxNp0/kBwMtkgGpSTqa7QCMjKZS6+BdKh/kiWq6wuoUj/4Ns3f+LNP4nh2nLqLQgk75gESg7D5fofe6ibfguHJDTiY2hcvPSwl+lAVCovTkoqIwOBrb5yQzH2mZj5pHax1PsZABLErdBHqUc9O5AclH5SJ1HlVv8D6HDEtWLqen9A7J2sbFVt4/QhbuKIzjG4mU6rMsgEdbP28qzgIcGcSIH/X1780Plw/kl5kF/z6xrvP1A0TEiyaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(44832011)(5660300002)(36756003)(30864003)(66556008)(86362001)(66476007)(956004)(2616005)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bzvtSufA+4KgMGjq2/ymkt8AmpGSKUwaiHM4j1Vcx0M+7Xh1bYKWu4WCvyl3qnqAFQtX9SKvSDgfnnX5ImQaoZ5nIV7cRgTJIZblE1SUhO1LUlo/Go6fjeZ86mOmS686BzUstQf0hRm/HFlEGGaVVyxE5pw0Am/PylRbmWQkswXHaPnX49eRU9c4AmZwZjw9nna2Loie3vvj1c/gWotA+QdFz3Pf6cI8kZMdSzg+/Nrlm4RM5Kd/c/kGv5HuzFs6V25pXRUGewN3mL9SwEtHVEZo9q5LiS+lvWScsvIeDIMCATTTv4NcC1UjMyzgQA/5fsjilHROG+IAPEoXtMqWvXnXwq1SyY1/MDdOp0YDzTv5qOpUJBRSEDfVUH/EayTLco/d9UYTtAll6jGmTWWQ87jl6ggHs8oqoC7PAoZIU14H7pccDg2msEWrFZS8zi7P9UmH9guwsU1iGnGkIl3Apo73+PqbUsRP0e0D2ZD3qwHY0h3MbGNd+f33FWZF+HZe
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1486df5-d116-48a1-ae44-08d8224a53db
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:49:50.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YPucdR3ld2CVPBJppUIP22jFzkb9toY/7DktfZpn6P3l/fIbzG2mKukaO9RJ777gYVmeaMNU5z5czsQBiPMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
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
index 8818935d157b..f98c3c1a6b26 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -405,6 +405,30 @@ static void set_phy_power_off(struct cdns3 *cdns)
 	phy_power_off(cdns->usb2_phy);
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
@@ -431,6 +455,7 @@ static int cdns3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	cdns->dev = dev;
+	cdns->pdata = dev_get_platdata(dev);
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -480,6 +505,15 @@ static int cdns3_probe(struct platform_device *pdev)
 
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
@@ -516,6 +550,19 @@ static int cdns3_probe(struct platform_device *pdev)
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
@@ -524,9 +571,11 @@ static int cdns3_probe(struct platform_device *pdev)
 	if (ret)
 		goto err4;
 
+	spin_lock_init(&cdns->lock);
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
 
 	/*
 	 * The controller needs less time between bus and controller suspend,
@@ -573,52 +622,122 @@ static int cdns3_remove(struct platform_device *pdev)
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

