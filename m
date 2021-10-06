Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C789442397D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 10:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbhJFIO5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 04:14:57 -0400
Received: from cable.insite.cz ([84.242.75.189]:59193 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237420AbhJFIO5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Oct 2021 04:14:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 56DB0A1A3D403;
        Wed,  6 Oct 2021 10:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633507984; bh=r48GFoEjeTtJFIZKBku61zwIKaXQjUm4CXNTisdQzY0=;
        h=From:To:Cc:Subject:Date:From;
        b=g8w5fJ9EUulataaZzIKIIMoPiJ94+Ho7ZtseFt00DsHolv1g8aEshieQWq1/Aq0cx
         1RiFdz/LVtXXgG4hIh9nTke0WZuwK8+BouwEJbMCa7E9fXOMhSTifTxF/o7YdflG8N
         zU017AlTk6+KQW0MU+4djidYPu3YopMe3Dixi6GM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tAABUJdUe7T6; Wed,  6 Oct 2021 10:12:58 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 9B81DA1A3D402;
        Wed,  6 Oct 2021 10:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633507978; bh=r48GFoEjeTtJFIZKBku61zwIKaXQjUm4CXNTisdQzY0=;
        h=From:To:Cc:Subject:Date:From;
        b=i+xhRsfxS4htZFeEDi+wyb1rT57gqe8BaW5zmqnl1IKxldzOsD+AZt54VE85t45TF
         jusLsqsqp1+n9MHPMjp7yWln2lP0bQzv3xrRZC68WYw0eYd2S7M3w2wcW0LctL5DF0
         EGToHoiDTxdqagmpxVcfU3IgFAZ5vZWVsDUndk/c=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] usb: gadget: u_audio.c: Adding Playback Pitch ctl for sync playback
Date:   Wed,  6 Oct 2021 10:12:58 +0200
Message-Id: <20211006081258.8501-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

EP IN is hard-coded as ASYNC both in f_uac1 and f_uac2 but u_audio sends
steady number of audio frames in each USB packet, without any control.

This patch adds 'Playback Pitch 1000000' ctl analogous to the existing
'Capture Pitch 1000000' ctl. The calculation of playback req->length in
u_audio_iso_complete respects the Playback Pitch ctl value to 1ppm now.

Max. value for Playback Pitch is configured by the existing parameter
uac2_opts->fb_max, used also for the Capture Pitch.

Since the EP IN packet size can be increased by uac2_opts->fb_max now,
maxPacketSize for the playback direction is calculated by the same
algorithm as for the async capture direction in
f_uac2.c:set_ep_max_packet_size.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---

Notes:
    v2 -> v3: only notes added
    
    For: usb-next
    Depends on patch 0560c9c ("usb: gadget: f_uac2: fixed EP-IN
    wMaxPacketSize") currently only in branch usb-linus.

 drivers/usb/gadget/function/f_uac2.c  |  5 +-
 drivers/usb/gadget/function/u_audio.c | 93 ++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 4a03a3945e60..a5eedd88eee6 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -674,8 +674,9 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
-	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC)) {
-	  // Win10 requires max packet size + 1 frame
+	if (is_playback || (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC)) {
+		// playback is always async, capture only when configured
+		// Win10 requires max packet size + 1 frame
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
 		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
 		max_size_bw = num_channels(chmask) * ssize *
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index ad16163b5ff8..b22bfeee6be6 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -29,6 +29,7 @@
 
 enum {
 	UAC_FBACK_CTRL,
+	UAC_P_PITCH_CTRL,
 	UAC_MUTE_CTRL,
 	UAC_VOLUME_CTRL,
 };
@@ -74,13 +75,9 @@ struct snd_uac_chip {
 	struct snd_card *card;
 	struct snd_pcm *pcm;
 
-	/* timekeeping for the playback endpoint */
-	unsigned int p_interval;
-	unsigned int p_residue;
-
 	/* pre-calculated values for playback iso completion */
-	unsigned int p_pktsize;
-	unsigned int p_pktsize_residue;
+	unsigned long long p_interval_mil;
+	unsigned long long p_residue_mil;
 	unsigned int p_framesize;
 };
 
@@ -153,6 +150,10 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct snd_pcm_runtime *runtime;
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+	unsigned int frames, p_pktsize;
+	unsigned long long pitched_rate_mil, p_pktsize_residue_mil, residue_frames_mil;
 
 	/* i/f shutting down */
 	if (!prm->ep_enabled) {
@@ -192,19 +193,38 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		 * If there is a residue from this division, add it to the
 		 * residue accumulator.
 		 */
-		req->length = uac->p_pktsize;
-		uac->p_residue += uac->p_pktsize_residue;
+		pitched_rate_mil = (unsigned long long)
+				params->p_srate * prm->pitch;
+		frames = pitched_rate_mil / uac->p_interval_mil;
+
+		pr_debug("p_srate %d, pitch %d, interval_mil %llu, frames %d\n",
+				params->p_srate, prm->pitch, uac->p_interval_mil, frames);
+
+		p_pktsize = min_t(unsigned int,
+					uac->p_framesize * frames,
+					ep->maxpacket);
+
+		if (p_pktsize < ep->maxpacket) {
+			residue_frames_mil = pitched_rate_mil - frames * uac->p_interval_mil;
+			p_pktsize_residue_mil = uac->p_framesize * residue_frames_mil;
+		} else
+			p_pktsize_residue_mil = 0;
+
+		req->length = p_pktsize;
+		uac->p_residue_mil += p_pktsize_residue_mil;
 
 		/*
-		 * Whenever there are more bytes in the accumulator than we
+		 * Whenever there are more bytes in the accumulator p_residue_mil than we
 		 * need to add one more sample frame, increase this packet's
 		 * size and decrease the accumulator.
 		 */
-		if (uac->p_residue / uac->p_interval >= uac->p_framesize) {
+		if (uac->p_residue_mil / uac->p_interval_mil >= uac->p_framesize) {
 			req->length += uac->p_framesize;
-			uac->p_residue -= uac->p_framesize *
-					   uac->p_interval;
+			uac->p_residue_mil -= uac->p_framesize *
+					   uac->p_interval_mil;
+			pr_debug("increased req length to %d\n", req->length);
 		}
+		pr_debug("remains uac->p_residue_mil %llu\n", uac->p_residue_mil);
 
 		req->actual = req->length;
 	}
@@ -371,7 +391,7 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	c_srate = params->c_srate;
 	p_chmask = params->p_chmask;
 	c_chmask = params->c_chmask;
-	uac->p_residue = 0;
+	uac->p_residue_mil = 0;
 
 	runtime->hw = uac_pcm_hardware;
 
@@ -566,12 +586,17 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	unsigned int factor;
 	const struct usb_endpoint_descriptor *ep_desc;
 	int req_len, i;
+	unsigned int p_interval, p_pktsize, p_pktsize_residue;
 
 	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
 
 	ep_desc = ep->desc;
+	/*
+	 * Always start with original frequency
+	 */
+	prm->pitch = 1000000;
 
 	/* pre-calculate the playback endpoint's interval */
 	if (gadget->speed == USB_SPEED_FULL)
@@ -582,20 +607,21 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	/* pre-compute some values for iso_complete() */
 	uac->p_framesize = params->p_ssize *
 			    num_channels(params->p_chmask);
-	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
-	uac->p_pktsize = min_t(unsigned int,
+	p_interval = factor / (1 << (ep_desc->bInterval - 1));
+	uac->p_interval_mil = (unsigned long long) p_interval * 1000000;
+	p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
-					(params->p_srate / uac->p_interval),
+					(params->p_srate / p_interval),
 				ep->maxpacket);
 
-	if (uac->p_pktsize < ep->maxpacket)
-		uac->p_pktsize_residue = uac->p_framesize *
-			(params->p_srate % uac->p_interval);
+	if (p_pktsize < ep->maxpacket)
+		p_pktsize_residue = uac->p_framesize *
+			(params->p_srate % p_interval);
 	else
-		uac->p_pktsize_residue = 0;
+		p_pktsize_residue = 0;
 
-	req_len = uac->p_pktsize;
-	uac->p_residue = 0;
+	req_len = p_pktsize;
+	uac->p_residue_mil = 0;
 
 	prm->ep_enabled = true;
 	usb_ep_enable(ep);
@@ -925,6 +951,13 @@ static struct snd_kcontrol_new u_audio_controls[]  = {
     .get =          u_audio_pitch_get,
     .put =          u_audio_pitch_put,
   },
+	[UAC_P_PITCH_CTRL] {
+		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+		.name =         "Playback Pitch 1000000",
+		.info =         u_audio_pitch_info,
+		.get =          u_audio_pitch_get,
+		.put =          u_audio_pitch_put,
+	},
   [UAC_MUTE_CTRL] {
 		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name =		"", /* will be filled later */
@@ -1062,6 +1095,22 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
+	if (p_chmask) {
+		kctl = snd_ctl_new1(&u_audio_controls[UAC_P_PITCH_CTRL],
+				    &uac->p_prm);
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
 	for (i = 0; i <= SNDRV_PCM_STREAM_LAST; i++) {
 		struct uac_rtd_params *prm;
 		struct uac_fu_params *fu;
-- 
2.25.1

