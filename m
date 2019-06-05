Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE15C35654
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 07:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfFEFsQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 01:48:16 -0400
Received: from inva021.nxp.com ([92.121.34.21]:43334 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfFEFsP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 01:48:15 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E8B51200719;
        Wed,  5 Jun 2019 07:48:12 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 61B8D200713;
        Wed,  5 Jun 2019 07:48:07 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 95D7A402DB;
        Wed,  5 Jun 2019 13:48:00 +0800 (SGT)
From:   Yinbo Zhu <yinbo.zhu@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     yinbo.zhu@nxp.com, xiaobo.xie@nxp.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        Nikhil Badola <nikhil.badola@freescale.com>,
        Ran Wang <ran.wang_1@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        Suresh Gupta <B42813@freescale.com>
Subject: [PATCH v6 2/5] usb: phy: Workaround for USB erratum-A005728
Date:   Wed,  5 Jun 2019 13:49:49 +0800
Message-Id: <20190605054952.34687-2-yinbo.zhu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605054952.34687-1-yinbo.zhu@nxp.com>
References: <20190605054952.34687-1-yinbo.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Suresh Gupta <B42813@freescale.com>

PHY_CLK_VALID bit for UTMI PHY in USBDR does not set even
if PHY is providing valid clock. Workaround for this
involves resetting of PHY and check PHY_CLK_VALID bit
multiple times. If PHY_CLK_VALID bit is still not set even
after 5 retries, it would be safe to deaclare that PHY
clock is not available.
This erratum is applicable for USBDR less then ver 2.4.

Signed-off-by: Suresh Gupta <B42813@freescale.com>
Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
Change in v6:
		Indented the code in ehci-fsl.c 	

 drivers/usb/host/ehci-fsl.c | 37 ++++++++++++++++++++++++++-----------
 drivers/usb/host/ehci-fsl.h |  3 +++
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 38674b7aa51e..8f3bf3efb038 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -183,6 +183,17 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
 	return retval;
 }
 
+static bool usb_phy_clk_valid(struct usb_hcd *hcd)
+{
+	void __iomem *non_ehci = hcd->regs;
+	bool ret = true;
+
+	if (!(ioread32be(non_ehci + FSL_SOC_USB_CTRL) & PHY_CLK_VALID))
+		ret = false;
+
+	return ret;
+}
+
 static int ehci_fsl_setup_phy(struct usb_hcd *hcd,
 			       enum fsl_usb2_phy_modes phy_mode,
 			       unsigned int port_offset)
@@ -226,6 +237,16 @@ static int ehci_fsl_setup_phy(struct usb_hcd *hcd,
 		/* fall through */
 	case FSL_USB2_PHY_UTMI:
 	case FSL_USB2_PHY_UTMI_DUAL:
+		/* PHY_CLK_VALID bit is de-featured from all controller
+		 * versions below 2.4 and is to be checked only for
+		 * internal UTMI phy
+		 */
+		if (pdata->controller_ver > FSL_USB_VER_2_4 &&
+		    pdata->have_sysif_regs && !usb_phy_clk_valid(hcd)) {
+			dev_err(dev, "USB PHY clock invalid\n");
+			return -EINVAL;
+		}
+
 		if (pdata->have_sysif_regs && pdata->controller_ver) {
 			/* controller version 1.6 or above */
 			tmp = ioread32be(non_ehci + FSL_SOC_USB_CTRL);
@@ -249,17 +270,11 @@ static int ehci_fsl_setup_phy(struct usb_hcd *hcd,
 		break;
 	}
 
-	/*
-	 * check PHY_CLK_VALID to determine phy clock presence before writing
-	 * to portsc
-	 */
-	if (pdata->check_phy_clk_valid) {
-		if (!(ioread32be(non_ehci + FSL_SOC_USB_CTRL) &
-		    PHY_CLK_VALID)) {
-			dev_warn(hcd->self.controller,
-				 "USB PHY clock invalid\n");
-			return -EINVAL;
-		}
+	if (pdata->have_sysif_regs &&
+	    pdata->controller_ver > FSL_USB_VER_1_6 &&
+	    !usb_phy_clk_valid(hcd)) {
+		dev_warn(hcd->self.controller, "USB PHY clock invalid\n");
+		return -EINVAL;
 	}
 
 	ehci_writel(ehci, portsc, &ehci->regs->port_status[port_offset]);
diff --git a/drivers/usb/host/ehci-fsl.h b/drivers/usb/host/ehci-fsl.h
index cbc422032e50..9d18c6e6ab27 100644
--- a/drivers/usb/host/ehci-fsl.h
+++ b/drivers/usb/host/ehci-fsl.h
@@ -50,4 +50,7 @@
 #define UTMI_PHY_EN             (1<<9)
 #define ULPI_PHY_CLK_SEL        (1<<10)
 #define PHY_CLK_VALID		(1<<17)
+
+/* Retry count for checking UTMI PHY CLK validity */
+#define UTMI_PHY_CLK_VALID_CHK_RETRY 5
 #endif				/* _EHCI_FSL_H */
-- 
2.17.1

