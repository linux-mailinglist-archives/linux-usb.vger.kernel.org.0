Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8A239AD64
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 00:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFCWDW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 18:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCWDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 18:03:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CF9C06174A
        for <linux-usb@vger.kernel.org>; Thu,  3 Jun 2021 15:01:22 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l2so7313447wrw.6
        for <linux-usb@vger.kernel.org>; Thu, 03 Jun 2021 15:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7topgvHjcZG4ywvM1BGcOPP7Ws5IjQsYH7VdS8VrVk=;
        b=YmEcz1Zq2HvEZF3C9roVI6AhWx0jbSL8/7lN5HkFOGMjfet7f1mAXiNn9KnXzfGaWV
         YqPhVtTx+Ol+R0tg/0SaDpv3nkMJZ0akIsqXbOwDN7Pm69ttPa7E8K/+jEukR0KxVPyf
         bqH/vUxMwVizdELm4dvlD5T26JKc6pouEIjBtf03c9ClEXHnIyc8daPvLpKLyPLUxMtQ
         nzNGfqzipvwc5WmfAv1K6ijnfbJ6F2AaCZ3KGQEJrN0SNt04jYQd9Jj0QwJ/+3fNJp/C
         cZjYYCu7n7QoiJVXNylCb7C8xUHgYJq6FlHE1geTYvMVCcvE95WwS1WWrsItkLpBizpD
         uinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7topgvHjcZG4ywvM1BGcOPP7Ws5IjQsYH7VdS8VrVk=;
        b=Mogx4IYVD4/99OHQjQDNV54bePluA4RBgGtQzyV0HHGowdtzX9iUiiHP0GbsNgKmnP
         divPEbznqpGScdO8SPNz1I1tAN2AyLUpQKFrmSDbKKRGoKpsDf/qMeSOiTgTNrErDNTq
         PuMKsQOLAOpXKrI4xycensQcHpwUmahO+Atn+9MS0lYaSZo5KnS6DFFMgWUJA4rJkI0M
         VVJrSeRT96k/BmfjHn2eSJ+fyEHqGe3HzhCVdqz9BGBQJpfPhyealoJ0Pcz+XzOVpAia
         aV6ZIE4VsfnquVarZs2wFv5fAuLJaJYiIuAwJiIfm40QXV9kuF6bvTSxmsf7COeaKuY9
         5k2A==
X-Gm-Message-State: AOAM533sh18CRWow4Eqlf8szjMMO3pKdm1AowknEg0kMVYOqDsXKrclN
        hE1Xk7lxwuTaM1e7AuetEKaVnQ==
X-Google-Smtp-Source: ABdhPJyxi3Xt0PpYpwNMqnBTY4lgIqbKUUiEQV032Iy2l/JEMEx3l/b+1nAUbk09g2hSvWwz2udsIg==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr574369wrp.58.1622757680616;
        Thu, 03 Jun 2021 15:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:11bf:2693:b60f:d58b:e3f4:1a80])
        by smtp.googlemail.com with ESMTPSA id s128sm4078404wme.6.2021.06.03.15.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:01:20 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 2/3] usb: gadget: f_uac2: add adaptive sync support for capture
Date:   Fri,  4 Jun 2021 00:01:03 +0200
Message-Id: <20210603220104.1216001-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0.rc0
In-Reply-To: <20210603220104.1216001-1-jbrunet@baylibre.com>
References: <20210603220104.1216001-1-jbrunet@baylibre.com>
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
2.32.0.rc0

