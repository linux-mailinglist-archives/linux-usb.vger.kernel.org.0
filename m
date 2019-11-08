Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBD5F5158
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 17:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfKHQmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Nov 2019 11:42:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:38694 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725941AbfKHQmd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Nov 2019 11:42:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C8DB9AC11;
        Fri,  8 Nov 2019 16:42:31 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: u_audio: Remove superfluous snd_dma_continuous_data()
Date:   Fri,  8 Nov 2019 17:42:14 +0100
Message-Id: <20191108164214.611-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The recent change (commit 08422d2c559d: "ALSA: memalloc: Allow NULL
device for SNDRV_DMA_TYPE_CONTINOUS type") made the PCM preallocation
helper accepting NULL as the device pointer for the default usage.
Drop the snd_dma_continuous_data() usage that became superfluous from
the callers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>

---

Note that the prerequisite commit 08422d2c559d is found currently only
on for-next branch of sound git tree, so please give ACK if it's OK,
so that I can apply on top of it.  Thanks!

 drivers/usb/gadget/function/u_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 56906d15fb55..7ec6a996af26 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -585,7 +585,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	sprintf(card->longname, "%s %i", card_name, card->dev->id);
 
 	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-		snd_dma_continuous_data(GFP_KERNEL), 0, BUFF_SIZE_MAX);
+					      NULL, 0, BUFF_SIZE_MAX);
 
 	err = snd_card_register(card);
 
-- 
2.16.4

