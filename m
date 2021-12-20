Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B845147B4D3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhLTVLo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:44 -0500
Received: from cable.insite.cz ([84.242.75.189]:36665 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230345AbhLTVLm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C7DBAA1A3D402;
        Mon, 20 Dec 2021 22:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034699; bh=vx4SmD1oiBOte6EW4yc3j/BqCuKPaYSVyu2JwOsbzRU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LmoQYLFh6m3/RKZk65ZIUcOGjt9JqNGuYwDXXv1KP61jRqhWhIkNDJQFWhXbWzB8X
         6S89GfwltAVq3SnMHG3RBu57IqGwo2RAAL1///2aGiC5ihiE73t8nazmPB4v5yXTR6
         LPvd2412pC/r933OR35CBabt2qViqMyRXP9rRnjk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AGig1YAUaFom; Mon, 20 Dec 2021 22:11:33 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 0A82FA1A3D404;
        Mon, 20 Dec 2021 22:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034693; bh=vx4SmD1oiBOte6EW4yc3j/BqCuKPaYSVyu2JwOsbzRU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WeLKY6ckLqCWKLeDG/cQl6OqM8lJxXw8oJg9GWe192Tc55MEJTgpo6ZzuiZCC92zY
         XxkMXB96DNxeYrIOT7m3mT8aTjBFdveLoOuStlRuAhMKi3OOChwaKLwORpWN6wRrDK
         9acXS5aD/XywDk6UToL0BptSyttu+F/5HHpnRTno=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 04/11] usb: gadget: f_uac1: Support multiple sampling rates
Date:   Mon, 20 Dec 2021 22:11:23 +0100
Message-Id: <20211220211130.88590-5-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Julian Scheel <julian@jusst.de>

A list of sampling rates can be specified via configfs. All enabled
sampling rates are sent to the USB host on request. When the host
selects a sampling rate the internal active rate is updated.

Config strings with single value stay compatible with the previous version.

Multiple samplerates passed as configuration arrays to g_audio module
when built for f_uac1.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 .../ABI/testing/configfs-usb-gadget-uac1      |   4 +-
 Documentation/usb/gadget-testing.rst          |   4 +-
 drivers/usb/gadget/function/f_uac1.c          | 114 ++++++++++++++----
 drivers/usb/gadget/function/u_uac1.h          |  63 +++++++++-
 drivers/usb/gadget/legacy/audio.c             |  26 ++--
 5 files changed, 176 insertions(+), 35 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1 b/Documentation/ABI/testing/configfs-usb-gadget-uac1
index b576b3d6ea6d..a8ecf17f688b 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac1
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac1
@@ -6,7 +6,7 @@ Description:
 
 		=====================	=======================================
 		c_chmask		capture channel mask
-		c_srate			capture sampling rate
+		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
 		c_mute_present		capture mute control enable
 		c_volume_present	capture volume control enable
@@ -17,7 +17,7 @@ Description:
 		c_volume_res		capture volume control resolution
 					(in 1/256 dB)
 		p_chmask		playback channel mask
-		p_srate			playback sampling rate
+		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
 		p_mute_present		playback mute control enable
 		p_volume_present	playback volume control enable
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 928f60a31544..f21cc21d2d7b 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -916,7 +916,7 @@ The uac1 function provides these attributes in its function directory:
 
 	================ ====================================================
 	c_chmask         capture channel mask
-	c_srate          capture sampling rate
+	c_srate          list of capture sampling rates (comma-separated)
 	c_ssize          capture sample size (bytes)
 	c_mute_present   capture mute control enable
 	c_volume_present capture volume control enable
@@ -924,7 +924,7 @@ The uac1 function provides these attributes in its function directory:
 	c_volume_max     capture volume control max value (in 1/256 dB)
 	c_volume_res     capture volume control resolution (in 1/256 dB)
 	p_chmask         playback channel mask
-	p_srate          playback sampling rate
+	p_srate          list of playback sampling rates (comma-separated)
 	p_ssize          playback sample size (bytes)
 	p_mute_present   playback mute control enable
 	p_volume_present playback volume control enable
diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index ccb0e4f41e5d..7fd2b5580374 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -3,6 +3,7 @@
  * f_uac1.c -- USB Audio Class 1.0 Function (using u_audio API)
  *
  * Copyright (C) 2016 Ruslan Bilovol <ruslan.bilovol@gmail.com>
+ * Copyright (C) 2021 Julian Scheel <julian@jusst.de>
  *
  * This driver doesn't expect any real Audio codec to be present
  * on the device - the audio streams are simply sinked to and
@@ -42,6 +43,7 @@ struct f_uac1 {
 	/* Interrupt IN endpoint of AC interface */
 	struct usb_ep	*int_ep;
 	atomic_t	int_count;
+	int ctl_id;
 };
 
 static inline struct f_uac1 *func_to_uac1(struct usb_function *f)
@@ -188,16 +190,18 @@ static struct uac1_as_header_descriptor as_in_header_desc = {
 	.wFormatTag =		cpu_to_le16(UAC_FORMAT_TYPE_I_PCM),
 };
 
-DECLARE_UAC_FORMAT_TYPE_I_DISCRETE_DESC(1);
+DECLARE_UAC_FORMAT_TYPE_I_DISCRETE_DESC(UAC_MAX_RATES);
+#define uac_format_type_i_discrete_descriptor \
+	uac_format_type_i_discrete_descriptor_##UAC_MAX_RATES
 
-static struct uac_format_type_i_discrete_descriptor_1 as_out_type_i_desc = {
-	.bLength =		UAC_FORMAT_TYPE_I_DISCRETE_DESC_SIZE(1),
+static struct uac_format_type_i_discrete_descriptor as_out_type_i_desc = {
+	.bLength =		0, /* filled on rate setup */
 	.bDescriptorType =	USB_DT_CS_INTERFACE,
 	.bDescriptorSubtype =	UAC_FORMAT_TYPE,
 	.bFormatType =		UAC_FORMAT_TYPE_I,
 	.bSubframeSize =	2,
 	.bBitResolution =	16,
-	.bSamFreqType =		1,
+	.bSamFreqType =		0, /* filled on rate setup */
 };
 
 /* Standard ISO OUT Endpoint Descriptor */
@@ -221,14 +225,14 @@ static struct uac_iso_endpoint_descriptor as_iso_out_desc = {
 	.wLockDelay =		cpu_to_le16(1),
 };
 
-static struct uac_format_type_i_discrete_descriptor_1 as_in_type_i_desc = {
-	.bLength =		UAC_FORMAT_TYPE_I_DISCRETE_DESC_SIZE(1),
+static struct uac_format_type_i_discrete_descriptor as_in_type_i_desc = {
+	.bLength =		0, /* filled on rate setup */
 	.bDescriptorType =	USB_DT_CS_INTERFACE,
 	.bDescriptorSubtype =	UAC_FORMAT_TYPE,
 	.bFormatType =		UAC_FORMAT_TYPE_I,
 	.bSubframeSize =	2,
 	.bBitResolution =	16,
-	.bSamFreqType =		1,
+	.bSamFreqType =		0, /* filled on rate setup */
 };
 
 /* Standard ISO OUT Endpoint Descriptor */
@@ -333,6 +337,31 @@ static struct usb_gadget_strings *uac1_strings[] = {
  * This function is an ALSA sound card following USB Audio Class Spec 1.0.
  */
 
+static void uac_cs_attr_sample_rate(struct usb_ep *ep, struct usb_request *req)
+{
+	struct usb_function *fn = ep->driver_data;
+	struct usb_composite_dev *cdev = fn->config->cdev;
+	struct g_audio *agdev = func_to_g_audio(fn);
+	struct f_uac1 *uac1 = func_to_uac1(fn);
+	struct f_uac1_opts *opts = g_audio_to_uac1_opts(agdev);
+	u8 *buf = (u8 *)req->buf;
+	u32 val = 0;
+
+	if (req->actual != 3) {
+		WARN(cdev, "Invalid data size for UAC_EP_CS_ATTR_SAMPLE_RATE.\n");
+		return;
+	}
+
+	val = buf[0] | (buf[1] << 8) | (buf[2] << 16);
+	if (uac1->ctl_id == (USB_DIR_IN | 2)) {
+		opts->p_srate = val;
+		u_audio_set_playback_srate(agdev, opts->p_srate);
+	} else if (uac1->ctl_id == (USB_DIR_OUT | 1)) {
+		opts->c_srate = val;
+		u_audio_set_capture_srate(agdev, opts->c_srate);
+	}
+}
+
 static void audio_notify_complete(struct usb_ep *_ep, struct usb_request *req)
 {
 	struct g_audio *audio = req->context;
@@ -707,18 +736,27 @@ static int audio_set_endpoint_req(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
 	struct usb_composite_dev *cdev = f->config->cdev;
+	struct usb_request	*req = f->config->cdev->req;
+	struct f_uac1		*uac1 = func_to_uac1(f);
 	int			value = -EOPNOTSUPP;
 	u16			ep = le16_to_cpu(ctrl->wIndex);
 	u16			len = le16_to_cpu(ctrl->wLength);
 	u16			w_value = le16_to_cpu(ctrl->wValue);
+	u8			cs = w_value >> 8;
 
 	DBG(cdev, "bRequest 0x%x, w_value 0x%04x, len %d, endpoint %d\n",
 			ctrl->bRequest, w_value, len, ep);
 
 	switch (ctrl->bRequest) {
-	case UAC_SET_CUR:
+	case UAC_SET_CUR: {
+		if (cs == UAC_EP_CS_ATTR_SAMPLE_RATE) {
+			cdev->gadget->ep0->driver_data = f;
+			uac1->ctl_id = ep;
+			req->complete = uac_cs_attr_sample_rate;
+		}
 		value = len;
 		break;
+	}
 
 	case UAC_SET_MIN:
 		break;
@@ -743,16 +781,34 @@ static int audio_get_endpoint_req(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
 	struct usb_composite_dev *cdev = f->config->cdev;
+	struct usb_request *req = f->config->cdev->req;
+	struct g_audio *agdev = func_to_g_audio(f);
+	struct f_uac1_opts *opts = g_audio_to_uac1_opts(agdev);
+	u8 *buf = (u8 *)req->buf;
 	int value = -EOPNOTSUPP;
-	u8 ep = ((le16_to_cpu(ctrl->wIndex) >> 8) & 0xFF);
+	u8 ep = le16_to_cpu(ctrl->wIndex);
 	u16 len = le16_to_cpu(ctrl->wLength);
 	u16 w_value = le16_to_cpu(ctrl->wValue);
+	u8 cs = w_value >> 8;
+	u32 val = 0;
 
 	DBG(cdev, "bRequest 0x%x, w_value 0x%04x, len %d, endpoint %d\n",
 			ctrl->bRequest, w_value, len, ep);
 
 	switch (ctrl->bRequest) {
-	case UAC_GET_CUR:
+	case UAC_GET_CUR: {
+		if (cs == UAC_EP_CS_ATTR_SAMPLE_RATE) {
+			if (ep == (USB_DIR_IN | 2))
+				val = opts->p_srate;
+			else if (ep == (USB_DIR_OUT | 1))
+				val = opts->c_srate;
+			buf[2] = (val >> 16) & 0xff;
+			buf[1] = (val >> 8) & 0xff;
+			buf[0] = val & 0xff;
+		}
+		value = len;
+		break;
+	}
 	case UAC_GET_MIN:
 	case UAC_GET_MAX:
 	case UAC_GET_RES:
@@ -1118,10 +1174,9 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	struct f_uac1_opts		*audio_opts;
 	struct usb_ep			*ep = NULL;
 	struct usb_string		*us;
-	u8				*sam_freq;
-	int				rate;
 	int				ba_iface_id;
 	int				status;
+	int				idx, i;
 
 	status = f_audio_validate_opts(audio, dev);
 	if (status)
@@ -1213,12 +1268,23 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 
 	/* Set sample rates */
-	rate = audio_opts->c_srate;
-	sam_freq = as_out_type_i_desc.tSamFreq[0];
-	memcpy(sam_freq, &rate, 3);
-	rate = audio_opts->p_srate;
-	sam_freq = as_in_type_i_desc.tSamFreq[0];
-	memcpy(sam_freq, &rate, 3);
+	for (i = 0, idx = 0; i < UAC_MAX_RATES; i++) {
+		if (audio_opts->c_srates[i] == 0)
+			break;
+		memcpy(as_out_type_i_desc.tSamFreq[idx++],
+				&audio_opts->c_srates[i], 3);
+	}
+	as_out_type_i_desc.bLength = UAC_FORMAT_TYPE_I_DISCRETE_DESC_SIZE(idx);
+	as_out_type_i_desc.bSamFreqType = idx;
+
+	for (i = 0, idx = 0; i < UAC_MAX_RATES; i++) {
+		if (audio_opts->p_srates[i] == 0)
+			break;
+		memcpy(as_in_type_i_desc.tSamFreq[idx++],
+				&audio_opts->p_srates[i], 3);
+	}
+	as_in_type_i_desc.bLength = UAC_FORMAT_TYPE_I_DISCRETE_DESC_SIZE(idx);
+	as_in_type_i_desc.bSamFreqType = idx;
 
 	/* allocate instance-specific interface IDs, and patch descriptors */
 	status = usb_interface_id(c, f);
@@ -1298,7 +1364,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
 	audio->params.c_srate = audio_opts->c_srate;
-	audio->params.c_srates[0] = audio_opts->c_srate;
+	memcpy(audio->params.c_srates, audio_opts->c_srates,
+			sizeof(audio->params.c_srates));
 	audio->params.c_ssize = audio_opts->c_ssize;
 	if (FUIN_EN(audio_opts)) {
 		audio->params.p_fu.id = USB_IN_FU_ID;
@@ -1311,7 +1378,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
 	audio->params.p_srate = audio_opts->p_srate;
-	audio->params.p_srates[0] = audio_opts->p_srate;
+	memcpy(audio->params.p_srates, audio_opts->p_srates,
+			sizeof(audio->params.p_srates));
 	audio->params.p_ssize = audio_opts->p_ssize;
 	if (FUOUT_EN(audio_opts)) {
 		audio->params.c_fu.id = USB_OUT_FU_ID;
@@ -1417,10 +1485,10 @@ end:									\
 CONFIGFS_ATTR(f_uac1_opts_, name)
 
 UAC1_ATTRIBUTE(u32, c_chmask);
-UAC1_ATTRIBUTE(u32, c_srate);
+UAC_RATE1_ATTRIBUTE(c_srate);
 UAC1_ATTRIBUTE(u32, c_ssize);
 UAC1_ATTRIBUTE(u32, p_chmask);
-UAC1_ATTRIBUTE(u32, p_srate);
+UAC_RATE1_ATTRIBUTE(p_srate);
 UAC1_ATTRIBUTE(u32, p_ssize);
 UAC1_ATTRIBUTE(u32, req_number);
 
@@ -1490,9 +1558,11 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
 
 	opts->c_chmask = UAC1_DEF_CCHMASK;
 	opts->c_srate = UAC1_DEF_CSRATE;
+	opts->c_srates[0] = UAC1_DEF_CSRATE;
 	opts->c_ssize = UAC1_DEF_CSSIZE;
 	opts->p_chmask = UAC1_DEF_PCHMASK;
 	opts->p_srate = UAC1_DEF_PSRATE;
+	opts->p_srates[0] = UAC1_DEF_PSRATE;
 	opts->p_ssize = UAC1_DEF_PSSIZE;
 
 	opts->p_mute_present = UAC1_DEF_MUTE_PRESENT;
diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
index 589fae861141..57dce469b46d 100644
--- a/drivers/usb/gadget/function/u_uac1.h
+++ b/drivers/usb/gadget/function/u_uac1.h
@@ -9,6 +9,7 @@
 #define __U_UAC1_H
 
 #include <linux/usb/composite.h>
+#include "uac_common.h"
 
 #define UAC1_OUT_EP_MAX_PACKET_SIZE	200
 #define UAC1_DEF_CCHMASK	0x3
@@ -30,9 +31,11 @@
 struct f_uac1_opts {
 	struct usb_function_instance	func_inst;
 	int				c_chmask;
+	int				c_srates[UAC_MAX_RATES];
 	int				c_srate;
 	int				c_ssize;
 	int				p_chmask;
+	int				p_srates[UAC_MAX_RATES];
 	int				p_srate;
 	int				p_ssize;
 
@@ -54,5 +57,63 @@ struct f_uac1_opts {
 	struct mutex			lock;
 	int				refcnt;
 };
-
+#define UAC_RATE1_ATTRIBUTE(name)					\
+static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
+					 char *page)			\
+{									\
+	struct f_uac1_opts *opts = to_f_uac1_opts(item);			\
+	int result = 0;							\
+	int i;								\
+									\
+	mutex_lock(&opts->lock);					\
+	page[0] = '\0';							\
+	for (i = 0; i < UAC_MAX_RATES; i++) {				\
+		if (opts->name##s[i] == 0)					\
+			break;					\
+		result += sprintf(page + strlen(page), "%u,",		\
+				opts->name##s[i]);				\
+	}								\
+	if (strlen(page) > 0)						\
+		page[strlen(page) - 1] = '\n';				\
+	mutex_unlock(&opts->lock);					\
+									\
+	return result;							\
+}									\
+									\
+static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
+					  const char *page, size_t len)	\
+{									\
+	struct f_uac1_opts *opts = to_f_uac1_opts(item);			\
+	char *split_page = NULL;					\
+	int ret = -EINVAL;						\
+	char *token;							\
+	u32 num;							\
+	int i;								\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt) {						\
+		ret = -EBUSY;						\
+		goto end;						\
+	}								\
+									\
+	i = 0;								\
+	memset(opts->name##s, 0x00, sizeof(opts->name##s));			\
+	split_page = kstrdup(page, GFP_KERNEL);				\
+	while ((token = strsep(&split_page, ",")) != NULL) {		\
+		ret = kstrtou32(token, 0, &num);			\
+		if (ret)						\
+			goto end;					\
+									\
+		opts->name##s[i++] = num;					\
+		opts->name = num;				\
+		ret = len;						\
+	};								\
+									\
+end:									\
+	kfree(split_page);						\
+	mutex_unlock(&opts->lock);					\
+	return ret;							\
+}									\
+									\
+CONFIGFS_ATTR(f_uac1_opts_, name)
 #endif /* __U_UAC1_H */
diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index 58bcb26c7854..9a0071cdecb6 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -61,9 +61,10 @@ module_param(p_chmask, uint, S_IRUGO);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
-static int p_srate = UAC1_DEF_PSRATE;
-module_param(p_srate, uint, S_IRUGO);
-MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
+static int p_srates[UAC_MAX_RATES] = {UAC1_DEF_PSRATE};
+static int p_srates_cnt = 1;
+module_param_array_named(p_srate, p_srates, uint, &p_srates_cnt, S_IRUGO);
+MODULE_PARM_DESC(p_srate, "Playback Sampling Rates (array)");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC1_DEF_PSSIZE;
@@ -76,9 +77,10 @@ module_param(c_chmask, uint, S_IRUGO);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 48 KHz */
-static int c_srate = UAC1_DEF_CSRATE;
-module_param(c_srate, uint, S_IRUGO);
-MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
+static int c_srates[UAC_MAX_RATES] = {UAC1_DEF_CSRATE};
+static int c_srates_cnt = 1;
+module_param_array_named(c_srate, c_srates, uint, &c_srates_cnt, S_IRUGO);
+MODULE_PARM_DESC(c_srate, "Capture Sampling Rates (array)");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC1_DEF_CSSIZE;
@@ -283,10 +285,18 @@ static int audio_bind(struct usb_composite_dev *cdev)
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 	uac1_opts = container_of(fi_uac1, struct f_uac1_opts, func_inst);
 	uac1_opts->p_chmask = p_chmask;
-	uac1_opts->p_srate = p_srate;
+
+	for (i = 0; i < p_srates_cnt; ++i)
+		uac1_opts->p_srates[i] = p_srates[i];
+	uac1_opts->p_srate = p_srates[0];
+
 	uac1_opts->p_ssize = p_ssize;
 	uac1_opts->c_chmask = c_chmask;
-	uac1_opts->c_srate = c_srate;
+
+	for (i = 0; i < c_srates_cnt; ++i)
+		uac1_opts->c_srates[i] = c_srates[i];
+	uac1_opts->c_srate = c_srates[0];
+
 	uac1_opts->c_ssize = c_ssize;
 	uac1_opts->req_number = UAC1_DEF_REQ_NUM;
 #else /* CONFIG_GADGET_UAC1_LEGACY */
-- 
2.25.1

