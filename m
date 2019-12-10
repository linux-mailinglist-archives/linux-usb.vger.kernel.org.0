Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72CE8118AA2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 15:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfLJOSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 09:18:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:35824 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727178AbfLJOSb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 09:18:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AD14AB1F7;
        Tue, 10 Dec 2019 14:18:29 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH for-5.6 1/2] usb: gadget: u_audio: Use managed buffer allocation
Date:   Tue, 10 Dec 2019 15:18:21 +0100
Message-Id: <20191210141822.18705-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210141822.18705-1-tiwai@suse.de>
References: <20191210141822.18705-1-tiwai@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/u_audio.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 7ec6a996af26..67c4c85433d1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -239,18 +239,6 @@ static snd_pcm_uframes_t uac_pcm_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(substream->runtime, prm->hw_ptr);
 }
 
-static int uac_pcm_hw_params(struct snd_pcm_substream *substream,
-			       struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-static int uac_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int uac_pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
@@ -327,8 +315,6 @@ static const struct snd_pcm_ops uac_pcm_ops = {
 	.open = uac_pcm_open,
 	.close = uac_pcm_null,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = uac_pcm_hw_params,
-	.hw_free = uac_pcm_hw_free,
 	.trigger = uac_pcm_trigger,
 	.pointer = uac_pcm_pointer,
 	.prepare = uac_pcm_null,
@@ -584,8 +570,8 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	strlcpy(card->shortname, card_name, sizeof(card->shortname));
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-					      NULL, 0, BUFF_SIZE_MAX);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, 0, BUFF_SIZE_MAX);
 
 	err = snd_card_register(card);
 
-- 
2.16.4

