Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A436F0B35
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 19:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244281AbjD0Rni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 13:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244163AbjD0RnR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 13:43:17 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470B45599
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 10:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjrH+Zs0aJiBQGJZn4PirmjuHvtpiFKmGpNu/Rfn7jQIHKzoHKCC0+IdaJCqfy1Im/NKA3heBGzgTcsp+02LZTtAMk3g7HGTG5V5cet6WUjl9VX5BoZtNURJgw7U3x2HiLB2tVP7mfbdtpF4EvA8+EfoJHqTMWxbGGdQXb//Z1GshJcxs4N5r4w97ksT4pXsl0lPCZY4h6AvLyD7kxsUfoSy2avLx4zPue4rx8po+wAZm4+l67iexj4DK1R21iMD0q8u2Bwwaa6w4hqAMlIay8nO+AXyJnWLnJXAWdU3mSb/rTLc/Ju2A0q0kGbZTKzfz5XKq9Mlz4tqlsk8gSsDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da9qBQHtLEJQmuni78r9G5LsinWb+uaG3J0htbqZB8Q=;
 b=kss2fADco+PxjOh0m3LGADV9gB+W+WSJW42VFOlgX7AbpHXGCCSFerEcBhS4YRc8zlQJP0l3dUeNRRluu8bkboJXbBsk7bq0lLO34emG+QRbSGPBqKvMtqBd4eiVW+GXzXEo4G6dpueMIi+ieUDXMPG8GI18w5I4g3ecC12N3CCdIZuZp2mlCT2M4rEvFP6SXWCxdqKqnFrPS16eohZSuqR+Tfph2B4hJRgIrzsb1PH0d8aO0MKWLK1YBuVWbLnDSvkVtmx3E77LGS12s45jD6feAjC1PRwbCaV0DbKdQeHwVo4pJiB79oSkET4doz0jzMa5XiBto/lcCP9HVZnxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da9qBQHtLEJQmuni78r9G5LsinWb+uaG3J0htbqZB8Q=;
 b=DTyhef4rA4N9wtkX3pMk0pYmvAbnxqK+qCEhtRQbP9RvFjpNqmAQDuZAcqRWyg2/k1EJODc91aMDapgZt2+BTcTfPBVVJfRliWOVLGE0WanFYcTWUJ0A1S3Lf53KEkFrRVWrE/cT73p1An6ELY38G4h6QW5jpzlYBxYtiwT8CqQ=
Received: from MW4PR03CA0052.namprd03.prod.outlook.com (2603:10b6:303:8e::27)
 by PH8PR12MB7303.namprd12.prod.outlook.com (2603:10b6:510:220::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 17:42:46 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::cd) by MW4PR03CA0052.outlook.office365.com
 (2603:10b6:303:8e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 17:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 17:42:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 12:42:42 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 1/2] USB: Extend pci resume function to handle PM events
Date:   Thu, 27 Apr 2023 23:12:19 +0530
Message-ID: <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
References: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT017:EE_|PH8PR12MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 63149925-4f92-43e0-dc1c-08db4746cf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sY/kuLafE+MAyORsFInQiMFqlCmIzKFvAqHLyXsuYGvs8oz/TlJXdZyNe+XVBYz/BQ/2tiV8wsfQqwvb8oBMz9oamg6sJfMMHl3cPnP5Vxe3GqUI80qfGg0Ck6CO9zjvAM0hQEdsXWO/3/Dvd7a2GDVJ623YAXHwUF3VqYXp9EU4e5M4YDfDrZjgSY07qv5YHIHKc/+vJ28S5tWckrW6ewdj9Anux3RuCLEGU4VqwjA6BOZsrJef+S55I/SJwbMYkRFq7w/0bveYY7qf9FJiwQ0RYYHHnnQJG7FwVcPxHHq85plgK+K9NMGBg+FxYDHXg5kwlMa9qbe+F7jnbbr6rV8dHnHFk3QOx6w6xd1+Cs7+X9YV996TRZ2/2yut2hcJPGedzh+rJJlQFZ8/PZj+bzRHqGtZRQ8Fqz2nWw7VM6A1+uM/Z7mlb545V6WX+0zMcjLdKylhtKt9N23coOJqafZg/j548odshMjPU0fn9l6WEmUdH30iOE/QacLxE835J9aTqMMURDVWuqFvG+W1iziFqG5IBb7Mu358mXUzWk+5BQEfi7qx+c3Na3s1ee5k5xI6vvaAR2ouy+pTbQHz6jTIlC1ZKvVlRc5GKlLklLmaJQe40bYPtBG/C0jaG6yWryMzrxJ0HjizSna2LJPQGwt9ZhnS0LKr4vfxQMYe1Kt7cJlhaZz5wr/+HLdqDN9Ox7vKYzeo3E7/1nB7JtuOlh4WEr1itT8IfI72mX/lmkY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6666004)(7696005)(36756003)(47076005)(83380400001)(336012)(36860700001)(426003)(186003)(2616005)(16526019)(86362001)(40480700001)(81166007)(82310400005)(1076003)(356005)(82740400003)(40460700003)(26005)(316002)(70206006)(2906002)(30864003)(4326008)(110136005)(70586007)(5660300002)(8936002)(8676002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 17:42:45.6565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63149925-4f92-43e0-dc1c-08db4746cf87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7303
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the pci_resume method has only a flag indicating whether the
system is resuming from hibernation. In order to handle all PM events like
AUTO_RESUME (runtime resume from device in D3), RESUME (system resume from
s2idle, S3 or S4 states) etc change the pci_resume method to handle all PM
events.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/core/hcd-pci.c    | 24 +++++++++++++-----------
 drivers/usb/host/ehci-pci.c   |  3 ++-
 drivers/usb/host/ohci-pci.c   |  8 +++++++-
 drivers/usb/host/uhci-pci.c   |  7 ++++---
 drivers/usb/host/xhci-histb.c |  2 +-
 drivers/usb/host/xhci-pci.c   |  4 ++--
 drivers/usb/host/xhci-plat.c  |  4 ++--
 drivers/usb/host/xhci-tegra.c |  2 +-
 drivers/usb/host/xhci.c       |  3 ++-
 drivers/usb/host/xhci.h       |  2 +-
 include/linux/usb/hcd.h       |  2 +-
 11 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index ab2f3737764e..990280688b25 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -415,12 +415,15 @@ static int check_root_hub_suspended(struct device *dev)
 	return 0;
 }
 
-static int suspend_common(struct device *dev, bool do_wakeup)
+static int suspend_common(struct device *dev, pm_message_t msg)
 {
 	struct pci_dev		*pci_dev = to_pci_dev(dev);
 	struct usb_hcd		*hcd = pci_get_drvdata(pci_dev);
+	bool			do_wakeup;
 	int			retval;
 
+	do_wakeup = PMSG_IS_AUTO(msg) ? true : device_may_wakeup(dev);
+
 	/* Root hub suspend should have stopped all downstream traffic,
 	 * and all bus master traffic.  And done so for both the interface
 	 * and the stub usb_device (which we check here).  But maybe it
@@ -447,7 +450,7 @@ static int suspend_common(struct device *dev, bool do_wakeup)
 				(retval == 0 && do_wakeup && hcd->shared_hcd &&
 				 HCD_WAKEUP_PENDING(hcd->shared_hcd))) {
 			if (hcd->driver->pci_resume)
-				hcd->driver->pci_resume(hcd, false);
+				hcd->driver->pci_resume(hcd, msg);
 			retval = -EBUSY;
 		}
 		if (retval)
@@ -470,7 +473,7 @@ static int suspend_common(struct device *dev, bool do_wakeup)
 	return retval;
 }
 
-static int resume_common(struct device *dev, int event)
+static int resume_common(struct device *dev, pm_message_t msg)
 {
 	struct pci_dev		*pci_dev = to_pci_dev(dev);
 	struct usb_hcd		*hcd = pci_get_drvdata(pci_dev);
@@ -498,12 +501,11 @@ static int resume_common(struct device *dev, int event)
 		 * No locking is needed because PCI controller drivers do not
 		 * get unbound during system resume.
 		 */
-		if (pci_dev->class == CL_EHCI && event != PM_EVENT_AUTO_RESUME)
+		if (pci_dev->class == CL_EHCI && msg.event != PM_EVENT_AUTO_RESUME)
 			for_each_companion(pci_dev, hcd,
 					ehci_wait_for_companions);
 
-		retval = hcd->driver->pci_resume(hcd,
-				event == PM_EVENT_RESTORE);
+		retval = hcd->driver->pci_resume(hcd, msg);
 		if (retval) {
 			dev_err(dev, "PCI post-resume error %d!\n", retval);
 			usb_hc_died(hcd);
@@ -516,7 +518,7 @@ static int resume_common(struct device *dev, int event)
 
 static int hcd_pci_suspend(struct device *dev)
 {
-	return suspend_common(dev, device_may_wakeup(dev));
+	return suspend_common(dev, PMSG_SUSPEND);
 }
 
 static int hcd_pci_suspend_noirq(struct device *dev)
@@ -577,12 +579,12 @@ static int hcd_pci_resume_noirq(struct device *dev)
 
 static int hcd_pci_resume(struct device *dev)
 {
-	return resume_common(dev, PM_EVENT_RESUME);
+	return resume_common(dev, PMSG_RESUME);
 }
 
 static int hcd_pci_restore(struct device *dev)
 {
-	return resume_common(dev, PM_EVENT_RESTORE);
+	return resume_common(dev, PMSG_RESTORE);
 }
 
 #else
@@ -600,7 +602,7 @@ static int hcd_pci_runtime_suspend(struct device *dev)
 {
 	int	retval;
 
-	retval = suspend_common(dev, true);
+	retval = suspend_common(dev, PMSG_AUTO_SUSPEND);
 	if (retval == 0)
 		powermac_set_asic(to_pci_dev(dev), 0);
 	dev_dbg(dev, "hcd_pci_runtime_suspend: %d\n", retval);
@@ -612,7 +614,7 @@ static int hcd_pci_runtime_resume(struct device *dev)
 	int	retval;
 
 	powermac_set_asic(to_pci_dev(dev), 1);
-	retval = resume_common(dev, PM_EVENT_AUTO_RESUME);
+	retval = resume_common(dev, PMSG_AUTO_RESUME);
 	dev_dbg(dev, "hcd_pci_runtime_resume: %d\n", retval);
 	return retval;
 }
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 4b148fe5e43b..889dc4426271 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -354,10 +354,11 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
  * Also they depend on separate root hub suspend/resume.
  */
 
-static int ehci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int ehci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
+	bool			hibernated = (msg.event == PM_EVENT_RESTORE);
 
 	if (ehci_resume(hcd, hibernated) != 0)
 		(void) ehci_pci_reinit(ehci, pdev);
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index d7b4f40f9ff4..900ea0d368e0 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -301,6 +301,12 @@ static struct pci_driver ohci_pci_driver = {
 #endif
 };
 
+#ifdef CONFIG_PM
+static int ohci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
+{
+	return ohci_resume(hcd, msg.event == PM_EVENT_RESTORE);
+}
+#endif
 static int __init ohci_pci_init(void)
 {
 	if (usb_disabled())
@@ -311,7 +317,7 @@ static int __init ohci_pci_init(void)
 #ifdef	CONFIG_PM
 	/* Entries for the PCI suspend/resume callbacks are special */
 	ohci_pci_hc_driver.pci_suspend = ohci_suspend;
-	ohci_pci_hc_driver.pci_resume = ohci_resume;
+	ohci_pci_hc_driver.pci_resume = ohci_pci_resume;
 #endif
 
 	return pci_register_driver(&ohci_pci_driver);
diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
index 3592f757fe05..5df4a1832b09 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -167,7 +167,7 @@ static void uhci_shutdown(struct pci_dev *pdev)
 
 #ifdef CONFIG_PM
 
-static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated);
+static int uhci_pci_resume(struct usb_hcd *hcd, pm_message_t state);
 
 static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
@@ -202,14 +202,15 @@ static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 
 	/* Check for race with a wakeup request */
 	if (do_wakeup && HCD_WAKEUP_PENDING(hcd)) {
-		uhci_pci_resume(hcd, false);
+		uhci_pci_resume(hcd, PMSG_SUSPEND);
 		rc = -EBUSY;
 	}
 	return rc;
 }
 
-static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int uhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
+	bool hibernated = (msg.event == PM_EVENT_RESTORE);
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
 
 	dev_dbg(uhci_dev(uhci), "%s\n", __func__);
diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 08369857686e..1b7bc2c6730a 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -367,7 +367,7 @@ static int __maybe_unused xhci_histb_resume(struct device *dev)
 	if (!device_may_wakeup(dev))
 		xhci_histb_host_enable(histb);
 
-	return xhci_resume(xhci, 0);
+	return xhci_resume(xhci, PMSG_ON);
 }
 
 static const struct dev_pm_ops xhci_histb_pm_ops = {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 6db07ca419c3..a4ea46911d7b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -628,7 +628,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	return ret;
 }
 
-static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
@@ -663,7 +663,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	retval = xhci_resume(xhci, hibernated);
+	retval = xhci_resume(xhci, msg);
 	return retval;
 }
 
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b9f9625467d6..727e771d4d5f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -465,7 +465,7 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = xhci_resume(xhci, 0);
+	ret = xhci_resume(xhci, PMSG_ON);
 	if (ret)
 		return ret;
 
@@ -494,7 +494,7 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
-	return xhci_resume(xhci, 0);
+	return xhci_resume(xhci, PMSG_ON);
 }
 
 const struct dev_pm_ops xhci_plat_pm_ops = {
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index a88c39e525c2..665f5c20f551 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2275,7 +2275,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	if (wakeup)
 		tegra_xhci_disable_phy_sleepwalk(tegra);
 
-	err = xhci_resume(xhci, 0);
+	err = xhci_resume(xhci, PMSG_ON);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6307bae9cddf..11a87b9cbb50 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1157,8 +1157,9 @@ EXPORT_SYMBOL_GPL(xhci_suspend);
  * This is called when the machine transition from S3/S4 mode.
  *
  */
-int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
+int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 {
+	bool			hibernated = (msg.event == PM_EVENT_RESTORE);
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 786002bb35db..f61a63f9e7e6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2139,7 +2139,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
-int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
+int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index b51c07111729..4f559b4523df 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -267,7 +267,7 @@ struct hc_driver {
 	int	(*pci_suspend)(struct usb_hcd *hcd, bool do_wakeup);
 
 	/* called after entering D0 (etc), before resuming the hub */
-	int	(*pci_resume)(struct usb_hcd *hcd, bool hibernated);
+	int	(*pci_resume)(struct usb_hcd *hcd, pm_message_t state);
 
 	/* called just before hibernate final D3 state, allows host to poweroff parts */
 	int	(*pci_poweroff_late)(struct usb_hcd *hcd, bool do_wakeup);
-- 
2.25.1

