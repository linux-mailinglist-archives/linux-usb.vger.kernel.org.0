Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477BC49625C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381695AbiAUPxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:53:20 -0500
Received: from cable.insite.cz ([84.242.75.189]:49260 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381697AbiAUPxT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 10:53:19 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E9179A1A3D403;
        Fri, 21 Jan 2022 16:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780396; bh=0aioZtgpTZks+hH8fKfUIYhcOvrNsrRafru6VT6lr24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TGF/lQPt+ayi0/v162EBfApZUh1LR2yIf6Ig7dlcjuedv7cUMwOYVpBTqN3zqvOiD
         WFtFEHFeq0qf+GZM9r96lpCizKvV7DlH6ZCkiotBMMKR+LXlGyai1jIeaZtCGYwMwW
         wwdQgnF5h4EOZofKZn0WZEMJGdEHB+L/FA4kAbag=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 91oyh3CbEzWq; Fri, 21 Jan 2022 16:53:11 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 12BA5A1A3D404;
        Fri, 21 Jan 2022 16:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780391; bh=0aioZtgpTZks+hH8fKfUIYhcOvrNsrRafru6VT6lr24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MdOVxtMrJMO8CgZI39Tr423L2bA6x0d1niQIi3YpOEYyEUsQIoHqgeFS4fN1jgtRr
         5Mjs/gqw38uUolzw5a5OvffjJ0LIvki7bbpN0FX8HtqYIgWntYzbbU+AAVnxi6x5t0
         0uj2TulEsWAr3cNI3rH9KDCDCa9H5TwcFFaksd30=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 03/10] usb: gadget: u_audio: Move dynamic srate from params to rtd
Date:   Fri, 21 Jan 2022 16:53:01 +0100
Message-Id: <20220121155308.48794-4-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121155308.48794-1-pavel.hofman@ivitera.com>
References: <20220121155308.48794-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Parameters uac_params.p_srate/c_srate are dynamic now and are not part
of parametric configuration anymore. Move them to the
runtime struct uac_rtd_params for each stream.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Suggested-by: John Keeping <john@metanate.com>
---
v3: new patch

v4: added Suggested-by to commit msg
---
 drivers/usb/gadget/function/f_uac1.c  |  2 -
 drivers/usb/gadget/function/f_uac2.c  |  2 -
 drivers/usb/gadget/function/u_audio.c | 68 ++++++++++++++-------------
 drivers/usb/gadget/function/u_audio.h |  4 +-
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index ccb0e4f41e5d..0397b27df42e 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1297,7 +1297,6 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep_maxpsize = le16_to_cpu(as_out_ep_desc.wMaxPacketSize);
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
-	audio->params.c_srate = audio_opts->c_srate;
 	audio->params.c_srates[0] = audio_opts->c_srate;
 	audio->params.c_ssize = audio_opts->c_ssize;
 	if (FUIN_EN(audio_opts)) {
@@ -1310,7 +1309,6 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		audio->params.p_fu.volume_res = audio_opts->p_volume_res;
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
-	audio->params.p_srate = audio_opts->p_srate;
 	audio->params.p_srates[0] = audio_opts->p_srate;
 	audio->params.p_ssize = audio_opts->p_ssize;
 	if (FUOUT_EN(audio_opts)) {
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 1334691073a0..e518f210968c 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1209,7 +1209,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
-	agdev->params.p_srate = uac2_opts->p_srate;
 	agdev->params.p_srates[0] = uac2_opts->p_srate;
 	agdev->params.p_ssize = uac2_opts->p_ssize;
 	if (FUIN_EN(uac2_opts)) {
@@ -1221,7 +1220,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
-	agdev->params.c_srate = uac2_opts->c_srate;
 	agdev->params.c_srates[0] = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	if (FUOUT_EN(uac2_opts)) {
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 50ccb36d22d7..dce894dcae07 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -64,6 +64,7 @@ struct uac_rtd_params {
   int mute;
 
 	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */
+	int srate; /* selected samplerate */
 
   spinlock_t lock; /* lock for control transfers */
 
@@ -153,8 +154,6 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct snd_pcm_runtime *runtime;
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
 	unsigned int frames, p_pktsize;
 	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
 			residue_frames_mil, div_result;
@@ -199,15 +198,14 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		 */
 		unsigned long long p_interval_mil = uac->p_interval * 1000000ULL;
 
-		pitched_rate_mil = (unsigned long long)
-				params->p_srate * prm->pitch;
+		pitched_rate_mil = (unsigned long long) prm->srate * prm->pitch;
 		div_result = pitched_rate_mil;
 		do_div(div_result, uac->p_interval);
 		do_div(div_result, 1000000);
 		frames = (unsigned int) div_result;
 
 		pr_debug("p_srate %d, pitch %d, interval_mil %llu, frames %d\n",
-				params->p_srate, prm->pitch, p_interval_mil, frames);
+				prm->srate, prm->pitch, p_interval_mil, frames);
 
 		p_pktsize = min_t(unsigned int,
 					uac->p_framesize * frames,
@@ -284,7 +282,6 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
 	int status = req->status;
 
 	/* i/f shutting down */
@@ -306,7 +303,7 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 			__func__, status, req->actual, req->length);
 
 	u_audio_set_fback_frequency(audio_dev->gadget->speed, audio_dev->out_ep,
-				    params->c_srate, prm->pitch,
+				    prm->srate, prm->pitch,
 				    req->buf);
 
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
@@ -390,16 +387,14 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct g_audio *audio_dev;
 	struct uac_params *params;
+	struct uac_rtd_params *prm;
 	int p_ssize, c_ssize;
-	int p_srate, c_srate;
 	int p_chmask, c_chmask;
 
 	audio_dev = uac->audio_dev;
 	params = &audio_dev->params;
 	p_ssize = params->p_ssize;
 	c_ssize = params->c_ssize;
-	p_srate = params->p_srate;
-	c_srate = params->c_srate;
 	p_chmask = params->p_chmask;
 	c_chmask = params->c_chmask;
 	uac->p_residue_mil = 0;
@@ -407,19 +402,18 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw = uac_pcm_hardware;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		runtime->hw.rate_min = p_srate;
 		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
 		runtime->hw.channels_min = num_channels(p_chmask);
-		runtime->hw.period_bytes_min = 2 * uac->p_prm.max_psize
-						/ runtime->hw.periods_min;
+		prm = &uac->p_prm;
 	} else {
-		runtime->hw.rate_min = c_srate;
 		runtime->hw.formats = uac_ssize_to_fmt(c_ssize);
 		runtime->hw.channels_min = num_channels(c_chmask);
-		runtime->hw.period_bytes_min = 2 * uac->c_prm.max_psize
-						/ runtime->hw.periods_min;
+		prm = &uac->c_prm;
 	}
 
+	runtime->hw.period_bytes_min = 2 * prm->max_psize
+					/ runtime->hw.periods_min;
+	runtime->hw.rate_min = prm->srate;
 	runtime->hw.rate_max = runtime->hw.rate_min;
 	runtime->hw.channels_max = runtime->hw.channels_min;
 
@@ -499,12 +493,18 @@ static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
 int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate)
 {
 	struct uac_params *params = &audio_dev->params;
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
 	int i;
+	unsigned long flags;
 
 	dev_dbg(&audio_dev->gadget->dev, "%s: srate %d\n", __func__, srate);
+	prm = &uac->c_prm;
 	for (i = 0; i < UAC_MAX_RATES; i++) {
 		if (params->c_srates[i] == srate) {
-			params->c_srate = srate;
+			spin_lock_irqsave(&prm->lock, flags);
+			prm->srate = srate;
+			spin_unlock_irqrestore(&prm->lock, flags);
 			return 0;
 		}
 		if (params->c_srates[i] == 0)
@@ -518,12 +518,18 @@ EXPORT_SYMBOL_GPL(u_audio_set_capture_srate);
 int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 {
 	struct uac_params *params = &audio_dev->params;
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
 	int i;
+	unsigned long flags;
 
 	dev_dbg(&audio_dev->gadget->dev, "%s: srate %d\n", __func__, srate);
+	prm = &uac->p_prm;
 	for (i = 0; i < UAC_MAX_RATES; i++) {
 		if (params->p_srates[i] == srate) {
-			params->p_srate = srate;
+			spin_lock_irqsave(&prm->lock, flags);
+			prm->srate = srate;
+			spin_unlock_irqrestore(&prm->lock, flags);
 			return 0;
 		}
 		if (params->p_srates[i] == 0)
@@ -545,9 +551,9 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;
 
-	dev_dbg(dev, "start capture with rate %d\n", params->c_srate);
-	ep = audio_dev->out_ep;
 	prm = &uac->c_prm;
+	dev_dbg(dev, "start capture with rate %d\n", prm->srate);
+	ep = audio_dev->out_ep;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
 	req_len = ep->maxpacket;
 
@@ -604,7 +610,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	 */
 	prm->pitch = 1000000;
 	u_audio_set_fback_frequency(audio_dev->gadget->speed, ep,
-				    params->c_srate, prm->pitch,
+				    prm->srate, prm->pitch,
 				    req_fback->buf);
 
 	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
@@ -638,9 +644,9 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	int req_len, i;
 	unsigned int p_pktsize;
 
-	dev_dbg(dev, "start playback with rate %d\n", params->p_srate);
-	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
+	dev_dbg(dev, "start playback with rate %d\n", prm->srate);
+	ep = audio_dev->in_ep;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
 
 	ep_desc = ep->desc;
@@ -661,7 +667,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
 	p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
-					(params->p_srate / uac->p_interval),
+					(prm->srate / uac->p_interval),
 				ep->maxpacket);
 
 	req_len = p_pktsize;
@@ -1037,15 +1043,11 @@ static int u_audio_rate_get(struct snd_kcontrol *kcontrol,
 						 struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
-
-	if (prm == &uac->c_prm)
-		ucontrol->value.integer.value[0] = params->c_srate;
-	else
-		ucontrol->value.integer.value[0] = params->p_srate;
+	unsigned long flags;
 
+	spin_lock_irqsave(&prm->lock, flags);
+	ucontrol->value.integer.value[0] = prm->srate;
+	spin_unlock_irqrestore(&prm->lock, flags);
 	return 0;
 }
 
@@ -1117,6 +1119,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
     spin_lock_init(&prm->lock);
     uac->c_prm.uac = uac;
 		prm->max_psize = g_audio->out_ep_maxpsize;
+		prm->srate = params->c_srates[0];
 
 		prm->reqs = kcalloc(params->req_number,
 				    sizeof(struct usb_request *),
@@ -1141,6 +1144,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		spin_lock_init(&prm->lock);
 		uac->p_prm.uac = uac;
 		prm->max_psize = g_audio->in_ep_maxpsize;
+		prm->srate = params->p_srates[0];
 
 		prm->reqs = kcalloc(params->req_number,
 				    sizeof(struct usb_request *),
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 76b5b8169444..84579fe81b92 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -42,17 +42,17 @@ struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
 	int p_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
-	int p_srate;	/* selected rate in Hz */
 	int p_ssize;	/* sample size */
 	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
 	int c_chmask;	/* channel mask */
 	int c_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
-	int c_srate;	/* selected rate in Hz */
 	int c_ssize;	/* sample size */
 	struct uac_fu_params c_fu;	/* Feature Unit parameters */
 
+	/* rates are dynamic, in uac_rtd_params */
+
 	int req_number; /* number of preallocated requests */
 	int fb_max;	/* upper frequency drift feedback limit per-mil */
 };
-- 
2.25.1

