Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6FA47B4DC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhLTVLv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:51 -0500
Received: from cable.insite.cz ([84.242.75.189]:52817 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230345AbhLTVLr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A0C5EA1A3D400;
        Mon, 20 Dec 2021 22:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034705; bh=XQRAlk2+V8wj72YNBcUQRGUUNWyTfRhGHm58nuGGSeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i/KvCnFbTZBcE7qSXE0MaZ3cZj6pCEQewo1dke/78tJubUT0TmLyGA9d480qyw4T5
         kdYSK4UQ3a4ydYsHuhZt37ixI7H8rquCSQCfKamzbgdjUajop7BWTaisT3e7/sMwO6
         XZn+SFLPefBctRJcbbjulndhU+c/+4oA/k55V0u0=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KGNvGeyjAWG0; Mon, 20 Dec 2021 22:11:40 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8D255A1A3D40B;
        Mon, 20 Dec 2021 22:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034695; bh=XQRAlk2+V8wj72YNBcUQRGUUNWyTfRhGHm58nuGGSeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Aiu9c5yq4lspGqdeKK4ayWaRy5T5YUWJA0A5pou04v5lJigfNof5DddgakLhgYCMs
         9Rv+w3Md/RsfpxY4RDznmQd25Ie6ajgb0g/vrt9LJbdIFZ2y8LVttP9vRXnXM24XjU
         czK1iNwynFeM99xlZHbhubO4bPwEo5lNNNKPlrZg=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 11/11] usb: gadget: f_uac2: Determining bInterval for HS and SS
Date:   Mon, 20 Dec 2021 22:11:30 +0100
Message-Id: <20211220211130.88590-12-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So far bInterval for HS and SS was fixed at 4, disallowing faster
samplerates. The patch determines the largest bInterval (4 to 1) for
which the required bandwidth of the max samplerate fits the max allowed
packet size. If the required bandwidth exceeds max bandwidth for
single-packet mode (ep->mc=1), bInterval is left at 1.

The FS mode is left at fixed bInterval=1.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 90 +++++++++++++++++-----------
 1 file changed, 55 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 984f757de5a4..e72f6f42e1b7 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -333,7 +333,7 @@ static struct usb_endpoint_descriptor fs_epout_desc = {
 	.bEndpointAddress = USB_DIR_OUT,
 	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 1,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor hs_epout_desc = {
@@ -342,7 +342,7 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 
 	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor ss_epout_desc = {
@@ -352,7 +352,7 @@ static struct usb_endpoint_descriptor ss_epout_desc = {
 	.bEndpointAddress = USB_DIR_OUT,
 	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor ss_epout_desc_comp = {
@@ -467,7 +467,7 @@ static struct usb_endpoint_descriptor fs_epin_desc = {
 	.bEndpointAddress = USB_DIR_IN,
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 1,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor hs_epin_desc = {
@@ -476,7 +476,7 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
 
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor ss_epin_desc = {
@@ -486,7 +486,7 @@ static struct usb_endpoint_descriptor ss_epin_desc = {
 	.bEndpointAddress = USB_DIR_IN,
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
 	/* .wMaxPacketSize = DYNAMIC */
-	.bInterval = 4,
+	/* .bInterval = DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor ss_epin_desc_comp = {
@@ -659,29 +659,11 @@ static int get_max_srate(const int *srates)
 	return max_srate;
 }
 
-static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
-	struct usb_endpoint_descriptor *ep_desc,
-	enum usb_device_speed speed, bool is_playback)
+static int get_max_bw_for_binterval(const struct f_uac2_opts *uac2_opts,
+	u8 binterval, unsigned int factor, bool is_playback)
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
@@ -699,14 +681,52 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
 		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
 		max_size_bw = num_channels(chmask) * ssize *
-			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))));
+			(DIV_ROUND_UP(srate, factor / (1 << (binterval - 1))));
 	} else {
 		// adding 1 frame provision for Win10
 		max_size_bw = num_channels(chmask) * ssize *
-			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) + 1);
+			(DIV_ROUND_UP(srate, factor / (1 << (binterval - 1))) + 1);
 	}
+	return max_size_bw;
+}
+
+static int set_ep_max_packet_size_bint(const struct f_uac2_opts *uac2_opts,
+	struct usb_endpoint_descriptor *ep_desc,
+	enum usb_device_speed speed, bool is_playback)
+{
+	u16 max_size_bw, max_size_ep;
+	u8 binterval;
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+		max_size_ep = 1023;
+		// fixed
+		binterval = 1;
+		max_size_bw = get_max_bw_for_binterval(uac2_opts, binterval, 1000,
+			is_playback);
+		break;
+
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		max_size_ep = 1024;
+		// checking bInterval from 4 (= 1ms) to 1 if the required bandwidth fits
+		for (binterval = 4; binterval > 0; --binterval) {
+			max_size_bw = get_max_bw_for_binterval(uac2_opts, binterval, 8000,
+					is_playback);
+			if (max_size_bw <= max_size_ep) {
+				// found largest bInterval/max_size_bw fitting max_size_ep
+				break;
+			}
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
 						    max_size_ep));
+	ep_desc->bInterval = binterval;
 
 	return 0;
 }
@@ -1119,42 +1139,42 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	}
 
 	/* Calculate wMaxPacketSize according to audio bandwidth */
-	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
 				     true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
 				     false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
 				     true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
 				     false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
 				     true);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 		return ret;
 	}
 
-	ret = set_ep_max_packet_size(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
+	ret = set_ep_max_packet_size_bint(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
 				     false);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-- 
2.25.1

