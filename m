Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7FE488925
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbiAIMAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:02 -0500
Received: from cable.insite.cz ([84.242.75.189]:60607 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235396AbiAIMAB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A962BA1A3D40E;
        Sun,  9 Jan 2022 12:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729599; bh=PlKK2zKya4UR0/vBAJQnuw3XG/toTKbVMT/u4agQgio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y9NSqYTHmKShOpnqY65rjp/Du7FaZ5n/zLEmIXSbpOu1kHTBkkoLuiaHKzpDk+v9v
         3QHZKFr6CBP2B3XOlNsMC/pYdv7oBrLlrxK+v/8QILjwIJvrvn1Vc9Y0b/fgYCoV57
         vxn0be6wih3LiSoI2Uym4jlHIVuKin8IAaqIfMcc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rlc35bIxVa86; Sun,  9 Jan 2022 12:59:54 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D2651A1A3D409;
        Sun,  9 Jan 2022 12:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729592; bh=PlKK2zKya4UR0/vBAJQnuw3XG/toTKbVMT/u4agQgio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M7SrNv2lutWFOKcnLKT3oYDpYhPJkF4BDDokwTZNlAmfba6KTMGZy9SwtienrAnwU
         6aqPl9G+PSc2ovAi2PWq3l/X2N2kygNTIcLC8O75sAu+rVq3MVdKualk68Tic10smV
         OjK86pb+bxHjLtekWoK648cUHQKe2XIpbtTYkWIA=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 08/11] usb: gadget: u_audio: Rate ctl notifies about current srate (0=stopped)
Date:   Sun,  9 Jan 2022 12:59:43 +0100
Message-Id: <20220109115946.392818-9-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Playback/Capture ctl currently reports rate value set by USB
control selector UAC2_CS_CONTROL_SAM_FREQ (fixed for UAC1). When the
stops playback/capture, the reported value does not change.  The gadget
side has no information whether the host has started/stopped
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
v3:
* using prm->srate instead of params->c_srate/p_srate due to the added commit
  "[v3] usb: gadget: u_audio: Move dynamic srate from params to rtd"
---
 drivers/usb/gadget/function/u_audio.c | 28 ++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 283a449a9538..fab1bc439002 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -65,6 +65,7 @@ struct uac_rtd_params {
 
 	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */
 	int srate; /* selected samplerate */
+	int active; /* playback/capture running */
 
   spinlock_t lock; /* lock for control transfers */
 
@@ -490,6 +491,21 @@ static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
 		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
 }
 
+static void set_active(struct uac_rtd_params *prm, bool active)
+{
+	// notifying through the Rate ctrl
+	struct snd_kcontrol *kctl = prm->snd_kctl_rate;
+	unsigned long flags;
+
+	spin_lock_irqsave(&prm->lock, flags);
+	if (prm->active != active) {
+		prm->active = active;
+		snd_ctl_notify(prm->uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				&kctl->id);
+	}
+	spin_unlock_irqrestore(&prm->lock, flags);
+}
+
 int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate)
 {
 	struct uac_params *params = &audio_dev->params;
@@ -607,6 +623,8 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
+	set_active(&uac->c_prm, true);
+
 	ep_fback = audio_dev->in_ep_fback;
 	if (!ep_fback)
 		return 0;
@@ -652,6 +670,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	set_active(&uac->c_prm, false);
 	if (audio_dev->in_ep_fback)
 		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
@@ -723,6 +742,8 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
+	set_active(&uac->p_prm, true);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(u_audio_start_playback);
@@ -731,6 +752,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	set_active(&uac->p_prm, false);
 	free_ep(&uac->p_prm, audio_dev->in_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
@@ -1074,7 +1096,11 @@ static int u_audio_rate_get(struct snd_kcontrol *kcontrol,
 	unsigned long flags;
 
 	spin_lock_irqsave(&prm->lock, flags);
-	ucontrol->value.integer.value[0] = prm->srate;
+	if (prm->active)
+		ucontrol->value.integer.value[0] = prm->srate;
+	else
+		/* not active: reporting zero rate */
+		ucontrol->value.integer.value[0] = 0;
 	spin_unlock_irqrestore(&prm->lock, flags);
 	return 0;
 }
-- 
2.25.1

