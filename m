Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8B73C5CB1
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 14:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbhGLM62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 08:58:28 -0400
Received: from cable.insite.cz ([84.242.75.189]:33576 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231696AbhGLM61 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 08:58:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 177ADA1A3D401;
        Mon, 12 Jul 2021 14:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094537; bh=8YkhOcaqkeUQJzRE3yOHz0lGUUAJjjvd2n3ISWQTj70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O6Fk6HbPx02bGtsOfK1qd7/b4QwQG4wegheNj42jKbk6cirKGLQ3E2DPVfedWh+m5
         Bpi3elyg5Q8DShKQ0m+31RK1Yya2z23GPa2NQgU60G68xU6il45QfNr+8rRzCA/hLa
         xWrqEaxiiA9FuyVuJFJvjCuKdbvfmR76wUVKU5Wo=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id khODKWJECx2T; Mon, 12 Jul 2021 14:55:31 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1E952A1A3D403;
        Mon, 12 Jul 2021 14:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626094531; bh=8YkhOcaqkeUQJzRE3yOHz0lGUUAJjjvd2n3ISWQTj70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ALx9ltVJ8kQfLVXxcPUMxgVeMfQAdORZdEq8m23vSbHpFP26lhlzjbfJwqNKZ0ujd
         VAtVMQrH6mlFWwMnNHPJugAE6aUcAC6OmV/si0EqvyivtfpyrHBYZfmDFeIVsakMDC
         8gYE1ArwerqpnL1o49JjT3us9zYis1MYnOHUL29k=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 2/4] usb: gadget: u_audio: add bi-directional volume and mute support
Date:   Mon, 12 Jul 2021 14:55:27 +0200
Message-Id: <20210712125529.76070-3-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712125529.76070-1-pavel.hofman@ivitera.com>
References: <20210712125529.76070-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

USB Audio Class 1/2 have ability to change device's
volume and mute by USB Host through class-specific control
requests. Device also can notify Host about volume/mute
change on its side through optional interrupt endpoint.

This patch adds Volume and Mute ALSA controls which can be
used by user to send and receive notifications to/from
the USB Host about Volume and Mute change.

These params come from f_uac* so volume and mute controls
will be created only if the function support and enable
each explicitly

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/u_audio.c | 369 +++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h |  22 ++
 2 files changed, 380 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 018dd0978995..f6b5b9547236 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -12,11 +12,14 @@
  *    Jaswinder Singh (jaswinder.singh@linaro.org)
  */
 
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/control.h>
+#include <sound/tlv.h>
+#include <linux/usb/audio.h>
 
 #include "u_audio.h"
 
@@ -24,6 +27,12 @@
 #define PRD_SIZE_MAX	PAGE_SIZE
 #define MIN_PERIODS	4
 
+enum {
+	UAC_FBACK_CTRL,
+	UAC_MUTE_CTRL,
+	UAC_VOLUME_CTRL,
+};
+
 /* Runtime data params for one stream */
 struct uac_rtd_params {
 	struct snd_uac_chip *uac; /* parent chip */
@@ -43,6 +52,17 @@ struct uac_rtd_params {
 
 	struct usb_request *req_fback; /* Feedback endpoint request */
 	bool fb_ep_enabled; /* if the ep is enabled */
+
+  /* Volume/Mute controls and their state */
+  int fu_id; /* Feature Unit ID */
+  struct snd_kcontrol *snd_kctl_volume;
+  struct snd_kcontrol *snd_kctl_mute;
+  s16 volume_min, volume_max, volume_res;
+  s16 volume;
+  int mute;
+
+  spinlock_t lock; /* lock for control transfers */
+
 };
 
 struct snd_uac_chip {
@@ -597,6 +617,103 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
+int u_audio_get_volume(struct g_audio *audio_dev, int playback, s16 *val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+
+	if (playback)
+		prm = &uac->p_prm;
+	else
+		prm = &uac->c_prm;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	*val = prm->volume;
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_get_volume);
+
+int u_audio_set_volume(struct g_audio *audio_dev, int playback, s16 val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+	int change = 0;
+
+	if (playback)
+		prm = &uac->p_prm;
+	else
+		prm = &uac->c_prm;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	val = clamp(val, prm->volume_min, prm->volume_max);
+	if (prm->volume != val) {
+		prm->volume = val;
+		change = 1;
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	if (change)
+		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				&prm->snd_kctl_volume->id);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_set_volume);
+
+int u_audio_get_mute(struct g_audio *audio_dev, int playback, int *val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+
+	if (playback)
+		prm = &uac->p_prm;
+	else
+		prm = &uac->c_prm;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	*val = prm->mute;
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_get_mute);
+
+int u_audio_set_mute(struct g_audio *audio_dev, int playback, int val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+	int change = 0;
+	int mute;
+
+	if (playback)
+		prm = &uac->p_prm;
+	else
+		prm = &uac->c_prm;
+
+	mute = val ? 1 : 0;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	if (prm->mute != mute) {
+		prm->mute = mute;
+		change = 1;
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	if (change)
+		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &prm->snd_kctl_mute->id);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_set_mute);
+
+
 static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_info *uinfo)
 {
@@ -656,14 +773,158 @@ static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static const struct snd_kcontrol_new u_audio_controls[]  = {
+static int u_audio_mute_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
 {
-	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
-	.name =         "Capture Pitch 1000000",
-	.info =         u_audio_pitch_info,
-	.get =          u_audio_pitch_get,
-	.put =          u_audio_pitch_put,
-},
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	uinfo->value.integer.step = 1;
+
+	return 0;
+}
+
+static int u_audio_mute_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	unsigned long flags;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	ucontrol->value.integer.value[0] = !prm->mute;
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return 0;
+}
+
+static int u_audio_mute_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	unsigned int val;
+	unsigned long flags;
+	int change = 0;
+
+	val = !ucontrol->value.integer.value[0];
+
+	spin_lock_irqsave(&prm->lock, flags);
+	if (val != prm->mute) {
+		prm->mute = val;
+		change = 1;
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	if (change && audio_dev->notify)
+		audio_dev->notify(audio_dev, prm->fu_id, UAC_FU_MUTE);
+
+	return change;
+}
+
+/*
+ * TLV callback for mixer volume controls
+ */
+static int u_audio_volume_tlv(struct snd_kcontrol *kcontrol, int op_flag,
+			 unsigned int size, unsigned int __user *_tlv)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	DECLARE_TLV_DB_MINMAX(scale, 0, 0);
+
+	if (size < sizeof(scale))
+		return -ENOMEM;
+
+	/* UAC volume resolution is 1/256 dB, TLV is 1/100 dB */
+	scale[2] = (prm->volume_min * 100) / 256;
+	scale[3] = (prm->volume_max * 100) / 256;
+	if (copy_to_user(_tlv, scale, sizeof(scale)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int u_audio_volume_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max =
+		(prm->volume_max - prm->volume_min + prm->volume_res - 1)
+		/ prm->volume_res;
+	uinfo->value.integer.step = 1;
+
+	return 0;
+}
+
+static int u_audio_volume_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	unsigned long flags;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	ucontrol->value.integer.value[0] =
+			(prm->volume - prm->volume_min) / prm->volume_res;
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	return 0;
+}
+
+static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	unsigned int val;
+	s16 volume;
+	unsigned long flags;
+	int change = 0;
+
+	val = ucontrol->value.integer.value[0];
+
+	spin_lock_irqsave(&prm->lock, flags);
+	volume = (val * prm->volume_res) + prm->volume_min;
+	volume = clamp(volume, prm->volume_min, prm->volume_max);
+	if (volume != prm->volume) {
+		prm->volume = volume;
+		change = 1;
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	if (change && audio_dev->notify)
+		audio_dev->notify(audio_dev, prm->fu_id, UAC_FU_VOLUME);
+
+	return change;
+}
+
+
+static struct snd_kcontrol_new u_audio_controls[]  = {
+  [UAC_FBACK_CTRL] {
+    .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+    .name =         "Capture Pitch 1000000",
+    .info =         u_audio_pitch_info,
+    .get =          u_audio_pitch_get,
+    .put =          u_audio_pitch_put,
+  },
+  [UAC_MUTE_CTRL] {
+		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name =		"", /* will be filled later */
+		.info =		u_audio_mute_info,
+		.get =		u_audio_mute_get,
+		.put =		u_audio_mute_put,
+	},
+	[UAC_VOLUME_CTRL] {
+		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name =		"", /* will be filled later */
+		.info =		u_audio_volume_info,
+		.get =		u_audio_volume_get,
+		.put =		u_audio_volume_put,
+	},
 };
 
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
@@ -675,7 +936,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	struct snd_kcontrol *kctl;
 	struct uac_params *params;
 	int p_chmask, c_chmask;
-	int err;
+	int i, err;
 
 	if (!g_audio)
 		return -EINVAL;
@@ -693,7 +954,8 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	if (c_chmask) {
 		struct uac_rtd_params *prm = &uac->c_prm;
 
-		uac->c_prm.uac = uac;
+    spin_lock_init(&prm->lock);
+    uac->c_prm.uac = uac;
 		prm->max_psize = g_audio->out_ep_maxpsize;
 
 		prm->reqs = kcalloc(params->req_number,
@@ -716,6 +978,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	if (p_chmask) {
 		struct uac_rtd_params *prm = &uac->p_prm;
 
+		spin_lock_init(&prm->lock);
 		uac->p_prm.uac = uac;
 		prm->max_psize = g_audio->in_ep_maxpsize;
 
@@ -760,10 +1023,18 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &uac_pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &uac_pcm_ops);
 
-	if (c_chmask && g_audio->in_ep_fback) {
+	/*
+	 * Create mixer and controls
+	 * Create only if it's required on USB side
+	 */
+	if ((c_chmask && g_audio->in_ep_fback)
+			|| (p_chmask && params->p_fu.id)
+			|| (c_chmask && params->c_fu.id))
 		strscpy(card->mixername, card_name, sizeof(card->driver));
 
-		kctl = snd_ctl_new1(&u_audio_controls[0], &uac->c_prm);
+	if (c_chmask && g_audio->in_ep_fback) {
+		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
+				    &uac->c_prm);
 		if (!kctl) {
 			err = -ENOMEM;
 			goto snd_fail;
@@ -777,6 +1048,82 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			goto snd_fail;
 	}
 
+	for (i = 0; i <= SNDRV_PCM_STREAM_LAST; i++) {
+		struct uac_rtd_params *prm;
+		struct uac_fu_params *fu;
+		char ctrl_name[24];
+		char *direction;
+
+		if (!pcm->streams[i].substream_count)
+			continue;
+
+		if (i == SNDRV_PCM_STREAM_PLAYBACK) {
+			prm = &uac->p_prm;
+			fu = &params->p_fu;
+			direction = "Playback";
+		} else {
+			prm = &uac->c_prm;
+			fu = &params->c_fu;
+			direction = "Capture";
+		}
+
+		prm->fu_id = fu->id;
+
+		if (fu->mute_present) {
+			snprintf(ctrl_name, sizeof(ctrl_name),
+					"PCM %s Switch", direction);
+
+			u_audio_controls[UAC_MUTE_CTRL].name = ctrl_name;
+
+			kctl = snd_ctl_new1(&u_audio_controls[UAC_MUTE_CTRL],
+					    prm);
+			if (!kctl) {
+				err = -ENOMEM;
+				goto snd_fail;
+			}
+
+			kctl->id.device = pcm->device;
+			kctl->id.subdevice = i;
+
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
+				goto snd_fail;
+			prm->snd_kctl_mute = kctl;
+			prm->mute = 0;
+		}
+
+		if (fu->volume_present) {
+			snprintf(ctrl_name, sizeof(ctrl_name),
+					"PCM %s Volume", direction);
+
+			u_audio_controls[UAC_VOLUME_CTRL].name = ctrl_name;
+
+			kctl = snd_ctl_new1(&u_audio_controls[UAC_VOLUME_CTRL],
+					    prm);
+			if (!kctl) {
+				err = -ENOMEM;
+				goto snd_fail;
+			}
+
+			kctl->id.device = pcm->device;
+			kctl->id.subdevice = i;
+
+
+			kctl->tlv.c = u_audio_volume_tlv;
+			kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+					SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+
+			err = snd_ctl_add(card, kctl);
+			if (err < 0)
+				goto snd_fail;
+			prm->snd_kctl_volume = kctl;
+			prm->volume = fu->volume_max;
+			prm->volume_max = fu->volume_max;
+			prm->volume_min = fu->volume_min;
+			prm->volume_res = fu->volume_res;
+		}
+	}
+
 	strscpy(card->driver, card_name, sizeof(card->driver));
 	strscpy(card->shortname, card_name, sizeof(card->shortname));
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index a218cdf771fe..001a79a46022 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -19,16 +19,30 @@
  */
 #define FBACK_SLOW_MAX	250
 
+/* Feature Unit parameters */
+struct uac_fu_params {
+	int id;			/* Feature Unit ID */
+
+	bool mute_present;	/* mute control enable */
+
+	bool volume_present;	/* volume control enable */
+	s16 volume_min;		/* min volume in 1/256 dB */
+	s16 volume_max;		/* max volume in 1/256 dB */
+	s16 volume_res;		/* volume resolution in 1/256 dB */
+};
+
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
 	int p_srate;	/* rate in Hz */
 	int p_ssize;	/* sample size */
+	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
 	int c_chmask;	/* channel mask */
 	int c_srate;	/* rate in Hz */
 	int c_ssize;	/* sample size */
+	struct uac_fu_params c_fu;	/* Feature Unit parameters */
 
 	int req_number; /* number of preallocated requests */
 	int fb_max;	/* upper frequency drift feedback limit per-mil */
@@ -49,6 +63,9 @@ struct g_audio {
 	/* Max packet size for all out_ep possible speeds */
 	unsigned int out_ep_maxpsize;
 
+	/* Notify UAC driver about control change */
+	int (*notify)(struct g_audio *g_audio, int unit_id, int cs);
+
 	/* The ALSA Sound Card it represents on the USB-Client side */
 	struct snd_uac_chip *uac;
 
@@ -94,4 +111,9 @@ void u_audio_stop_capture(struct g_audio *g_audio);
 int u_audio_start_playback(struct g_audio *g_audio);
 void u_audio_stop_playback(struct g_audio *g_audio);
 
+int u_audio_get_volume(struct g_audio *g_audio, int playback, s16 *val);
+int u_audio_set_volume(struct g_audio *g_audio, int playback, s16 val);
+int u_audio_get_mute(struct g_audio *g_audio, int playback, int *val);
+int u_audio_set_mute(struct g_audio *g_audio, int playback, int val);
+
 #endif /* __U_AUDIO_H */
-- 
2.25.1

