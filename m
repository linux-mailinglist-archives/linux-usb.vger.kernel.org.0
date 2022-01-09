Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F049F48892A
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbiAIMAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:06 -0500
Received: from cable.insite.cz ([84.242.75.189]:37535 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235385AbiAIMAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 2621EA1A3D40A;
        Sun,  9 Jan 2022 13:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729601; bh=0gu29ZHAXZ7cXAX1X+n83OUONm5tdr6osIbSYK+lxKA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JAo2MgDZpHt/8tXbruSBTQxCUwAQPxKzMbRnkQcHaoP5f6us1Ubf3IUlFESBU1CiF
         CitEwRrcyt83VMM7D12cVCul6LeovYVVQh8iFDK7D7UYxNA5zWFPcgy74JUhVFvfvi
         oFcf/e0sXZjCTiSAz+KicilSP0/bemUvGIxZBuDc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kWhdbRIk11nm; Sun,  9 Jan 2022 12:59:53 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 6D591A1A3D406;
        Sun,  9 Jan 2022 12:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729590; bh=0gu29ZHAXZ7cXAX1X+n83OUONm5tdr6osIbSYK+lxKA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aN7XGnd/zI06mrw+zkWHrqo8mFoFmLek8kr0mso+CxZgcpw1wzHJeD/AOARBqhzrd
         GXCe2xzsGNUlWm31U8TC08j+tRj8QWtfQ6mKVTsDy9XJ17SIBU0aN6xqGwgCb3cduC
         c/0p61X+zh8yuRgLZQU+aJcJnyEh/OJSjfkREB8Q=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 05/11] usb: gadget: f_uac2: Support multiple sampling rates
Date:   Sun,  9 Jan 2022 12:59:40 +0100
Message-Id: <20220109115946.392818-6-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Julian Scheel <julian@jusst.de>

A list of sampling rates can be specified via configfs. All enabled
sampling rates are sent to the USB host on request. When the host
selects a sampling rate, the internal active rate (stored in
struct f_uac2) is updated.

Config strings with single value stay compatible with the previous
version.

Multiple samplerates passed as configuration arrays to g_audio module
when built for f_uac2.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3:
* audio.c: fixed unused variables for CONFIG_UAC1 variants
* audio: used 0444 instead of S_IRUGO
* f_uac2: renamed ctl_id -> clock_id + added explaining
  comment
* f_uac2: removed current state srates from struct f_uac2_opts, using
  u_audio_get_playback/capture_srate() instead.
* f_uac2: renamed UAC_RATE2_ATTRIBUTE -> UAC2_RATE_ATTRIBUTE, moved from
  u_uac2.h to f_uac2.c
* renamed confusing cntrl_range_lay3 to cntrl_subrange_lay3
* struct cntrl_ranges_lay3_xxx is created with DECLARE_UAC2_CNTRL_RANGES_LAY3
* fixed ranges_size calculation, renamed to specific ranges_lay3_size
* updated commit message
---
 .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
 Documentation/usb/gadget-testing.rst          |   4 +-
 drivers/usb/gadget/function/f_uac2.c          | 196 +++++++++++++++---
 drivers/usb/gadget/function/u_uac2.h          |   5 +-
 drivers/usb/gadget/legacy/audio.c             |  25 ++-
 5 files changed, 186 insertions(+), 48 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 7fb3dbe26857..9d2f59ab9701 100644
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
index cbbd948c626f..419f6e5e890a 100644
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
index e518f210968c..089da132913c 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -70,6 +70,8 @@ struct f_uac2 {
 	/* Interrupt IN endpoint of AC interface */
 	struct usb_ep	*int_ep;
 	atomic_t	int_count;
+	/* transient state, only valid during handling of a single control request */
+	int clock_id;
 };
 
 static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
@@ -166,7 +168,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
 	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
 	/* .bClockID = DYNAMIC */
 	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
-	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
+	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
 	.bAssocTerminal = 0,
 };
 
@@ -178,7 +180,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
 	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
 	/* .bClockID = DYNAMIC */
 	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
-	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
+	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
 	.bAssocTerminal = 0,
 };
 
@@ -634,13 +636,36 @@ struct cntrl_cur_lay3 {
 	__le32	dCUR;
 };
 
-struct cntrl_range_lay3 {
-	__le16	wNumSubRanges;
+struct cntrl_subrange_lay3 {
 	__le32	dMIN;
 	__le32	dMAX;
 	__le32	dRES;
 } __packed;
 
+#define ranges_lay3_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges	\
+		* sizeof(struct cntrl_subrange_lay3))
+
+#define DECLARE_UAC2_CNTRL_RANGES_LAY3(k, n)		\
+	struct cntrl_ranges_lay3_##k {			\
+	__le16	wNumSubRanges;				\
+	struct cntrl_subrange_lay3 r[n];		\
+} __packed
+
+DECLARE_UAC2_CNTRL_RANGES_LAY3(srates, UAC_MAX_RATES);
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
@@ -667,11 +692,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 
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
 
@@ -912,10 +937,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
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
@@ -956,6 +981,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	struct f_uac2_opts *uac2_opts = g_audio_to_uac2_opts(agdev);
 	struct usb_string *us;
 	int ret;
+	int init_p_srate, init_c_srate;
 
 	ret = afunc_validate_opts(agdev, dev);
 	if (ret)
@@ -1037,8 +1063,11 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		*bma = cpu_to_le32(control);
 	}
 
-	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", uac2_opts->p_srate);
-	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", uac2_opts->c_srate);
+	init_p_srate = uac2_opts->p_srates[0];
+	init_c_srate = uac2_opts->c_srates[0];
+
+	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", init_p_srate);
+	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", init_c_srate);
 
 	ret = usb_interface_id(cfg, fn);
 	if (ret < 0) {
@@ -1209,7 +1238,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
-	agdev->params.p_srates[0] = uac2_opts->p_srate;
+	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
+			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
 	if (FUIN_EN(uac2_opts)) {
 		agdev->params.p_fu.id = USB_IN_FU_ID;
@@ -1220,7 +1250,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
-	agdev->params.c_srates[0] = uac2_opts->c_srate;
+	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
+			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	if (FUOUT_EN(uac2_opts)) {
 		agdev->params.c_fu.id = USB_OUT_FU_ID;
@@ -1423,10 +1454,10 @@ in_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	u8 entity_id = (w_index >> 8) & 0xff;
 	u8 control_selector = w_value >> 8;
 	int value = -EOPNOTSUPP;
-	int p_srate, c_srate;
+	u32 p_srate, c_srate;
 
-	p_srate = opts->p_srate;
-	c_srate = opts->c_srate;
+	u_audio_get_playback_srate(agdev, &p_srate);
+	u_audio_get_capture_srate(agdev, &c_srate);
 
 	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
 		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
@@ -1500,28 +1531,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
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
+			struct cntrl_ranges_lay3_srates rs;
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
+			value = min_t(unsigned int, w_length, ranges_lay3_size(rs));
+			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
+				__func__, rs.wNumSubRanges, value);
+			memcpy(req->buf, &rs, value);
 		} else {
 			dev_err(&agdev->gadget->dev,
 				"%s:%d control_selector=%d TODO!\n",
@@ -1580,6 +1622,25 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 		return -EOPNOTSUPP;
 }
 
+static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
+{
+	struct usb_function *fn = ep->driver_data;
+	struct g_audio *agdev = func_to_g_audio(fn);
+	struct f_uac2 *uac2 = func_to_uac2(fn);
+	u32 val;
+
+	if (req->actual != 4)
+		return;
+
+	val = le32_to_cpu(*((u32 *)req->buf));
+	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
+	if (uac2->clock_id == USB_IN_CLK_ID) {
+		u_audio_set_playback_srate(agdev, val);
+	} else if (uac2->clock_id == USB_OUT_CLK_ID) {
+		u_audio_set_capture_srate(agdev, val);
+	}
+}
+
 static void
 out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
 {
@@ -1631,6 +1692,7 @@ out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
 static int
 out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
+	struct usb_composite_dev *cdev = fn->config->cdev;
 	struct usb_request *req = fn->config->cdev->req;
 	struct g_audio *agdev = func_to_g_audio(fn);
 	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
@@ -1640,10 +1702,17 @@ out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
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
+			uac2->clock_id = clock_id;
+			req->complete = uac2_cs_control_sam_freq;
 			return w_length;
+		}
 	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
 			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
 		memcpy(&uac2->setup_cr, cr, sizeof(*cr));
@@ -1836,11 +1905,70 @@ end:									\
 									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
+#define UAC2_RATE_ATTRIBUTE(name)					\
+static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
+					 char *page)			\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
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
+static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
+					  const char *page, size_t len)	\
+{									\
+	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
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
+CONFIGFS_ATTR(f_uac2_opts_, name)
+
 UAC2_ATTRIBUTE(u32, p_chmask);
-UAC2_ATTRIBUTE(u32, p_srate);
+UAC2_RATE_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(u32, p_ssize);
 UAC2_ATTRIBUTE(u32, c_chmask);
-UAC2_ATTRIBUTE(u32, c_srate);
+UAC2_RATE_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(u32, c_ssize);
 UAC2_ATTRIBUTE(u32, req_number);
@@ -1913,10 +2041,10 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 				    &f_uac2_func_type);
 
 	opts->p_chmask = UAC2_DEF_PCHMASK;
-	opts->p_srate = UAC2_DEF_PSRATE;
+	opts->p_srates[0] = UAC2_DEF_PSRATE;
 	opts->p_ssize = UAC2_DEF_PSSIZE;
 	opts->c_chmask = UAC2_DEF_CCHMASK;
-	opts->c_srate = UAC2_DEF_CSRATE;
+	opts->c_srates[0] = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
 
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index e0c8e3513bfd..6bfcf6d0e863 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -14,6 +14,7 @@
 #define U_UAC2_H
 
 #include <linux/usb/composite.h>
+#include "uac_common.h"
 
 #define UAC2_DEF_PCHMASK 0x3
 #define UAC2_DEF_PSRATE 48000
@@ -35,10 +36,10 @@
 struct f_uac2_opts {
 	struct usb_function_instance	func_inst;
 	int				p_chmask;
-	int				p_srate;
+	int				p_srates[UAC_MAX_RATES];
 	int				p_ssize;
 	int				c_chmask;
-	int				c_srate;
+	int				c_srates[UAC_MAX_RATES];
 	int				c_ssize;
 	int				c_sync;
 
diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/legacy/audio.c
index 5ec477ffab7f..d14b9f2d4c07 100644
--- a/drivers/usb/gadget/legacy/audio.c
+++ b/drivers/usb/gadget/legacy/audio.c
@@ -26,9 +26,10 @@ module_param(p_chmask, uint, 0444);
 MODULE_PARM_DESC(p_chmask, "Playback Channel Mask");
 
 /* Playback Default 48 KHz */
-static int p_srate = UAC2_DEF_PSRATE;
-module_param(p_srate, uint, 0444);
-MODULE_PARM_DESC(p_srate, "Playback Sampling Rate");
+static int p_srates[UAC_MAX_RATES] = {UAC2_DEF_PSRATE};
+static int p_srates_cnt = 1;
+module_param_array_named(p_srate, p_srates, uint, &p_srates_cnt, 0444);
+MODULE_PARM_DESC(p_srate, "Playback Sampling Rates (array)");
 
 /* Playback Default 16bits/sample */
 static int p_ssize = UAC2_DEF_PSSIZE;
@@ -41,9 +42,10 @@ module_param(c_chmask, uint, 0444);
 MODULE_PARM_DESC(c_chmask, "Capture Channel Mask");
 
 /* Capture Default 64 KHz */
-static int c_srate = UAC2_DEF_CSRATE;
-module_param(c_srate, uint, 0444);
-MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
+static int c_srates[UAC_MAX_RATES] = {UAC2_DEF_CSRATE};
+static int c_srates_cnt = 1;
+module_param_array_named(c_srate, c_srates, uint, &c_srates_cnt, 0444);
+MODULE_PARM_DESC(c_srate, "Capture Sampling Rates (array)");
 
 /* Capture Default 16bits/sample */
 static int c_ssize = UAC2_DEF_CSSIZE;
@@ -237,6 +239,7 @@ static int audio_bind(struct usb_composite_dev *cdev)
 {
 #ifndef CONFIG_GADGET_UAC1
 	struct f_uac2_opts	*uac2_opts;
+	int i;
 #else
 #ifndef CONFIG_GADGET_UAC1_LEGACY
 	struct f_uac1_opts	*uac1_opts;
@@ -263,10 +266,16 @@ static int audio_bind(struct usb_composite_dev *cdev)
 #ifndef CONFIG_GADGET_UAC1
 	uac2_opts = container_of(fi_uac2, struct f_uac2_opts, func_inst);
 	uac2_opts->p_chmask = p_chmask;
-	uac2_opts->p_srate = p_srate;
+
+	for (i = 0; i < p_srates_cnt; ++i)
+		uac2_opts->p_srates[i] = p_srates[i];
+
 	uac2_opts->p_ssize = p_ssize;
 	uac2_opts->c_chmask = c_chmask;
-	uac2_opts->c_srate = c_srate;
+
+	for (i = 0; i < c_srates_cnt; ++i)
+		uac2_opts->c_srates[i] = c_srates[i];
+
 	uac2_opts->c_ssize = c_ssize;
 	uac2_opts->req_number = UAC2_DEF_REQ_NUM;
 #else
-- 
2.25.1

