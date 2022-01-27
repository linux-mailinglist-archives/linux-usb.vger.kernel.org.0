Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E77F49E15E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240694AbiA0Lnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:43:42 -0500
Received: from cable.insite.cz ([84.242.75.189]:36880 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235790AbiA0Lnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E16F5A1A3D400;
        Thu, 27 Jan 2022 12:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283817; bh=386iu8Cry8GecKMnHRI/QCgIuv0u8VObhgMHH4OCnsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eAhJRHSAK8p58wGJL5qq1KNYvYryF6H5g6/QAmREugMYH0T5blcerOQuPxklrEl2O
         ic3alfvkWyDSP+aDLleYJEiBP9KNT/+WhAlDBxExX+r52Us8zZjJaxFgtVJp/TI0AA
         hxqYMm1wGW7cQhjaVc82qoMTpwK9voKDWIVEb0oM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XClEMCOYBjgJ; Thu, 27 Jan 2022 12:43:32 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 282D6A1A3D401;
        Thu, 27 Jan 2022 12:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283812; bh=386iu8Cry8GecKMnHRI/QCgIuv0u8VObhgMHH4OCnsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TwuJXO9exhPL1o791ac77taGJLJN5cfPJlddLoryazKzOIprDBisxZpdFftNIYRjH
         x2kvhzIf+TtcBbve9labFC6P6SiuKKEqWgDVWpAb3rjxc13rJzKEAaekvNp27Aq/wf
         s+7PHfuTGE3RbHMJI/cOJf8qzz6ZawnfJZm8L07E=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yunhao Tian <t123yh.xyz@gmail.com>
Subject: [PATCH 1/4] usb: gadget: f_uac2: Add HS/SS bInterval to configfs
Date:   Thu, 27 Jan 2022 12:43:28 +0100
Message-Id: <20220127114331.41367-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127114331.41367-1-pavel.hofman@ivitera.com>
References: <20220127114331.41367-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow configuring the HS/SS bInterval through configfs, via
parameters p_hs_bint/c_hs_bint separately for playback/capture.

The default param values are left at the original 4.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Suggested-by: John Keeping <john@metanate.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |  2 ++
 Documentation/usb/gadget-testing.rst          |  2 ++
 drivers/usb/gadget/function/f_uac2.c          | 31 ++++++++++++++++---
 drivers/usb/gadget/function/u_uac2.h          |  4 +++
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 4c6bf63fcb22..33fb237b3ca5 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -8,6 +8,7 @@ Description:
 		c_chmask		capture channel mask
 		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
+		c_hs_bint		capture bInterval for HS/SS (1-4)
 		c_sync			capture synchronization type
 					(async/adaptive)
 		c_mute_present		capture mute control enable
@@ -22,6 +23,7 @@ Description:
 		p_chmask		playback channel mask
 		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
+		p_hs_bint		playback bInterval for HS/SS (1-4)
 		p_mute_present		playback mute control enable
 		p_volume_present	playback volume control enable
 		p_volume_min		playback volume control min value
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 6e8fdfaf19e7..bd91191683be 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -734,6 +734,7 @@ The uac2 function provides these attributes in its function directory:
 	c_volume_min     capture volume control min value (in 1/256 dB)
 	c_volume_max     capture volume control max value (in 1/256 dB)
 	c_volume_res     capture volume control resolution (in 1/256 dB)
+	c_hs_bint        capture bInterval for HS/SS (1-4)
 	fb_max           maximum extra bandwidth in async mode
 	p_chmask         playback channel mask
 	p_srate          list of playback sampling rates (comma-separated)
@@ -743,6 +744,7 @@ The uac2 function provides these attributes in its function directory:
 	p_volume_min     playback volume control min value (in 1/256 dB)
 	p_volume_max     playback volume control max value (in 1/256 dB)
 	p_volume_res     playback volume control resolution (in 1/256 dB)
+	p_hs_bint        playback bInterval for HS/SS (1-4)
 	req_number       the number of pre-allocated request for both capture
 	                 and playback
 	function_name    name of the interface
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d874e0d34188..34bb6c9a9023 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -343,7 +343,7 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 
 	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor ss_epout_desc = {
@@ -353,7 +353,7 @@ static struct usb_endpoint_descriptor ss_epout_desc = {
 	.bEndpointAddress = USB_DIR_OUT,
 	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor ss_epout_desc_comp = {
@@ -477,7 +477,7 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
 
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor ss_epin_desc = {
@@ -487,7 +487,7 @@ static struct usb_endpoint_descriptor ss_epin_desc = {
 	.bEndpointAddress = USB_DIR_IN,
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor ss_epin_desc_comp = {
@@ -965,6 +965,16 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
 			return -EINVAL;
 	}
 
+	if ((opts->p_hs_bint < 1) || (opts->p_hs_bint > 4)) {
+		dev_err(dev, "Error: incorrect playback HS/SS bInterval (1-4)\n");
+		return -EINVAL;
+	}
+
+	if ((opts->c_hs_bint < 1) || (opts->c_hs_bint > 4)) {
+		dev_err(dev, "Error: incorrect capture HS/SS bInterval (1-4)\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1125,6 +1135,11 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		std_ac_if_desc.bNumEndpoints = 1;
 	}
 
+	hs_epin_desc.bInterval = uac2_opts->p_hs_bint;
+	ss_epin_desc.bInterval = uac2_opts->p_hs_bint;
+	hs_epout_desc.bInterval = uac2_opts->c_hs_bint;
+	ss_epout_desc.bInterval = uac2_opts->c_hs_bint;
+
 	/* Calculate wMaxPacketSize according to audio bandwidth */
 	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
 				     true);
@@ -1801,10 +1816,12 @@ static struct configfs_item_operations f_uac2_item_ops = {
 	.release	= f_uac2_attr_release,
 };
 
+#define uac2_kstrtou8 kstrtou8
 #define uac2_kstrtou32 kstrtou32
 #define uac2_kstrtos16 kstrtos16
 #define uac2_kstrtobool(s, base, res) kstrtobool((s), (res))
 
+static const char *u8_fmt = "%u\n";
 static const char *u32_fmt = "%u\n";
 static const char *s16_fmt = "%hd\n";
 static const char *bool_fmt = "%u\n";
@@ -2004,10 +2021,12 @@ CONFIGFS_ATTR(f_uac2_opts_, name)
 UAC2_ATTRIBUTE(u32, p_chmask);
 UAC2_RATE_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(u32, p_ssize);
+UAC2_ATTRIBUTE(u8, p_hs_bint);
 UAC2_ATTRIBUTE(u32, c_chmask);
 UAC2_RATE_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(u32, c_ssize);
+UAC2_ATTRIBUTE(u8, c_hs_bint);
 UAC2_ATTRIBUTE(u32, req_number);
 
 UAC2_ATTRIBUTE(bool, p_mute_present);
@@ -2028,9 +2047,11 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
 	&f_uac2_opts_attr_p_srate,
 	&f_uac2_opts_attr_p_ssize,
+	&f_uac2_opts_attr_p_hs_bint,
 	&f_uac2_opts_attr_c_chmask,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
+	&f_uac2_opts_attr_c_hs_bint,
 	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
 	&f_uac2_opts_attr_fb_max,
@@ -2083,9 +2104,11 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->p_chmask = UAC2_DEF_PCHMASK;
 	opts->p_srates[0] = UAC2_DEF_PSRATE;
 	opts->p_ssize = UAC2_DEF_PSSIZE;
+	opts->p_hs_bint = UAC2_DEF_PHSBINT;
 	opts->c_chmask = UAC2_DEF_CCHMASK;
 	opts->c_srates[0] = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
+	opts->c_hs_bint = UAC2_DEF_CHSBINT;
 	opts->c_sync = UAC2_DEF_CSYNC;
 
 	opts->p_mute_present = UAC2_DEF_MUTE_PRESENT;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index ed96c7c853e4..733a0e0945fb 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -19,9 +19,11 @@
 #define UAC2_DEF_PCHMASK 0x3
 #define UAC2_DEF_PSRATE 48000
 #define UAC2_DEF_PSSIZE 2
+#define UAC2_DEF_PHSBINT 4
 #define UAC2_DEF_CCHMASK 0x3
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
+#define UAC2_DEF_CHSBINT 4
 #define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 
 #define UAC2_DEF_MUTE_PRESENT	1
@@ -38,10 +40,12 @@ struct f_uac2_opts {
 	int				p_chmask;
 	int				p_srates[UAC_MAX_RATES];
 	int				p_ssize;
+	u8				p_hs_bint;
 	int				c_chmask;
 	int				c_srates[UAC_MAX_RATES];
 	int				c_ssize;
 	int				c_sync;
+	u8				c_hs_bint;
 
 	bool			p_mute_present;
 	bool			p_volume_present;
-- 
2.25.1

