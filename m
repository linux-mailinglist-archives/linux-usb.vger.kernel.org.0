Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79F11A5BFE
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2020 04:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgDLCUD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Apr 2020 22:20:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:58660 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726565AbgDLCUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Apr 2020 22:20:02 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 996FB40191;
        Sun, 12 Apr 2020 02:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1586658002; bh=HGrXQFF2JiioOhfstv6Xcs0YejRBgqD9eb8RA8cO+2M=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BF7njqFnlE1FaPCy9lQWybpa6ktZscfWubOUo8gfNK9DkM56cXK6I853zCTDOZcjo
         pncEzJl6Q0dfmLn29y98QzO9aM2315TOoGQe4+3Ea90RLW04mIShPe4d9TGco953p9
         iN9hJFmXQ3xrS0zPo2G99OBhObIe0awjjWjPb3AN5UfWRpuIwZqxcDdVDslEkMG0qk
         B9qBrR/YQYKmMB5IoL0yN6iCBkrwYKg8Zy7WRXw9ntC0TmE1eb9bIXSrkrEZ8MlZeV
         VA1CHFGRURSap5T4pRZUzOa/JuTmZ2glL853cfjLXLFdDGB/o9Om4jPeUGnD42ZQGF
         0sddTFfqvf5hQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 66387A009D;
        Sun, 12 Apr 2020 02:20:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 11 Apr 2020 19:20:01 -0700
Date:   Sat, 11 Apr 2020 19:20:01 -0700
Message-Id: <e0abfafcb7edd6036c003bd3192d06476d7c0abf.1586657327.git.thinhn@synopsys.com>
In-Reply-To: <cover.1586657326.git.thinhn@synopsys.com>
References: <cover.1586657326.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/2] usb: dwc3: Add support for DWC_usb32 IP
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Synopsys introduces a new controller DWC_usb32. It supports dual-lane
and speed up to 20 Gbps, and the DWC3 driver will drive this controller.
Currently the driver uses a single field dwc->revision to ID both
DWC_usb3 and DWC_usb31 and their version number. This was sufficient for
two IPs, but this method doesn't work with additional IPs. As a result,
let's separate the dwc->revision field to 2 separate fields: ip and
revision. The ip field now stores the ID of the controller's IP while
the revision field stores the controller's version number.

This new scheme enforces DWC3 to compare the revision within the same IP
only. As a result, we must update all the revision check of the
controller to check its corresponding IP.

To help with this enforcement, we create a few macros to help with
the common version checks:

DWC3_IP_IS(IP)
DWC3_VER_IS(IP, VERSION)
DWC3_VER_IS_PRIOR(IP, VERSION)
DWC3_VER_IS_WITHIN(IP, LOWER_VERSION, UPPER_VERSION)
DWC3_VER_TYPE_IS_WITHIN(IP, VERSION,
			LOWER_VERSION_TYPE,
			UPPER_VERSION_TYPE)

The DWC_usb32 controller operates using the same programming model and
with very similar configurations as its previous controllers. Please
note that the various IP and revision checks in this patch match the
current checks for DWC_usb31 version 1.90a. Additional configurations
that are unique to DWC_usb32 are applied separately.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
 - Change the macro to avoid constant to constant comparison static analysis
   warnings. (DWC3x_VERSION_ANY == DWC3x_VERSION_XXX) => !(DWC3x_VERSION_XXX)

 drivers/usb/dwc3/core.c   | 49 ++++++++++++++----------------
 drivers/usb/dwc3/core.h   | 66 ++++++++++++++++++++++------------------
 drivers/usb/dwc3/gadget.c | 77 +++++++++++++++++++++++------------------------
 drivers/usb/dwc3/host.c   |  2 +-
 4 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ab6323b8e323..25c686a752b0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -87,7 +87,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 		if (mode == USB_DR_MODE_OTG &&
 		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
 		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
-		    dwc->revision >= DWC3_REVISION_330A)
+		    !DWC3_VER_IS_PRIOR(DWC3, 330A))
 			mode = USB_DR_MODE_PERIPHERAL;
 	}
 
@@ -264,7 +264,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	 * take a little more than 50ms. Set the polling rate at 20ms
 	 * for 10 times instead.
 	 */
-	if (dwc3_is_usb31(dwc) && dwc->revision >= DWC3_USB31_REVISION_190A)
+	if (DWC3_VER_IS_WITHIN(DWC31, 190A, ANY) || DWC3_IP_IS(DWC32))
 		retries = 10;
 
 	do {
@@ -272,8 +272,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 		if (!(reg & DWC3_DCTL_CSFTRST))
 			goto done;
 
-		if (dwc3_is_usb31(dwc) &&
-		    dwc->revision >= DWC3_USB31_REVISION_190A)
+		if (DWC3_VER_IS_WITHIN(DWC31, 190A, ANY) || DWC3_IP_IS(DWC32))
 			msleep(20);
 		else
 			udelay(1);
@@ -290,7 +289,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	 * is cleared, we must wait at least 50ms before accessing the PHY
 	 * domain (synchronization delay).
 	 */
-	if (dwc3_is_usb31(dwc) && dwc->revision <= DWC3_USB31_REVISION_180A)
+	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 180A))
 		msleep(50);
 
 	return 0;
@@ -305,7 +304,7 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
 	u32 reg;
 	u32 dft;
 
-	if (dwc->revision < DWC3_REVISION_250A)
+	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
 		return;
 
 	if (dwc->fladj == 0)
@@ -586,7 +585,7 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	 * will be '0' when the core is reset. Application needs to set it
 	 * to '1' after the core initialization is completed.
 	 */
-	if (dwc->revision > DWC3_REVISION_194A)
+	if (!DWC3_VER_IS_WITHIN(DWC3, ANY, 194A))
 		reg |= DWC3_GUSB3PIPECTL_SUSPHY;
 
 	/*
@@ -677,7 +676,7 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
 	 * be '0' when the core is reset. Application needs to set it to
 	 * '1' after the core initialization is completed.
 	 */
-	if (dwc->revision > DWC3_REVISION_194A)
+	if (!DWC3_VER_IS_WITHIN(DWC3, ANY, 194A))
 		reg |= DWC3_GUSB2PHYCFG_SUSPHY;
 
 	/*
@@ -726,15 +725,13 @@ static bool dwc3_core_is_valid(struct dwc3 *dwc)
 	u32 reg;
 
 	reg = dwc3_readl(dwc->regs, DWC3_GSNPSID);
+	dwc->ip = DWC3_GSNPS_ID(reg);
 
 	/* This should read as U3 followed by revision number */
-	if ((reg & DWC3_GSNPSID_MASK) == 0x55330000) {
-		/* Detected DWC_usb3 IP */
+	if (DWC3_IP_IS(DWC3)) {
 		dwc->revision = reg;
-	} else if ((reg & DWC3_GSNPSID_MASK) == 0x33310000) {
-		/* Detected DWC_usb31 IP */
+	} else if (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) {
 		dwc->revision = dwc3_readl(dwc->regs, DWC3_VER_NUMBER);
-		dwc->revision |= DWC3_REVISION_IS_DWC31;
 		dwc->version_type = dwc3_readl(dwc->regs, DWC3_VER_TYPE);
 	} else {
 		return false;
@@ -767,8 +764,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 		 */
 		if ((dwc->dr_mode == USB_DR_MODE_HOST ||
 				dwc->dr_mode == USB_DR_MODE_OTG) &&
-				(dwc->revision >= DWC3_REVISION_210A &&
-				dwc->revision <= DWC3_REVISION_250A))
+				DWC3_VER_IS_WITHIN(DWC3, 210A, 250A))
 			reg |= DWC3_GCTL_DSBLCLKGTNG | DWC3_GCTL_SOFITPSYNC;
 		else
 			reg &= ~DWC3_GCTL_DSBLCLKGTNG;
@@ -811,7 +807,7 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 	 * and falls back to high-speed mode which causes
 	 * the device to enter a Connect/Disconnect loop
 	 */
-	if (dwc->revision < DWC3_REVISION_190A)
+	if (DWC3_VER_IS_PRIOR(DWC3, 190A))
 		reg |= DWC3_GCTL_U2RSTECN;
 
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
@@ -964,7 +960,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		goto err0a;
 
 	if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD &&
-	    dwc->revision > DWC3_REVISION_194A) {
+	    !DWC3_VER_IS_WITHIN(DWC3, ANY, 194A)) {
 		if (!dwc->dis_u3_susphy_quirk) {
 			reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
 			reg |= DWC3_GUSB3PIPECTL_SUSPHY;
@@ -1011,20 +1007,20 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 * the DWC_usb3 controller. It is NOT available in the
 	 * DWC_usb31 controller.
 	 */
-	if (!dwc3_is_usb31(dwc) && dwc->revision >= DWC3_REVISION_310A) {
+	if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
 		reg |= DWC3_GUCTL2_RST_ACTBITLATER;
 		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
 	}
 
-	if (dwc->revision >= DWC3_REVISION_250A) {
+	if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
 
 		/*
 		 * Enable hardware control of sending remote wakeup
 		 * in HS when the device is in the L1 state.
 		 */
-		if (dwc->revision >= DWC3_REVISION_290A)
+		if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
 			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
 
 		if (dwc->dis_tx_ipgap_linecheck_quirk)
@@ -1056,7 +1052,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 * Must config both number of packets and max burst settings to enable
 	 * RX and/or TX threshold.
 	 */
-	if (dwc3_is_usb31(dwc) && dwc->dr_mode == USB_DR_MODE_HOST) {
+	if (!DWC3_IP_IS(DWC3) && dwc->dr_mode == USB_DR_MODE_HOST) {
 		u8 rx_thr_num = dwc->rx_thr_num_pkt_prd;
 		u8 rx_maxburst = dwc->rx_max_burst_prd;
 		u8 tx_thr_num = dwc->tx_thr_num_pkt_prd;
@@ -1378,10 +1374,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 /* check whether the core supports IMOD */
 bool dwc3_has_imod(struct dwc3 *dwc)
 {
-	return ((dwc3_is_usb3(dwc) &&
-		 dwc->revision >= DWC3_REVISION_300A) ||
-		(dwc3_is_usb31(dwc) &&
-		 dwc->revision >= DWC3_USB31_REVISION_120A));
+	return DWC3_VER_IS_WITHIN(DWC3, 300A, ANY) ||
+		DWC3_VER_IS_WITHIN(DWC31, 120A, ANY) ||
+		DWC3_IP_IS(DWC32);
 }
 
 static void dwc3_check_params(struct dwc3 *dwc)
@@ -1402,7 +1397,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
 	 * affected version.
 	 */
 	if (!dwc->imod_interval &&
-	    (dwc->revision == DWC3_REVISION_300A))
+	    DWC3_VER_IS(DWC3, 300A))
 		dwc->imod_interval = 1;
 
 	/* Check the maximum_speed parameter */
@@ -1424,7 +1419,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
 		/*
 		 * default to superspeed plus if we are capable.
 		 */
-		if (dwc3_is_usb31(dwc) &&
+		if ((DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) &&
 		    (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
 		     DWC3_GHWPARAMS3_SSPHY_IFC_GEN2))
 			dwc->maximum_speed = USB_SPEED_SUPER_PLUS;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e054a79024c7..b2903492437a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -69,6 +69,7 @@
 #define DWC3_GEVNTCOUNT_EHB	BIT(31)
 #define DWC3_GSNPSID_MASK	0xffff0000
 #define DWC3_GSNPSREV_MASK	0xffff
+#define DWC3_GSNPS_ID(p)	(((p) & DWC3_GSNPSID_MASK) >> 16)
 
 /* DWC3 registers memory space boundries */
 #define DWC3_XHCI_REGS_START		0x0
@@ -949,7 +950,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
- * @revision: revision register contents
+ * @ip: controller's ID
+ * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
  * @dr_mode: requested mode of operation
  * @current_dr_role: current role of operation when in dual-role mode
@@ -1110,15 +1112,15 @@ struct dwc3 {
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
+#define DWC3_IP			0x5533
+#define DWC31_IP		0x3331
+#define DWC32_IP		0x3332
+
 	u32			revision;
 
+#define DWC3_REVISION_ANY	0x0
 #define DWC3_REVISION_173A	0x5533173a
 #define DWC3_REVISION_175A	0x5533175a
 #define DWC3_REVISION_180A	0x5533180a
@@ -1143,20 +1145,17 @@ struct dwc3 {
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
+#define DWC31_REVISION_ANY	0x0
+#define DWC31_REVISION_110A	0x3131302a
+#define DWC31_REVISION_120A	0x3132302a
+#define DWC31_REVISION_160A	0x3136302a
+#define DWC31_REVISION_170A	0x3137302a
+#define DWC31_REVISION_180A	0x3138302a
+#define DWC31_REVISION_190A	0x3139302a
 
 	u32			version_type;
 
+#define DWC31_VERSIONTYPE_ANY		0x0
 #define DWC31_VERSIONTYPE_EA01		0x65613031
 #define DWC31_VERSIONTYPE_EA02		0x65613032
 #define DWC31_VERSIONTYPE_EA03		0x65613033
@@ -1400,17 +1399,26 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode);
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
 
-/* check whether we are on the DWC_usb3 core */
-static inline bool dwc3_is_usb3(struct dwc3 *dwc)
-{
-	return !(dwc->revision & DWC3_REVISION_IS_DWC31);
-}
+#define DWC3_IP_IS(_ip)							\
+	(dwc->ip == _ip##_IP)
 
-/* check whether we are on the DWC_usb31 core */
-static inline bool dwc3_is_usb31(struct dwc3 *dwc)
-{
-	return !!(dwc->revision & DWC3_REVISION_IS_DWC31);
-}
+#define DWC3_VER_IS(_ip, _ver)						\
+	(DWC3_IP_IS(_ip) && dwc->revision == _ip##_REVISION_##_ver)
+
+#define DWC3_VER_IS_PRIOR(_ip, _ver)					\
+	(DWC3_IP_IS(_ip) && dwc->revision < _ip##_REVISION_##_ver)
+
+#define DWC3_VER_IS_WITHIN(_ip, _from, _to)				\
+	(DWC3_IP_IS(_ip) &&						\
+	 dwc->revision >= _ip##_REVISION_##_from &&			\
+	 (!(_ip##_REVISION_##_to) ||					\
+	  dwc->revision <= _ip##_REVISION_##_to))
+
+#define DWC3_VER_TYPE_IS_WITHIN(_ip, _ver, _from, _to)			\
+	(DWC3_VER_IS(_ip, _ver) &&					\
+	 dwc->version_type >= _ip##_VERSIONTYPE_##_from &&		\
+	 (!(_ip##_VERSIONTYPE_##_to) ||					\
+	  dwc->version_type <= _ip##_VERSIONTYPE_##_to))
 
 bool dwc3_has_imod(struct dwc3 *dwc);
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ada5aa209346..31c968db728d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -95,7 +95,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	 * Wait until device controller is ready. Only applies to 1.94a and
 	 * later RTL.
 	 */
-	if (dwc->revision >= DWC3_REVISION_194A) {
+	if (!DWC3_VER_IS_PRIOR(DWC3, 194A)) {
 		while (--retries) {
 			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 			if (reg & DWC3_DSTS_DCNRD)
@@ -122,7 +122,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state)
 	 * The following code is racy when called from dwc3_gadget_wakeup,
 	 * and is not needed, at least on newer versions
 	 */
-	if (dwc->revision >= DWC3_REVISION_194A)
+	if (!DWC3_VER_IS_PRIOR(DWC3, 194A))
 		return 0;
 
 	/* wait for a change in DSTS */
@@ -420,7 +420,8 @@ static int dwc3_send_clear_stall_ep_cmd(struct dwc3_ep *dep)
 	 * IN transfers due to a mishandled error condition. Synopsys
 	 * STAR 9000614252.
 	 */
-	if (dep->direction && (dwc->revision >= DWC3_REVISION_260A) &&
+	if (dep->direction &&
+	    !DWC3_VER_IS_PRIOR(DWC3, 260A) &&
 	    (dwc->gadget.speed >= USB_SPEED_SUPER))
 		cmd |= DWC3_DEPCMD_CLEARPENDIN;
 
@@ -1421,12 +1422,9 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 		return -EAGAIN;
 	}
 
-	if (!dwc->dis_start_transfer_quirk && dwc3_is_usb31(dwc) &&
-	    (dwc->revision <= DWC3_USB31_REVISION_160A ||
-	     (dwc->revision == DWC3_USB31_REVISION_170A &&
-	      dwc->version_type >= DWC31_VERSIONTYPE_EA01 &&
-	      dwc->version_type <= DWC31_VERSIONTYPE_EA06))) {
-
+	if (!dwc->dis_start_transfer_quirk &&
+	    (DWC3_VER_IS_PRIOR(DWC31, 170A) ||
+	     DWC3_VER_TYPE_IS_WITHIN(DWC31, 170A, EA01, EA06))) {
 		if (dwc->gadget.speed <= USB_SPEED_HIGH && dep->direction)
 			return dwc3_gadget_start_isoc_quirk(dep);
 	}
@@ -1822,7 +1820,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
 	}
 
 	/* Recent versions do this automatically */
-	if (dwc->revision < DWC3_REVISION_194A) {
+	if (DWC3_VER_IS_PRIOR(DWC3, 194A)) {
 		/* write zeroes to Link Change Request */
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
@@ -1884,12 +1882,12 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (is_on) {
-		if (dwc->revision <= DWC3_REVISION_187A) {
+		if (DWC3_VER_IS_WITHIN(DWC3, ANY, 187A)) {
 			reg &= ~DWC3_DCTL_TRGTULST_MASK;
 			reg |= DWC3_DCTL_TRGTULST_RX_DET;
 		}
 
-		if (dwc->revision >= DWC3_REVISION_194A)
+		if (!DWC3_VER_IS_PRIOR(DWC3, 194A))
 			reg &= ~DWC3_DCTL_KEEP_CONNECT;
 		reg |= DWC3_DCTL_RUN_STOP;
 
@@ -1963,7 +1961,7 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
 			DWC3_DEVTEN_USBRSTEN |
 			DWC3_DEVTEN_DISCONNEVTEN);
 
-	if (dwc->revision < DWC3_REVISION_250A)
+	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
 		reg |= DWC3_DEVTEN_ULSTCNGEN;
 
 	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
@@ -2044,10 +2042,10 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	 * bursts of data without going through any sort of endpoint throttling.
 	 */
 	reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
-	if (dwc3_is_usb31(dwc))
-		reg &= ~DWC31_GRXTHRCFG_PKTCNTSEL;
-	else
+	if (DWC3_IP_IS(DWC3))
 		reg &= ~DWC3_GRXTHRCFG_PKTCNTSEL;
+	else
+		reg &= ~DWC31_GRXTHRCFG_PKTCNTSEL;
 
 	dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
 
@@ -2220,7 +2218,7 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	 * STAR#9000525659: Clock Domain Crossing on DCTL in
 	 * USB 2.0 Mode
 	 */
-	if (dwc->revision < DWC3_REVISION_220A &&
+	if (DWC3_VER_IS_PRIOR(DWC3, 220A) &&
 	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
@@ -2238,18 +2236,18 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 			reg |= DWC3_DCFG_SUPERSPEED;
 			break;
 		case USB_SPEED_SUPER_PLUS:
-			if (dwc3_is_usb31(dwc))
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-			else
+			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
 			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
 
-			if (dwc->revision & DWC3_REVISION_IS_DWC31)
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-			else
+			if (DWC3_IP_IS(DWC3))
 				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
@@ -2296,10 +2294,10 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	mdwidth /= 8;
 
 	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
-	if (dwc3_is_usb31(dwc))
-		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
-	else
+	if (DWC3_IP_IS(DWC3))
 		size = DWC3_GTXFIFOSIZ_TXFDEP(size);
+	else
+		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
 
 	/* FIFO Depth is in MDWDITH bytes. Multiply */
 	size *= mdwidth;
@@ -2342,10 +2340,10 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 
 	/* All OUT endpoints share a single RxFIFO space */
 	size = dwc3_readl(dwc->regs, DWC3_GRXFIFOSIZ(0));
-	if (dwc3_is_usb31(dwc))
-		size = DWC31_GRXFIFOSIZ_RXFDEP(size);
-	else
+	if (DWC3_IP_IS(DWC3))
 		size = DWC3_GRXFIFOSIZ_RXFDEP(size);
+	else
+		size = DWC31_GRXFIFOSIZ_RXFDEP(size);
 
 	/* FIFO depth is in MDWDITH bytes */
 	size *= mdwidth;
@@ -2669,7 +2667,7 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 	 * WORKAROUND: This is the 2nd half of U1/U2 -> U0 workaround.
 	 * See dwc3_gadget_linksts_change_interrupt() for 1st half.
 	 */
-	if (dwc->revision < DWC3_REVISION_183A) {
+	if (DWC3_VER_IS_PRIOR(DWC3, 183A)) {
 		u32		reg;
 		int		i;
 
@@ -2927,7 +2925,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	 * STAR#9000466709: RTL: Device : Disconnect event not
 	 * generated if setup packet pending in FIFO
 	 */
-	if (dwc->revision < DWC3_REVISION_188A) {
+	if (DWC3_VER_IS_PRIOR(DWC3, 188A)) {
 		if (dwc->setup_packet_pending)
 			dwc3_gadget_disconnect_interrupt(dwc);
 	}
@@ -2986,7 +2984,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		 * STAR#9000483510: RTL: SS : USB3 reset event may
 		 * not be generated always when the link enters poll
 		 */
-		if (dwc->revision < DWC3_REVISION_190A)
+		if (DWC3_VER_IS_PRIOR(DWC3, 190A))
 			dwc3_gadget_reset_interrupt(dwc);
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
@@ -3014,7 +3012,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 	/* Enable USB2 LPM Capability */
 
-	if ((dwc->revision > DWC3_REVISION_194A) &&
+	if (!DWC3_VER_IS_WITHIN(DWC3, ANY, 194A) &&
 	    (speed != DWC3_DSTS_SUPERSPEED) &&
 	    (speed != DWC3_DSTS_SUPERSPEED_PLUS)) {
 		reg = dwc3_readl(dwc->regs, DWC3_DCFG);
@@ -3033,11 +3031,10 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		 * BESL value in the LPM token is less than or equal to LPM
 		 * NYET threshold.
 		 */
-		WARN_ONCE(dwc->revision < DWC3_REVISION_240A
-				&& dwc->has_lpm_erratum,
+		WARN_ONCE(DWC3_VER_IS_PRIOR(DWC3, 240A) && dwc->has_lpm_erratum,
 				"LPM Erratum not available on dwc3 revisions < 2.40a\n");
 
-		if (dwc->has_lpm_erratum && dwc->revision >= DWC3_REVISION_240A)
+		if (dwc->has_lpm_erratum && !DWC3_VER_IS_PRIOR(DWC3, 240A))
 			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
 
 		dwc3_gadget_dctl_write_safe(dwc, reg);
@@ -3108,7 +3105,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	 * operational mode
 	 */
 	pwropt = DWC3_GHWPARAMS1_EN_PWROPT(dwc->hwparams.hwparams1);
-	if ((dwc->revision < DWC3_REVISION_250A) &&
+	if (DWC3_VER_IS_PRIOR(DWC3, 250A) &&
 			(pwropt != DWC3_GHWPARAMS1_EN_PWROPT_HIB)) {
 		if ((dwc->link_state == DWC3_LINK_STATE_U3) &&
 				(next == DWC3_LINK_STATE_RESUME)) {
@@ -3134,7 +3131,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 	 * STAR#9000446952: RTL: Device SS : if U1/U2 ->U0 takes >128us
 	 * core send LGO_Ux entering U0
 	 */
-	if (dwc->revision < DWC3_REVISION_183A) {
+	if (DWC3_VER_IS_PRIOR(DWC3, 183A)) {
 		if (next == DWC3_LINK_STATE_U0) {
 			u32	u1u2;
 			u32	reg;
@@ -3245,7 +3242,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 		break;
 	case DWC3_DEVICE_EVENT_EOPF:
 		/* It changed to be suspend event for version 2.30a and above */
-		if (dwc->revision >= DWC3_REVISION_230A) {
+		if (!DWC3_VER_IS_PRIOR(DWC3, 230A)) {
 			/*
 			 * Ignore suspend event until the gadget enters into
 			 * USB_STATE_CONFIGURED state.
@@ -3490,7 +3487,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	 * is less than super speed because we don't have means, yet, to tell
 	 * composite.c that we are USB 2.0 + LPM ECN.
 	 */
-	if (dwc->revision < DWC3_REVISION_220A &&
+	if (DWC3_VER_IS_PRIOR(DWC3, 220A) &&
 	    !dwc->dis_metastability_quirk)
 		dev_info(dwc->dev, "changing max_speed on rev %08x\n",
 				dwc->revision);
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 86dbd012b984..bef1c1ac2067 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -104,7 +104,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	 *
 	 * This following flag tells XHCI to do just that.
 	 */
-	if (dwc->revision <= DWC3_REVISION_300A)
+	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
 	if (prop_idx) {
-- 
2.11.0

