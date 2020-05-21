Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8FF1DC6D6
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 08:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgEUGFv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 02:05:51 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54136 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726938AbgEUGFv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 02:05:51 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DD286401BB;
        Thu, 21 May 2020 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590041150; bh=yD5sfGNfx1sQYdOQUQnCmReRHeFGRMnD7U6Jkg9oKUA=;
        h=Date:From:Subject:To:Cc:From;
        b=hghiln4CPN9OpzOga8GTUuxH+FumWmmOhFL5miHX1b+EjQDkhot9DBkK03FeDQ+nl
         FHlddfN7LP/ODlBG/tCTjYRqF5fS7AFBuXOEV0D//TI2yQeCfMtKbFhTshzXSHOMYb
         QeHw5SeVHeHu6hHDBBpEzpdXB0uPYULQGFnzcPx8Q4nkIGAxtb4076XZdggEZjXV3m
         I11Cd0NgshxNcgR5K9KDxzLbnZpSJuux42XWKIdVnds3CMFOKTZbp5NSVEEHrqsCQ+
         BNRnGtz/kbrHWnDgdWyh947p1U1fY1a7HVy9M9YZKLTmUwBuSBXYUKnINBc7iaN1O9
         vwMnvGuDCJQMA==
Received: from hminas-z420 (hminas-z420.internal.synopsys.com [10.116.126.211])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id AE0CAA005B;
        Thu, 21 May 2020 06:05:45 +0000 (UTC)
Received: by hminas-z420 (sSMTP sendmail emulation); Thu, 21 May 2020 10:05:44 +0400
Date:   Thu, 21 May 2020 10:05:44 +0400
Message-Id: <9be2bb0c728da3dabf634c894f77e0e9709edeaa.1590040892.git.hminas@synopsys.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: Update Core Reset programming flow.
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Starting from core version 4.20a Core Reset flow is changed.
Introduced new bit in GRSTCTL register - GRSTCTL_CSFTRST_DONE.
Core Reset new programming flow steps are follow:
1. Set GRSTCTL_CSFTRST bit.
2. Wait for bit GRSTCTL_CSFTRST_DONE is set.
3. Clear GRSTCTL_CSFTRST and GRSTCTL_CSFTRST_DONE bits.

Check core version functionality separated from dwc2_get_hwparams() to
new dwc2_check_core_version() function because Core Reset flow depend
on SNPSID.

Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>

---

Changes for v2:
- Add dwc2_check_core_version() functions prototype in core.h

 drivers/usb/dwc2/core.c     | 23 +++++++++++++++++++----
 drivers/usb/dwc2/core.h     |  4 ++++
 drivers/usb/dwc2/hw.h       |  1 +
 drivers/usb/dwc2/params.c   | 19 -------------------
 drivers/usb/dwc2/platform.c | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 78a4925aa118..fec17a2d2447 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -524,10 +524,25 @@ int dwc2_core_reset(struct dwc2_hsotg *hsotg, bool skip_wait)
 	greset |= GRSTCTL_CSFTRST;
 	dwc2_writel(hsotg, greset, GRSTCTL);
 
-	if (dwc2_hsotg_wait_bit_clear(hsotg, GRSTCTL, GRSTCTL_CSFTRST, 10000)) {
-		dev_warn(hsotg->dev, "%s: HANG! Soft Reset timeout GRSTCTL GRSTCTL_CSFTRST\n",
-			 __func__);
-		return -EBUSY;
+	if ((hsotg->hw_params.snpsid & DWC2_CORE_REV_MASK) <
+		(DWC2_CORE_REV_4_20a & DWC2_CORE_REV_MASK)) {
+		if (dwc2_hsotg_wait_bit_clear(hsotg, GRSTCTL,
+					      GRSTCTL_CSFTRST, 10000)) {
+			dev_warn(hsotg->dev, "%s: HANG! Soft Reset timeout GRSTCTL_CSFTRST\n",
+				 __func__);
+			return -EBUSY;
+		}
+	} else {
+		if (dwc2_hsotg_wait_bit_set(hsotg, GRSTCTL,
+					    GRSTCTL_CSFTRST_DONE, 10000)) {
+			dev_warn(hsotg->dev, "%s: HANG! Soft Reset timeout GRSTCTL_CSFTRST_DONE\n",
+				 __func__);
+			return -EBUSY;
+		}
+		greset = dwc2_readl(hsotg, GRSTCTL);
+		greset &= ~GRSTCTL_CSFTRST;
+		greset |= GRSTCTL_CSFTRST_DONE;
+		dwc2_writel(hsotg, greset, GRSTCTL);
 	}
 
 	/* Wait for AHB master IDLE state */
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 668d1ad646a4..132d687f1590 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1103,8 +1103,10 @@ struct dwc2_hsotg {
 #define DWC2_CORE_REV_3_00a	0x4f54300a
 #define DWC2_CORE_REV_3_10a	0x4f54310a
 #define DWC2_CORE_REV_4_00a	0x4f54400a
+#define DWC2_CORE_REV_4_20a	0x4f54420a
 #define DWC2_FS_IOT_REV_1_00a	0x5531100a
 #define DWC2_HS_IOT_REV_1_00a	0x5532100a
+#define DWC2_CORE_REV_MASK	0x0000ffff
 
 	/* DWC OTG HW Core ID */
 #define DWC2_OTG_ID		0x4f540000
@@ -1309,6 +1311,8 @@ void dwc2_force_dr_mode(struct dwc2_hsotg *hsotg);
 
 bool dwc2_is_controller_alive(struct dwc2_hsotg *hsotg);
 
+int dwc2_check_core_version(struct dwc2_hsotg *hsotg);
+
 /*
  * Common core Functions.
  * The following functions support managing the DWC_otg controller in either
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 864b76a0b954..c3d6dde2aca4 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -126,6 +126,7 @@
 #define GRSTCTL				HSOTG_REG(0x010)
 #define GRSTCTL_AHBIDLE			BIT(31)
 #define GRSTCTL_DMAREQ			BIT(30)
+#define GRSTCTL_CSFTRST_DONE		BIT(29)
 #define GRSTCTL_TXFNUM_MASK		(0x1f << 6)
 #define GRSTCTL_TXFNUM_SHIFT		6
 #define GRSTCTL_TXFNUM_LIMIT		0x1f
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 8ccc83f7eb3f..ce736d67c7c3 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -782,25 +782,6 @@ int dwc2_get_hwparams(struct dwc2_hsotg *hsotg)
 	u32 hwcfg1, hwcfg2, hwcfg3, hwcfg4;
 	u32 grxfsiz;
 
-	/*
-	 * Attempt to ensure this device is really a DWC_otg Controller.
-	 * Read and verify the GSNPSID register contents. The value should be
-	 * 0x45f4xxxx, 0x5531xxxx or 0x5532xxxx
-	 */
-
-	hw->snpsid = dwc2_readl(hsotg, GSNPSID);
-	if ((hw->snpsid & GSNPSID_ID_MASK) != DWC2_OTG_ID &&
-	    (hw->snpsid & GSNPSID_ID_MASK) != DWC2_FS_IOT_ID &&
-	    (hw->snpsid & GSNPSID_ID_MASK) != DWC2_HS_IOT_ID) {
-		dev_err(hsotg->dev, "Bad value for GSNPSID: 0x%08x\n",
-			hw->snpsid);
-		return -ENODEV;
-	}
-
-	dev_dbg(hsotg->dev, "Core Release: %1x.%1x%1x%1x (snpsid=%x)\n",
-		hw->snpsid >> 12 & 0xf, hw->snpsid >> 8 & 0xf,
-		hw->snpsid >> 4 & 0xf, hw->snpsid & 0xf, hw->snpsid);
-
 	hwcfg1 = dwc2_readl(hsotg, GHWCFG1);
 	hwcfg2 = dwc2_readl(hsotg, GHWCFG2);
 	hwcfg3 = dwc2_readl(hsotg, GHWCFG3);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 69972750e161..e571c8ae65ec 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -362,6 +362,37 @@ static bool dwc2_check_core_endianness(struct dwc2_hsotg *hsotg)
 	return true;
 }
 
+/**
+ * Check core version
+ *
+ * @hsotg: Programming view of the DWC_otg controller
+ *
+ */
+int dwc2_check_core_version(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_hw_params *hw = &hsotg->hw_params;
+
+	/*
+	 * Attempt to ensure this device is really a DWC_otg Controller.
+	 * Read and verify the GSNPSID register contents. The value should be
+	 * 0x45f4xxxx, 0x5531xxxx or 0x5532xxxx
+	 */
+
+	hw->snpsid = dwc2_readl(hsotg, GSNPSID);
+	if ((hw->snpsid & GSNPSID_ID_MASK) != DWC2_OTG_ID &&
+	    (hw->snpsid & GSNPSID_ID_MASK) != DWC2_FS_IOT_ID &&
+	    (hw->snpsid & GSNPSID_ID_MASK) != DWC2_HS_IOT_ID) {
+		dev_err(hsotg->dev, "Bad value for GSNPSID: 0x%08x\n",
+			hw->snpsid);
+		return -ENODEV;
+	}
+
+	dev_dbg(hsotg->dev, "Core Release: %1x.%1x%1x%1x (snpsid=%x)\n",
+		hw->snpsid >> 12 & 0xf, hw->snpsid >> 8 & 0xf,
+		hw->snpsid >> 4 & 0xf, hw->snpsid & 0xf, hw->snpsid);
+	return 0;
+}
+
 /**
  * dwc2_driver_probe() - Called when the DWC_otg core is bound to the DWC_otg
  * driver
@@ -444,6 +475,14 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		of_property_read_bool(dev->dev.of_node,
 				      "snps,need-phy-for-wake");
 
+	/*
+	 * Before performing any core related operations
+	 * check core version.
+	 */
+	retval = dwc2_check_core_version(hsotg);
+	if (retval)
+		goto error;
+
 	/*
 	 * Reset before dwc2_get_hwparams() then it could get power-on real
 	 * reset value form registers.
-- 
2.11.0

