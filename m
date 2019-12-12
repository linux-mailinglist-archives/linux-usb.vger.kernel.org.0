Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4E911C38B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfLLCt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:27 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:38162 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727811AbfLLCt1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:27 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4DBB5C000E;
        Thu, 12 Dec 2019 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118966; bh=odLYiJc96TrK6C6Bg/wVT/jB/bFOpnDN9RbDWeVPbcU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=k51YgfkOolVyNYYSh02nsDaRbQ1h1PNSRXZFIeOmMzTiW8r9YHOemqOv58RZzbJah
         wPJUbdi7x5q40vRJwZEXgX6DuqGZRAj6lGdfPkMqMwahGadThd6oVwLbeWgDnQpZsw
         c24uBoojzV3ncMtuu078wYinjKEJVH7dNcLZ3CRR/s0sxzXqXpyYIPy8pihhE1X8X2
         K3c738yDr7bO4pNjhA0oa1s0LmZmI8Zj3ShdOXeGH3NzEs7khPWu5ZtkDSEadeifyP
         4wZaOKHwawMbwTrG9okUFStuepPFayVtcufvhly+VHhqvE2qoUdFFd9yCXmI1amLVv
         XfEqkuSn+YRkQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2085AA006F;
        Thu, 12 Dec 2019 02:49:25 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:25 -0800
Date:   Wed, 11 Dec 2019 18:49:25 -0800
Message-Id: <368532f16fcd511c62d3c32e0439451512b9a903.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 04/14] usb: dwc3: Implement new id check for DWC_usb32
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Synopsys introduces a new controller DWC_usb32 that supports dual-lane
and speed up to 40 Gbps, and DWC3 driver will drive this controller.
Currently DWC3 uses a single field dwc->revision to ID both the
controllers and their version number. This was sufficient for two
controllers DWC_usb3 and DWC_usb31. However, this check no longer works
to support additional controllers. As a result, let's separate the
dwc->revision field to 2 separate fields: ip and revision. The ip field
now stores the ID of the controller's IP while the revision field stores
the controller's version number.

This new scheme enforces DWC3 to compare the revision within the same
controller's IP only. This patch updates all the revision check of
DWC_usb3 and DWC_usb31 controller to also check the controller's IP.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 31 +++++++++++++++----------------
 drivers/usb/dwc3/core.h   | 44 +++++++++++++++++++++++---------------------
 drivers/usb/dwc3/gadget.c | 44 ++++++++++++++++++++++++--------------------
 drivers/usb/dwc3/host.c   |  2 +-
 4 files changed, 63 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f561c6c9e8a9..694984a30c5f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -85,7 +85,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 		 * specified or set to OTG, then set the mode to peripheral.
 		 */
 		if (mode == USB_DR_MODE_OTG &&
-		    dwc->revision >= DWC3_REVISION_330A)
+		    !(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_330A))
 			mode = USB_DR_MODE_PERIPHERAL;
 	}
 
@@ -304,7 +304,7 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
 	u32 reg;
 	u32 dft;
 
-	if (dwc->revision < DWC3_REVISION_250A)
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_250A)
 		return;
 
 	if (dwc->fladj == 0)
@@ -585,7 +585,7 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	 * will be '0' when the core is reset. Application needs to set it
 	 * to '1' after the core initialization is completed.
 	 */
-	if (dwc->revision > DWC3_REVISION_194A)
+	if (!(dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_194A))
 		reg |= DWC3_GUSB3PIPECTL_SUSPHY;
 
 	/*
@@ -676,7 +676,7 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	 * be '0' when the core is reset. Application needs to set it to
 	 * '1' after the core initialization is completed.
 	 */
-	if (dwc->revision > DWC3_REVISION_194A)
+	if (!(dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_194A))
 		reg |= DWC3_GUSB2PHYCFG_SUSPHY;
 
 	/*
@@ -725,15 +725,13 @@ static bool dwc3_core_is_valid(struct dwc3 *dwc)
 	u32 reg;
 
 	reg = dwc3_readl(dwc->regs, DWC3_GSNPSID);
+	dwc->ip = DWC3_GSNPS_ID(reg);
 
 	/* This should read as U3 followed by revision number */
-	if ((reg & DWC3_GSNPSID_MASK) == 0x55330000) {
-		/* Detected DWC_usb3 IP */
+	if (dwc->ip == DWC3_IP_USB3) {
 		dwc->revision = reg;
-	} else if ((reg & DWC3_GSNPSID_MASK) == 0x33310000) {
-		/* Detected DWC_usb31 IP */
+	} else if (dwc->ip == DWC3_IP_USB31 || dwc->ip == DWC3_IP_USB32) {
 		dwc->revision = dwc3_readl(dwc->regs, DWC3_VER_NUMBER);
-		dwc->revision |= DWC3_REVISION_IS_DWC31;
 		dwc->version_type = dwc3_readl(dwc->regs, DWC3_VER_TYPE);
 	} else {
 		return false;
@@ -766,8 +764,9 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 		 */
 		if ((dwc->dr_mode == USB_DR_MODE_HOST ||
 				dwc->dr_mode == USB_DR_MODE_OTG) &&
-				(dwc->revision >= DWC3_REVISION_210A &&
-				dwc->revision <= DWC3_REVISION_250A))
+				(dwc3_is_usb3(dwc) &&
+				 dwc->revision >= DWC3_REVISION_210A &&
+				 dwc->revision <= DWC3_REVISION_250A))
 			reg |= DWC3_GCTL_DSBLCLKGTNG | DWC3_GCTL_SOFITPSYNC;
 		else
 			reg &= ~DWC3_GCTL_DSBLCLKGTNG;
@@ -810,7 +809,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 	 * and falls back to high-speed mode which causes
 	 * the device to enter a Connect/Disconnect loop
 	 */
-	if (dwc->revision < DWC3_REVISION_190A)
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_190A)
 		reg |= DWC3_GCTL_U2RSTECN;
 
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
@@ -963,7 +962,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		goto err0a;
 
 	if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD &&
-	    dwc->revision > DWC3_REVISION_194A) {
+	    !(dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_194A)) {
 		if (!dwc->dis_u3_susphy_quirk) {
 			reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
 			reg |= DWC3_GUSB3PIPECTL_SUSPHY;
@@ -1016,14 +1015,14 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
 	}
 
-	if (dwc->revision >= DWC3_REVISION_250A) {
+	if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_250A)) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
 
 		/*
 		 * Enable hardware control of sending remote wakeup
 		 * in HS when the device is in the L1 state.
 		 */
-		if (dwc->revision >= DWC3_REVISION_290A)
+		if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_290A))
 			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
 
 		if (dwc->dis_tx_ipgap_linecheck_quirk)
@@ -1393,7 +1392,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
 	 * affected version.
 	 */
 	if (!dwc->imod_interval &&
-	    (dwc->revision == DWC3_REVISION_300A))
+	    (dwc3_is_usb3(dwc) && dwc->revision == DWC3_REVISION_300A))
 		dwc->imod_interval = 1;
 
 	/* Check the maximum_speed parameter */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 0f019db5e125..7fde3c7da543 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -68,6 +68,7 @@
 #define DWC3_GEVNTCOUNT_EHB	BIT(31)
 #define DWC3_GSNPSID_MASK	0xffff0000
 #define DWC3_GSNPSREV_MASK	0xffff
+#define DWC3_GSNPS_ID(p)	(((p) & DWC3_GSNPSID_MASK) >> 16)
 
 /* DWC3 registers memory space boundries */
 #define DWC3_XHCI_REGS_START		0x0
@@ -945,7 +946,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
- * @revision: revision register contents
+ * @ip: controller's ID
+ * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
  * @dr_mode: requested mode of operation
  * @current_dr_role: current role of operation when in dual-role mode
@@ -1099,13 +1101,12 @@ struct dwc3 {
 	u32			u1u2;
 	u32			maximum_speed;
 
-	/*
-	 * All 3.1 IP version constants are greater than the 3.0 IP
-	 * version constants. This works for most version checks in
-	 * dwc3. However, in the future, this may not apply as
-	 * features may be developed on newer versions of the 3.0 IP
-	 * that are not in the 3.1 IP.
-	 */
+	u32			ip;
+
+#define DWC3_IP_USB3		0x5533
+#define DWC3_IP_USB31		0x3331
+#define DWC3_IP_USB32		0x3332
+
 	u32			revision;
 
 #define DWC3_REVISION_173A	0x5533173a
@@ -1132,17 +1133,12 @@ struct dwc3 {
 #define DWC3_REVISION_310A	0x5533310a
 #define DWC3_REVISION_330A	0x5533330a
 
-/*
- * NOTICE: we're using bit 31 as a "is usb 3.1" flag. This is really
- * just so dwc31 revisions are always larger than dwc3.
- */
-#define DWC3_REVISION_IS_DWC31		0x80000000
-#define DWC3_USB31_REVISION_110A	(0x3131302a | DWC3_REVISION_IS_DWC31)
-#define DWC3_USB31_REVISION_120A	(0x3132302a | DWC3_REVISION_IS_DWC31)
-#define DWC3_USB31_REVISION_160A	(0x3136302a | DWC3_REVISION_IS_DWC31)
-#define DWC3_USB31_REVISION_170A	(0x3137302a | DWC3_REVISION_IS_DWC31)
-#define DWC3_USB31_REVISION_180A	(0x3138302a | DWC3_REVISION_IS_DWC31)
-#define DWC3_USB31_REVISION_190A	(0x3139302a | DWC3_REVISION_IS_DWC31)
+#define DWC3_USB31_REVISION_110A	0x3131302a
+#define DWC3_USB31_REVISION_120A	0x3132302a
+#define DWC3_USB31_REVISION_160A	0x3136302a
+#define DWC3_USB31_REVISION_170A	0x3137302a
+#define DWC3_USB31_REVISION_180A	0x3138302a
+#define DWC3_USB31_REVISION_190A	0x3139302a
 
 	u32			version_type;
 
@@ -1391,13 +1387,19 @@ u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 /* check whether we are on the DWC_usb3 core */
 static inline bool dwc3_is_usb3(struct dwc3 *dwc)
 {
-	return !(dwc->revision & DWC3_REVISION_IS_DWC31);
+	return dwc->ip == DWC3_IP_USB3;
 }
 
 /* check whether we are on the DWC_usb31 core */
 static inline bool dwc3_is_usb31(struct dwc3 *dwc)
 {
-	return !!(dwc->revision & DWC3_REVISION_IS_DWC31);
+	return dwc->ip == DWC3_IP_USB31;
+}
+
+/* check whether we are on the DWC_usb32 core */
+static inline bool dwc3_is_usb32(struct dwc3 *dwc)
+{
+	return dwc->ip == DWC3_IP_USB32;
 }
 
 bool dwc3_has_imod(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8657c744e826..e0652253ad27 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -95,7 +95,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	 * Wait until device controller is ready. Only applies to 1.94a and
 	 * later RTL.
 	 */
-	if (dwc->revision >= DWC3_REVISION_194A) {
+	if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_194A)) {
 		while (--retries) {
 			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 			if (reg & DWC3_DSTS_DCNRD)
@@ -122,7 +122,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	 * The following code is racy when called from dwc3_gadget_wakeup,
 	 * and is not needed, at least on newer versions
 	 */
-	if (dwc->revision >= DWC3_REVISION_194A)
+	if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_194A))
 		return 0;
 
 	/* wait for a change in DSTS */
@@ -415,7 +415,8 @@ static int dwc3_send_clear_stall_ep_cmd(struct dwc3_ep *dep)
 	 * IN transfers due to a mishandled error condition. Synopsys
 	 * STAR 9000614252.
 	 */
-	if (dep->direction && (dwc->revision >= DWC3_REVISION_260A) &&
+	if (dep->direction &&
+	    !(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_260A) &&
 	    (dwc->gadget.speed >= USB_SPEED_SUPER))
 		cmd |= DWC3_DEPCMD_CLEARPENDIN;
 
@@ -1747,7 +1748,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	}
 
 	/* Recent versions do this automatically */
-	if (dwc->revision < DWC3_REVISION_194A) {
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_194A) {
 		/* write zeroes to Link Change Request */
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
@@ -1809,12 +1810,12 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (is_on) {
-		if (dwc->revision <= DWC3_REVISION_187A) {
+		if (dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_187A) {
 			reg &= ~DWC3_DCTL_TRGTULST_MASK;
 			reg |= DWC3_DCTL_TRGTULST_RX_DET;
 		}
 
-		if (dwc->revision >= DWC3_REVISION_194A)
+		if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_194A))
 			reg &= ~DWC3_DCTL_KEEP_CONNECT;
 		reg |= DWC3_DCTL_RUN_STOP;
 
@@ -1888,7 +1889,7 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
 			DWC3_DEVTEN_USBRSTEN |
 			DWC3_DEVTEN_DISCONNEVTEN);
 
-	if (dwc->revision < DWC3_REVISION_250A)
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_250A)
 		reg |= DWC3_DEVTEN_ULSTCNGEN;
 
 	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
@@ -2145,7 +2146,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	 * STAR#9000525659: Clock Domain Crossing on DCTL in
 	 * USB 2.0 Mode
 	 */
-	if (dwc->revision < DWC3_REVISION_220A &&
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_220A &&
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
@@ -2171,7 +2172,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 		default:
 			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
 
-			if (dwc->revision & DWC3_REVISION_IS_DWC31)
+			if (dwc3_is_usb31(dwc))
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			else
 				reg |= DWC3_DCFG_SUPERSPEED;
@@ -2588,7 +2589,7 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
 	 * See dwc3_gadget_linksts_change_interrupt() for 1st half.
 	 */
-	if (dwc->revision < DWC3_REVISION_183A) {
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_183A) {
 		u32		reg;
 		int		i;
 
@@ -2755,7 +2756,8 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	if (!interrupt)
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 
-	if (dwc3_is_usb31(dwc) || dwc->revision < DWC3_REVISION_310A)
+	if (dwc3_is_usb31(dwc) ||
+	    (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_310A))
 		udelay(100);
 }
 
@@ -2833,7 +2835,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	 * STAR#9000466709: RTL: Device : Disconnect event not
 	 * generated if setup packet pending in FIFO
 	 */
-	if (dwc->revision < DWC3_REVISION_188A) {
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_188A) {
 		if (dwc->setup_packet_pending)
 			dwc3_gadget_disconnect_interrupt(dwc);
 	}
@@ -2892,7 +2894,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		 * STAR#9000483510: RTL: SS : USB3 reset event may
 		 * not be generated always when the link enters poll
 		 */
-		if (dwc->revision < DWC3_REVISION_190A)
+		if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_190A)
 			dwc3_gadget_reset_interrupt(dwc);
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
@@ -2920,7 +2922,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 	/* Enable USB2 LPM Capability */
 
-	if ((dwc->revision > DWC3_REVISION_194A) &&
+	if (!(dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_194A) &&
 	    (speed != DWC3_DSTS_SUPERSPEED) &&
 	    (speed != DWC3_DSTS_SUPERSPEED_PLUS)) {
 		reg = dwc3_readl(dwc->regs, DWC3_DCFG);
@@ -2939,11 +2941,13 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		 * BESL value in the LPM token is less than or equal to LPM
 		 * NYET threshold.
 		 */
-		WARN_ONCE(dwc->revision < DWC3_REVISION_240A
+		WARN_ONCE(dwc3_is_usb3(dwc) &&
+			  dwc->revision < DWC3_REVISION_240A
 				&& dwc->has_lpm_erratum,
 				"LPM Erratum not available on dwc3 revisions < 2.40a\n");
 
-		if (dwc->has_lpm_erratum && dwc->revision >= DWC3_REVISION_240A)
+		if (dwc->has_lpm_erratum &&
+		    !(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_240A))
 			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
 
 		dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -3014,7 +3018,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	 * operational mode
 	 */
 	pwropt = DWC3_GHWPARAMS1_EN_PWROPT(dwc->hwparams.hwparams1);
-	if ((dwc->revision < DWC3_REVISION_250A) &&
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_250A &&
 			(pwropt != DWC3_GHWPARAMS1_EN_PWROPT_HIB)) {
 		if ((dwc->link_state == DWC3_LINK_STATE_U3) &&
 				(next == DWC3_LINK_STATE_RESUME)) {
@@ -3040,7 +3044,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	 * STAR#9000446952: RTL: Device SS : if U1/U2 ->U0 takes >128us
 	 * core send LGO_Ux entering U0
 	 */
-	if (dwc->revision < DWC3_REVISION_183A) {
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_183A) {
 		if (next == DWC3_LINK_STATE_U0) {
 			u32	u1u2;
 			u32	reg;
@@ -3151,7 +3155,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		break;
 	case DWC3_DEVICE_EVENT_EOPF:
 		/* It changed to be suspend event for version 2.30a and above */
-		if (dwc->revision >= DWC3_REVISION_230A) {
+		if (!(dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_230A)) {
 			/*
 			 * Ignore suspend event until the gadget enters into
 			 * USB_STATE_CONFIGURED state.
@@ -3396,7 +3400,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	 * is less than super speed because we don't have means, yet, to tell
 	 * composite.c that we are USB 2.0 + LPM ECN.
 	 */
-	if (dwc->revision < DWC3_REVISION_220A &&
+	if (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_220A &&
 	    !dwc->dis_metastability_quirk)
 		dev_info(dwc->dev, "changing max_speed on rev %08x\n",
 				dwc->revision);
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 5567ed2cddbe..e8fc3800e3c0 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -102,7 +102,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	 *
 	 * This following flag tells XHCI to do just that.
 	 */
-	if (dwc->revision <= DWC3_REVISION_300A)
+	if (dwc3_is_usb3(dwc) && dwc->revision <= DWC3_REVISION_300A)
 		props[prop_idx++].name = "quirk-broken-port-ped";
 
 	if (prop_idx) {
-- 
2.11.0

