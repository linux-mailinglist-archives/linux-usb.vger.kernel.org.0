Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D047A5FD
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhLTIZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:25:53 -0500
Received: from cable.insite.cz ([84.242.75.189]:39351 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229632AbhLTIZw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 03:25:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8533EA1A3D402;
        Mon, 20 Dec 2021 09:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988750; bh=Xne0b8n0z/LWfnow/J1Xm6QDToOHuC/GquzUfE+nK6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=onZZiXE07S71d7ie8ElhrD9KVL+wR4/xXxAnNhZlT5BmeyyPS1kqE1+m5I+3L9NwL
         sh4asGTJtnxputQ+uRvigH7IDkB75N2dp8XOCMIgFcDX5KZQFqxDl7EQd21z1Xco5o
         K95ZAUKGJgqhpZyWu3JxGPNkXnUeisrGYiKffqjc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L4ypqtJedGoj; Mon, 20 Dec 2021 09:25:44 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 78203A1A3D403;
        Mon, 20 Dec 2021 09:25:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988744; bh=Xne0b8n0z/LWfnow/J1Xm6QDToOHuC/GquzUfE+nK6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AcGtNdC/bsghbjcD2r1XLUQ99hzJWLkKEvYVlcdWXVVN3JrWSUwwExwLPNsPNf/JA
         uDDUd2HzZlyuHXIP9A6Scx3o4wIfADUAx1A+QiPy8wYjyY0+91VjAkHp7A+V1mg+vM
         eYizvuM8UcBgSAPgAcZ7/fncZSPUEWm4EY1Zk164=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/11] usb: gadget: f_uac2: Support multiple sampling rates
Date:   Mon, 20 Dec 2021 09:25:34 +0100
Message-Id: <20211220082542.13750-4-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220082542.13750-1-pavel.hofman@ivitera.com>
References: <20211220082542.13750-1-pavel.hofman@ivitera.com>
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
when built for f_uac2.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
 Documentation/usb/gadget-testing.rst          |   4 +-
 drivers/usb/gadget/function/f_uac2.c          | 118 ++++++++++++++----
 drivers/usb/gadget/function/u_uac2.h          |  62 +++++++++
 drivers/usb/gadget/legacy/audio.c             |  28 +++--
 5 files changed, 177 insertions(+), 39 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 244d96650123..b20b0471d48a 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -6,7 +6,7 @@ Description:
 
 		=====================	=======================================
 		c_chmask		capture channel mask
-		c_srate			capture sampling rate
+		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
 		c_sync			capture synchronization type
 					(async/adaptive)
@@ -20,7 +20,7 @@ Description:
 					(in 1/256 dB)
 		fb_max			maximum extra bandwidth in async mode
 		p_chmask		playback channel mask
-		p_srate			playback sampling rate
+		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
 		p_mute_present		playback mute control enable
 		p_volume_present	playback volume control enable
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index c18113077889..928f60a31544 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -726,7 +726,7 @@ The uac2 function provides these attributes in its function directory:
 
 	================ ====================================================
 	c_chmask         capture channel mask
-	c_srate          capture sampling rate
+	c_srate          list of capture sampling rates (comma-separated)
 	c_ssize          capture sample size (bytes)
 	c_sync           capture synchronization type (async/adaptive)
 	c_mute_present   capture mute control enable
@@ -736,7 +736,7 @@ The uac2 function provides these attributes in its function directory:
 	c_volume_res     capture volume control resolution (in 1/256 dB)
 	fb_max           maximum extra bandwidth in async mode
 	p_chmask         playback channel mask
-	p_srate          playback sampling rate
+	p_srate          list of playback sampling rates (comma-separated)
 	p_ssize          playback sample size (bytes)
 	p_mute_present   playback mute control enable
 	p_volume_present playback volume control enable
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 1d6e426e5078..74e32bb146c7 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -70,6 +70,7 @@ struct f_uac2 {
 	/* Interrupt IN endpoint of AC interface */
 	struct usb_ep	*int_ep;
 	atomic_t	int_count;
+	int ctl_id;
 };
 
 static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
@@ -166,7 +167,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
 	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
 	/* .bClockID = DYNAMIC */
 	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
-	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
+	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
 	.bAssocTerminal = 0,
 };
 
@@ -178,7 +179,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
 	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
 	/* .bClockID = DYNAMIC */
 	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
-	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
+	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
 	.bAssocTerminal = 0,
 };
 
@@ -635,12 +636,32 @@ struct cntrl_cur_lay3 {
 };
 
 struct cntrl_range_lay3 {
-	__le16	wNumSubRanges;
 	__le32	dMIN;
 	__le32	dMAX;
 	__le32	dRES;
 } __packed;
 
+#define ranges_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges \
+		* sizeof(struct cntrl_ranges_lay3))
+
+struct cntrl_ranges_lay3 {
+	__u16	wNumSubRanges;
+	struct cntrl_range_lay3 r[UAC_MAX_RATES];
+} __packed;
+
+static int get_max_srate(const int *srates)
+{
+	int i, max_srate = 0;
+
+	for (i = 0; i < UAC_MAX_RATES; i++) {
+		if (srates[i] == 0)
+			break;
+		if (srates[i] > max_srate)
+			max_srate = srates[i];
+	}
+	return max_srate;
+}
+
 static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 	struct usb_endpoint_descriptor *ep_desc,
 	enum usb_device_speed speed, bool is_playback)
@@ -667,11 +688,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 
 	if (is_playback) {
 		chmask = uac2_opts->p_chmask;
-		srate = uac2_opts->p_srate;
+		srate = get_max_srate(uac2_opts->p_srates);
 		ssize = uac2_opts->p_ssize;
 	} else {
 		chmask = uac2_opts->c_chmask;
-		srate = uac2_opts->c_srate;
+		srate = get_max_srate(uac2_opts->c_srates);
 		ssize = uac2_opts->c_ssize;
 	}
 
@@ -912,10 +933,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
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
@@ -1210,7 +1231,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
 	agdev->params.p_srate = uac2_opts->p_srate;
-	agdev->params.p_srates[0] = uac2_opts->p_srate;
+	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
+			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
 	if (FUIN_EN(uac2_opts)) {
 		agdev->params.p_fu.id = USB_IN_FU_ID;
@@ -1222,7 +1244,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
 	agdev->params.c_srate = uac2_opts->c_srate;
-	agdev->params.c_srates[0] = uac2_opts->c_srate;
+	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
+			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	if (FUOUT_EN(uac2_opts)) {
 		agdev->params.c_fu.id = USB_OUT_FU_ID;
@@ -1502,28 +1525,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	u8 entity_id = (w_index >> 8) & 0xff;
 	u8 control_selector = w_value >> 8;
 	int value = -EOPNOTSUPP;
-	int p_srate, c_srate;
-
-	p_srate = opts->p_srate;
-	c_srate = opts->c_srate;
 
 	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
 		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
-			struct cntrl_range_lay3 r;
+			struct cntrl_ranges_lay3 rs;
+			int i;
+			int wNumSubRanges = 0;
+			int srate;
+			int *srates;
 
 			if (entity_id == USB_IN_CLK_ID)
-				r.dMIN = cpu_to_le32(p_srate);
+				srates = opts->p_srates;
 			else if (entity_id == USB_OUT_CLK_ID)
-				r.dMIN = cpu_to_le32(c_srate);
+				srates = opts->c_srates;
 			else
 				return -EOPNOTSUPP;
-
-			r.dMAX = r.dMIN;
-			r.dRES = 0;
-			r.wNumSubRanges = cpu_to_le16(1);
-
-			value = min_t(unsigned int, w_length, sizeof(r));
-			memcpy(req->buf, &r, value);
+			for (i = 0; i < UAC_MAX_RATES; i++) {
+				srate = srates[i];
+				if (srate == 0)
+					break;
+
+				rs.r[wNumSubRanges].dMIN = cpu_to_le32(srate);
+				rs.r[wNumSubRanges].dMAX = cpu_to_le32(srate);
+				rs.r[wNumSubRanges].dRES = 0;
+				wNumSubRanges++;
+				dev_dbg(&agdev->gadget->dev,
+					"%s(): clk %d: rate ID %d: %d\n",
+					__func__, entity_id, wNumSubRanges, srate);
+			}
+			rs.wNumSubRanges = cpu_to_le16(wNumSubRanges);
+			value = min_t(unsigned int, w_length, ranges_size(rs));
+			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
+				__func__, rs.wNumSubRanges, value);
+			memcpy(req->buf, &rs, value);
 		} else {
 			dev_err(&agdev->gadget->dev,
 				"%s:%d control_selector=%d TODO!\n",
@@ -1582,6 +1616,28 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 		return -EOPNOTSUPP;
 }
 
+static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
+{
+	struct usb_function *fn = ep->driver_data;
+	struct g_audio *agdev = func_to_g_audio(fn);
+	struct f_uac2 *uac2 = func_to_uac2(fn);
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
+	u32 val;
+
+	if (req->actual != 4)
+		return;
+
+	val = le32_to_cpu(*((u32 *)req->buf));
+	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
+	if (uac2->ctl_id == USB_IN_CLK_ID) {
+		opts->p_srate = val;
+		u_audio_set_playback_srate(agdev, opts->p_srate);
+	} else if (uac2->ctl_id == USB_OUT_CLK_ID) {
+		opts->c_srate = val;
+		u_audio_set_capture_srate(agdev, opts->c_srate);
+	}
+}
+
 static void
 out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
 {
@@ -1633,6 +1689,7 @@ out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
 static int
 out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
+	struct usb_composite_dev *cdev = fn->config->cdev;
 	struct usb_request *req = fn->config->cdev->req;
 	struct g_audio *agdev = func_to_g_audio(fn);
 	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
@@ -1642,10 +1699,17 @@ out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	u16 w_value = le16_to_cpu(cr->wValue);
 	u8 entity_id = (w_index >> 8) & 0xff;
 	u8 control_selector = w_value >> 8;
+	u8 clock_id = w_index >> 8;
 
 	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
-		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ)
+		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
+			dev_dbg(&agdev->gadget->dev,
+				"control_selector UAC2_CS_CONTROL_SAM_FREQ, clock: %d\n", clock_id);
+			cdev->gadget->ep0->driver_data = fn;
+			uac2->ctl_id = clock_id;
+			req->complete = uac2_cs_control_sam_freq;
 			return w_length;
+		}
 	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
 			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
 		memcpy(&uac2->setup_cr, cr, sizeof(*cr));
@@ -1839,10 +1903,10 @@ end:									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
 UAC2_ATTRIBUTE(u32, p_chmask);
-UAC2_ATTRIBUTE(u32, p_srate);
+UAC_RATE2_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(u32, p_ssize);
 UAC2_ATTRIBUTE(u32, c_chmask);
-UAC2_ATTRIBUTE(u32, c_srate);
+UAC_RATE2_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(u32, c_ssize);
 UAC2_ATTRIBUTE(u32, req_number);
@@ -1915,9 +1979,11 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 				    &f_uac2_func_type);
 
 	opts->p_chmask = UAC2_DEF_PCHMASK;
+	opts->p_srates[0] = UAC2_DEF_PSRATE;
 	opts->p_srate = UAC2_DEF_PSRATE;
 	opts->p_ssize = UAC2_DEF_PSSIZE;
 	opts->c_chmask = UAC2_DEF_CCHMASK;
+	opts->c_srates[0] = UAC2_DEF_CSRATE;
 	opts->c_srate = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index e0c8e3513bfd..8058217322f8 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -14,6 +14,7 @@
 #define U_UAC2_H
 
 #include <linux/usb/composite.h>
+#include "uac_common.h"
 
 #define UAC2_DEF_PCHMASK 0x3
 #define UAC2_DEF_PSRATE 48000
@@ -35,9 +36,11 @@
 struct f_uac2_opts {
 	struct usb_function_instance	func_inst;
 	int				p_chmask;
+	int				p_srates[UAC_MAX_RATES];
 	int				p_srate;
 	int				p_ssize;
 	int				c_chmask;
+	int				c_srates[UAC_MAX_RATES];
 	int				c_srate;
 	int				c_ssize;
 	int				c_sync;
@@ -62,4 +65,63 @@ struct f_uac2_opts {
 	int				refcnt;
 };
 
+#define UAC_RATE2_ATTRIBUTE(name)					\
+static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
+					 char *page)			\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);			\
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
+static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
+					  const char *page, size_t len)	\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);			\
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
+CONFIGFS_ATTR(f_uac2_opts_, name)
 #endif
diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index a748ed0842e8..58bcb26c7854 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -26,9 +26,10 @@ module_param(p_chmask, uint, S_IRUGO);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
-static int p_srate = UAC2_DEF_PSRATE;
-module_param(p_srate, uint, S_IRUGO);
-MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
+static int p_srates[UAC_MAX_RATES] = {UAC2_DEF_PSRATE};
+static int p_srates_cnt = 1;
+module_param_array_named(p_srate, p_srates, uint, &p_srates_cnt, S_IRUGO);
+MODULE_PARM_DESC(p_srate, "Playback Sampling Rates (array)");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC2_DEF_PSSIZE;
@@ -41,9 +42,10 @@ module_param(c_chmask, uint, S_IRUGO);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 64 KHz */
-static int c_srate = UAC2_DEF_CSRATE;
-module_param(c_srate, uint, S_IRUGO);
-MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
+static int c_srates[UAC_MAX_RATES] = {UAC2_DEF_CSRATE};
+static int c_srates_cnt = 1;
+module_param_array_named(c_srate, c_srates, uint, &c_srates_cnt, S_IRUGO);
+MODULE_PARM_DESC(c_srate, "Capture Sampling Rates (array)");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC2_DEF_CSSIZE;
@@ -244,7 +246,7 @@ static int audio_bind(struct usb_composite_dev *cdev)
 	struct f_uac1_legacy_opts	*uac1_opts;
 #endif
 #endif
-	int			status;
+	int status, i;
 
 #ifndef CONFIG_GADGET_UAC1
 	fi_uac2 = usb_get_function_instance("uac2");
@@ -263,10 +265,18 @@ static int audio_bind(struct usb_composite_dev *cdev)
 #ifndef CONFIG_GADGET_UAC1
 	uac2_opts = container_of(fi_uac2, struct f_uac2_opts, func_inst);
 	uac2_opts->p_chmask = p_chmask;
-	uac2_opts->p_srate = p_srate;
+
+	for (i = 0; i < p_srates_cnt; ++i)
+		uac2_opts->p_srates[i] = p_srates[i];
+	uac2_opts->p_srate = p_srates[0];
+
 	uac2_opts->p_ssize = p_ssize;
 	uac2_opts->c_chmask = c_chmask;
-	uac2_opts->c_srate = c_srate;
+
+	for (i = 0; i < c_srates_cnt; ++i)
+		uac2_opts->c_srates[i] = c_srates[i];
+	uac2_opts->c_srate = c_srates[0];
+
 	uac2_opts->c_ssize = c_ssize;
 	uac2_opts->req_number = UAC2_DEF_REQ_NUM;
 #else
-- 
2.25.1

