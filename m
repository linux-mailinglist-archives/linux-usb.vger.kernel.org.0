Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAF6401C1C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 15:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242225AbhIFNJf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 09:09:35 -0400
Received: from cable.insite.cz ([84.242.75.189]:59638 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242248AbhIFNJf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Sep 2021 09:09:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 2A9F2A1A3D401;
        Mon,  6 Sep 2021 15:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1630933709; bh=q0okpm5kzlOLD5fr7XwjhNG+zaSKy33/Psiwz2HiBIM=;
        h=From:To:Cc:Subject:Date:From;
        b=FmDctSRUwFq6/0UPpe11hPPnAZy8k/pONA+O3nh2aDNgb7Rh4Zxm0hXP6k4QJij0h
         r25N0ejipMqb/I0ZnTsROE9XzaT8RP7R/2Qnp8B7vYQGdBuhz3JJveWWUy6KR9EJnB
         PVMkXWrmA0IQLe5xnV/lhPXVkySKWY8cZwzcltqU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9ytiQLD0Vw27; Mon,  6 Sep 2021 15:08:24 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id BBDCEA1A3D400;
        Mon,  6 Sep 2021 15:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1630933703; bh=q0okpm5kzlOLD5fr7XwjhNG+zaSKy33/Psiwz2HiBIM=;
        h=From:To:Cc:Subject:Date:From;
        b=Op9tFf53thhKyzAI2x2h1zQ8W2f/52k27WvK1Hrv5PPbeOgZx6jhel0MdEcaEXem1
         t8pyE6nGoT6lfos4XKJnzd8DSKn0tGPe1M8Z/EizjM7ZEtN2hx3+1zDEELwUiVk5Qi
         TLcx0Kw6h0y3OtVSd36WK/O54W7tljqX51qAsKIU=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] usb: gadget: u_audio: EP-OUT bInterval in fback frequency
Date:   Mon,  6 Sep 2021 15:08:22 +0200
Message-Id: <20210906130822.12256-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch increases the bitshift in feedback frequency
calculation with EP-OUT bInterval value.

Tests have revealed that Win10 and OSX UAC2 drivers require
the feedback frequency to be based on the actual packet
interval instead of on the USB2 microframe. Otherwise they
ignore the feedback value. Linux snd-usb-audio driver
detects the applied bitshift automatically.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f6b5b9547236..d2eef7d76981 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -96,11 +96,13 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 };
 
 static void u_audio_set_fback_frequency(enum usb_device_speed speed,
+					struct usb_ep *out_ep,
 					unsigned long long freq,
 					unsigned int pitch,
 					void *buf)
 {
 	u32 ff = 0;
+	const struct usb_endpoint_descriptor *ep_desc;
 
 	/*
 	 * Because the pitch base is 1000000, the final divider here
@@ -128,8 +130,13 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * byte fromat (that is Q16.16)
 		 *
 		 * ff = (freq << 16) / 8000
+		 *
+		 * Win10 and OSX UAC2 drivers require number of samples per packet
+		 * in order to honor the feedback value.
+		 * Linux snd-usb-audio detects the applied bit-shift automatically.
 		 */
-		freq <<= 4;
+		ep_desc = out_ep->desc;
+		freq <<= 4 + (ep_desc->bInterval - 1);
 	}
 
 	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), 1953125);
@@ -261,7 +268,7 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 		pr_debug("%s: iso_complete status(%d) %d/%d\n",
 			__func__, status, req->actual, req->length);
 
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+	u_audio_set_fback_frequency(audio_dev->gadget->speed, audio_dev->out_ep,
 				    params->c_srate, prm->pitch,
 				    req->buf);
 
@@ -519,7 +526,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	 * be meauserd at start of playback
 	 */
 	prm->pitch = 1000000;
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+	u_audio_set_fback_frequency(audio_dev->gadget->speed, ep,
 				    params->c_srate, prm->pitch,
 				    req_fback->buf);
 
-- 
2.25.1

