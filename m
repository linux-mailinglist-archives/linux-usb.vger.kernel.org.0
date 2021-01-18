Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D282F9B7D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 09:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbhARIsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 03:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387946AbhARIsQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 03:48:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4532EC0613D3
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:47:05 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id m4so15579959wrx.9
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 00:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8u2QoVss2UavcelbE4BrawmKFXEyru6c+YRhQ7iYuuo=;
        b=Sm3PhrpBPJ137AQ3z5B1ZzYmp5XOc27tFEKSH7DZzea2NsslTMdd4ll2jv+fInlKud
         P4fKiBDUoWVNbFzr2/SJ9PI+ALG3UxWl2WcmrjJyK9OVmlLKWzJccGondH2tASIDy7PN
         tyDelH5GLOhJplrYl7A4VOdiZKaedrunuuoW66BXfZI/Cw1l36Y1ItbluxTVrrDA9rMX
         9vYe7dWh0dmJt5lT0Peg4epzlQmlH4GLPtZaAGvIGljtspNHoqbQr7FuRarayJ4UOe0O
         GPQ8GlhC/nKpnWqOgGgMFtD+dDfqMVYdKCAAIaxbBhDyzBVZIjqpACvcLx2kiewzP+HJ
         ZkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8u2QoVss2UavcelbE4BrawmKFXEyru6c+YRhQ7iYuuo=;
        b=Lrm4TgAuXteVCJ7wfpDPSQ0NXhYqQrrvzKf+uUrDt2Vpo0mfcYMcsCcDAYClXsf+jn
         NUEKR6VVhwGUdlCN5PY0W4MzJzOreZ9cnL7FNOKrQ1qZsi6NiQMBei4UUYuYLfrgJowu
         7ouZFjSdDUzIwrrqchatk398zKXXm4R1EQ5Sf2ndeZsjBJz66QVnqPay5XB5ud+J8Aqt
         mXm/joWi11mN5B8mrUKQNeZnvmtBTgrtMzr21b13tBPSCJ+WoRyS0lL12Bfxz7+VXpwC
         NNRxQ7m89w0xPrO9sF0aXa2/nDtY++PCfRI7GDINiGE1gLWMX/pK/dk61p5b+9lgA0Pr
         sY2w==
X-Gm-Message-State: AOAM533O2ssovIw3wy83QcbV+GMo1+e+kxQerhmEcMqeQHpEIvaPA5gZ
        Fw4wKak1FaMhdhCjl7F85DBheQ==
X-Google-Smtp-Source: ABdhPJyOR062eJcPDrMUnJ6U36q+eusFtWUgiq9folxccNLxdBoqcFKCwo7r0JY1IdYXfHj37a8UOA==
X-Received: by 2002:adf:8503:: with SMTP id 3mr24920822wrh.56.1610959624016;
        Mon, 18 Jan 2021 00:47:04 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id y63sm26224518wmd.21.2021.01.18.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 00:47:03 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] usb: gadget: u_audio: factorize ssize to alsa fmt conversion
Date:   Mon, 18 Jan 2021 09:46:40 +0100
Message-Id: <20210118084642.322510-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118084642.322510-1-jbrunet@baylibre.com>
References: <20210118084642.322510-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Factorize format related code common to the capture and playback path.

Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/gadget/function/u_audio.c | 43 +++++++++++++--------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 908e49dafd62..27f941f71a9d 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -244,6 +244,25 @@ static snd_pcm_uframes_t uac_pcm_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(substream->runtime, prm->hw_ptr);
 }
 
+static u64 uac_ssize_to_fmt(int ssize)
+{
+	u64 ret;
+
+	switch (ssize) {
+	case 3:
+		ret = SNDRV_PCM_FMTBIT_S24_3LE;
+		break;
+	case 4:
+		ret = SNDRV_PCM_FMTBIT_S32_LE;
+		break;
+	default:
+		ret = SNDRV_PCM_FMTBIT_S16_LE;
+		break;
+	}
+
+	return ret;
+}
+
 static int uac_pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
@@ -269,34 +288,14 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		spin_lock_init(&uac->p_prm.lock);
 		runtime->hw.rate_min = p_srate;
-		switch (p_ssize) {
-		case 3:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S24_3LE;
-			break;
-		case 4:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
-			break;
-		default:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-			break;
-		}
+		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
 		runtime->hw.channels_min = num_channels(p_chmask);
 		runtime->hw.period_bytes_min = 2 * uac->p_prm.max_psize
 						/ runtime->hw.periods_min;
 	} else {
 		spin_lock_init(&uac->c_prm.lock);
 		runtime->hw.rate_min = c_srate;
-		switch (c_ssize) {
-		case 3:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S24_3LE;
-			break;
-		case 4:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
-			break;
-		default:
-			runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-			break;
-		}
+		runtime->hw.formats = uac_ssize_to_fmt(c_ssize);
 		runtime->hw.channels_min = num_channels(c_chmask);
 		runtime->hw.period_bytes_min = 2 * uac->c_prm.max_psize
 						/ runtime->hw.periods_min;
-- 
2.29.2

