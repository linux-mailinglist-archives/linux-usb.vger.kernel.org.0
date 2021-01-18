Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C402F9B89
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 09:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388081AbhARIum (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 03:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387991AbhARIua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 03:50:30 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D657C061573
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:49:45 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id h17so12625716wmq.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YN9R4ncGY5I9okKgQc69PrWQgu7d0QiAoW90YzkPRN0=;
        b=MV+UnwxtiGCI8jrwIqDhEbvHnsfQ5+GVMYufMM1BUhj6Lb0wjtNv7PNIFd8vp6JqrC
         IPGrI3FRR5IyfhysBMa4E1pu/9s+4VXHK6xIqE014azlv2aEVlQlKPevDPMrQ7WYMNn5
         YqjqCO3lxFUuQYjev2zyPN4OeEMt+m85/lba3qSYiHxzKJ+r6KR+W+bWO73M4YZHMHum
         hPvc5Y9LiB9RH2C5MsIX3JjFX7GCwE+ay/jCUpIIIQS6aZmVqqZ7ifiSd7eo55gECvhY
         zvj/Bf54BV/n//RH4A5KfBNd5BZCmsaewhveucEqrWHo0mNFxA6mvLqerxcRRZvD6YIk
         BgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YN9R4ncGY5I9okKgQc69PrWQgu7d0QiAoW90YzkPRN0=;
        b=O1pF+XjQO6ynYpkSr8HYHpdl64k4F+qfVvMKQWDyoXOSnZzTv4UWIMESvmnfMdW7c4
         drto33eTIBVL5/WRJaLhNc4ED29GyHl2XFF+UxHoW5jly+D6zOJtN8HLzvXxqZeJEj2K
         h99aCfK8ZUu/QaKmii0+JlVSMeq/6UzTlFIH3R3u2zl+9ESwBZHUjMY43mqqIJj/5Dzn
         PGb4RTTQHdB33XKZr3gCccJNVVmeGBzGsR8YeVrsR7Pi6vM9tVhmMPuPiLe1lmIKmjJd
         XDJznzdFu6u1lqH2OGfzPlzTVcdxFYQmfK1Kl9+yWUJVPaXga8YXWdUoSSJFL6bz6tru
         YO/Q==
X-Gm-Message-State: AOAM531pMSrWuZYsG79Gz6SQzrfqkE0WW3vaWxKv4IkTBffeIk4Ne0Gr
        mEdWaeBV9E2E3jZoM9Eq39v2Vg==
X-Google-Smtp-Source: ABdhPJy/7OMoaWqMuEm6P+3Q8gsO7TaNnKdg06NDgx/qL3v/fi3h/pyveEv9nqcLs7uDFoQATh/b1g==
X-Received: by 2002:a05:600c:1483:: with SMTP id c3mr19638067wmh.87.1610959783969;
        Mon, 18 Jan 2021 00:49:43 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id a24sm18205619wmj.17.2021.01.18.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 00:49:43 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] usb: gadget: u_audio: clean up locking
Date:   Mon, 18 Jan 2021 09:49:31 +0100
Message-Id: <20210118084931.322861-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118084642.322510-1-jbrunet@baylibre.com>
References: <20210118084642.322510-1-jbrunet@baylibre.com>
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

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/gadget/function/u_audio.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index a1a1f4c8685c..265c4d805f81 100644
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

