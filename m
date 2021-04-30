Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4617236FC54
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhD3O1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbhD3O1Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 10:27:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83247C06138B
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id zg3so23952256ejb.8
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RyyrRt2ajEZ5GKudfRFcfpOEyyZsq4/5SeJfSMwSBuM=;
        b=WjW3DQ4vZe2wFcirLbUcujLiRxl3Vi4wGAZlfbAqqY7QtQSpvEXnemSbqRpMczY1pj
         iWWCGY0sD1sjgtKavfAcLJulv/KE8k0rK9NyjP+9HcpCJPbBlkxPdtWARxYQ8pdl6aYS
         Rg9dJKYoiC+2BcDw9JimoXx6MvqGh2SiwssVibccvpTxLz6MsCcZYmKgC8vZfQROfJXw
         3qIdVifK45eDXKWy6s/nDM22fbB5d/DEEZRzshp1coZqAr86tm7pQKL1XYEFhRBAHwSN
         bw24oNbcrXntc6mIlLrdK478FmMLBgaLnt847qYL2qRVEX5i9NtNlajo2ld9avWaouZN
         uT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RyyrRt2ajEZ5GKudfRFcfpOEyyZsq4/5SeJfSMwSBuM=;
        b=MXhrs9gNaWH940Tdz+FSwyklPwPSHETJqpUG2XBEgyoLzJKkaEp9eMYd9es8IaLEIu
         DTIMGQgdE6my2DWUcVYzNpcLaF0N6FJ3ogJjnnb/3XPAU5qBFl4A20vT0Ji/bYV+/R1N
         8kL1iNqjzMI4OGEjReJ3JdxBC+5q/oZxk8HM7QFRKN2SqMioyVOrmLSjaW6X3g2amwQz
         CDAaB0zplfNXCeVS1KSRAmI2a2QxaDlz6kTX9zx7oBgsY7mQfMudqSq6ZUZpbheuxDlW
         Me5sRe/Hmuhd6hLAm546IXbpgKKNakQb04NkJpIux9jBeFnXM7VuFQ76wtOo63ROd0Gp
         gVMA==
X-Gm-Message-State: AOAM533rIZ0QDWJB/NWlwllAgy/wFal8EogZ8x1U6L0lQtRK1+hlL3E5
        z5gMwMSPqDT9RsaIPD1bd2xggu/s7ObmOsF+
X-Google-Smtp-Source: ABdhPJzuHcrdyHWCtyOQwAITcp4z/DmsaDWSnPvGEq08JJldOeEsaHQsRNm00T0EblWK412VeKz7HA==
X-Received: by 2002:a17:906:1e0b:: with SMTP id g11mr4595564ejj.291.1619792793113;
        Fri, 30 Apr 2021 07:26:33 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id t22sm1009290edw.29.2021.04.30.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:26:32 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [RFC PATCH v2 3/3] usb: gadget: u_audio: add real feedback implementation
Date:   Fri, 30 Apr 2021 16:26:25 +0200
Message-Id: <20210430142625.357152-4-jbrunet@baylibre.com>
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
 drivers/usb/gadget/function/u_audio.c         | 111 ++++++++++++++++--
 drivers/usb/gadget/function/u_audio.h         |   9 ++
 drivers/usb/gadget/function/u_uac2.h          |   2 +
 6 files changed, 124 insertions(+), 9 deletions(-)

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
index f637ebec80b0..b517beb17006 100644
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
 
@@ -75,7 +76,9 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 };
 
 static void u_audio_set_fback_frequency(enum usb_device_speed speed,
-					unsigned int freq, void *buf)
+					unsigned long long freq,
+					unsigned int pitch,
+					void *buf)
 {
 	u32 ff = 0;
 
@@ -86,7 +89,7 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * Format is encoded in Q10.10 left-justified in the 24 bits,
 		 * so that it has a Q10.14 format.
 		 */
-		ff = DIV_ROUND_UP((freq << 14), 1000);
+		freq <<= 14;
 	} else {
 		/*
 		 * High-speed feedback endpoints report frequency
@@ -95,8 +98,11 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * the binary point is located between the second and the third
 		 * byte fromat (that is Q16.16)
 		 */
-		ff = DIV_ROUND_UP((freq << 13), 1000);
+		freq <<= 13;
 	}
+
+	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), (1000 * 1000000));
+
 	*(__le32 *)buf = cpu_to_le32(ff);
 }
 
@@ -209,8 +215,8 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
 	int status = req->status;
-	unsigned long flags;
 
 	/* i/f shutting down */
 	if (!prm->fb_ep_enabled || req->status == -ESHUTDOWN)
@@ -225,7 +231,8 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 			__func__, status, req->actual, req->length);
 
 	u_audio_set_fback_frequency(audio_dev->gadget->speed,
-				    prm->ffback, req->buf);
+				    params->c_srate, prm->pitch,
+				    req->buf);
 
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
 		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
@@ -480,9 +487,10 @@ int u_audio_start_capture(struct g_audio *audio_dev)
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
@@ -578,12 +586,82 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
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
@@ -671,6 +749,23 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
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
2.31.1

