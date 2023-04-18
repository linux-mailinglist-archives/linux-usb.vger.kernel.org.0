Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3806E66B6
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 16:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjDROJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 10:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjDROJh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 10:09:37 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472A013FB4
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 07:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQDE89ivdCwIazW3g8U4m1GvUfWsKQj+lVhjkltZGCzpjmdsLjYJmg08AKlV4KKaUwKBdpKGxxkDCPLbpnX7LU/wvIedR+AxFdq9/DSp64+Iqz3YvD41sDbli6cJcs7a6Odw7HSP24tVhsvTgHq3Pfj6EJaz9NrHtpl1ZUHrwzXXvwfHQxnoN/DvfLyB6o19xgaat13IMVs7VXGTSMHhI9jB+6m3WrOumWybUT0/oU1eDn2DDBxSAETIGDXL8cy0wmMk/LHBwpa1fIPDlcJInhCJK5QOUTGjb/lNgKPpTSMi8bmeE4775o5Mv69Wn+bk9cUnLJQYZgL/gIVI3R8L/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbulCZ/LGniyGQioA6E38ZQ7BtU2NBxT0RFj7wOphwA=;
 b=U2P43LtukBjVBUeLOjUHlrTjYwS6LflW2HEE0Irl4ZWIxKb9EmATtd1C1vYzyY/uQ4O/ttNzddyqd6wDc/k1hvJu2kfvPrq1c/AgibsgGFWDk+4/8ZSLgU0ZZlkeGe3u3a+mcUJqSlXFiZxu8/r4zU2Uj/GeM5kqAvlAFmjMtXCuT7/o9hFXaEsnOWro6jln79wjmVoPHrJgbjOga/OB0Tmc/8UgHazpEvwdMn3PYsZTgWCRsXeqNZj5+eXWmtqhCuxqgMnny86tQkN1lhA8mVVmvms2wDqHzoN9huDKDfCeXATb+xUlnN2L7JZEArnbTmpMx5T7B2Zr429pnQEIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbulCZ/LGniyGQioA6E38ZQ7BtU2NBxT0RFj7wOphwA=;
 b=il6eK8/ovdHDnQMnmdgkyXv+5yhIydxvCa5jvKXHVePrMPjCvxNFC//dGD/kLtJHSEiBiDLTaDMdYwRWOYdWsRfg1SLPXW9HhFte/IgNY1/JtseXEB/52pMrHWFVFSG+6Q+beNWky4LJM1hz+dzN25eXl/yGKZcI+0Sxt2GgSmo=
Received: from DM6PR11CA0061.namprd11.prod.outlook.com (2603:10b6:5:14c::38)
 by SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:09:29 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::68) by DM6PR11CA0061.outlook.office365.com
 (2603:10b6:5:14c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 14:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 14:09:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 09:08:59 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] USB: Extend pci resume function to handle PM events
Date:   Tue, 18 Apr 2023 19:38:16 +0530
Message-ID: <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e8c042-75b4-4b6e-0c5a-08db40168650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N20+LXFY5cTWJK8q79g+6SkymXODFGkaHehiRv1kAx0Mdv72YJDiUlBcVYTgYVkvgSiJ/0C6N5ZntFmOR2lqvYjFMbOoEUBH4CPWsxNghodYFfJ2UqZKo6KZNqE45yvuEx8CwSTOpl0RLbkm5bRfp1FBdVCEiX9hngHYLcU1IqIX5KvI7tJAU7f7KHdB460lvwYecVnkpnBM6FHIgfbdsmomXff+2qINFnp9bSzvaXo7hGcUtR2MiWc+DGNhvT4sn5xRCoR7EraIe4Q/7iQWKlWrvYP5iL4pYzdIwF6v1pvodEi7sxRs5Pz/bifn80qrjCS2F1qQr1BmHZBKtjvq4LiKnf+xdS+BpdipEtbuvPbbzaA2In8sh/Btra8lJpgTAwQ8PPJlaqq2Tebb7vQ9ep3BgANz3SBVKfBOvbdbwXfnsYT+pJPHA0QKshX8dBhuW7BKb0ZTHpr08rWiFXiuxauzLdLMMDRexJeWmZXELUvYdgkJE6WbBdCWscTQCLTM0Sxw6fwpPNXkrmxKQcVxvBMLUNdkswUzxehn4M2T5EpJPPJRT61+JrLTdHGCeE2ClxSIh1vOCbWt4hxGZOgTVHbWMP1zrJVhBH2g3RYStx4aaMtwl1RhXcm19qwOk2YPq6b1YOixAddIFFrNsXsaMy9e79ok3n0awXrjdbQMyeeAsEbeu1jnjPPDFiDk8d+vp7yzmSS8iPbhRRvIv3XseGAlBXhbwWltgmH+wvw2gJU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(316002)(4326008)(70586007)(70206006)(478600001)(110136005)(82740400003)(8936002)(8676002)(5660300002)(356005)(41300700001)(81166007)(36860700001)(186003)(16526019)(426003)(336012)(47076005)(83380400001)(2616005)(7696005)(6666004)(1076003)(26005)(86362001)(36756003)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:09:28.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e8c042-75b4-4b6e-0c5a-08db40168650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the pci_resume method has only a flag indicating whether the
system is resuming from hibernation. In order to handle all PM events like
AUTO_RESUME, SUSPEND etc change the pci_resume method to handle all PM
events.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/core/hcd-pci.c  | 14 ++++++++------
 drivers/usb/host/ehci-pci.c |  3 ++-
 drivers/usb/host/ohci-pci.c |  8 +++++++-
 drivers/usb/host/uhci-pci.c | 10 +++++++---
 drivers/usb/host/xhci-pci.c |  4 ++--
 drivers/usb/host/xhci.c     |  3 ++-
 drivers/usb/host/xhci.h     |  2 +-
 include/linux/usb/hcd.h     |  2 +-
 8 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index ab2f3737764e..bef092da477a 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -415,12 +415,15 @@ static int check_root_hub_suspended(struct device *dev)
 	return 0;
 }
 
-static int suspend_common(struct device *dev, bool do_wakeup)
+static int suspend_common(struct device *dev, int event)
 {
 	struct pci_dev		*pci_dev = to_pci_dev(dev);
 	struct usb_hcd		*hcd = pci_get_drvdata(pci_dev);
+	bool			do_wakeup;
 	int			retval;
 
+	do_wakeup = event == PM_EVENT_AUTO_SUSPEND ? true : device_may_wakeup(dev);
+
 	/* Root hub suspend should have stopped all downstream traffic,
 	 * and all bus master traffic.  And done so for both the interface
 	 * and the stub usb_device (which we check here).  But maybe it
@@ -447,7 +450,7 @@ static int suspend_common(struct device *dev, bool do_wakeup)
 				(retval == 0 && do_wakeup && hcd->shared_hcd &&
 				 HCD_WAKEUP_PENDING(hcd->shared_hcd))) {
 			if (hcd->driver->pci_resume)
-				hcd->driver->pci_resume(hcd, false);
+				hcd->driver->pci_resume(hcd, event);
 			retval = -EBUSY;
 		}
 		if (retval)
@@ -502,8 +505,7 @@ static int resume_common(struct device *dev, int event)
 			for_each_companion(pci_dev, hcd,
 					ehci_wait_for_companions);
 
-		retval = hcd->driver->pci_resume(hcd,
-				event == PM_EVENT_RESTORE);
+		retval = hcd->driver->pci_resume(hcd, event);
 		if (retval) {
 			dev_err(dev, "PCI post-resume error %d!\n", retval);
 			usb_hc_died(hcd);
@@ -516,7 +518,7 @@ static int resume_common(struct device *dev, int event)
 
 static int hcd_pci_suspend(struct device *dev)
 {
-	return suspend_common(dev, device_may_wakeup(dev));
+	return suspend_common(dev, PM_EVENT_SUSPEND);
 }
 
 static int hcd_pci_suspend_noirq(struct device *dev)
@@ -600,7 +602,7 @@ static int hcd_pci_runtime_suspend(struct device *dev)
 {
 	int	retval;
 
-	retval = suspend_common(dev, true);
+	retval = suspend_common(dev, PM_EVENT_AUTO_SUSPEND);
 	if (retval == 0)
 		powermac_set_asic(to_pci_dev(dev), 0);
 	dev_dbg(dev, "hcd_pci_runtime_suspend: %d\n", retval);
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 4b148fe5e43b..1145c6e7fae5 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -354,10 +354,11 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
  * Also they depend on separate root hub suspend/resume.
  */
 
-static int ehci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int ehci_pci_resume(struct usb_hcd *hcd, int event)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
+	bool hibernated = event == PM_EVENT_RESTORE;
 
 	if (ehci_resume(hcd, hibernated) != 0)
 		(void) ehci_pci_reinit(ehci, pdev);
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index d7b4f40f9ff4..923ed502414b 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -301,6 +301,12 @@ static struct pci_driver ohci_pci_driver = {
 #endif
 };
 
+#ifdef CONFIG_PM
+static int ohci_pci_resume(struct usb_hcd *hcd, int event)
+{
+	return ohci_resume(hcd, event == PM_EVENT_RESTORE);
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
index 3592f757fe05..9b90c3221bd8 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -167,7 +167,7 @@ static void uhci_shutdown(struct pci_dev *pdev)
 
 #ifdef CONFIG_PM
 
-static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated);
+static int uhci_resume(struct usb_hcd *hcd, bool hibernated);
 
 static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 {
@@ -202,13 +202,13 @@ static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 
 	/* Check for race with a wakeup request */
 	if (do_wakeup && HCD_WAKEUP_PENDING(hcd)) {
-		uhci_pci_resume(hcd, false);
+		uhci_resume(hcd, false);
 		rc = -EBUSY;
 	}
 	return rc;
 }
 
-static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int uhci_resume(struct usb_hcd *hcd, bool hibernated)
 {
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
 
@@ -252,6 +252,10 @@ static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	return 0;
 }
 
+static int uhci_pci_resume(struct usb_hcd *hcd, int event)
+{
+	return uhci_resume(hcd, event == PM_EVENT_RESTORE);
+}
 #endif
 
 static const struct hc_driver uhci_driver = {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 6db07ca419c3..ebdf9f32d128 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -628,7 +628,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	return ret;
 }
 
-static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
+static int xhci_pci_resume(struct usb_hcd *hcd, int event)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
@@ -663,7 +663,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	retval = xhci_resume(xhci, hibernated);
+	retval = xhci_resume(xhci, event);
 	return retval;
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6307bae9cddf..a539e4dd54f7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1157,8 +1157,9 @@ EXPORT_SYMBOL_GPL(xhci_suspend);
  * This is called when the machine transition from S3/S4 mode.
  *
  */
-int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
+int xhci_resume(struct xhci_hcd *xhci, int event)
 {
+	bool			hibernated = event == PM_EVENT_RESTORE;
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 786002bb35db..948fc2d7b1f0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2139,7 +2139,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
-int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
+int xhci_resume(struct xhci_hcd *xhci, int event);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index b51c07111729..337575dd8665 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -267,7 +267,7 @@ struct hc_driver {
 	int	(*pci_suspend)(struct usb_hcd *hcd, bool do_wakeup);
 
 	/* called after entering D0 (etc), before resuming the hub */
-	int	(*pci_resume)(struct usb_hcd *hcd, bool hibernated);
+	int	(*pci_resume)(struct usb_hcd *hcd, int event);
 
 	/* called just before hibernate final D3 state, allows host to poweroff parts */
 	int	(*pci_poweroff_late)(struct usb_hcd *hcd, bool do_wakeup);
-- 
2.25.1

