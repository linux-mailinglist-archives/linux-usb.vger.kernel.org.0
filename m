Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D5D2DFF4A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 19:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgLUSGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 13:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgLUSGq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 13:06:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9FDC061793
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:06:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o19so25892478lfo.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UTSIWNrCdfFZGrfLRZuDMagz0Cnd73ZK/iAZinL3Hdk=;
        b=HFwFklBFejfRIGWkA2tHTHhTKeW2c1LNBGTqxXTKD8QsawAuLODDYMDiuRMSFan+Wm
         2rKLN9+sFiXkjIMuxnrl7qH6x2o5G7XG5WNuNvEZjd8hgK8AV3mWH9yCbu+f7C3nn1Qp
         p1v8v+XYry0BSpgjoRfQIe+M3AyEpCLKrkkzwGR1oCndoh1xWPKmlmvKZhvvoHEbHoZ/
         JyTTI2eYgMghTdci/REOKrK2r/LfuBX+gmEwdHYZ7tTT8kxocXTb4Gf01aHgSotTTdE1
         hAsD/tagSBGz7mxfgE3xNyotXr7+t1E6zzx1s+2G2unQvXEt07vAx25PyBwuCVaKB0ND
         X+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTSIWNrCdfFZGrfLRZuDMagz0Cnd73ZK/iAZinL3Hdk=;
        b=OPAwxOdF4/lSlfR8GCEBR3Ddv58CPtwY+uV5UwPIuLo+Z77H705QlK4H0OolQ5bZgv
         21ft6AXd/wCSsA0tbWDJ7yN/GxdgVvY46XUUftiK/u6CbkIpoE9MaoxfrFeK1MfYTYNs
         CJ7wmakDUi1NMRQsyWBVcRWNp5pOs40kBvAGy1Q1yZeKG8lydwe+7cEGYByncGObL8Hk
         FM7vAwodXhZi+YE78cJedYH9u/kW6qebV+Vb+/4dG9/V3co1bYdHq3GYpdzRQxNTpggy
         oPdgE3IDSb1Ea1pNN7vfeqdcEUaGltHOvl3bmo9N7ajlOJIXyan0cAXbRJ50puS0wleI
         4g1A==
X-Gm-Message-State: AOAM5315DABgStClWaVxoadGT8+YDIIptdYYnt8UUBukq8lvPemMMfP7
        jXEO28SIpj1qHYAT/pa3hyahZvqvKNt04WZk
X-Google-Smtp-Source: ABdhPJxoRxAwUo5v1zUN7j/lrS068fcY+SGTa6oCbfq9J4aZIFZv96SVmM1NXilbBPAI7VEZITS5xA==
X-Received: by 2002:a17:906:e247:: with SMTP id gq7mr16632490ejb.27.1608572141971;
        Mon, 21 Dec 2020 09:35:41 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id dd18sm9338408ejb.53.2020.12.21.09.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:35:41 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] usb: gadget: f_uac2: reset wMaxPacketSize
Date:   Mon, 21 Dec 2020 18:35:28 +0100
Message-Id: <20201221173531.215169-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221173531.215169-1-jbrunet@baylibre.com>
References: <20201221173531.215169-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With commit 913e4a90b6f9 ("usb: gadget: f_uac2: finalize wMaxPacketSize according to bandwidth")
wMaxPacketSize is computed dynamically but the value is never reset.

Because of this, the actual maximum packet size can only decrease each time
the audio gadget is instantiated.

Reset the endpoint maximum packet size and mark wMaxPacketSize as dynamic
to solve the problem.

Fixes: 913e4a90b6f9 ("usb: gadget: f_uac2: finalize wMaxPacketSize according to bandwidth")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/gadget/function/f_uac2.c | 69 ++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 3633df6d7610..5d960b6603b6 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -271,7 +271,7 @@ static struct usb_endpoint_descriptor fs_epout_desc = {
 
 	.bEndpointAddress = USB_DIR_OUT,
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
-	.wMaxPacketSize = cpu_to_le16(1023),
+	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 1,
 };
 
@@ -280,7 +280,7 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
-	.wMaxPacketSize = cpu_to_le16(1024),
+	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
 
@@ -348,7 +348,7 @@ static struct usb_endpoint_descriptor fs_epin_desc = {
 
 	.bEndpointAddress = USB_DIR_IN,
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
-	.wMaxPacketSize = cpu_to_le16(1023),
+	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 1,
 };
 
@@ -357,7 +357,7 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
-	.wMaxPacketSize = cpu_to_le16(1024),
+	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
 
@@ -444,12 +444,28 @@ struct cntrl_range_lay3 {
 	__le32	dRES;
 } __packed;
 
-static void set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
+static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 	struct usb_endpoint_descriptor *ep_desc,
-	unsigned int factor, bool is_playback)
+	enum usb_device_speed speed, bool is_playback)
 {
 	int chmask, srate, ssize;
-	u16 max_packet_size;
+	u16 max_size_bw, max_size_ep;
+	unsigned int factor;
+
+	switch (speed) {
+	case USB_SPEED_FULL:
+		max_size_ep = 1023;
+		factor = 1000;
+		break;
+
+	case USB_SPEED_HIGH:
+		max_size_ep = 1024;
+		factor = 8000;
+		break;
+
+	default:
+		return -EINVAL;
+	}
 
 	if (is_playback) {
 		chmask = uac2_opts->p_chmask;
@@ -461,10 +477,12 @@ static void set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
-	max_packet_size = num_channels(chmask) * ssize *
+	max_size_bw = num_channels(chmask) * ssize *
 		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
-	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_packet_size,
-				le16_to_cpu(ep_desc->wMaxPacketSize)));
+	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
+						    max_size_ep));
+
+	return 0;
 }
 
 /* Use macro to overcome line length limitation */
@@ -670,10 +688,33 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	}
 
 	/* Calculate wMaxPacketSize according to audio bandwidth */
-	set_ep_max_packet_size(uac2_opts, &fs_epin_desc, 1000, true);
-	set_ep_max_packet_size(uac2_opts, &fs_epout_desc, 1000, false);
-	set_ep_max_packet_size(uac2_opts, &hs_epin_desc, 8000, true);
-	set_ep_max_packet_size(uac2_opts, &hs_epout_desc, 8000, false);
+	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
+				     true);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
+
+	ret = set_ep_max_packet_size(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
+				     false);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
+
+	ret = set_ep_max_packet_size(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
+				     true);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
+
+	ret = set_ep_max_packet_size(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
+				     false);
+	if (ret < 0) {
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+		return ret;
+	}
 
 	if (EPOUT_EN(uac2_opts)) {
 		agdev->out_ep = usb_ep_autoconfig(gadget, &fs_epout_desc);
-- 
2.29.2

