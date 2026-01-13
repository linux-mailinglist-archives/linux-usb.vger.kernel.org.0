Return-Path: <linux-usb+bounces-32227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1507ED1751D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0D29304E103
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C066D3806A1;
	Tue, 13 Jan 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GtGmWJZu"
X-Original-To: linux-usb@vger.kernel.org
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD92264BB;
	Tue, 13 Jan 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293048; cv=none; b=h+XyKIrHmcAFHs+EP/QfTom5O8Ia9TG1gcm20BAmnVgTmIE/YA1Igrxp2lYJWhFt4n6diP/5fl/s5PbwlgzyZLqdZTAr8qdcnFOZkM8yBUs3FQE838STniUaEyTTqRHZBE7sco30DsyaHwNMngDiAJZXUvrNONvjzzu5adzQoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293048; c=relaxed/simple;
	bh=m3IuV4ZXbtAkwv6zg4oUMPIPXHweCM9YFIkqoVNmHbs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ewAQXRZHPPod08BsdATJeZ+CBG1llotND1jz6oOcOk3BIPgX2LziV3x896Bp0JDYlbFKhtei0+jlZ3MOB4sMYHdrDGnTtNKtPK2t/FrCz02veYBOKW7l66Y6w1oSzr6dSSLIHZCtppT1esflhXUV2z2+vHS7HKhAGDU7IfrEYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GtGmWJZu; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768293037; bh=oP3eSR2188lw7kNfd0sBbiUcMey2IzVvyS1HIhfA6Hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GtGmWJZuibXLUo1kDPulNVggkMU6ceCki2JXpHE9S4JnEbjQCiVo/VApMusu49WXv
	 SSvv0/slvgF+MAeCNFWXPg+J83Rp2MFGsKO3vI413LKsamCxudF+gBKov9almJ+Q1g
	 BKeqd4K+hDeHsqOEo6wJlS66uOsciquyTfV+aBD8=
Received: from lxu-ped-host.. ([114.244.57.237])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 7571D6E2; Tue, 13 Jan 2026 16:29:23 +0800
X-QQ-mid: xmsmtpt1768292963togkapueg
Message-ID: <tencent_9AECE6CD2C7A826D902D696C289724E8120A@qq.com>
X-QQ-XMAILINFO: OZebYClYfzV+cAmvPAHwOa6Zo4Bld06tNs64uhgWX0cB9bKPwP1dfeSkHLR8yL
	 zTf6NhzYehG0HHXbYDuIn+PtXQblT5kJ6sXfJ2ODFMyWRGtCWgFgwh4fZN0j6QFm9+uIgjSAse4T
	 CFQODaREVhQQYwYhsje9WoCuwaiM/Joevn0DyvZq5C1x6dWmZA+hpDDkbYbxr1t/vcUkdgocCrIp
	 0kRkSp4uoVJya942KIVkb+kc3lXb6K+Swi+yk0HwOlSxPTwXbLg3sTDFDYQgChIM07t7vqe0r0gf
	 XvtFRMyC2KDDKL3Af6GP0WHvbAEEdkNVeYc3HMZvsHOo8xjjSLn2zdywYD1PHdOZ8Zot097zADDI
	 JZpdjRPH57vTEM3vC3HdsJIx+ABpwei5Ah2VhvbUsmAtkDcPHVQpGYoKeKRLndP1u4klgvqvU12y
	 E6YOQs4ICrteOZQOtUGMzG8ic4CznY0IENRIrL3lEV7DsaluY7FzCONn2hYwLn4+fvkXn6bzRUhF
	 Cf9gYBwt2c3Kpy337RVei0bjbGzQ6eX5J06BAjECbq3K7r9CMTDTuZanC0n/EZA8w0eosC7ur+vm
	 weEVoUD9WE33H7TjwkfPjthPGS0skQfXrAtusY0GTT4jM22B3uN6LvalUsS2arTdN8Qeg/gk0DYC
	 BgT9da/RNafCoCPLYEjGiw1/PC2VPEfEAgXPI9hR8zv2cjbedXKJbft0fW+zhT3uItHacos7n6Se
	 j/j68ghQ5F9prpL2wZZYnmmFZV+j4liyYL9IChHwLNrL5XuNqzA48BwlRMzNgdGWXPDJhO0iQLZC
	 YcEJKYOMkZTANCq/jf6hRCOf9dfLLmdDVMwYXun87EqIrw84YzRxQ6KEdSUj+xot2SYgrL6x9a9O
	 J3H3ViT1Kj2iwzAZ27RJzBEwJFElMBge3PIskJKlXBwQRX1epCosdxGKVfEoIq3J6+fWntSH0tV7
	 +8F7rRFD0h9375DV1QEtfGg2ON4/FzK9hIC6YR3NoWk5wVlNzdRd0PuhykdFJgsEUBIRNQ60qiyX
	 bFXdF6od5T4sQ4XGkB
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Prevent excessive number of frames
Date: Tue, 13 Jan 2026 16:29:23 +0800
X-OQ-MSGID: <20260113082922.683088-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6965a06e.050a0220.38aacd.0004.GAE@google.com>
References: <6965a06e.050a0220.38aacd.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this case, the user constructed the parameters with maxpacksize 40
for rate 22050 / pps 1000, and packsize[0] 22 packsize[1] 23. The buffer
size for each data URB is maxpacksize * packets, which in this example
is 40 * 6 = 240; When the user performs a write operation to send audio
data into the ALSA PCM playback stream, the calculated number of frames
is packsize[0] * packets = 264, which exceeds the allocated URB buffer
size, triggering the out-of-bounds (OOB) issue reported by syzbot [1].

Added a check for the number of single data URB frames when calculating
the number of frames to prevent [1].

[1]
BUG: KASAN: slab-out-of-bounds in copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
Write of size 264 at addr ffff88804337e800 by task syz.0.17/5506
Call Trace:
 copy_to_urb+0x261/0x460 sound/usb/pcm.c:1487
 prepare_playback_urb+0x953/0x13d0 sound/usb/pcm.c:1611
 prepare_outbound_urb+0x377/0xc50 sound/usb/endpoint.c:333

Reported-by: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6db0415d6d5c635f72cb
Tested-by: syzbot+6db0415d6d5c635f72cb@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 sound/usb/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 54d01dfd820f..263abb36bb2d 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1553,7 +1553,7 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 
 		for (i = 0; i < ctx->packets; i++) {
 			counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
-			if (counts < 0)
+			if (counts < 0 || frames + counts >= ep->max_urb_frames)
 				break;
 			/* set up descriptor */
 			urb->iso_frame_desc[i].offset = frames * stride;
-- 
2.43.0


