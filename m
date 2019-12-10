Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDACB118AA3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 15:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfLJOSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 09:18:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:35830 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727272AbfLJOSb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 09:18:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C0094B1FA;
        Tue, 10 Dec 2019 14:18:29 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH for-5.6 2/2] usb: gadget: u_audio: Drop superfluous ioctl PCM ops
Date:   Tue, 10 Dec 2019 15:18:22 +0100
Message-Id: <20191210141822.18705-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210141822.18705-1-tiwai@suse.de>
References: <20191210141822.18705-1-tiwai@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/u_audio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 67c4c85433d1..cf4f2358889b 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -314,7 +314,6 @@ static int uac_pcm_null(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops uac_pcm_ops = {
 	.open = uac_pcm_open,
 	.close = uac_pcm_null,
-	.ioctl = snd_pcm_lib_ioctl,
 	.trigger = uac_pcm_trigger,
 	.pointer = uac_pcm_pointer,
 	.prepare = uac_pcm_null,
-- 
2.16.4

