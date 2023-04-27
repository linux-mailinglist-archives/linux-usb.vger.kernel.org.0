Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C586F0475
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 12:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243512AbjD0Ksx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 06:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243401AbjD0Ksv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 06:48:51 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80EC2103
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 03:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2RAP6ZTzWWywF9NsZiMwfP6R4SEOj33jUzK48sD4WnXlVFr+PB02a90Y7nvgMkkpCmg+ZsHVBwDJZkRpSkI8Uprn3TFR6JOUb6F+0ef6OGRufp4J5D2yXAaQ669w6lVzRv9Ni2IUMS+U8Xb8Uu+Sj2LirlkaAxM5nFvm2LWIwgnMlsq6+OmjLk0UR7d/LtG43mj0N57n9A8kz3mkJ8dRiw2apYEFGCaPncelEjseoJA4y7doS5C6i4OIEa9rpueMK+ffJxCWUZ5JO14FXQEZ6VGMJeTWSrptDopsFiDcevALtrSVy+7r6ZUl6tzsXO4MGHK0B4VKcaVNDSk9BUnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u17NERG/qscUsNSFCIfN6HKq85nCvLhwE3jJ/1HKp0o=;
 b=hKBSpfvUkYy4HtUWPh03gH8i6Q2dArz4kBB3X30mxL0MM46oWQmlCwT3K+gNm8UNI9Ph65eTHrt3jy9evKjR/cSW4oWZerwUDRPkI8uRtrZhLb3uVwwxH7MOfaF2/CTYrtvlbvwsBDc9Yl7GJ1tQ79arYDJwEmVfFp6r2w60B4lH3zMb2x9e4DBvskFU5YerBtmdYC0DovwDbbUILzwTXWpTh/ThSqom8VpNmpRybPuwn03i7Ncumt/GJ84lN5uuBLAlH/EHYenxEpcPbqU6JdAXQmK3nMOWdBFVVrOnubQRoPDV4RG+TUzMY3Z5KSUOsooD9J6Em4s4PMdq2cJTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u17NERG/qscUsNSFCIfN6HKq85nCvLhwE3jJ/1HKp0o=;
 b=R2sRxGkfk4TfMvBlelXU3ySCgMqWVarfKqTYp01H3wnC7QY2OREJ7yg/uaaJ0GBy9n20aMnUz8+zeeCR26OIMIlsWhEU6JNHSMrWnWW1BislU7kjeDEJdh8CQSoK+vqozCZ6/lNLS6+K/idZ95jRqW/PcnSgU2zm4JncNPn+kDo=
Received: from BN0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:408:141::25)
 by IA0PR12MB7530.namprd12.prod.outlook.com (2603:10b6:208:440::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 10:48:47 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::7e) by BN0PR07CA0018.outlook.office365.com
 (2603:10b6:408:141::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 10:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.23 via Frontend Transport; Thu, 27 Apr 2023 10:48:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 05:48:44 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/2] USB: Extend pci resume function to handle PM events
Date:   Thu, 27 Apr 2023 16:18:04 +0530
Message-ID: <20230427104805.3560591-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427104805.3560591-1-Basavaraj.Natikar@amd.com>
References: <20230427104805.3560591-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|IA0PR12MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 4228fde7-c699-4992-ce4b-08db470cfa72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qenHWC42C/ACrJq4mMpveUNgw+b0ndfr+lDQQdK5j6zzEUsDmcpZURssB6gu0LcN1OwXcuBdalV8OmKuGY4ld6/OzqKnw4sNe3uY1vtHjKw21OOsS4LY7G7i084JvWSWFTUDRNtsXSenkZxA0M3ckYD5vlp3FZRfSUayofCEOiAuvW0c0BeQd1cvkagrQSYHTFD8+TinmrDT6SK/rzT0ZMZzbceUVzFaiapJe7IvLww1qWnSZ97CdoLh+u48rYIjpRJ7PYQ5W/eD/mCqnQEnFAAx5xllIlAzMM/LJarS22rRFdneEMe6WlfD16L2qkWwNpf9lv7ZDEfz6ChXx1n0ds45sWnEPdDss72S+s4ZHt+aQocpoiqXq/yFcltaJlYFIcTlgN/A1LWipkSCoV2hm/i5fzRNdyrOCOv8RiL8t50tYRmTbMMok+OlWnzmpKfrgF/dxoZH3+plqqjkjq8D8a2KEQL3S+SSlwMIMjA2TeHrDVYAm8Ky1ZmWCsxiTrIyaMqV7hudHgUGcwfDlkw/pz40DBBqXiwjRwqbP0vUmXUjcaigYiJieYDXaqHQkc5Pxuo+Q4oV4MUzIm29SpWlXeqVxHnu5IynK7n7XryH/9GDqLKTi0o/5IJk4nRxlpynMcETsfXFGbP79WPYe+v1jUgrrD/afdT7ttGgyoGV0H1xkEQG0JUTCgGm5Iq18cRlcEWi8j6puu6aItx5prL+XfJbltmtrYCWF5U3lggQYs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(81166007)(40480700001)(356005)(40460700003)(2616005)(426003)(478600001)(110136005)(336012)(36756003)(316002)(7696005)(82310400005)(6666004)(8676002)(36860700001)(2906002)(5660300002)(70586007)(8936002)(83380400001)(4326008)(70206006)(47076005)(41300700001)(82740400003)(86362001)(1076003)(186003)(16526019)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 10:48:46.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4228fde7-c699-4992-ce4b-08db470cfa72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7530
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
 drivers/usb/core/hcd-pci.c   | 24 +++++++++++++-----------
 drivers/usb/host/ehci-pci.c  |  3 ++-
 drivers/usb/host/ohci-pci.c  |  8 +++++++-
 drivers/usb/host/uhci-pci.c  |  7 ++++---
 drivers/usb/host/xhci-pci.c  |  4 ++--
 drivers/usb/host/xhci-plat.c |  4 ++--
 drivers/usb/host/xhci.c      |  3 ++-
 drivers/usb/host/xhci.h      |  2 +-
 include/linux/usb/hcd.h      |  2 +-
 9 files changed, 34 insertions(+), 23 deletions(-)

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

