Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D731B47A5FC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhLTIZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:25:52 -0500
Received: from cable.insite.cz ([84.242.75.189]:60365 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229874AbhLTIZv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 03:25:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id EFB56A1A3D400;
        Mon, 20 Dec 2021 09:25:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988749; bh=ahBtijJ5iunVsC4K1uKqZgjRN0ieDvzhhXBg11RqPzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FoOt5YBpI+zjmhwt5Mfk/57yjnorkhbAhYhA4b7o1vjHFy2z3k7XUTCt1I3O4+tN4
         m5c5nQ4GqpheUB+fOEk8rx5WtP91qYap7zf07PcbWM5WIoec5DSJrdkXPN4qlfmVXr
         P1Rbzo0m82ylq9Usj1XkIfcocnzhF1BDOrLOJ1GI=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HaflhKrTUy7z; Mon, 20 Dec 2021 09:25:44 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 26CFEA1A3D402;
        Mon, 20 Dec 2021 09:25:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988744; bh=ahBtijJ5iunVsC4K1uKqZgjRN0ieDvzhhXBg11RqPzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nbBhQuPLjpa/6XK4hwMlyuEXLHz+byNuw7y/FhSKrWyHkztRJcN+A1G4AQVJ/AYAN
         kLqNprCgRLWKLkA9mwFv7Gv4WEAkXWrLkFb4L4rOZD+qPD/5O1yWR2SqFYBBmHDpHr
         f6X5vb3MdZ19mAzmdpzuuGcNJE5ATg/a+dgAg448=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 02/11] usb: gadget: u_audio: Support multiple sampling rates
Date:   Mon, 20 Dec 2021 09:25:33 +0100
Message-Id: <20211220082542.13750-3-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220082542.13750-1-pavel.hofman@ivitera.com>
References: <20211220082542.13750-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Julian Scheel <julian@jusst.de>

Implement support for multiple sampling rates in u_audio part of the
audio gadget. The currently configured rates are exposed through
read-only amixer controls 'Capture Rate' and 'Playback Rate'.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac1.c     |   2 +
 drivers/usb/gadget/function/f_uac2.c     |   2 +
 drivers/usb/gadget/function/u_audio.c    | 135 +++++++++++++++++++++++
 drivers/usb/gadget/function/u_audio.h    |  10 +-
 drivers/usb/gadget/function/uac_common.h |   9 ++
 5 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/gadget/function/uac_common.h

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 03f50643fbba..ccb0e4f41e5d 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1298,6 +1298,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->in_ep_maxpsize = le16_to_cpu(as_in_ep_desc.wMaxPacketSize);
 	audio->params.c_chmask = audio_opts->c_chmask;
 	audio->params.c_srate = audio_opts->c_srate;
+	audio->params.c_srates[0] = audio_opts->c_srate;
 	audio->params.c_ssize = audio_opts->c_ssize;
 	if (FUIN_EN(audio_opts)) {
 		audio->params.p_fu.id = USB_IN_FU_ID;
@@ -1310,6 +1311,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 	audio->params.p_chmask = audio_opts->p_chmask;
 	audio->params.p_srate = audio_opts->p_srate;
+	audio->params.p_srates[0] = audio_opts->p_srate;
 	audio->params.p_ssize = audio_opts->p_ssize;
 	if (FUOUT_EN(audio_opts)) {
 		audio->params.c_fu.id = USB_OUT_FU_ID;
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index f8c1f406f19b..1d6e426e5078 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1210,6 +1210,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
 	agdev->params.p_srate = uac2_opts->p_srate;
+	agdev->params.p_srates[0] = uac2_opts->p_srate;
 	agdev->params.p_ssize = uac2_opts->p_ssize;
 	if (FUIN_EN(uac2_opts)) {
 		agdev->params.p_fu.id = USB_IN_FU_ID;
@@ -1221,6 +1222,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
 	agdev->params.c_srate = uac2_opts->c_srate;
+	agdev->params.c_srates[0] = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	if (FUOUT_EN(uac2_opts)) {
 		agdev->params.c_fu.id = USB_OUT_FU_ID;
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 4f6c0049c534..e737a104156d 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -32,6 +32,7 @@ enum {
 	UAC_P_PITCH_CTRL,
 	UAC_MUTE_CTRL,
 	UAC_VOLUME_CTRL,
+	UAC_RATE_CTRL,
 };
 
 /* Runtime data params for one stream */
@@ -62,6 +63,8 @@ struct uac_rtd_params {
   s16 volume;
   int mute;
 
+	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */
+
   spinlock_t lock; /* lock for control transfers */
 
 };
@@ -490,6 +493,48 @@ static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
 		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
 }
 
+int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate)
+{
+	struct uac_params *params = &audio_dev->params;
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm = &uac->c_prm;
+	int i;
+
+	dev_dbg(&audio_dev->gadget->dev, "%s: srate %d\n", __func__, srate);
+	for (i = 0; i < UAC_MAX_RATES; i++) {
+		if (params->c_srates[i] == srate) {
+			params->c_srate = srate;
+			return 0;
+		}
+		if (params->c_srates[i] == 0)
+			break;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(u_audio_set_capture_srate);
+
+int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm = &uac->p_prm;
+	struct uac_params *params = &audio_dev->params;
+	int i;
+
+	dev_dbg(&audio_dev->gadget->dev, "%s: srate %d\n", __func__, srate);
+	for (i = 0; i < UAC_MAX_RATES; i++) {
+		if (params->p_srates[i] == srate) {
+			params->p_srate = srate;
+			return 0;
+		}
+		if (params->p_srates[i] == 0)
+			break;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(u_audio_set_playback_srate);
+
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
@@ -501,6 +546,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;
 
+	dev_dbg(dev, "start capture with rate %d\n", params->c_srate);
 	ep = audio_dev->out_ep;
 	prm = &uac->c_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
@@ -593,6 +639,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	int req_len, i;
 	unsigned int p_interval, p_pktsize;
 
+	dev_dbg(dev, "start playback with rate %d\n", params->p_srate);
 	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
@@ -941,6 +988,68 @@ static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
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
+static int get_min_srate(const int *srates)
+{
+	int i, min_srate = INT_MAX;
+
+	for (i = 0; i < UAC_MAX_RATES; i++) {
+		if (srates[i] == 0)
+			break;
+		if (srates[i] < min_srate)
+			min_srate = srates[i];
+	}
+	return min_srate;
+}
+
+static int uac_pcm_rate_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	const int *srates;
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+
+	if (prm == &uac->c_prm)
+		srates = params->c_srates;
+	else
+		srates = params->p_srates;
+	uinfo->value.integer.min = get_min_srate(srates);
+	uinfo->value.integer.max = get_max_srate(srates);
+	return 0;
+}
+
+static int uac_pcm_rate_get(struct snd_kcontrol *kcontrol,
+						 struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	struct uac_params *params = &audio_dev->params;
+
+	if (prm == &uac->c_prm)
+		ucontrol->value.integer.value[0] = params->c_srate;
+	else
+		ucontrol->value.integer.value[0] = params->p_srate;
+
+	return 0;
+}
 
 static struct snd_kcontrol_new u_audio_controls[]  = {
   [UAC_FBACK_CTRL] {
@@ -971,6 +1080,13 @@ static struct snd_kcontrol_new u_audio_controls[]  = {
 		.get =		u_audio_volume_get,
 		.put =		u_audio_volume_put,
 	},
+	[UAC_RATE_CTRL] {
+		.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
+		.name =		"", /* will be filled later */
+		.access =	SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info =		uac_pcm_rate_info,
+		.get =		uac_pcm_rate_get,
+	},
 };
 
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
@@ -1184,6 +1300,25 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			prm->volume_min = fu->volume_min;
 			prm->volume_res = fu->volume_res;
 		}
+
+		/* Add rate control */
+		snprintf(ctrl_name, sizeof(ctrl_name),
+				"%s Rate", direction);
+		u_audio_controls[UAC_RATE_CTRL].name = ctrl_name;
+
+		kctl = snd_ctl_new1(&u_audio_controls[UAC_RATE_CTRL], prm);
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
+		prm->snd_kctl_rate = kctl;
 	}
 
 	strscpy(card->driver, card_name, sizeof(card->driver));
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 8dfdae1721cd..76b5b8169444 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -10,6 +10,7 @@
 #define __U_AUDIO_H
 
 #include <linux/usb/composite.h>
+#include "uac_common.h"
 
 /*
  * Same maximum frequency deviation on the slower side as in
@@ -40,13 +41,15 @@ struct uac_fu_params {
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
-	int p_srate;	/* rate in Hz */
+	int p_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
+	int p_srate;	/* selected rate in Hz */
 	int p_ssize;	/* sample size */
 	struct uac_fu_params p_fu;	/* Feature Unit parameters */
 
 	/* capture */
 	int c_chmask;	/* channel mask */
-	int c_srate;	/* rate in Hz */
+	int c_srates[UAC_MAX_RATES];	/* available rates in Hz (0 terminated list) */
+	int c_srate;	/* selected rate in Hz */
 	int c_ssize;	/* sample size */
 	struct uac_fu_params c_fu;	/* Feature Unit parameters */
 
@@ -117,6 +120,9 @@ void u_audio_stop_capture(struct g_audio *g_audio);
 int u_audio_start_playback(struct g_audio *g_audio);
 void u_audio_stop_playback(struct g_audio *g_audio);
 
+int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate);
+int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate);
+
 int u_audio_get_volume(struct g_audio *g_audio, int playback, s16 *val);
 int u_audio_set_volume(struct g_audio *g_audio, int playback, s16 val);
 int u_audio_get_mute(struct g_audio *g_audio, int playback, int *val);
diff --git a/drivers/usb/gadget/function/uac_common.h b/drivers/usb/gadget/function/uac_common.h
new file mode 100644
index 000000000000..3ecf89d6e814
--- /dev/null
+++ b/drivers/usb/gadget/function/uac_common.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ */
+
+#ifndef UAC_COMMON_H
+#define UAC_COMMON_H
+
+#define UAC_MAX_RATES 10 /* maximum number of rates configurable by f_uac1/2 */
+#endif
-- 
2.25.1

