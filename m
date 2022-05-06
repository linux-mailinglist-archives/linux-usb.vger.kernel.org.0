Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1808551DD72
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 18:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443703AbiEFQUT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 12:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350965AbiEFQUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 12:20:18 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE20DBC85
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651853794; x=1683389794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aLZECGEma6e8axsukOqTeSv3Th1TWba2cXpXfEVYvz0=;
  b=iukhjpy6BeJwrcRFseBHNI/oNuLLhT0rspSRg9srQ+STo+SIncofHnLN
   14XRCoTb6+OxREYAgIK8MpRXtSK/5TEcufSsTtSUu5BCdB8SlHwd+LzWJ
   Xd8aoTuMYp3GajZfrHHLtbvPycSckeXh+I9KOMyvlqlWTsgrqjam6sZqB
   8dBc3AJKE51J+OVGkCXNPyPaB28ibrKl2DYTK9/2lH/5ln0iy4dw40lPC
   FhxqLWhOuh4v5H+xYockhJWJp9HSgjLWUzLU/HhCf5p+2VyNhqG6af4nb
   JeL8knPf1rBuyFISw2zb7HFSWMNAxEWG3D2F/eJ2yrayHn8vR0ASGUjGj
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="354941606"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="354941606"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 09:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="632992879"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2022 09:16:33 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] usb: Avoid extra usb SET_SEL requests when enabling link power management
Date:   Fri,  6 May 2022 19:18:07 +0300
Message-Id: <20220506161807.3369439-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The host needs to tell the device the exit latencies using the SET_SEL
request before device initiated link powermanagement can be enabled.

The exit latency values do not change after enumeration, it's enough
to set them once. So do like Windows 10 and issue the SET_SEL request
once just before setting the configuration.

This is also the sequence described in USB 3.2 specs "9.1.2 Bus
enumeration". SET_SEL is issued once before the Set Configuration
request, and won't be cleared by the Set Configuration,
Set Interface or ClearFeature (STALL) requests.

Only warm reset, hot reset, set Address 0 clears the exit latencies.
See USB 3.2 section 9.4.14 Table 9-10 Device parameters and events

Add udev->lpm_devinit_allow, and set it if SET_SEL was successful.
If not set, then don't try to enable device initiated LPM

We used to issue a SET_SEL request every time lpm is enabled for either
U1 or U2 link states, meaning a SET_SEL was issued twice after every
Set Configuration and Set Interface requests, easily accumulating to
over 15 SET_SEL requets during a USB3 webcam enumeration.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 60 +++++++++++++++---------------------------
 include/linux/usb.h    |  2 ++
 2 files changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7781b2d31473..1af50eb3765e 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3946,7 +3946,7 @@ static const char * const usb3_lpm_names[]  = {
  * This function will fail if the SEL or PEL values for udev are greater than
  * the maximum allowed values for the link state to be enabled.
  */
-static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
+static int usb_req_set_sel(struct usb_device *udev)
 {
 	struct usb_set_sel_req *sel_values;
 	unsigned long long u1_sel;
@@ -3955,7 +3955,7 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
 	unsigned long long u2_pel;
 	int ret;
 
-	if (udev->state != USB_STATE_CONFIGURED)
+	if (!udev->parent || udev->speed < USB_SPEED_SUPER || !udev->lpm_capable)
 		return 0;
 
 	/* Convert SEL and PEL stored in ns to us */
@@ -3972,34 +3972,14 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
 	 * latency for the link state, and could start a device-initiated
 	 * U1/U2 when the exit latencies are too high.
 	 */
-	if ((state == USB3_LPM_U1 &&
-				(u1_sel > USB3_LPM_MAX_U1_SEL_PEL ||
-				 u1_pel > USB3_LPM_MAX_U1_SEL_PEL)) ||
-			(state == USB3_LPM_U2 &&
-			 (u2_sel > USB3_LPM_MAX_U2_SEL_PEL ||
-			  u2_pel > USB3_LPM_MAX_U2_SEL_PEL))) {
-		dev_dbg(&udev->dev, "Device-initiated %s disabled due to long SEL %llu us or PEL %llu us\n",
-				usb3_lpm_names[state], u1_sel, u1_pel);
+	if (u1_sel > USB3_LPM_MAX_U1_SEL_PEL ||
+	    u1_pel > USB3_LPM_MAX_U1_SEL_PEL ||
+	    u2_sel > USB3_LPM_MAX_U2_SEL_PEL ||
+	    u2_pel > USB3_LPM_MAX_U2_SEL_PEL) {
+		dev_dbg(&udev->dev, "Device-initiated U1/U2 disabled due to long SEL or PEL\n");
 		return -EINVAL;
 	}
 
-	/*
-	 * If we're enabling device-initiated LPM for one link state,
-	 * but the other link state has a too high SEL or PEL value,
-	 * just set those values to the max in the Set SEL request.
-	 */
-	if (u1_sel > USB3_LPM_MAX_U1_SEL_PEL)
-		u1_sel = USB3_LPM_MAX_U1_SEL_PEL;
-
-	if (u1_pel > USB3_LPM_MAX_U1_SEL_PEL)
-		u1_pel = USB3_LPM_MAX_U1_SEL_PEL;
-
-	if (u2_sel > USB3_LPM_MAX_U2_SEL_PEL)
-		u2_sel = USB3_LPM_MAX_U2_SEL_PEL;
-
-	if (u2_pel > USB3_LPM_MAX_U2_SEL_PEL)
-		u2_pel = USB3_LPM_MAX_U2_SEL_PEL;
-
 	/*
 	 * usb_enable_lpm() can be called as part of a failed device reset,
 	 * which may be initiated by an error path of a mass storage driver.
@@ -4021,6 +4001,10 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
 			sel_values, sizeof *(sel_values),
 			USB_CTRL_SET_TIMEOUT);
 	kfree(sel_values);
+
+	if (ret > 0)
+		udev->lpm_devinit_allow = 1;
+
 	return ret;
 }
 
@@ -4136,6 +4120,9 @@ static bool usb_device_may_initiate_lpm(struct usb_device *udev,
 	unsigned int sel;		/* us */
 	int i, j;
 
+	if (!udev->lpm_devinit_allow)
+		return false;
+
 	if (state == USB3_LPM_U1)
 		sel = DIV_ROUND_UP(udev->u1_params.sel, 1000);
 	else if (state == USB3_LPM_U2)
@@ -4184,7 +4171,7 @@ static bool usb_device_may_initiate_lpm(struct usb_device *udev,
 static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		enum usb3_link_state state)
 {
-	int timeout, ret;
+	int timeout;
 	__u8 u1_mel = udev->bos->ss_cap->bU1devExitLat;
 	__le16 u2_mel = udev->bos->ss_cap->bU2DevExitLat;
 
@@ -4196,17 +4183,6 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 			(state == USB3_LPM_U2 && u2_mel == 0))
 		return;
 
-	/*
-	 * First, let the device know about the exit latencies
-	 * associated with the link state we're about to enable.
-	 */
-	ret = usb_req_set_sel(udev, state);
-	if (ret < 0) {
-		dev_warn(&udev->dev, "Set SEL for device-initiated %s failed.\n",
-				usb3_lpm_names[state]);
-		return;
-	}
-
 	/* We allow the host controller to set the U1/U2 timeout internally
 	 * first, so that it can change its schedule to account for the
 	 * additional latency to send data to a device in a lower power
@@ -4486,6 +4462,11 @@ static int hub_handle_remote_wakeup(struct usb_hub *hub, unsigned int port,
 	return 0;
 }
 
+static int usb_req_set_sel(struct usb_device *udev)
+{
+	return 0;
+}
+
 #endif	/* CONFIG_PM */
 
 /*
@@ -5011,6 +4992,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			udev->lpm_capable = usb_device_supports_lpm(udev);
 			udev->lpm_disable_count = 1;
 			usb_set_lpm_parameters(udev);
+			usb_req_set_sel(udev);
 		}
 	}
 
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 60bee864d897..f7a9914fc97f 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -584,6 +584,7 @@ struct usb3_lpm_parameters {
  * @authenticated: Crypto authentication passed
  * @wusb: device is Wireless USB
  * @lpm_capable: device supports LPM
+ * @lpm_devinit_allow: Allow USB3 device initiated LPM, exit latency is in range
  * @usb2_hw_lpm_capable: device can perform USB2 hardware LPM
  * @usb2_hw_lpm_besl_capable: device can perform USB2 hardware BESL LPM
  * @usb2_hw_lpm_enabled: USB2 hardware LPM is enabled
@@ -666,6 +667,7 @@ struct usb_device {
 	unsigned authenticated:1;
 	unsigned wusb:1;
 	unsigned lpm_capable:1;
+	unsigned lpm_devinit_allow:1;
 	unsigned usb2_hw_lpm_capable:1;
 	unsigned usb2_hw_lpm_besl_capable:1;
 	unsigned usb2_hw_lpm_enabled:1;
-- 
2.25.1

