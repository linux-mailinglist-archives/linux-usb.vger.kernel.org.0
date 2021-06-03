Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8076539AD65
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 00:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhFCWDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 18:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCWDY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 18:03:24 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381BAC061756
        for <linux-usb@vger.kernel.org>; Thu,  3 Jun 2021 15:01:23 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m18so7315678wrv.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Jun 2021 15:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d3gXcRw86U0iTZGVZUuJI1eqkDL2PgpWihuPFnwTp0E=;
        b=s7T9t5iKxNDS9w/zhBbn9d8VlWvYMbnO6mapevTUgH+UfJv3VWU6uxegrnBccrWqt+
         yoobGRbYRiYHxqwvdturp2XBi5VUh1GKMCAwDHl7/W8Xy2NWhaF1WqOSuKY4qx/I5EIO
         fzXzBC615ghkDq2rYtdI9Mm3LX18i6Qw3crStYrDcIGJx5tUX8KhXqw/aRRyHu8Z6v6+
         Z7T/TJ1Qb7475qSnxHWUEPuhXYsVihqmtOl6re5uX9G3oG6KgXnupTmRJk9i7OlPYuYH
         hPN0CSxplTUWlBKOMlR8P+QGzukaJh9kHFNQPpWXmtjWwL17dTXBOdAH4rWDNsdb23SC
         zl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d3gXcRw86U0iTZGVZUuJI1eqkDL2PgpWihuPFnwTp0E=;
        b=gSBwEykwh3ramncl3jtSfLTqXhK3Xh3TVUwOfS3o0Wvpyu6ARUzx2Ix+6ChekcCG0r
         6fQkSq3JlMkNkHuhcuDzjpHI1/qX6m+f6keEiTomtImu4Y8+eucSlLFNreqUtaYch/pD
         fHYnGPwY2Qb0NzoDoJ36gQJfpbz/KaGYkEFpicGPA/UXKShTnByXMD2956gveIfHA8Z9
         wnfRZXmyaGy6RtD4TtBHIr3KTJgkyaK+eDYdyadj8p5VFGawCiMXgxRi4xJryzRhMcbe
         RrTg4gcsOalSWciQhPj12eK5QxWzmLiD8vw5BlEKy8UN1AzG2HGspwDFtNfVkp4hu0la
         EOKg==
X-Gm-Message-State: AOAM530B9eyvlW9j3xSI6242dWMjiewGiyEVI9hMu7sjVgO8ChQKnXnp
        4mnKueQ5gK4nmjszKsG364C6z00oFHs4BA==
X-Google-Smtp-Source: ABdhPJxwZ7qiO8ak/Y//w2fr/tskH8gCC7hEXlwDEPU5wNj7KS3AeImRCox45euncbtw0tdvlzRO6w==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr518457wri.293.1622757681732;
        Thu, 03 Jun 2021 15:01:21 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:11bf:2693:b60f:d58b:e3f4:1a80])
        by smtp.googlemail.com with ESMTPSA id s128sm4078404wme.6.2021.06.03.15.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:01:21 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 3/3] usb: gadget: u_audio: add real feedback implementation
Date:   Fri,  4 Jun 2021 00:01:04 +0200
Message-Id: <20210603220104.1216001-4-jbrunet@baylibre.com>
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

This adds interface between userspace and feedback endpoint to report real
feedback frequency to the Host.

Current implementation adds new userspace interface ALSA mixer control
"Capture Pitch 1000000" (similar to aloop driver's "PCM Rate Shift 100000"
mixer control)

Value in PPM is chosen to have correction value agnostic of the actual HW
rate, which the application is not necessarily dealing with, while still
retaining a good enough precision to allow smooth clock correction on the
playback side, if necessary.

Similar to sound/usb/endpoint.c, a slow down is allowed up to 25%. This
has no impact on the required bandwidth. Speedup correction has an impact
on the bandwidth reserved for the isochronous endpoint. The default
allowed speedup is 500ppm. This seems to be more than enough but, if
necessary, this is configurable through a module parameter. The reserved
bandwidth is rounded up to the next packet size.

Usage of this new control is easy to implement in existing userspace tools
like alsaloop from alsa-utils.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      |   1 +
 Documentation/usb/gadget-testing.rst          |   1 +
 drivers/usb/gadget/function/f_uac2.c          |   9 +-
 drivers/usb/gadget/function/u_audio.c         | 124 ++++++++++++++++--
 drivers/usb/gadget/function/u_audio.h         |   9 ++
 drivers/usb/gadget/function/u_uac2.h          |   2 +
 6 files changed, 136 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index e7e59d7fb12f..26fb8e9b4e61 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -9,6 +9,7 @@ Description:
 		c_srate    capture sampling rate
 		c_ssize    capture sample size (bytes)
 		c_sync     capture synchronization type (async/adaptive)
+		fb_max     maximum extra bandwidth in async mode
 		p_chmask   playback channel mask
 		p_srate    playback sampling rate
 		p_ssize    playback sample size (bytes)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index f5a12667bd41..9d6276f82774 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -729,6 +729,7 @@ The uac2 function provides these attributes in its function directory:
 	c_srate		capture sampling rate
 	c_ssize		capture sample size (bytes)
 	c_sync		capture synchronization type (async/adaptive)
+	fb_max          maximum extra bandwidth in async mode
 	p_chmask	playback channel mask
 	p_srate		playback sampling rate
 	p_ssize		playback sample size (bytes)
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 321e6c05ba93..ae29ff2b2b68 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -584,8 +584,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
+	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
+
 	max_size_bw = num_channels(chmask) * ssize *
-		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
+		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
 						    max_size_ep));
 
@@ -957,6 +960,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->params.c_srate = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	agdev->params.req_number = uac2_opts->req_number;
+	agdev->params.fb_max = uac2_opts->fb_max;
 	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
 	if (ret)
 		goto err_free_descs;
@@ -1329,6 +1333,7 @@ UAC2_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(c_ssize);
 UAC2_ATTRIBUTE(req_number);
+UAC2_ATTRIBUTE(fb_max);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
@@ -1339,6 +1344,7 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_ssize,
 	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
+	&f_uac2_opts_attr_fb_max,
 	NULL,
 };
 
@@ -1378,6 +1384,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
+	opts->fb_max = UAC2_DEF_FB_MAX;
 	return &opts->func_inst;
 }
 
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f637ebec80b0..018dd0978995 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -16,6 +16,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/control.h>
 
 #include "u_audio.h"
 
@@ -35,12 +36,12 @@ struct uac_rtd_params {
 
 	void *rbuf;
 
+	unsigned int pitch;	/* Stream pitch ratio to 1000000 */
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
 
 	struct usb_request **reqs;
 
 	struct usb_request *req_fback; /* Feedback endpoint request */
-	unsigned int ffback; /* Real frequency reported by feedback endpoint */
 	bool fb_ep_enabled; /* if the ep is enabled */
 };
 
@@ -75,18 +76,29 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 };
 
 static void u_audio_set_fback_frequency(enum usb_device_speed speed,
-					unsigned int freq, void *buf)
+					unsigned long long freq,
+					unsigned int pitch,
+					void *buf)
 {
 	u32 ff = 0;
 
+	/*
+	 * Because the pitch base is 1000000, the final divider here
+	 * will be 1000 * 1000000 = 1953125 << 9
+	 *
+	 * Instead of dealing with big numbers lets fold this 9 left shift
+	 */
+
 	if (speed == USB_SPEED_FULL) {
 		/*
 		 * Full-speed feedback endpoints report frequency
-		 * in samples/microframe
+		 * in samples/frame
 		 * Format is encoded in Q10.10 left-justified in the 24 bits,
 		 * so that it has a Q10.14 format.
+		 *
+		 * ff = (freq << 14) / 1000
 		 */
-		ff = DIV_ROUND_UP((freq << 14), 1000);
+		freq <<= 5;
 	} else {
 		/*
 		 * High-speed feedback endpoints report frequency
@@ -94,9 +106,14 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * Format is encoded in Q12.13 fitted into four bytes so that
 		 * the binary point is located between the second and the third
 		 * byte fromat (that is Q16.16)
+		 *
+		 * ff = (freq << 16) / 8000
 		 */
-		ff = DIV_ROUND_UP((freq << 13), 1000);
+		freq <<= 4;
 	}
+
+	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), 1953125);
+
 	*(__le32 *)buf = cpu_to_le32(ff);
 }
 
@@ -209,8 +226,8 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
 	int status = req->status;
-	unsigned long flags;
 
 	/* i/f shutting down */
 	if (!prm->fb_ep_enabled || req->status == -ESHUTDOWN)
@@ -225,7 +242,8 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 			__func__, status, req->actual, req->length);
 
 	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    prm->ffback, req->buf);
+				    params->c_srate, prm->pitch,
+				    req->buf);
 
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
 		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
@@ -480,9 +498,10 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	 * Always start with original frequency since its deviation can't
 	 * be meauserd at start of playback
 	 */
-	prm->ffback = params->c_srate;
+	prm->pitch = 1000000;
 	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    prm->ffback, req_fback->buf);
+				    params->c_srate, prm->pitch,
+				    req_fback->buf);
 
 	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
@@ -578,12 +597,82 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
+static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+	unsigned int pitch_min, pitch_max;
+
+	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
+	pitch_max = (1000 + params->fb_max) * 1000;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = pitch_min;
+	uinfo->value.integer.max = pitch_max;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+static int u_audio_pitch_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = prm->pitch;
+
+	return 0;
+}
+
+static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+	unsigned int val;
+	unsigned int pitch_min, pitch_max;
+	int change = 0;
+
+	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
+	pitch_max = (1000 + params->fb_max) * 1000;
+
+	val = ucontrol->value.integer.value[0];
+
+	if (val < pitch_min)
+		val = pitch_min;
+	if (val > pitch_max)
+		val = pitch_max;
+
+	if (prm->pitch != val) {
+		prm->pitch = val;
+		change = 1;
+	}
+
+	return change;
+}
+
+static const struct snd_kcontrol_new u_audio_controls[]  = {
+{
+	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+	.name =         "Capture Pitch 1000000",
+	.info =         u_audio_pitch_info,
+	.get =          u_audio_pitch_get,
+	.put =          u_audio_pitch_put,
+},
+};
+
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 					const char *card_name)
 {
 	struct snd_uac_chip *uac;
 	struct snd_card *card;
 	struct snd_pcm *pcm;
+	struct snd_kcontrol *kctl;
 	struct uac_params *params;
 	int p_chmask, c_chmask;
 	int err;
@@ -671,6 +760,23 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &uac_pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &uac_pcm_ops);
 
+	if (c_chmask && g_audio->in_ep_fback) {
+		strscpy(card->mixername, card_name, sizeof(card->driver));
+
+		kctl = snd_ctl_new1(&u_audio_controls[0], &uac->c_prm);
+		if (!kctl) {
+			err = -ENOMEM;
+			goto snd_fail;
+		}
+
+		kctl->id.device = pcm->device;
+		kctl->id.subdevice = 0;
+
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			goto snd_fail;
+	}
+
 	strscpy(card->driver, card_name, sizeof(card->driver));
 	strscpy(card->shortname, card_name, sizeof(card->shortname));
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 53e6baf55cbf..a218cdf771fe 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -11,6 +11,14 @@
 
 #include <linux/usb/composite.h>
 
+/*
+ * Same maximum frequency deviation on the slower side as in
+ * sound/usb/endpoint.c. Value is expressed in per-mil deviation.
+ * The maximum deviation on the faster side will be provided as
+ * parameter, as it impacts the endpoint required bandwidth.
+ */
+#define FBACK_SLOW_MAX	250
+
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
@@ -23,6 +31,7 @@ struct uac_params {
 	int c_ssize;	/* sample size */
 
 	int req_number; /* number of preallocated requests */
+	int fb_max;	/* upper frequency drift feedback limit per-mil */
 };
 
 struct g_audio {
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 13589c3c805c..179d3ef6a195 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -23,6 +23,7 @@
 #define UAC2_DEF_CSSIZE 2
 #define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
 #define UAC2_DEF_REQ_NUM 2
+#define UAC2_DEF_FB_MAX 5
 
 struct f_uac2_opts {
 	struct usb_function_instance	func_inst;
@@ -34,6 +35,7 @@ struct f_uac2_opts {
 	int				c_ssize;
 	int				c_sync;
 	int				req_number;
+	int				fb_max;
 	bool				bound;
 
 	struct mutex			lock;
-- 
2.32.0.rc0

