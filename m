Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F1B3C5CB2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 14:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhGLM62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 08:58:28 -0400
Received: from cable.insite.cz ([84.242.75.189]:36604 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233833AbhGLM62 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 08:58:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 752B5A1A3D402;
        Mon, 12 Jul 2021 14:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094538; bh=8judzWEAB9LjAD2WzzBxOH99/zZuBtEIKUycqDorkZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gejWo7Wr/MJbheRIJycUVHGFvhJ64gU7eIGDLw2xDhNbYsRCmjLlsmshuPI48kHDI
         7Vk/WVtx+7UkceHK/gvnRSf3KtWPQ93GYCli6VDoJ+mx8FiWLCFcAcPk3cQOk4PyTI
         MOYvnJk70ns9azh28Gnk3o0g/jMYXOxYZOxgSCkM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id faWe8XI2g9J2; Mon, 12 Jul 2021 14:55:31 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 6EFE9A1A3D404;
        Mon, 12 Jul 2021 14:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094531; bh=8judzWEAB9LjAD2WzzBxOH99/zZuBtEIKUycqDorkZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WMy8LXmUEeQCBuOmkwWuqx7rXu+f/1Pk5QaF4BDpsJJ8B3X6UrjxjF8feTlmuApke
         SHeqY+apiSfGoO91qHSCSwcAT4h1LloV8ZmQ9lgkbpK0YjhuZN2rjBpnmFzq8FHCsn
         J5cYnMrUqwd0qCyJQX8Bfb21Ez/KdCWbeR8+Hv7g=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 3/4] usb: gadget: f_uac2: add volume and mute support
Date:   Mon, 12 Jul 2021 14:55:28 +0200
Message-Id: <20210712125529.76070-4-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712125529.76070-1-pavel.hofman@ivitera.com>
References: <20210712125529.76070-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

This adds bi-directional (host->device, device->host)
volume/mute support to the f_uac2 driver by adding
Feature Units and interrupt endpoint.

Currently only master channel is supported.

Volume and mute are configurable through configfs,
by default volume has -100..0 dB range with 1 dB step.

Similar to existing flexible endpoints configuration,
Feature Unit won't be added to the topology if both
mute and volume are not enabled, also interrupt endpoint
isn't added to the device if no feature unit is present

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |  10 +
 Documentation/usb/gadget-testing.rst          |  12 +-
 drivers/usb/gadget/function/f_uac2.c          | 656 ++++++++++++++++--
 drivers/usb/gadget/function/u_uac2.h          |  23 +-
 4 files changed, 638 insertions(+), 63 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 26fb8e9b4e61..cfd160ff8b56 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -9,8 +9,18 @@ Description:
 		c_srate    capture sampling rate
 		c_ssize    capture sample size (bytes)
 		c_sync     capture synchronization type (async/adaptive)
+		c_mute_present	capture mute control enable
+		c_volume_present	capture volume control enable
+		c_volume_min	capture volume control min value (in 1/256 dB)
+		c_volume_max	capture volume control max value (in 1/256 dB)
+		c_volume_res	capture volume control resolution (in 1/256 dB)
 		fb_max     maximum extra bandwidth in async mode
 		p_chmask   playback channel mask
 		p_srate    playback sampling rate
 		p_ssize    playback sample size (bytes)
+		p_mute_present	playback mute control enable
+		p_volume_present	playback volume control enable
+		p_volume_min	playback volume control min value (in 1/256 dB)
+		p_volume_max	playback volume control max value (in 1/256 dB)
+		p_volume_res	playback volume control resolution (in 1/256 dB)
 		=========  ============================
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 9d6276f82774..272e51f17f54 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -729,10 +729,20 @@ The uac2 function provides these attributes in its function directory:
 	c_srate		capture sampling rate
 	c_ssize		capture sample size (bytes)
 	c_sync		capture synchronization type (async/adaptive)
-	fb_max          maximum extra bandwidth in async mode
+	c_mute_present	capture mute control enable
+	c_volume_present	capture volume control enable
+	c_volume_min	capture volume control min value (in 1/256 dB)
+	c_volume_max	capture volume control max value (in 1/256 dB)
+	c_volume_res	capture volume control resolution (in 1/256 dB)
+	fb_max    maximum extra bandwidth in async mode
 	p_chmask	playback channel mask
 	p_srate		playback sampling rate
 	p_ssize		playback sample size (bytes)
+	p_mute_present	playback mute control enable
+	p_volume_present	playback volume control enable
+	p_volume_min	playback volume control min value (in 1/256 dB)
+	p_volume_max	playback volume control max value (in 1/256 dB)
+	p_volume_res	playback volume control resolution (in 1/256 dB)
 	req_number	the number of pre-allocated request for both capture
 			and playback
 	=============== ====================================================
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..b9edc6787f79 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2011
  *    Yadwinder Singh (yadi.brar01@gmail.com)
  *    Jaswinder Singh (jaswinder.singh@linaro.org)
+ *
+ * Copyright (C) 2020
+ *    Ruslan Bilovol (ruslan.bilovol@gmail.com)
  */
 
 #include <linux/usb/audio.h>
@@ -19,14 +22,16 @@
 
 /*
  * The driver implements a simple UAC_2 topology.
- * USB-OUT -> IT_1 -> OT_3 -> ALSA_Capture
- * ALSA_Playback -> IT_2 -> OT_4 -> USB-IN
+ * USB-OUT -> IT_1 -> FU -> OT_3 -> ALSA_Capture
+ * ALSA_Playback -> IT_2 -> FU -> OT_4 -> USB-IN
  * Capture and Playback sampling rates are independently
  *  controlled by two clock sources :
  *    CLK_5 := c_srate, and CLK_6 := p_srate
  */
 #define USB_OUT_CLK_ID	(out_clk_src_desc.bClockID)
 #define USB_IN_CLK_ID	(in_clk_src_desc.bClockID)
+#define USB_OUT_FU_ID	(out_feature_unit_desc->bUnitID)
+#define USB_IN_FU_ID	(in_feature_unit_desc->bUnitID)
 
 #define CONTROL_ABSENT	0
 #define CONTROL_RDONLY	1
@@ -34,6 +39,8 @@
 
 #define CLK_FREQ_CTRL	0
 #define CLK_VLD_CTRL	2
+#define FU_MUTE_CTRL	0
+#define FU_VOL_CTRL	2
 
 #define COPY_CTRL	0
 #define CONN_CTRL	2
@@ -44,12 +51,24 @@
 
 #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
 #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
+#define FUIN_EN(_opts) (EPIN_EN(_opts) \
+				&& ((_opts)->p_mute_present \
+				|| (_opts)->p_volume_present))
+#define FUOUT_EN(_opts) (EPOUT_EN(_opts) \
+				&& ((_opts)->c_mute_present \
+				|| (_opts)->c_volume_present))
 #define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
 
 struct f_uac2 {
 	struct g_audio g_audio;
 	u8 ac_intf, as_in_intf, as_out_intf;
 	u8 ac_alt, as_in_alt, as_out_alt;	/* needed for get_alt() */
+
+	struct usb_ctrlrequest setup_cr;	/* will be used in data stage */
+
+	/* Interrupt IN endpoint of AC interface */
+	struct usb_ep	*int_ep;
+	atomic_t	int_count;
 };
 
 static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
@@ -63,6 +82,8 @@ struct f_uac2_opts *g_audio_to_uac2_opts(struct g_audio *agdev)
 	return container_of(agdev->func.fi, struct f_uac2_opts, func_inst);
 }
 
+static int afunc_notify(struct g_audio *agdev, int unit_id, int cs);
+
 /* --------- USB Function Interface ------------- */
 
 enum {
@@ -74,6 +95,8 @@ enum {
 	STR_IO_IT,
 	STR_USB_OT,
 	STR_IO_OT,
+	STR_FU_IN,
+	STR_FU_OUT,
 	STR_AS_OUT_ALT0,
 	STR_AS_OUT_ALT1,
 	STR_AS_IN_ALT0,
@@ -92,6 +115,8 @@ static struct usb_string strings_fn[] = {
 	[STR_IO_IT].s = "USBD Out",
 	[STR_USB_OT].s = "USBH In",
 	[STR_IO_OT].s = "USBD In",
+	[STR_FU_IN].s = "Capture Volume",
+	[STR_FU_OUT].s = "Playback Volume",
 	[STR_AS_OUT_ALT0].s = "Playback Inactive",
 	[STR_AS_OUT_ALT1].s = "Playback Active",
 	[STR_AS_IN_ALT0].s = "Capture Inactive",
@@ -126,7 +151,7 @@ static struct usb_interface_descriptor std_ac_if_desc = {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 0,
-	.bNumEndpoints = 0,
+	/* .bNumEndpoints = DYNAMIC */
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -212,6 +237,9 @@ static struct uac2_output_terminal_descriptor io_out_ot_desc = {
 	.bmControls = cpu_to_le16(CONTROL_RDWR << COPY_CTRL),
 };
 
+static struct uac2_feature_unit_descriptor *in_feature_unit_desc;
+static struct uac2_feature_unit_descriptor *out_feature_unit_desc;
+
 static struct uac2_ac_header_descriptor ac_hdr_desc = {
 	.bLength = sizeof ac_hdr_desc,
 	.bDescriptorType = USB_DT_CS_INTERFACE,
@@ -223,6 +251,36 @@ static struct uac2_ac_header_descriptor ac_hdr_desc = {
 	.bmControls = 0,
 };
 
+/* AC IN Interrupt Endpoint */
+static struct usb_endpoint_descriptor fs_ep_int_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_INT,
+	.wMaxPacketSize = cpu_to_le16(6),
+	.bInterval = 1,
+};
+
+static struct usb_endpoint_descriptor hs_ep_int_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bmAttributes = USB_ENDPOINT_XFER_INT,
+	.wMaxPacketSize = cpu_to_le16(6),
+	.bInterval = 4,
+};
+
+static struct usb_endpoint_descriptor ss_ep_int_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_INT,
+	.wMaxPacketSize = cpu_to_le16(6),
+	.bInterval = 4,
+};
+
 /* Audio Streaming OUT Interface - Alt0 */
 static struct usb_interface_descriptor std_as_out_if0_desc = {
 	.bLength = sizeof std_as_out_if0_desc,
@@ -452,10 +510,14 @@ static struct usb_descriptor_header *fs_audio_desc[] = {
 	(struct usb_descriptor_header *)&in_clk_src_desc,
 	(struct usb_descriptor_header *)&out_clk_src_desc,
 	(struct usb_descriptor_header *)&usb_out_it_desc,
+	(struct usb_descriptor_header *)&out_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_in_it_desc,
 	(struct usb_descriptor_header *)&usb_in_ot_desc,
+	(struct usb_descriptor_header *)&in_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
 
+	(struct usb_descriptor_header *)&fs_ep_int_desc,
+
 	(struct usb_descriptor_header *)&std_as_out_if0_desc,
 	(struct usb_descriptor_header *)&std_as_out_if1_desc,
 
@@ -483,10 +545,14 @@ static struct usb_descriptor_header *hs_audio_desc[] = {
 	(struct usb_descriptor_header *)&in_clk_src_desc,
 	(struct usb_descriptor_header *)&out_clk_src_desc,
 	(struct usb_descriptor_header *)&usb_out_it_desc,
+	(struct usb_descriptor_header *)&out_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_in_it_desc,
 	(struct usb_descriptor_header *)&usb_in_ot_desc,
+	(struct usb_descriptor_header *)&in_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
 
+	(struct usb_descriptor_header *)&hs_ep_int_desc,
+
 	(struct usb_descriptor_header *)&std_as_out_if0_desc,
 	(struct usb_descriptor_header *)&std_as_out_if1_desc,
 
@@ -514,10 +580,14 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	(struct usb_descriptor_header *)&in_clk_src_desc,
 	(struct usb_descriptor_header *)&out_clk_src_desc,
 	(struct usb_descriptor_header *)&usb_out_it_desc,
+  (struct usb_descriptor_header *)&out_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_in_it_desc,
 	(struct usb_descriptor_header *)&usb_in_ot_desc,
+	(struct usb_descriptor_header *)&in_feature_unit_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
 
+  (struct usb_descriptor_header *)&ss_ep_int_desc,
+
 	(struct usb_descriptor_header *)&std_as_out_if0_desc,
 	(struct usb_descriptor_header *)&std_as_out_if1_desc,
 
@@ -539,6 +609,17 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	NULL,
 };
 
+struct cntrl_cur_lay2 {
+	__le16	wCUR;
+};
+
+struct cntrl_range_lay2 {
+	__le16	wNumSubRanges;
+	__le16	wMIN;
+	__le16	wMAX;
+	__le16	wRES;
+} __packed;
+
 struct cntrl_cur_lay3 {
 	__le32	dCUR;
 };
@@ -595,6 +676,26 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 	return 0;
 }
 
+static struct uac2_feature_unit_descriptor *build_fu_desc(int chmask)
+{
+	struct uac2_feature_unit_descriptor *fu_desc;
+	int channels = num_channels(chmask);
+	int fu_desc_size = UAC2_DT_FEATURE_UNIT_SIZE(channels);
+
+	fu_desc = kzalloc(fu_desc_size, GFP_KERNEL);
+	if (!fu_desc)
+		return NULL;
+
+	fu_desc->bLength = fu_desc_size;
+	fu_desc->bDescriptorType = USB_DT_CS_INTERFACE;
+
+	fu_desc->bDescriptorSubtype = UAC_FEATURE_UNIT;
+
+	/* bUnitID, bSourceID and bmaControls will be defined later */
+
+	return fu_desc;
+}
+
 /* Use macro to overcome line length limitation */
 #define USBDHDR(p) (struct usb_descriptor_header *)(p)
 
@@ -607,6 +708,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 	struct usb_endpoint_descriptor *epout_desc;
 	struct usb_endpoint_descriptor *epin_desc;
 	struct usb_endpoint_descriptor *epin_fback_desc;
+	struct usb_endpoint_descriptor *ep_int_desc;
 	int i;
 
 	switch (speed) {
@@ -614,11 +716,13 @@ static void setup_headers(struct f_uac2_opts *opts,
 		epout_desc = &fs_epout_desc;
 		epin_desc = &fs_epin_desc;
 		epin_fback_desc = &fs_epin_fback_desc;
+		ep_int_desc = &fs_ep_int_desc;
 		break;
 	case USB_SPEED_HIGH:
 		epout_desc = &hs_epout_desc;
 		epin_desc = &hs_epin_desc;
 		epin_fback_desc = &hs_epin_fback_desc;
+		ep_int_desc = &hs_ep_int_desc;
 		break;
 	default:
 		epout_desc = &ss_epout_desc;
@@ -626,6 +730,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 		epout_desc_comp = &ss_epout_desc_comp;
 		epin_desc_comp = &ss_epin_desc_comp;
 		epin_fback_desc = &ss_epin_fback_desc;
+		ep_int_desc = &ss_ep_int_desc;
 	}
 
 	i = 0;
@@ -637,13 +742,27 @@ static void setup_headers(struct f_uac2_opts *opts,
 	if (EPOUT_EN(opts)) {
 		headers[i++] = USBDHDR(&out_clk_src_desc);
 		headers[i++] = USBDHDR(&usb_out_it_desc);
-	}
+
+    if (FUOUT_EN(opts))
+      headers[i++] = USBDHDR(out_feature_unit_desc);
+  }
+
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&io_in_it_desc);
+
+    if (FUIN_EN(opts))
+      headers[i++] = USBDHDR(in_feature_unit_desc);
+
 		headers[i++] = USBDHDR(&usb_in_ot_desc);
 	}
-	if (EPOUT_EN(opts)) {
+
+	if (EPOUT_EN(opts))
 		headers[i++] = USBDHDR(&io_out_ot_desc);
+
+  if (FUOUT_EN(opts) || FUIN_EN(opts))
+      headers[i++] = USBDHDR(ep_int_desc);
+
+  if (EPOUT_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_out_if0_desc);
 		headers[i++] = USBDHDR(&std_as_out_if1_desc);
 		headers[i++] = USBDHDR(&as_out_hdr_desc);
@@ -657,6 +776,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 		if (EPOUT_FBACK_IN_EN(opts))
 			headers[i++] = USBDHDR(epin_fback_desc);
 	}
+
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_in_if0_desc);
 		headers[i++] = USBDHDR(&std_as_in_if1_desc);
@@ -684,17 +804,35 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		io_out_ot_desc.bTerminalID = i++;
 	if (EPIN_EN(opts))
 		usb_in_ot_desc.bTerminalID = i++;
+	if (FUOUT_EN(opts))
+		out_feature_unit_desc->bUnitID = i++;
+	if (FUIN_EN(opts))
+		in_feature_unit_desc->bUnitID = i++;
 	if (EPOUT_EN(opts))
 		out_clk_src_desc.bClockID = i++;
 	if (EPIN_EN(opts))
 		in_clk_src_desc.bClockID = i++;
 
 	usb_out_it_desc.bCSourceID = out_clk_src_desc.bClockID;
-	usb_in_ot_desc.bSourceID = io_in_it_desc.bTerminalID;
+
+	if (FUIN_EN(opts)) {
+		usb_in_ot_desc.bSourceID = in_feature_unit_desc->bUnitID;
+		in_feature_unit_desc->bSourceID = io_in_it_desc.bTerminalID;
+	} else {
+		usb_in_ot_desc.bSourceID = io_in_it_desc.bTerminalID;
+	}
+
 	usb_in_ot_desc.bCSourceID = in_clk_src_desc.bClockID;
 	io_in_it_desc.bCSourceID = in_clk_src_desc.bClockID;
 	io_out_ot_desc.bCSourceID = out_clk_src_desc.bClockID;
-	io_out_ot_desc.bSourceID = usb_out_it_desc.bTerminalID;
+
+	if (FUOUT_EN(opts)) {
+		io_out_ot_desc.bSourceID = out_feature_unit_desc->bUnitID;
+		out_feature_unit_desc->bSourceID = usb_out_it_desc.bTerminalID;
+	} else {
+		io_out_ot_desc.bSourceID = usb_out_it_desc.bTerminalID;
+	}
+
 	as_out_hdr_desc.bTerminalLink = usb_out_it_desc.bTerminalID;
 	as_in_hdr_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
 
@@ -706,6 +844,10 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 
 		len += sizeof(in_clk_src_desc);
 		len += sizeof(usb_in_ot_desc);
+
+		if (FUIN_EN(opts))
+			len += in_feature_unit_desc->bLength;
+
 		len += sizeof(io_in_it_desc);
 		ac_hdr_desc.wTotalLength = cpu_to_le16(len);
 		iad_desc.bInterfaceCount++;
@@ -715,6 +857,10 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 
 		len += sizeof(out_clk_src_desc);
 		len += sizeof(usb_out_it_desc);
+
+		if (FUOUT_EN(opts))
+			len += out_feature_unit_desc->bLength;
+
 		len += sizeof(io_out_ot_desc);
 		ac_hdr_desc.wTotalLength = cpu_to_le16(len);
 		iad_desc.bInterfaceCount++;
@@ -752,6 +898,28 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
 		return -EINVAL;
 	}
 
+	if (opts->p_volume_max <= opts->p_volume_min) {
+		dev_err(dev, "Error: incorrect playback volume max/min\n");
+			return -EINVAL;
+	} else if (opts->c_volume_max <= opts->c_volume_min) {
+		dev_err(dev, "Error: incorrect capture volume max/min\n");
+			return -EINVAL;
+	} else if (opts->p_volume_res <= 0) {
+		dev_err(dev, "Error: negative/zero playback volume resolution\n");
+			return -EINVAL;
+	} else if (opts->c_volume_res <= 0) {
+		dev_err(dev, "Error: negative/zero capture volume resolution\n");
+			return -EINVAL;
+	}
+
+	if ((opts->p_volume_max - opts->p_volume_min) % opts->p_volume_res) {
+		dev_err(dev, "Error: incorrect playback volume resolution\n");
+			return -EINVAL;
+	} else if ((opts->c_volume_max - opts->c_volume_min) % opts->c_volume_res) {
+		dev_err(dev, "Error: incorrect capture volume resolution\n");
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -774,6 +942,20 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	us = usb_gstrings_attach(cdev, fn_strings, ARRAY_SIZE(strings_fn));
 	if (IS_ERR(us))
 		return PTR_ERR(us);
+
+	if (FUOUT_EN(uac2_opts)) {
+		out_feature_unit_desc = build_fu_desc(uac2_opts->c_chmask);
+		if (!out_feature_unit_desc)
+			return -ENOMEM;
+	}
+	if (FUIN_EN(uac2_opts)) {
+		in_feature_unit_desc = build_fu_desc(uac2_opts->p_chmask);
+		if (!in_feature_unit_desc) {
+			ret = -ENOMEM;
+			goto err_free_fu;
+		}
+	}
+
 	iad_desc.iFunction = us[STR_ASSOC].id;
 	std_ac_if_desc.iInterface = us[STR_IF_CTRL].id;
 	in_clk_src_desc.iClockSource = us[STR_CLKSRC_IN].id;
@@ -787,6 +969,21 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	std_as_in_if0_desc.iInterface = us[STR_AS_IN_ALT0].id;
 	std_as_in_if1_desc.iInterface = us[STR_AS_IN_ALT1].id;
 
+	if (FUOUT_EN(uac2_opts)) {
+		u8 *i_feature = (u8 *)out_feature_unit_desc;
+
+		i_feature = (u8 *)out_feature_unit_desc +
+					out_feature_unit_desc->bLength - 1;
+		*i_feature = us[STR_FU_OUT].id;
+	}
+	if (FUIN_EN(uac2_opts)) {
+		u8 *i_feature = (u8 *)in_feature_unit_desc;
+
+		i_feature = (u8 *)in_feature_unit_desc +
+					in_feature_unit_desc->bLength - 1;
+		*i_feature = us[STR_FU_IN].id;
+	}
+
 
 	/* Initialize the configurable parameters */
 	usb_out_it_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
@@ -801,6 +998,26 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	as_out_fmt1_desc.bBitResolution = uac2_opts->c_ssize * 8;
 	as_in_fmt1_desc.bSubslotSize = uac2_opts->p_ssize;
 	as_in_fmt1_desc.bBitResolution = uac2_opts->p_ssize * 8;
+	if (FUOUT_EN(uac2_opts)) {
+		__le32 *bma = (__le32 *)&out_feature_unit_desc->bmaControls[0];
+		u32 control = 0;
+
+		if (uac2_opts->c_mute_present)
+			control |= CONTROL_RDWR << FU_MUTE_CTRL;
+		if (uac2_opts->c_volume_present)
+			control |= CONTROL_RDWR << FU_VOL_CTRL;
+		*bma = cpu_to_le32(control);
+	}
+	if (FUIN_EN(uac2_opts)) {
+		__le32 *bma = (__le32 *)&in_feature_unit_desc->bmaControls[0];
+		u32 control = 0;
+
+		if (uac2_opts->p_mute_present)
+			control |= CONTROL_RDWR << FU_MUTE_CTRL;
+		if (uac2_opts->p_volume_present)
+			control |= CONTROL_RDWR << FU_VOL_CTRL;
+		*bma = cpu_to_le32(control);
+	}
 
 	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", uac2_opts->p_srate);
 	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", uac2_opts->c_srate);
@@ -808,7 +1025,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	ret = usb_interface_id(cfg, fn);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-		return ret;
+		goto err_free_fu;
 	}
 	iad_desc.bFirstInterface = ret;
 
@@ -820,7 +1037,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		ret = usb_interface_id(cfg, fn);
 		if (ret < 0) {
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return ret;
+			goto err_free_fu;
 		}
 		std_as_out_if0_desc.bInterfaceNumber = ret;
 		std_as_out_if1_desc.bInterfaceNumber = ret;
@@ -849,7 +1066,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		ret = usb_interface_id(cfg, fn);
 		if (ret < 0) {
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return ret;
+			goto err_free_fu;
 		}
 		std_as_in_if0_desc.bInterfaceNumber = ret;
 		std_as_in_if1_desc.bInterfaceNumber = ret;
@@ -857,6 +1074,17 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		uac2->as_in_alt = 0;
 	}
 
+	if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts)) {
+		uac2->int_ep = usb_ep_autoconfig(gadget, &fs_ep_int_desc);
+		if (!uac2->int_ep) {
+			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+			ret = -ENODEV;
+			goto err_free_fu;
+		}
+
+		std_ac_if_desc.bNumEndpoints = 1;
+	}
+
 	/* Calculate wMaxPacketSize according to audio bandwidth */
 	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
 				     true);
@@ -904,7 +1132,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->out_ep = usb_ep_autoconfig(gadget, &fs_epout_desc);
 		if (!agdev->out_ep) {
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_free_fu;
 		}
 		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
 			agdev->in_ep_fback = usb_ep_autoconfig(gadget,
@@ -912,7 +1141,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 			if (!agdev->in_ep_fback) {
 				dev_err(dev, "%s:%d Error!\n",
 					__func__, __LINE__);
-				return -ENODEV;
+				ret = -ENODEV;
+				goto err_free_fu;
 			}
 		}
 	}
@@ -921,7 +1151,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->in_ep = usb_ep_autoconfig(gadget, &fs_epin_desc);
 		if (!agdev->in_ep) {
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_free_fu;
 		}
 	}
 
@@ -937,38 +1168,137 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->out_ep_maxpsize = max_t(u16, agdev->out_ep_maxpsize,
 				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
 
+	// HS and SS endpoint addresses are copied from autoconfigured FS descriptors
+	hs_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
 	hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 	ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
 	ss_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
+	ss_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
 
 	setup_descriptor(uac2_opts);
 
 	ret = usb_assign_descriptors(fn, fs_audio_desc, hs_audio_desc, ss_audio_desc,
 				     ss_audio_desc);
 	if (ret)
-		return ret;
+		goto err_free_fu;
 
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
 	agdev->params.p_srate = uac2_opts->p_srate;
 	agdev->params.p_ssize = uac2_opts->p_ssize;
+	if (FUIN_EN(uac2_opts)) {
+		agdev->params.p_fu.id = USB_IN_FU_ID;
+		agdev->params.p_fu.mute_present = uac2_opts->p_mute_present;
+		agdev->params.p_fu.volume_present = uac2_opts->p_volume_present;
+		agdev->params.p_fu.volume_min = uac2_opts->p_volume_min;
+		agdev->params.p_fu.volume_max = uac2_opts->p_volume_max;
+		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
+	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
 	agdev->params.c_srate = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
+	if (FUOUT_EN(uac2_opts)) {
+		agdev->params.c_fu.id = USB_OUT_FU_ID;
+		agdev->params.c_fu.mute_present = uac2_opts->c_mute_present;
+		agdev->params.c_fu.volume_present = uac2_opts->c_volume_present;
+		agdev->params.c_fu.volume_min = uac2_opts->c_volume_min;
+		agdev->params.c_fu.volume_max = uac2_opts->c_volume_max;
+		agdev->params.c_fu.volume_res = uac2_opts->c_volume_res;
+	}
 	agdev->params.req_number = uac2_opts->req_number;
 	agdev->params.fb_max = uac2_opts->fb_max;
+
+	if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts))
+    agdev->notify = afunc_notify;
+
 	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
 	if (ret)
 		goto err_free_descs;
+
 	return 0;
 
 err_free_descs:
 	usb_free_all_descriptors(fn);
 	agdev->gadget = NULL;
+err_free_fu:
+	kfree(out_feature_unit_desc);
+	out_feature_unit_desc = NULL;
+	kfree(in_feature_unit_desc);
+	in_feature_unit_desc = NULL;
+	return ret;
+}
+
+static void
+afunc_notify_complete(struct usb_ep *_ep, struct usb_request *req)
+{
+	struct g_audio *agdev = req->context;
+	struct f_uac2 *uac2 = func_to_uac2(&agdev->func);
+
+	atomic_dec(&uac2->int_count);
+	kfree(req->buf);
+	usb_ep_free_request(_ep, req);
+}
+
+static int
+afunc_notify(struct g_audio *agdev, int unit_id, int cs)
+{
+	struct f_uac2 *uac2 = func_to_uac2(&agdev->func);
+	struct usb_request *req;
+	struct uac2_interrupt_data_msg *msg;
+	u16 w_index, w_value;
+	int ret;
+
+	if (!uac2->int_ep->enabled)
+		return 0;
+
+	if (atomic_inc_return(&uac2->int_count) > UAC2_DEF_INT_REQ_NUM) {
+		atomic_dec(&uac2->int_count);
+		return 0;
+	}
+
+	req = usb_ep_alloc_request(uac2->int_ep, GFP_ATOMIC);
+	if (req == NULL) {
+		ret = -ENOMEM;
+		goto err_dec_int_count;
+	}
+
+	msg = kzalloc(sizeof(*msg), GFP_ATOMIC);
+	if (msg == NULL) {
+		ret = -ENOMEM;
+		goto err_free_request;
+	}
+
+	w_index = unit_id << 8 | uac2->ac_intf;
+	w_value = cs << 8;
+
+	msg->bInfo = 0; /* Non-vendor, interface interrupt */
+	msg->bAttribute = UAC2_CS_CUR;
+	msg->wIndex = cpu_to_le16(w_index);
+	msg->wValue = cpu_to_le16(w_value);
+
+	req->length = sizeof(*msg);
+	req->buf = msg;
+	req->context = agdev;
+	req->complete = afunc_notify_complete;
+
+	ret = usb_ep_queue(uac2->int_ep, req, GFP_ATOMIC);
+
+	if (ret)
+		goto err_free_msg;
+
+	return 0;
+
+err_free_msg:
+	kfree(msg);
+err_free_request:
+	usb_ep_free_request(uac2->int_ep, req);
+err_dec_int_count:
+	atomic_dec(&uac2->int_count);
+
 	return ret;
 }
 
@@ -977,6 +1307,7 @@ afunc_set_alt(struct usb_function *fn, unsigned intf, unsigned alt)
 {
 	struct usb_composite_dev *cdev = fn->config->cdev;
 	struct f_uac2 *uac2 = func_to_uac2(fn);
+	struct g_audio *agdev = func_to_g_audio(fn);
 	struct usb_gadget *gadget = cdev->gadget;
 	struct device *dev = &gadget->dev;
 	int ret = 0;
@@ -993,6 +1324,14 @@ afunc_set_alt(struct usb_function *fn, unsigned intf, unsigned alt)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 			return -EINVAL;
 		}
+
+		/* restart interrupt endpoint */
+		if (uac2->int_ep) {
+			usb_ep_disable(uac2->int_ep);
+			config_ep_by_speed(gadget, &agdev->func, uac2->int_ep);
+			usb_ep_enable(uac2->int_ep);
+		}
+
 		return 0;
 	}
 
@@ -1047,6 +1386,8 @@ afunc_disable(struct usb_function *fn)
 	uac2->as_out_alt = 0;
 	u_audio_stop_capture(&uac2->g_audio);
 	u_audio_stop_playback(&uac2->g_audio);
+	if (uac2->int_ep)
+		usb_ep_disable(uac2->int_ep);
 }
 
 static int
@@ -1054,7 +1395,7 @@ in_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
 	struct usb_request *req = fn->config->cdev->req;
 	struct g_audio *agdev = func_to_g_audio(fn);
-	struct f_uac2_opts *opts;
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
 	u16 w_length = le16_to_cpu(cr->wLength);
 	u16 w_index = le16_to_cpu(cr->wIndex);
 	u16 w_value = le16_to_cpu(cr->wValue);
@@ -1063,28 +1404,64 @@ in_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	int value = -EOPNOTSUPP;
 	int p_srate, c_srate;
 
-	opts = g_audio_to_uac2_opts(agdev);
 	p_srate = opts->p_srate;
 	c_srate = opts->c_srate;
 
-	if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
-		struct cntrl_cur_lay3 c;
-		memset(&c, 0, sizeof(struct cntrl_cur_lay3));
+	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
+		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
+			struct cntrl_cur_lay3 c;
+
+			memset(&c, 0, sizeof(struct cntrl_cur_lay3));
+
+			if (entity_id == USB_IN_CLK_ID)
+				c.dCUR = cpu_to_le32(p_srate);
+			else if (entity_id == USB_OUT_CLK_ID)
+				c.dCUR = cpu_to_le32(c_srate);
+
+			value = min_t(unsigned int, w_length, sizeof(c));
+			memcpy(req->buf, &c, value);
+		} else if (control_selector == UAC2_CS_CONTROL_CLOCK_VALID) {
+			*(u8 *)req->buf = 1;
+			value = min_t(unsigned int, w_length, 1);
+		} else {
+			dev_err(&agdev->gadget->dev,
+				"%s:%d control_selector=%d TODO!\n",
+				__func__, __LINE__, control_selector);
+		}
+	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
+			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+		unsigned int is_playback = 0;
 
-		if (entity_id == USB_IN_CLK_ID)
-			c.dCUR = cpu_to_le32(p_srate);
-		else if (entity_id == USB_OUT_CLK_ID)
-			c.dCUR = cpu_to_le32(c_srate);
+		if (FUIN_EN(opts) && (entity_id == USB_IN_FU_ID))
+			is_playback = 1;
 
-		value = min_t(unsigned, w_length, sizeof c);
-		memcpy(req->buf, &c, value);
-	} else if (control_selector == UAC2_CS_CONTROL_CLOCK_VALID) {
-		*(u8 *)req->buf = 1;
-		value = min_t(unsigned, w_length, 1);
+		if (control_selector == UAC_FU_MUTE) {
+			unsigned int mute;
+
+			u_audio_get_mute(agdev, is_playback, &mute);
+
+			*(u8 *)req->buf = mute;
+			value = min_t(unsigned int, w_length, 1);
+		} else if (control_selector == UAC_FU_VOLUME) {
+			struct cntrl_cur_lay2 c;
+			s16 volume;
+
+			memset(&c, 0, sizeof(struct cntrl_cur_lay2));
+
+			u_audio_get_volume(agdev, is_playback, &volume);
+			c.wCUR = cpu_to_le16(volume);
+
+			value = min_t(unsigned int, w_length, sizeof(c));
+			memcpy(req->buf, &c, value);
+		} else {
+			dev_err(&agdev->gadget->dev,
+				"%s:%d control_selector=%d TODO!\n",
+				__func__, __LINE__, control_selector);
+		}
 	} else {
 		dev_err(&agdev->gadget->dev,
-			"%s:%d control_selector=%d TODO!\n",
-			__func__, __LINE__, control_selector);
+			"%s:%d entity_id=%d control_selector=%d TODO!\n",
+			__func__, __LINE__, entity_id, control_selector);
 	}
 
 	return value;
@@ -1095,38 +1472,77 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
 	struct usb_request *req = fn->config->cdev->req;
 	struct g_audio *agdev = func_to_g_audio(fn);
-	struct f_uac2_opts *opts;
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
 	u16 w_length = le16_to_cpu(cr->wLength);
 	u16 w_index = le16_to_cpu(cr->wIndex);
 	u16 w_value = le16_to_cpu(cr->wValue);
 	u8 entity_id = (w_index >> 8) & 0xff;
 	u8 control_selector = w_value >> 8;
-	struct cntrl_range_lay3 r;
 	int value = -EOPNOTSUPP;
 	int p_srate, c_srate;
 
-	opts = g_audio_to_uac2_opts(agdev);
 	p_srate = opts->p_srate;
 	c_srate = opts->c_srate;
 
-	if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
-		if (entity_id == USB_IN_CLK_ID)
-			r.dMIN = cpu_to_le32(p_srate);
-		else if (entity_id == USB_OUT_CLK_ID)
-			r.dMIN = cpu_to_le32(c_srate);
-		else
-			return -EOPNOTSUPP;
+	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
+		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
+			struct cntrl_range_lay3 r;
+
+			if (entity_id == USB_IN_CLK_ID)
+				r.dMIN = cpu_to_le32(p_srate);
+			else if (entity_id == USB_OUT_CLK_ID)
+				r.dMIN = cpu_to_le32(c_srate);
+			else
+				return -EOPNOTSUPP;
 
-		r.dMAX = r.dMIN;
-		r.dRES = 0;
-		r.wNumSubRanges = cpu_to_le16(1);
+			r.dMAX = r.dMIN;
+			r.dRES = 0;
+			r.wNumSubRanges = cpu_to_le16(1);
 
-		value = min_t(unsigned, w_length, sizeof r);
-		memcpy(req->buf, &r, value);
+			value = min_t(unsigned int, w_length, sizeof(r));
+			memcpy(req->buf, &r, value);
+		} else {
+			dev_err(&agdev->gadget->dev,
+				"%s:%d control_selector=%d TODO!\n",
+				__func__, __LINE__, control_selector);
+		}
+	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
+			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+		unsigned int is_playback = 0;
+
+		if (FUIN_EN(opts) && (entity_id == USB_IN_FU_ID))
+			is_playback = 1;
+
+		if (control_selector == UAC_FU_VOLUME) {
+			struct cntrl_range_lay2 r;
+			s16 max_db, min_db, res_db;
+
+			if (is_playback) {
+				max_db = opts->p_volume_max;
+				min_db = opts->p_volume_min;
+				res_db = opts->p_volume_res;
+			} else {
+				max_db = opts->c_volume_max;
+				min_db = opts->c_volume_min;
+				res_db = opts->c_volume_res;
+			}
+
+			r.wMAX = cpu_to_le16(max_db);
+			r.wMIN = cpu_to_le16(min_db);
+			r.wRES = cpu_to_le16(res_db);
+			r.wNumSubRanges = cpu_to_le16(1);
+
+			value = min_t(unsigned int, w_length, sizeof(r));
+			memcpy(req->buf, &r, value);
+		} else {
+			dev_err(&agdev->gadget->dev,
+				"%s:%d control_selector=%d TODO!\n",
+				__func__, __LINE__, control_selector);
+		}
 	} else {
 		dev_err(&agdev->gadget->dev,
-			"%s:%d control_selector=%d TODO!\n",
-			__func__, __LINE__, control_selector);
+			"%s:%d entity_id=%d control_selector=%d TODO!\n",
+			__func__, __LINE__, entity_id, control_selector);
 	}
 
 	return value;
@@ -1143,16 +1559,82 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 		return -EOPNOTSUPP;
 }
 
+static void
+out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct g_audio *agdev = req->context;
+	struct usb_composite_dev *cdev = agdev->func.config->cdev;
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
+	struct f_uac2 *uac2 = func_to_uac2(&agdev->func);
+	struct usb_ctrlrequest *cr = &uac2->setup_cr;
+	u16 w_index = le16_to_cpu(cr->wIndex);
+	u16 w_value = le16_to_cpu(cr->wValue);
+	u8 entity_id = (w_index >> 8) & 0xff;
+	u8 control_selector = w_value >> 8;
+
+	if (req->status != 0) {
+		dev_dbg(&cdev->gadget->dev, "completion err %d\n", req->status);
+		return;
+	}
+
+	if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
+		(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+		unsigned int is_playback = 0;
+
+		if (FUIN_EN(opts) && (entity_id == USB_IN_FU_ID))
+			is_playback = 1;
+
+		if (control_selector == UAC_FU_MUTE) {
+			u8 mute = *(u8 *)req->buf;
+
+			u_audio_set_mute(agdev, is_playback, mute);
+
+			return;
+		} else if (control_selector == UAC_FU_VOLUME) {
+			struct cntrl_cur_lay2 *c = req->buf;
+			s16 volume;
+
+			volume = le16_to_cpu(c->wCUR);
+			u_audio_set_volume(agdev, is_playback, volume);
+
+			return;
+		} else {
+			dev_err(&agdev->gadget->dev,
+				"%s:%d control_selector=%d TODO!\n",
+				__func__, __LINE__, control_selector);
+			usb_ep_set_halt(ep);
+		}
+	}
+}
+
 static int
 out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
+	struct usb_request *req = fn->config->cdev->req;
+	struct g_audio *agdev = func_to_g_audio(fn);
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
+	struct f_uac2 *uac2 = func_to_uac2(fn);
 	u16 w_length = le16_to_cpu(cr->wLength);
+	u16 w_index = le16_to_cpu(cr->wIndex);
 	u16 w_value = le16_to_cpu(cr->wValue);
+	u8 entity_id = (w_index >> 8) & 0xff;
 	u8 control_selector = w_value >> 8;
 
-	if (control_selector == UAC2_CS_CONTROL_SAM_FREQ)
-		return w_length;
+	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
+		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ)
+			return w_length;
+	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
+			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+		memcpy(&uac2->setup_cr, cr, sizeof(*cr));
+		req->context = agdev;
+		req->complete = out_rq_cur_complete;
 
+		return w_length;
+	} else {
+		dev_err(&agdev->gadget->dev,
+			"%s:%d entity_id=%d control_selector=%d TODO!\n",
+			__func__, __LINE__, entity_id, control_selector);
+	}
 	return -EOPNOTSUPP;
 }
 
@@ -1228,7 +1710,15 @@ static struct configfs_item_operations f_uac2_item_ops = {
 	.release	= f_uac2_attr_release,
 };
 
-#define UAC2_ATTRIBUTE(name)						\
+#define uac2_kstrtou32 kstrtou32
+#define uac2_kstrtos16 kstrtos16
+#define uac2_kstrtobool(s, base, res) kstrtobool((s), (res))
+
+static const char *u32_fmt = "%u\n";
+static const char *s16_fmt = "%hd\n";
+static const char *bool_fmt = "%u\n";
+
+#define UAC2_ATTRIBUTE(type, name)					\
 static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
 					 char *page)			\
 {									\
@@ -1236,7 +1726,7 @@ static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
 	int result;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%u\n", opts->name);			\
+	result = sprintf(page, type##_fmt, opts->name);			\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -1247,7 +1737,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 	int ret;							\
-	u32 num;							\
+	type num;							\
 									\
 	mutex_lock(&opts->lock);					\
 	if (opts->refcnt) {						\
@@ -1255,7 +1745,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 		goto end;						\
 	}								\
 									\
-	ret = kstrtou32(page, 0, &num);					\
+	ret = uac2_kstrto##type(page, 0, &num);				\
 	if (ret)							\
 		goto end;						\
 									\
@@ -1325,15 +1815,27 @@ end:									\
 									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
-UAC2_ATTRIBUTE(p_chmask);
-UAC2_ATTRIBUTE(p_srate);
-UAC2_ATTRIBUTE(p_ssize);
-UAC2_ATTRIBUTE(c_chmask);
-UAC2_ATTRIBUTE(c_srate);
+UAC2_ATTRIBUTE(u32, p_chmask);
+UAC2_ATTRIBUTE(u32, p_srate);
+UAC2_ATTRIBUTE(u32, p_ssize);
+UAC2_ATTRIBUTE(u32, c_chmask);
+UAC2_ATTRIBUTE(u32, c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
-UAC2_ATTRIBUTE(c_ssize);
-UAC2_ATTRIBUTE(req_number);
-UAC2_ATTRIBUTE(fb_max);
+UAC2_ATTRIBUTE(u32, c_ssize);
+UAC2_ATTRIBUTE(u32, req_number);
+
+UAC2_ATTRIBUTE(bool, p_mute_present);
+UAC2_ATTRIBUTE(bool, p_volume_present);
+UAC2_ATTRIBUTE(s16, p_volume_min);
+UAC2_ATTRIBUTE(s16, p_volume_max);
+UAC2_ATTRIBUTE(s16, p_volume_res);
+
+UAC2_ATTRIBUTE(bool, c_mute_present);
+UAC2_ATTRIBUTE(bool, c_volume_present);
+UAC2_ATTRIBUTE(s16, c_volume_min);
+UAC2_ATTRIBUTE(s16, c_volume_max);
+UAC2_ATTRIBUTE(s16, c_volume_res);
+UAC2_ATTRIBUTE(u32, fb_max);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
@@ -1345,6 +1847,19 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
 	&f_uac2_opts_attr_fb_max,
+
+	&f_uac2_opts_attr_p_mute_present,
+	&f_uac2_opts_attr_p_volume_present,
+	&f_uac2_opts_attr_p_volume_min,
+	&f_uac2_opts_attr_p_volume_max,
+	&f_uac2_opts_attr_p_volume_res,
+
+	&f_uac2_opts_attr_c_mute_present,
+	&f_uac2_opts_attr_c_volume_present,
+	&f_uac2_opts_attr_c_volume_min,
+	&f_uac2_opts_attr_c_volume_max,
+	&f_uac2_opts_attr_c_volume_res,
+
 	NULL,
 };
 
@@ -1383,6 +1898,19 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_srate = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
+
+	opts->p_mute_present = UAC2_DEF_MUTE_PRESENT;
+	opts->p_volume_present = UAC2_DEF_VOLUME_PRESENT;
+	opts->p_volume_min = UAC2_DEF_MIN_DB;
+	opts->p_volume_max = UAC2_DEF_MAX_DB;
+	opts->p_volume_res = UAC2_DEF_RES_DB;
+
+	opts->c_mute_present = UAC2_DEF_MUTE_PRESENT;
+	opts->c_volume_present = UAC2_DEF_VOLUME_PRESENT;
+	opts->c_volume_min = UAC2_DEF_MIN_DB;
+	opts->c_volume_max = UAC2_DEF_MAX_DB;
+	opts->c_volume_res = UAC2_DEF_RES_DB;
+
 	opts->req_number = UAC2_DEF_REQ_NUM;
 	opts->fb_max = UAC2_DEF_FB_MAX;
 	return &opts->func_inst;
@@ -1409,6 +1937,11 @@ static void afunc_unbind(struct usb_configuration *c, struct usb_function *f)
 	usb_free_all_descriptors(f);
 
 	agdev->gadget = NULL;
+
+	kfree(out_feature_unit_desc);
+	out_feature_unit_desc = NULL;
+	kfree(in_feature_unit_desc);
+	in_feature_unit_desc = NULL;
 }
 
 static struct usb_function *afunc_alloc(struct usb_function_instance *fi)
@@ -1441,3 +1974,4 @@ DECLARE_USB_FUNCTION_INIT(uac2, afunc_alloc_inst, afunc_alloc);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Yadwinder Singh");
 MODULE_AUTHOR("Jaswinder Singh");
+MODULE_AUTHOR("Ruslan Bilovol");
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 179d3ef6a195..a73b35774c44 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -22,8 +22,16 @@
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
 #define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
+
+#define UAC2_DEF_MUTE_PRESENT	1
+#define UAC2_DEF_VOLUME_PRESENT 1
+#define UAC2_DEF_MIN_DB		(-100*256)	/* -100 dB */
+#define UAC2_DEF_MAX_DB		0		/* 0 dB */
+#define UAC2_DEF_RES_DB		(1*256)		/* 1 dB */
+
 #define UAC2_DEF_REQ_NUM 2
 #define UAC2_DEF_FB_MAX 5
+#define UAC2_DEF_INT_REQ_NUM	10
 
 struct f_uac2_opts {
 	struct usb_function_instance	func_inst;
@@ -34,9 +42,22 @@ struct f_uac2_opts {
 	int				c_srate;
 	int				c_ssize;
 	int				c_sync;
+
+	bool			p_mute_present;
+	bool			p_volume_present;
+	s16				p_volume_min;
+	s16				p_volume_max;
+	s16				p_volume_res;
+
+	bool			c_mute_present;
+	bool			c_volume_present;
+	s16				c_volume_min;
+	s16				c_volume_max;
+	s16				c_volume_res;
+
 	int				req_number;
 	int				fb_max;
-	bool				bound;
+	bool			bound;
 
 	struct mutex			lock;
 	int				refcnt;
-- 
2.25.1


