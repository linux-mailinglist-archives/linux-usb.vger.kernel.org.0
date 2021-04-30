Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C75C36FC51
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhD3O1X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbhD3O1W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 10:27:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92F5C06138C
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id q6so23590309edr.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRuFkGf+6iSk7X1JhBm9EtqPo3OM7aC4PTr5rB1CZo4=;
        b=e398LU3FCHX6XomaDhnWrRTg0QBFyF7o4dVJpmxBQo44Y3LhWZc/q2N/ZagrtN2GIA
         HwkvDJ5WAlOg1LG5QgwNVQ6i9h4LFVG/VKSZHSK/UoMFukJQAD3AJVU7lGgSKrH+Qj+F
         XaZGWE72ehZcBIj6p9kkPWHb/U2Z5ubXItbiRru3z6Axa+PyBECp/MaXvVZgaDz4ssI7
         RxfpYbTbqin4CKgqc7yR+x9r7k8QGnja2NkLF4zmxvOB6pwJhZehDzjwy5sJz0C/6c4g
         67rMbCN5X9EeP8GZIu2fuUvJ+lL29IWo8v0uqAroumEiMDygrGc+eFwgKKsrWifYRn6O
         GGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRuFkGf+6iSk7X1JhBm9EtqPo3OM7aC4PTr5rB1CZo4=;
        b=Z/xJUuKGrvDetMvG+hzhnpn3GifwugeV+nPu0R9l5t/KetCozDgThAUMPvdnSKFi5k
         yBtIlzZ3tNGCBPCbGAEIFWO215Cnn+DxnDwzFSVepHhnxh9h4ESN3sic1foKbEhptvzH
         F+4YPR5bgpq9onvHDW8W8TOy0N5Dq66n+OG40wtXmR24myRHnDZQmITbl3ZfWPwt4U9y
         VUgqTbIMRtIb6a6xRxoR72wfdXg+K9qFzmA+zBCJdQ3QmW23M6AyEWIicO9CM6jnOuHo
         klB+kvCrSvlxC83+LCALligp1T+btbMtnsxEZxRttZkkHLoklTO69w1CIURCxOJHhSIu
         lJdg==
X-Gm-Message-State: AOAM530UCovvpy+84j/ON5Yz+Yq95OsKaNG8JiCv+JpJKF1UdLVmotto
        sV4LNqktl51MveZTxA2oaqP7VQ==
X-Google-Smtp-Source: ABdhPJxvkIP6Z6Q3CvK9HqjSlREvs4/WOqWgMz8DE/M+ragrRuIQSJVsu72yA+EoHpF5nWzhXsSTLw==
X-Received: by 2002:a05:6402:1907:: with SMTP id e7mr6299432edz.313.1619792792471;
        Fri, 30 Apr 2021 07:26:32 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id t22sm1009290edw.29.2021.04.30.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:26:32 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [RFC PATCH v2 2/3] usb: gadget: f_uac2: add adaptive sync support for capture
Date:   Fri, 30 Apr 2021 16:26:24 +0200
Message-Id: <20210430142625.357152-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430142625.357152-1-jbrunet@baylibre.com>
References: <20210430142625.357152-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

Current f_uac2 USB OUT (aka 'capture') synchronization
implements 'ASYNC' scenario which means USB Gadget has
it's own freerunning clock and can update Host about
real clock frequency through feedback endpoint so Host
can align number of samples sent to the USB gadget to
prevent overruns/underruns

In case if Gadget can has no it's internal clock and
can consume audio samples at any rate (for example,
on the Gadget side someone records audio directly to
a file, or audio samples are played through an
external DAC as soon as they arrive), UAC2 spec
suggests 'ADAPTIVE' synchronization type.

Change UAC2 driver to make it configurable through
additional 'c_sync' configfs file.

Default remains 'asynchronous' with possibility to
switch it to 'adaptive'

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |   1 +
 Documentation/usb/gadget-testing.rst          |   1 +
 drivers/usb/gadget/function/f_uac2.c          | 100 ++++++++++++++++--
 drivers/usb/gadget/function/u_uac2.h          |   2 +
 4 files changed, 95 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index d4356c8b8cd6..e7e59d7fb12f 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -8,6 +8,7 @@ Description:
 		c_chmask   capture channel mask
 		c_srate    capture sampling rate
 		c_ssize    capture sample size (bytes)
+		c_sync     capture synchronization type (async/adaptive)
 		p_chmask   playback channel mask
 		p_srate    playback sampling rate
 		p_ssize    playback sample size (bytes)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 2085e7b24eeb..f5a12667bd41 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -728,6 +728,7 @@ The uac2 function provides these attributes in its function directory:
 	c_chmask	capture channel mask
 	c_srate		capture sampling rate
 	c_ssize		capture sample size (bytes)
+	c_sync		capture synchronization type (async/adaptive)
 	p_chmask	playback channel mask
 	p_srate		playback sampling rate
 	p_ssize		playback sample size (bytes)
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 5d63244ba319..321e6c05ba93 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -44,6 +44,7 @@
 
 #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
 #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
+#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
 
 struct f_uac2 {
 	struct g_audio g_audio;
@@ -240,7 +241,7 @@ static struct usb_interface_descriptor std_as_out_if1_desc = {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 2,
+	.bNumEndpoints = 1,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -273,7 +274,7 @@ static struct usb_endpoint_descriptor fs_epout_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bEndpointAddress = USB_DIR_OUT,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 1,
 };
@@ -282,7 +283,7 @@ static struct usb_endpoint_descriptor hs_epout_desc = {
 	.bLength = USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType = USB_DT_ENDPOINT,
 
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
@@ -292,7 +293,7 @@ static struct usb_endpoint_descriptor ss_epout_desc = {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bEndpointAddress = USB_DIR_OUT,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	/* .bmAttributes = DYNAMIC */
 	/* .wMaxPacketSize = DYNAMIC */
 	.bInterval = 4,
 };
@@ -649,7 +650,9 @@ static void setup_headers(struct f_uac2_opts *opts,
 			headers[i++] = USBDHDR(epout_desc_comp);
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
-		headers[i++] = USBDHDR(epin_fback_desc);
+
+		if (EPOUT_FBACK_IN_EN(opts))
+			headers[i++] = USBDHDR(epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -820,6 +823,23 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		std_as_out_if1_desc.bInterfaceNumber = ret;
 		uac2->as_out_intf = ret;
 		uac2->as_out_alt = 0;
+
+		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
+			fs_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
+			hs_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
+			ss_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
+			std_as_out_if1_desc.bNumEndpoints++;
+		} else {
+			fs_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
+			hs_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
+			ss_epout_desc.bmAttributes =
+			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
+		}
 	}
 
 	if (EPIN_EN(uac2_opts)) {
@@ -883,11 +903,14 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 			return -ENODEV;
 		}
-		agdev->in_ep_fback = usb_ep_autoconfig(gadget,
+		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
+			agdev->in_ep_fback = usb_ep_autoconfig(gadget,
 						       &fs_epin_fback_desc);
-		if (!agdev->in_ep_fback) {
-			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-			return -ENODEV;
+			if (!agdev->in_ep_fback) {
+				dev_err(dev, "%s:%d Error!\n",
+					__func__, __LINE__);
+				return -ENODEV;
+			}
 		}
 	}
 
@@ -1242,11 +1265,68 @@ end:									\
 									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
+#define UAC2_ATTRIBUTE_SYNC(name)					\
+static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
+					 char *page)			\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
+	int result;							\
+	char *str;							\
+									\
+	mutex_lock(&opts->lock);					\
+	switch (opts->name) {						\
+	case USB_ENDPOINT_SYNC_ASYNC:					\
+		str = "async";						\
+		break;							\
+	case USB_ENDPOINT_SYNC_ADAPTIVE:				\
+		str = "adaptive";					\
+		break;							\
+	default:							\
+		str = "unknown";					\
+		break;							\
+	}								\
+	result = sprintf(page, "%s\n", str);				\
+	mutex_unlock(&opts->lock);					\
+									\
+	return result;							\
+}									\
+									\
+static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
+					  const char *page, size_t len)	\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
+	int ret = 0;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt) {						\
+		ret = -EBUSY;						\
+		goto end;						\
+	}								\
+									\
+	if (!strncmp(page, "async", 5))					\
+		opts->name = USB_ENDPOINT_SYNC_ASYNC;			\
+	else if (!strncmp(page, "adaptive", 8))				\
+		opts->name = USB_ENDPOINT_SYNC_ADAPTIVE;		\
+	else {								\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
+	ret = len;							\
+									\
+end:									\
+	mutex_unlock(&opts->lock);					\
+	return ret;							\
+}									\
+									\
+CONFIGFS_ATTR(f_uac2_opts_, name)
+
 UAC2_ATTRIBUTE(p_chmask);
 UAC2_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(p_ssize);
 UAC2_ATTRIBUTE(c_chmask);
 UAC2_ATTRIBUTE(c_srate);
+UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(c_ssize);
 UAC2_ATTRIBUTE(req_number);
 
@@ -1257,6 +1337,7 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_chmask,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
+	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
 	NULL,
 };
@@ -1295,6 +1376,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_chmask = UAC2_DEF_CCHMASK;
 	opts->c_srate = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
+	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
 	return &opts->func_inst;
 }
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index b5035711172d..13589c3c805c 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -21,6 +21,7 @@
 #define UAC2_DEF_CCHMASK 0x3
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
+#define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 #define UAC2_DEF_REQ_NUM 2
 
 struct f_uac2_opts {
@@ -31,6 +32,7 @@ struct f_uac2_opts {
 	int				c_chmask;
 	int				c_srate;
 	int				c_ssize;
+	int				c_sync;
 	int				req_number;
 	bool				bound;
 
-- 
2.31.1

