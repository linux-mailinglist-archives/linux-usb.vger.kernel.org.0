Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DE149E160
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240720AbiA0Lnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:43:42 -0500
Received: from cable.insite.cz ([84.242.75.189]:36816 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235918AbiA0Lnl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 06:43:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A5C4AA1A3D402;
        Thu, 27 Jan 2022 12:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283818; bh=QEbe/TAzdMNrHPD60tJe2Z/9qgGgeBw6tGhTSdBqRoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGD7oA+httVKspNHCa/0LTuK4M/Q5vJUHwVblpdVw/keqPTWdCzpuhaN4XbZeZv0+
         2ug8TuENNG7r1mm7ShFsHfSMbcc0XXvxkO+esXGJOm+9Em/YNBDbhqgrd07ChclJaS
         Q1EkG03kBPuTFXn+lZPxjIwS52QfDoNPD51s/AaA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bejPxS6TfQ6a; Thu, 27 Jan 2022 12:43:33 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id ED065A1A3D403;
        Thu, 27 Jan 2022 12:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643283813; bh=QEbe/TAzdMNrHPD60tJe2Z/9qgGgeBw6tGhTSdBqRoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jZPd2HfWBeBwzQPIHvZQ/KOaV9zDCcE4dA4ZdpXTroFFpuVaVtLIVaXzqDoA/FluR
         ijC+Ak97qQ69bYIgqOKK2euV6aMF4CStKexhdIL1UxbhXY7jRi8PwQzolaj1VkamRo
         kdX16zop231PCq7HsSI/fU2cjaXEJS2WBoEa75d4=
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
Subject: [PATCH 3/4] usb: gadget: f_uac2: Optionally determine bInterval for HS and SS
Date:   Thu, 27 Jan 2022 12:43:30 +0100
Message-Id: <20220127114331.41367-4-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127114331.41367-1-pavel.hofman@ivitera.com>
References: <20220127114331.41367-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow setting configfs params p_hs_bint/c_hs_bint to 0. If they are set
to 0, determine the largest bInterval (4 to 1) for which the required
bandwidth of the max samplerate fits the max allowed packet size. If the
required bandwidth exceeds max bandwidth for single-packet mode
(ep->mc=1), keep bInterval at 1.

The FS speed is left at fixed bInterval=1.

If for any speed the required bandwidth exceeds the max bandwidth
corresponding to the selected/determined bInterval, print a warning.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
 Documentation/usb/gadget-testing.rst          |   4 +-
 drivers/usb/gadget/function/f_uac2.c          | 126 ++++++++++++------
 drivers/usb/gadget/function/u_uac2.h          |   4 +-
 4 files changed, 91 insertions(+), 47 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 33fb237b3ca5..3371c39f651d 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -8,7 +8,7 @@ Description:
 		c_chmask		capture channel mask
 		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
-		c_hs_bint		capture bInterval for HS/SS (1-4)
+		c_hs_bint		capture bInterval for HS/SS (1-4: fixed, 0: auto)
 		c_sync			capture synchronization type
 					(async/adaptive)
 		c_mute_present		capture mute control enable
@@ -23,7 +23,7 @@ Description:
 		p_chmask		playback channel mask
 		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
-		p_hs_bint		playback bInterval for HS/SS (1-4)
+		p_hs_bint		playback bInterval for HS/SS (1-4: fixed, 0: auto)
 		p_mute_present		playback mute control enable
 		p_volume_present	playback volume control enable
 		p_volume_min		playback volume control min value
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index bd91191683be..c6d034abce3a 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -734,7 +734,7 @@ The uac2 function provides these attributes in its function directory:
 	c_volume_min     capture volume control min value (in 1/256 dB)
 	c_volume_max     capture volume control max value (in 1/256 dB)
 	c_volume_res     capture volume control resolution (in 1/256 dB)
-	c_hs_bint        capture bInterval for HS/SS (1-4)
+	c_hs_bint        capture bInterval for HS/SS (1-4: fixed, 0: auto)
 	fb_max           maximum extra bandwidth in async mode
 	p_chmask         playback channel mask
 	p_srate          list of playback sampling rates (comma-separated)
@@ -744,7 +744,7 @@ The uac2 function provides these attributes in its function directory:
 	p_volume_min     playback volume control min value (in 1/256 dB)
 	p_volume_max     playback volume control max value (in 1/256 dB)
 	p_volume_res     playback volume control resolution (in 1/256 dB)
-	p_hs_bint        playback bInterval for HS/SS (1-4)
+	p_hs_bint        playback bInterval for HS/SS (1-4: fixed, 0: auto)
 	req_number       the number of pre-allocated request for both capture
 	                 and playback
 	function_name    name of the interface
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 34bb6c9a9023..48d6fb26bb19 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -664,29 +664,11 @@ static int get_max_srate(const int *srates)
 	return max_srate;
 }
 
-static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
-	struct usb_endpoint_descriptor *ep_desc,
-	enum usb_device_speed speed, bool is_playback)
+static int get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
+	u8 bint, unsigned int factor, bool is_playback)
 {
 	int chmask, srate, ssize;
-	u16 max_size_bw, max_size_ep;
-	unsigned int factor;
-
-	switch (speed) {
-	case USB_SPEED_FULL:
-		max_size_ep = 1023;
-		factor = 1000;
-		break;
-
-	case USB_SPEED_HIGH:
-	case USB_SPEED_SUPER:
-		max_size_ep = 1024;
-		factor = 8000;
-		break;
-
-	default:
-		return -EINVAL;
-	}
+	u16 max_size_bw;
 
 	if (is_playback) {
 		chmask = uac2_opts->p_chmask;
@@ -704,14 +686,76 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
 		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
 		max_size_bw = num_channels(chmask) * ssize *
-			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))));
+			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))));
 	} else {
 		// adding 1 frame provision for Win10
 		max_size_bw = num_channels(chmask) * ssize *
-			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) + 1);
+			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))) + 1);
 	}
-	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
-						    max_size_ep));
+	return max_size_bw;
+}
+
+static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_opts *uac2_opts,
+	struct usb_endpoint_descriptor *ep_desc,
+	enum usb_device_speed speed, bool is_playback)
+{
+	u16 max_size_bw, max_size_ep;
+	u8 bint, opts_bint;
+	char *dir;
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+		max_size_ep = 1023;
+		// fixed
+		bint = ep_desc->bInterval;
+		max_size_bw = get_max_bw_for_bint(uac2_opts, bint, 1000, is_playback);
+		break;
+
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		max_size_ep = 1024;
+		if (is_playback)
+			opts_bint = uac2_opts->p_hs_bint;
+		else
+			opts_bint = uac2_opts->c_hs_bint;
+
+		if (opts_bint > 0) {
+			/* fixed bint */
+			bint = opts_bint;
+			max_size_bw = get_max_bw_for_bint(uac2_opts, bint, 8000, is_playback);
+		} else {
+			/* checking bInterval from 4 to 1 whether the required bandwidth fits */
+			for (bint = 4; bint > 0; --bint) {
+				max_size_bw = get_max_bw_for_bint(
+					uac2_opts, bint, 8000, is_playback);
+				if (max_size_bw <= max_size_ep)
+					break;
+			}
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (is_playback)
+		dir = "Playback";
+	else
+		dir = "Capture";
+
+	if (max_size_bw <= max_size_ep)
+		dev_dbg(dev,
+			"%s: Will use maxpctksize %d and bInterval %d\n",
+			dir, max_size_bw, bint);
+	else {
+		dev_warn(dev,
+			"%s: Req. maxpcktsize %d at bInterval %d > max ISOC %d, may drop data!\n",
+			dir, max_size_bw, bint, max_size_ep);
+		max_size_bw = max_size_ep;
+	}
+
+	ep_desc->wMaxPacketSize = cpu_to_le16(max_size_bw);
+	ep_desc->bInterval = bint;
 
 	return 0;
 }
@@ -965,13 +1009,13 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
 			return -EINVAL;
 	}
 
-	if ((opts->p_hs_bint < 1) || (opts->p_hs_bint > 4)) {
-		dev_err(dev, "Error: incorrect playback HS/SS bInterval (1-4)\n");
+	if ((opts->p_hs_bint < 0) || (opts->p_hs_bint > 4)) {
+		dev_err(dev, "Error: incorrect playback HS/SS bInterval (1-4: fixed, 0: auto)\n");
 		return -EINVAL;
 	}
 
-	if ((opts->c_hs_bint < 1) || (opts->c_hs_bint > 4)) {
-		dev_err(dev, "Error: incorrect capture HS/SS bInterval (1-4)\n");
+	if ((opts->c_hs_bint < 0) || (opts->c_hs_bint > 4)) {
+		dev_err(dev, "Error: incorrect capture HS/SS bInterval (1-4: fixed, 0: auto)\n");
 		return -EINVAL;
 	}
 
@@ -1141,43 +1185,43 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	ss_epout_desc.bInterval = uac2_opts->c_hs_bint;
 
 	/* Calculate wMaxPacketSize according to audio bandwidth */
-	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
-				     true);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &fs_epin_desc,
+					USB_SPEED_FULL, true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
-				     false);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &fs_epout_desc,
+					USB_SPEED_FULL, false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
-				     true);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &hs_epin_desc,
+					USB_SPEED_HIGH, true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
-				     false);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &hs_epout_desc,
+					USB_SPEED_HIGH, false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
-				     true);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &ss_epin_desc,
+					USB_SPEED_SUPER, true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
-				     false);
+	ret = set_ep_max_packet_size_bint(dev, uac2_opts, &ss_epout_desc,
+					USB_SPEED_SUPER, false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 733a0e0945fb..0510c9bad58d 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -19,11 +19,11 @@
 #define UAC2_DEF_PCHMASK 0x3
 #define UAC2_DEF_PSRATE 48000
 #define UAC2_DEF_PSSIZE 2
-#define UAC2_DEF_PHSBINT 4
+#define UAC2_DEF_PHSBINT 0
 #define UAC2_DEF_CCHMASK 0x3
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
-#define UAC2_DEF_CHSBINT 4
+#define UAC2_DEF_CHSBINT 0
 #define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 
 #define UAC2_DEF_MUTE_PRESENT	1
-- 
2.25.1

