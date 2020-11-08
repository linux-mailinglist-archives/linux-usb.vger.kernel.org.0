Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201BC2AA88A
	for <lists+linux-usb@lfdr.de>; Sun,  8 Nov 2020 01:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgKHASj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 19:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgKHASj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 19:18:39 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2605C0613CF
        for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2020 16:18:38 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d17so3778025lfq.10
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2020 16:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hs/n4wHqAZumQHAbTgr2kPhT2sOoR/BpHta+kZDd6TA=;
        b=hcWfc+zz+ZWnlwaYAydKAS07n0Emka85xI2pP/JKWrrNeGwejHo9jQDuRIn/PqFThE
         c/Z07hK9gZ63fPsVz+/2WTG73sUTlW5A083KAewID1X/NS7dj8MwFI40igqVXwq8h4j1
         c5sljCzI7DayubR9zU63gEUREF9IDXZ71Xfx1LtZACEYhbmXcBZyWRnNboIsO85sNC62
         my7gTRfZ1Z7nP4vMhK55lcmaZqFqaIDz7aae/KKM6IQxixw0+gPar0WKf7TKb24i2ZkC
         uqCKZYPLsMiQczn7ESX1AQ3TNeY4eQQE7QCr64j3xvA8zVNPYi3fYccK084irA4/tXFf
         /2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hs/n4wHqAZumQHAbTgr2kPhT2sOoR/BpHta+kZDd6TA=;
        b=DYsZmx3wMpF5JRgpCT4dQt1br+sBGEPuBgCIcb4MzZ9VSlkviSOpQov1hneqUSLIj6
         eiQf2AoWz0tOEvXvCjM62vWQjDQQOyeUEqGauuVU12neCthzWbOJCVs0Zo60hquB7euV
         Dkl46A37LHXviUNCYmmMRNBHWOly1HU2VrHJbiTwd9RHPpXQaiwUvOClNcoNtI9lxNdU
         3cPkOx/kbLEgbqJVgf9gJ5/t+RUinsRNlHhqD8Wjpa4l+CRi4nKnnE4ZwyBNhSpW456f
         bQiE+u3tIyIl+GydqoLlqFXiqem0+4DhQAdyUAxIlClMPbJ8wUkdyUMtUUpWLOrdh42u
         NqUw==
X-Gm-Message-State: AOAM533kcyMWVHUcP2gbkTA9bnQ04AePhwyIuC0Eo45npRV9CchiwG5G
        0Qa+iuymePrcY0Ov1KjZs7w=
X-Google-Smtp-Source: ABdhPJwmy1cx11+3LfSwf5WXy7lu/szV9XZrB/UGjDjmNO00PZTv6/6LaHR7ni+FCtXvz9Zeog5qDg==
X-Received: by 2002:a19:6541:: with SMTP id c1mr3554492lfj.183.1604794717191;
        Sat, 07 Nov 2020 16:18:37 -0800 (PST)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id j19sm891155ljb.51.2020.11.07.16.18.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2020 16:18:36 -0800 (PST)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for capture
Date:   Sun,  8 Nov 2020 02:18:30 +0200
Message-Id: <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
---
 Documentation/ABI/testing/configfs-usb-gadget-uac2 |  1 +
 Documentation/usb/gadget-testing.rst               |  1 +
 drivers/usb/gadget/function/f_uac2.c               | 96 ++++++++++++++++++++--
 drivers/usb/gadget/function/u_uac2.h               |  2 +
 4 files changed, 91 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 2bfdd4e..4fbff96 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -7,6 +7,7 @@ Description:
 		c_chmask - capture channel mask
 		c_srate - capture sampling rate
 		c_ssize - capture sample size (bytes)
+		c_sync - capture synchronization type (async/adaptive)
 		p_chmask - playback channel mask
 		p_srate - playback sampling rate
 		p_ssize - playback sample size (bytes)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 2eeb3e9..360a7ca 100644
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
index a57bf77..3187ad3 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -41,6 +41,7 @@
 
 #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
 #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
+#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
 
 struct f_uac2 {
 	struct g_audio g_audio;
@@ -237,7 +238,7 @@ enum {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 2,
+	.bNumEndpoints = 1,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -270,7 +271,7 @@ enum {
 	.bDescriptorType = USB_DT_ENDPOINT,
 
 	.bEndpointAddress = USB_DIR_OUT,
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC,
 	.wMaxPacketSize = cpu_to_le16(1023),
 	.bInterval = 1,
 };
@@ -279,7 +280,7 @@ enum {
 	.bLength = USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType = USB_DT_ENDPOINT,
 
-	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC,
 	.wMaxPacketSize = cpu_to_le16(1024),
 	.bInterval = 1,
 };
@@ -540,6 +541,19 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		len += sizeof(io_out_ot_desc);
 		ac_hdr_desc.wTotalLength = cpu_to_le16(len);
 		iad_desc.bInterfaceCount++;
+
+		if (EPOUT_FBACK_IN_EN(opts)) {
+			fs_epout_desc.bmAttributes |=
+						USB_ENDPOINT_SYNC_ASYNC;
+			hs_epout_desc.bmAttributes |=
+						USB_ENDPOINT_SYNC_ASYNC;
+			std_as_out_if1_desc.bNumEndpoints++;
+		} else {
+			fs_epout_desc.bmAttributes |=
+						USB_ENDPOINT_SYNC_ADAPTIVE;
+			hs_epout_desc.bmAttributes |=
+						USB_ENDPOINT_SYNC_ADAPTIVE;
+		}
 	}
 
 	i = 0;
@@ -564,7 +578,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		fs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
 		fs_audio_desc[i++] = USBDHDR(&fs_epout_desc);
 		fs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
-		fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
+		if (EPOUT_FBACK_IN_EN(opts))
+			fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		fs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -598,7 +613,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		hs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
 		hs_audio_desc[i++] = USBDHDR(&hs_epout_desc);
 		hs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
-		hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
+		if (EPOUT_FBACK_IN_EN(opts))
+			hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		hs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -706,11 +722,14 @@ static void setup_descriptor(struct f_uac2_opts *opts)
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
 
@@ -1057,11 +1076,68 @@ static void f_uac2_attr_release(struct config_item *item)
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
 
@@ -1072,6 +1148,7 @@ static void f_uac2_attr_release(struct config_item *item)
 	&f_uac2_opts_attr_c_chmask,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
+	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
 	NULL,
 };
@@ -1110,6 +1187,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_chmask = UAC2_DEF_CCHMASK;
 	opts->c_srate = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
+	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
 	return &opts->func_inst;
 }
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index b503571..13589c3 100644
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
1.9.1

