Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9E82DFF3A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 19:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgLUSFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 13:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLUSFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 13:05:38 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F058FC061282
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:04:57 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id j22so14642669eja.13
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jskPg/JNftDq6XGRLoJGmRDxx5qATPuCeD9qSRQFjug=;
        b=HFj1AGT9hr83R33/pq3M9sZqzZboMYoDL/RrYGKB3LRz4TMVZDhjI63rlO2Nz/EVyM
         U41AgCq9qRnaYXyxAW8LFLev5ndgijD6e+xObtmPU3CBF2K1UbovnT6hUS91ekn4HQMR
         KYfyxYTSUnz0VlZbvcBloy0yRzUfrsvBT2A784juRtbCJjZ0LT+xUWLZFP29189KLSWZ
         RNuZs8izX6Rh3YFzruI/b0nwMuUhl9w16gOwczBFWXtbKpybwX/0mWut3FkdeUBFQh9l
         6u3pGhALYxb0WXjY/j0uWgfqtQl6Rd6fNTi2nwMmVVjNf7Tx9z1DD3I2bYVSOU7yoHMv
         CEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jskPg/JNftDq6XGRLoJGmRDxx5qATPuCeD9qSRQFjug=;
        b=J13YceAUoKYhej3ccFlfRAjvitfOguYWX23OGAJL7KzEqTe/kwqQnbtmef8GxtF0oq
         NBcYbFqfolhsV8MIvEBVgtj+9J1fTO/nfxdyk3Hg9uF57u2tu8/21E31X2S1CEcngRYw
         eXzLq4Ucoi0RdMoeeELIcu5FoQvJ8LOdgg4tngRWtgOYCsYigaoajIe21FphTzSTtrRx
         ObFoCoRtjGxsABiuMTTLrCdS+PP1Cpug1pggjO7wTi0KUENcNzS9jmwwAYSZE22I4gm/
         V3D6S5otMvGrbZXPVwn4F+2vahi4jD3sczTKVh4EEKV7TVDPC6tcGjutyXJ6D5EoSXyx
         LnDQ==
X-Gm-Message-State: AOAM531je2E3mwIQvJEu1SnYYn2ShSv7rNhesHLIXS/rkA282d03QyGC
        dr4jKdEAJAC4c1i4wsFEaWOA4jcDM7oPVYlX
X-Google-Smtp-Source: ABdhPJxUIY6Gyc02PD/88pkXtWIJLffLL5Xru/yDlfXs2VbhjCKEu4AFwb7HRe1B9R1W6adGlFEYuw==
X-Received: by 2002:a50:eb97:: with SMTP id y23mr16939005edr.29.1608572144956;
        Mon, 21 Dec 2020 09:35:44 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id dd18sm9338408ejb.53.2020.12.21.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 09:35:44 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] usb: gadget: u_audio: clean up locking
Date:   Mon, 21 Dec 2020 18:35:31 +0100
Message-Id: <20201221173531.215169-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221173531.215169-1-jbrunet@baylibre.com>
References: <20201221173531.215169-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

snd_pcm_stream_lock() is held when the ALSA .trigger() callback is called.
The lock of 'struct uac_rtd_params' is not necessary since all its locking
operation are done under the snd_pcm_stream_lock() too.

Also, usb_request .complete() is called with irqs disabled, so saving and
restoring the irqs is not necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/gadget/function/u_audio.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 3eba31b8ebcb..d94f95edca40 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -36,9 +36,8 @@ struct uac_rtd_params {
 	void *rbuf;
 
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
-	struct usb_request **reqs;
 
-	spinlock_t lock;
+	struct usb_request **reqs;
 };
 
 struct snd_uac_chip {
@@ -74,7 +73,6 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	unsigned int pending;
-	unsigned long flags, flags2;
 	unsigned int hw_ptr;
 	int status = req->status;
 	struct snd_pcm_substream *substream;
@@ -105,16 +103,14 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	if (!substream)
 		goto exit;
 
-	snd_pcm_stream_lock_irqsave(substream, flags2);
+	snd_pcm_stream_lock(substream);
 
 	runtime = substream->runtime;
 	if (!runtime || !snd_pcm_running(substream)) {
-		snd_pcm_stream_unlock_irqrestore(substream, flags2);
+		snd_pcm_stream_unlock(substream);
 		goto exit;
 	}
 
-	spin_lock_irqsave(&prm->lock, flags);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		/*
 		 * For each IN packet, take the quotient of the current data
@@ -141,8 +137,6 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 
 	hw_ptr = prm->hw_ptr;
 
-	spin_unlock_irqrestore(&prm->lock, flags);
-
 	/* Pack USB load in ALSA ring buffer */
 	pending = runtime->dma_bytes - hw_ptr;
 
@@ -166,12 +160,10 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		}
 	}
 
-	spin_lock_irqsave(&prm->lock, flags);
 	/* update hw_ptr after data is copied to memory */
 	prm->hw_ptr = (hw_ptr + req->actual) % runtime->dma_bytes;
 	hw_ptr = prm->hw_ptr;
-	spin_unlock_irqrestore(&prm->lock, flags);
-	snd_pcm_stream_unlock_irqrestore(substream, flags2);
+	snd_pcm_stream_unlock(substream);
 
 	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
 		snd_pcm_period_elapsed(substream);
@@ -187,7 +179,6 @@ static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct uac_rtd_params *prm;
 	struct g_audio *audio_dev;
 	struct uac_params *params;
-	unsigned long flags;
 	int err = 0;
 
 	audio_dev = uac->audio_dev;
@@ -198,8 +189,6 @@ static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	else
 		prm = &uac->c_prm;
 
-	spin_lock_irqsave(&prm->lock, flags);
-
 	/* Reset */
 	prm->hw_ptr = 0;
 
@@ -216,8 +205,6 @@ static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		err = -EINVAL;
 	}
 
-	spin_unlock_irqrestore(&prm->lock, flags);
-
 	/* Clear buffer after Play stops */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && !prm->ss)
 		memset(prm->rbuf, 0, prm->max_psize * params->req_number);
@@ -280,14 +267,12 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw = uac_pcm_hardware;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		spin_lock_init(&uac->p_prm.lock);
 		runtime->hw.rate_min = p_srate;
 		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
 		runtime->hw.channels_min = num_channels(p_chmask);
 		runtime->hw.period_bytes_min = 2 * uac->p_prm.max_psize
 						/ runtime->hw.periods_min;
 	} else {
-		spin_lock_init(&uac->c_prm.lock);
 		runtime->hw.rate_min = c_srate;
 		runtime->hw.formats = uac_ssize_to_fmt(c_ssize);
 		runtime->hw.channels_min = num_channels(c_chmask);
-- 
2.29.2

