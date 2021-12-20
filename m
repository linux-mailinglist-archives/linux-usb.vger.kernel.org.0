Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D8D47B4DB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhLTVLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:50 -0500
Received: from cable.insite.cz ([84.242.75.189]:56757 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230393AbhLTVLq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:46 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id BE9F3A1A3D401;
        Mon, 20 Dec 2021 22:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034704; bh=Miww34CI1HM+vFrrFdUYBLjj1bjD5ruYmQEzP4ZkXpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qhylWF/GB1YuvigMX6cERujvt8OlvKl/2hDat+V+/rBQQx2f5+tIy8gnB6vOFiExe
         MY5EohgGNstvYznw3mj92BdnaG0BSgEuf+5zGGAi1PJaYv45RBu361/pZiyLi1bWl6
         Rx0sXouQUq0aWRfJn5jVP63tnN7yqPu8cjAY3Ti4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zx_79Dp-dtlK; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C478BA1A3D406;
        Mon, 20 Dec 2021 22:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034694; bh=Miww34CI1HM+vFrrFdUYBLjj1bjD5ruYmQEzP4ZkXpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mumJvQlrAVR8qbsYCY55zwIB44MwJA44s+lzFZ2YysmTdPNhyjU91G5DV1+fez9DT
         fL+bjTsorr59R9JCt3WUML4IkBsfSQ9txLblZ6jU5aWhSUc8DSz2ThdgGJdXuxB3d1
         IAWBbejMjIig/B3DJCNUWMWk4exne0Hb5X0QFJ8c=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 06/11] usb: gadget: u_audio: Rate ctl notifies about current srate (0=stopped)
Date:   Mon, 20 Dec 2021 22:11:25 +0100
Message-Id: <20211220211130.88590-7-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Playback/Capture ctl currently reports rate value set by USB
control selector UAC2_CS_CONTROL_SAM_FREQ (fixed for UAC1). When the
host has stopped playback/capture, the reported value does not change.
The gadget side has no information whether the host has started/stopped
capture/playback.

This patch sets the value reported by the respective rate ctl to zero
when the host side has stopped playback/capture. Also, it calls
snd_ctl_notify when start/stop  occurs, so that a subscribed client can
act appropriately.

Tests have confirmed that USB hosts change UAC2_CS_CONTROL_SAM_FREQ
before switching altsetting to activate playback/capture, resulting in
correct order (params->c/p_srate is set to requested rate before
u_audio_start_capture/playback is called).

The gadget rate notifications are used by user-space audio gadget
controller gaudio_ctl https://github.com/pavhofman/gaudio_ctl.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/u_audio.c | 46 ++++++++++++---------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e737a104156d..a6293415c071 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -64,6 +64,7 @@ struct uac_rtd_params {
   int mute;
 
 	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */
+	int rep_srate; /* srate reported by snd_kctl_rate */
 
   spinlock_t lock; /* lock for control transfers */
 
@@ -496,8 +497,6 @@ static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
 int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate)
 {
 	struct uac_params *params = &audio_dev->params;
-	struct snd_uac_chip *uac = audio_dev->uac;
-	struct uac_rtd_params *prm = &uac->c_prm;
 	int i;
 
 	dev_dbg(&audio_dev->gadget->dev, "%s: srate %d\n", __func__, srate);
@@ -516,8 +515,6 @@ EXPORT_SYMBOL_GPL(u_audio_set_capture_srate);
 
 int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 {
-	struct snd_uac_chip *uac = audio_dev->uac;
-	struct uac_rtd_params *prm = &uac->p_prm;
 	struct uac_params *params = &audio_dev->params;
 	int i;
 
@@ -535,6 +532,18 @@ int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 }
 EXPORT_SYMBOL_GPL(u_audio_set_playback_srate);
 
+static void set_reported_srate(struct uac_rtd_params *prm, int srate)
+{
+	struct snd_kcontrol *kctl = prm->snd_kctl_rate;
+
+	if (prm->rep_srate != srate) {
+		prm->rep_srate = srate;
+		snd_ctl_notify(prm->uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				&kctl->id);
+		pr_debug("Setting '%s' to %d", kctl->id.name, srate);
+	}
+}
+
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
@@ -574,6 +583,8 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
+	set_reported_srate(&uac->c_prm, params->c_srate);
+
 	ep_fback = audio_dev->in_ep_fback;
 	if (!ep_fback)
 		return 0;
@@ -619,6 +630,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	set_reported_srate(&uac->c_prm, 0);
 	if (audio_dev->in_ep_fback)
 		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
@@ -691,6 +703,8 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
+	set_reported_srate(&uac->p_prm, params->p_srate);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(u_audio_start_playback);
@@ -699,6 +713,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	set_reported_srate(&uac->p_prm, 0);
 	free_ep(&uac->p_prm, audio_dev->in_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
@@ -1001,19 +1016,6 @@ static int get_max_srate(const int *srates)
 	return max_srate;
 }
 
-static int get_min_srate(const int *srates)
-{
-	int i, min_srate = INT_MAX;
-
-	for (i = 0; i < UAC_MAX_RATES; i++) {
-		if (srates[i] == 0)
-			break;
-		if (srates[i] < min_srate)
-			min_srate = srates[i];
-	}
-	return min_srate;
-}
-
 static int uac_pcm_rate_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
 {
@@ -1030,7 +1032,7 @@ static int uac_pcm_rate_info(struct snd_kcontrol *kcontrol,
 		srates = params->c_srates;
 	else
 		srates = params->p_srates;
-	uinfo->value.integer.min = get_min_srate(srates);
+	uinfo->value.integer.min = 0;
 	uinfo->value.integer.max = get_max_srate(srates);
 	return 0;
 }
@@ -1039,14 +1041,8 @@ static int uac_pcm_rate_get(struct snd_kcontrol *kcontrol,
 						 struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
 
-	if (prm == &uac->c_prm)
-		ucontrol->value.integer.value[0] = params->c_srate;
-	else
-		ucontrol->value.integer.value[0] = params->p_srate;
+	ucontrol->value.integer.value[0] = prm->rep_srate;
 
 	return 0;
 }
-- 
2.25.1

