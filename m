Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B3647B4D6
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhLTVLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:47 -0500
Received: from cable.insite.cz ([84.242.75.189]:47382 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhLTVLp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 7B689A1A3D404;
        Mon, 20 Dec 2021 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034703; bh=4cg2A1gETsfLPgX1bNxerCaugEwwxGd1dUXYkPhu0uI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IpHkUEWxM0+nYTzvxHhJOQ6XoP122KnAbLGwf9XFrY+AvVRpLys+zI8iYCfUUoLbb
         E7DQD7wD+mxa7mwzFDxKWBAQ87/9VQ26HmSBPNU2WZpXb6IA2u3440sUTULrdM6mQn
         /7ecYKYDDvKqbqrUdZgce2/2PhdgxkmxjcAn7J9I=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YrtnCXODN8cw; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 22A92A1A3D407;
        Mon, 20 Dec 2021 22:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034694; bh=4cg2A1gETsfLPgX1bNxerCaugEwwxGd1dUXYkPhu0uI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MIImZAB1MKlqFKQHGcXarZCl0qY7ob9+4wQLy0lW8e2ACjXx0IxH5ZC4w2bR5ZwAb
         B5Ig7nBwZAhYgN/dBiD1Z9L7BQccRZt8Oqmo7n/ETAkyFas20c7ml7dFsxQFQl9DiO
         bHnxZ1dJ5WSVPT27vR4mbaO7TC/xa3V+bwMrDh7M=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 07/11] usb: gadget: u_audio: Stopping PCM substream at capture/playback stop
Date:   Mon, 20 Dec 2021 22:11:26 +0100
Message-Id: <20211220211130.88590-8-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the USB host stops capture/playback, the corresponding PCM
substream (if activated and running) is stopped and drained.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/u_audio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index a6293415c071..9dbce51c2eb7 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -544,6 +544,20 @@ static void set_reported_srate(struct uac_rtd_params *prm, int srate)
 	}
 }
 
+static void stop_substream(struct uac_rtd_params *prm)
+{
+	unsigned long _flags;
+	struct snd_pcm_substream *substream;
+
+	substream = prm->ss;
+	if (substream) {
+		snd_pcm_stream_lock_irqsave(substream, _flags);
+		if (snd_pcm_running(substream))
+			snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
+		snd_pcm_stream_unlock_irqrestore(substream, _flags);
+	}
+}
+
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
@@ -630,6 +644,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	stop_substream(&uac->c_prm);
 	set_reported_srate(&uac->c_prm, 0);
 	if (audio_dev->in_ep_fback)
 		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
@@ -713,6 +728,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	stop_substream(&uac->p_prm);
 	set_reported_srate(&uac->p_prm, 0);
 	free_ep(&uac->p_prm, audio_dev->in_ep);
 }
-- 
2.25.1

