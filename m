Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6343C489260
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240880AbiAJHmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:42:12 -0500
Received: from cable.insite.cz ([84.242.75.189]:59071 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241871AbiAJHjz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:39:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 66213A1A3D406;
        Mon, 10 Jan 2022 08:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800277; bh=0PGpGYVkbndwWBKCXHi1SHi9qS9QQS7y5owdEHwuWU8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mMF2hyeqddc5ZbwYckZzs9sdB7CkIt87aoUO9fhCYPCXbzDyr3srg57h2mW2OxGQU
         659vuqgR7yWe6nfzDrGr3juZwVHvjyis6KRxdtroHh6VSXKsAOc9zmpv7p4nGjJBrB
         9Uw5WJUwAriODGG6UGYb88fUhBW1B+NYkyfoXLnQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a1Wvdgr5m1Bt; Mon, 10 Jan 2022 08:37:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id BB191A1A3D407;
        Mon, 10 Jan 2022 08:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800266; bh=0PGpGYVkbndwWBKCXHi1SHi9qS9QQS7y5owdEHwuWU8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mL33DncPQtGH6mUbrdU5spjXI1aAe/3h3hfnGQG3PKPzM14ODRJ7eyWv2sFkuDTid
         AvsQ/JKOf8wl+9Bh6uWeLbi9fa9F4nyqWt/DAweYwUAtzlwCLTB5ciZ4CHcR3W84CS
         6Fc0Oa9zZfUf+QGyrkKbNOhoIwfTRHmKYqUyMKcw=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 06/10] usb: gadget: f_uac1: Support multiple sampling rates
Date:   Mon, 10 Jan 2022 08:37:38 +0100
Message-Id: <20220110073742.394237-7-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
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
v3:
* audio.c: fixed unused variables for CONFIG_UAC1 variants
* audio: used 0444 instead of S_IRUGO
* f_uac1: moved current state srates from struct f_uac1_opts to f_uac1
* f_uac1: renamed UAC_RATE1_ATTRIBUTE -> UAC1_RATE_ATTRIBUTE, moved from
  u_uac1.h to f_uac1.c
* updated commit message
---
 .../ABI/testing/configfs-usb-gadget-uac1      |   4 +-
 Documentation/usb/gadget-testing.rst          |   4 +-
 drivers/usb/gadget/function/f_uac1.c          | 181 +++++++++++++++---
 drivers/usb/gadget/function/u_uac1.h          |   5 +-
 drivers/usb/gadget/legacy/audio.c             |  25 ++-
 5 files changed, 179 insertions(+), 40 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1 b/Documentation/ABI/testing/configfs-usb-gadget-uac1
index d4b8cf40a9e4..09725e273e9b 100644
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
index 419f6e5e890a..046842b00c89 100644
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
index 0397b27df42e..73df76a6fbe0 100644
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
@@ -42,6 +43,9 @@ struct f_uac1 {
 	/* Interrupt IN endpoint of AC interface */
 	struct usb_ep	*int_ep;
 	atomic_t	int_count;
+	int ctl_id;		/* EP id */
+	int c_srate;	/* current capture srate */
+	int p_srate;	/* current playback prate */
 };
 
 static inline struct f_uac1 *func_to_uac1(struct usb_function *f)
@@ -188,16 +192,18 @@ static struct uac1_as_header_descriptor as_in_header_desc = {
 	.wFormatTag =		cpu_to_le16(UAC_FORMAT_TYPE_I_PCM),
 };
 
-DECLARE_UAC_FORMAT_TYPE_I_DISCRETE_DESC(1);
+DECLARE_UAC_FORMAT_TYPE_I_DISCRETE_DESC(UAC_MAX_RATES);
+#define uac_format_type_i_discrete_descriptor			\
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
@@ -221,14 +227,14 @@ static struct uac_iso_endpoint_descriptor as_iso_out_desc = {
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
@@ -333,6 +339,30 @@ static struct usb_gadget_strings *uac1_strings[] = {
  * This function is an ALSA sound card following USB Audio Class Spec 1.0.
  */
 
+static void uac_cs_attr_sample_rate(struct usb_ep *ep, struct usb_request *req)
+{
+	struct usb_function *fn = ep->driver_data;
+	struct usb_composite_dev *cdev = fn->config->cdev;
+	struct g_audio *agdev = func_to_g_audio(fn);
+	struct f_uac1 *uac1 = func_to_uac1(fn);
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
+		uac1->p_srate = val;
+		u_audio_set_playback_srate(agdev, uac1->p_srate);
+	} else if (uac1->ctl_id == (USB_DIR_OUT | 1)) {
+		uac1->c_srate = val;
+		u_audio_set_capture_srate(agdev, uac1->c_srate);
+	}
+}
+
 static void audio_notify_complete(struct usb_ep *_ep, struct usb_request *req)
 {
 	struct g_audio *audio = req->context;
@@ -707,18 +737,27 @@ static int audio_set_endpoint_req(struct usb_function *f,
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
@@ -743,16 +782,33 @@ static int audio_get_endpoint_req(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
 	struct usb_composite_dev *cdev = f->config->cdev;
+	struct usb_request *req = f->config->cdev->req;
+	struct f_uac1 *uac1 = func_to_uac1(f);
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
+				val = uac1->p_srate;
+			else if (ep == (USB_DIR_OUT | 1))
+				val = uac1->c_srate;
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
@@ -1074,10 +1130,10 @@ static int f_audio_validate_opts(struct g_audio *audio, struct device *dev)
 	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
 		dev_err(dev, "Error: incorrect capture sample size\n");
 		return -EINVAL;
-	} else if (!opts->p_srate) {
+	} else if (!opts->p_srates[0]) {
 		dev_err(dev, "Error: incorrect playback sampling rate\n");
 		return -EINVAL;
-	} else if (!opts->c_srate) {
+	} else if (!opts->c_srates[0]) {
 		dev_err(dev, "Error: incorrect capture sampling rate\n");
 		return -EINVAL;
 	}
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
@@ -1213,12 +1268,25 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
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
+	uac1->p_srate = audio_opts->p_srates[0];
+	uac1->c_srate = audio_opts->c_srates[0];
 
 	/* allocate instance-specific interface IDs, and patch descriptors */
 	status = usb_interface_id(c, f);
@@ -1297,7 +1365,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep_maxpsize = le16_to_cpu(as_out_ep_desc.wMaxPacketSize);
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
-	audio->params.c_srates[0] = audio_opts->c_srate;
+	memcpy(audio->params.c_srates, audio_opts->c_srates,
+			sizeof(audio->params.c_srates));
 	audio->params.c_ssize = audio_opts->c_ssize;
 	if (FUIN_EN(audio_opts)) {
 		audio->params.p_fu.id = USB_IN_FU_ID;
@@ -1309,7 +1378,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.p_fu.volume_res = audio_opts->p_volume_res;
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
-	audio->params.p_srates[0] = audio_opts->p_srate;
+	memcpy(audio->params.p_srates, audio_opts->p_srates,
+			sizeof(audio->params.p_srates));
 	audio->params.p_ssize = audio_opts->p_ssize;
 	if (FUOUT_EN(audio_opts)) {
 		audio->params.c_fu.id = USB_OUT_FU_ID;
@@ -1414,11 +1484,70 @@ end:									\
 									\
 CONFIGFS_ATTR(f_uac1_opts_, name)
 
+#define UAC1_RATE_ATTRIBUTE(name)					\
+static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
+					 char *page)			\
+{									\
+	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
+	int result = 0;							\
+	int i;								\
+									\
+	mutex_lock(&opts->lock);					\
+	page[0] = '\0';							\
+	for (i = 0; i < UAC_MAX_RATES; i++) {				\
+		if (opts->name##s[i] == 0)				\
+			break;						\
+		result += sprintf(page + strlen(page), "%u,",		\
+				opts->name##s[i]);			\
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
+	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
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
+	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
+	split_page = kstrdup(page, GFP_KERNEL);				\
+	while ((token = strsep(&split_page, ",")) != NULL) {		\
+		ret = kstrtou32(token, 0, &num);			\
+		if (ret)						\
+			goto end;					\
+									\
+		opts->name##s[i++] = num;				\
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
+
 UAC1_ATTRIBUTE(u32, c_chmask);
-UAC1_ATTRIBUTE(u32, c_srate);
+UAC1_RATE_ATTRIBUTE(c_srate);
 UAC1_ATTRIBUTE(u32, c_ssize);
 UAC1_ATTRIBUTE(u32, p_chmask);
-UAC1_ATTRIBUTE(u32, p_srate);
+UAC1_RATE_ATTRIBUTE(p_srate);
 UAC1_ATTRIBUTE(u32, p_ssize);
 UAC1_ATTRIBUTE(u32, req_number);
 
@@ -1487,10 +1616,10 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
 				    &f_uac1_func_type);
 
 	opts->c_chmask = UAC1_DEF_CCHMASK;
-	opts->c_srate = UAC1_DEF_CSRATE;
+	opts->c_srates[0] = UAC1_DEF_CSRATE;
 	opts->c_ssize = UAC1_DEF_CSSIZE;
 	opts->p_chmask = UAC1_DEF_PCHMASK;
-	opts->p_srate = UAC1_DEF_PSRATE;
+	opts->p_srates[0] = UAC1_DEF_PSRATE;
 	opts->p_ssize = UAC1_DEF_PSSIZE;
 
 	opts->p_mute_present = UAC1_DEF_MUTE_PRESENT;
diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
index 589fae861141..b6cd6171d306 100644
--- a/drivers/usb/gadget/function/u_uac1.h
+++ b/drivers/usb/gadget/function/u_uac1.h
@@ -9,6 +9,7 @@
 #define __U_UAC1_H
 
 #include <linux/usb/composite.h>
+#include "uac_common.h"
 
 #define UAC1_OUT_EP_MAX_PACKET_SIZE	200
 #define UAC1_DEF_CCHMASK	0x3
@@ -30,10 +31,10 @@
 struct f_uac1_opts {
 	struct usb_function_instance	func_inst;
 	int				c_chmask;
-	int				c_srate;
+	int				c_srates[UAC_MAX_RATES];
 	int				c_ssize;
 	int				p_chmask;
-	int				p_srate;
+	int				p_srates[UAC_MAX_RATES];
 	int				p_ssize;
 
 	bool			p_mute_present;
diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index d14b9f2d4c07..c89c777a1aa3 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -61,9 +61,10 @@ module_param(p_chmask, uint, 0444);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
-static int p_srate = UAC1_DEF_PSRATE;
-module_param(p_srate, uint, 0444);
-MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
+static int p_srates[UAC_MAX_RATES] = {UAC1_DEF_PSRATE};
+static int p_srates_cnt = 1;
+module_param_array_named(p_srate, p_srates, uint, &p_srates_cnt, 0444);
+MODULE_PARM_DESC(p_srate, "Playback Sampling Rates (array)");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC1_DEF_PSSIZE;
@@ -76,9 +77,10 @@ module_param(c_chmask, uint, 0444);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 48 KHz */
-static int c_srate = UAC1_DEF_CSRATE;
-module_param(c_srate, uint, 0444);
-MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
+static int c_srates[UAC_MAX_RATES] = {UAC1_DEF_CSRATE};
+static int c_srates_cnt = 1;
+module_param_array_named(c_srate, c_srates, uint, &c_srates_cnt, 0444);
+MODULE_PARM_DESC(c_srate, "Capture Sampling Rates (array)");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC1_DEF_CSSIZE;
@@ -243,6 +245,7 @@ static int audio_bind(struct usb_composite_dev *cdev)
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 	struct f_uac1_opts	*uac1_opts;
+	int i;
 #else
 	struct f_uac1_legacy_opts	*uac1_opts;
 #endif
@@ -282,10 +285,16 @@ static int audio_bind(struct usb_composite_dev *cdev)
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 	uac1_opts = container_of(fi_uac1, struct f_uac1_opts, func_inst);
 	uac1_opts->p_chmask = p_chmask;
-	uac1_opts->p_srate = p_srate;
+
+	for (i = 0; i < p_srates_cnt; ++i)
+		uac1_opts->p_srates[i] = p_srates[i];
+
 	uac1_opts->p_ssize = p_ssize;
 	uac1_opts->c_chmask = c_chmask;
-	uac1_opts->c_srate = c_srate;
+
+	for (i = 0; i < c_srates_cnt; ++i)
+		uac1_opts->c_srates[i] = c_srates[i];
+
 	uac1_opts->c_ssize = c_ssize;
 	uac1_opts->req_number = UAC1_DEF_REQ_NUM;
 #else /* CONFIG_GADGET_UAC1_LEGACY */
-- 
2.25.1

