Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0159272FA8
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 15:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfGXNPY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 09:15:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:44422 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726514AbfGXNPY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 09:15:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 09A4AAE32;
        Wed, 24 Jul 2019 13:15:22 +0000 (UTC)
Date:   Wed, 24 Jul 2019 15:15:21 +0200
Message-ID: <s5hlfwn376e.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+d952e5e28f5fb7718d23@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in snd_usb_motu_microbookii_communicate/usb_submit_urb
In-Reply-To: <CAAeHK+zT+VhrxPDNFxCoVDrgBhmTiAuRjQv_A6SC91x8w0HmoQ@mail.gmail.com>
References: <000000000000acb99a058b0d5741@google.com>
        <000000000000ac8f77058e0d11e9@google.com>
        <CAAeHK+zT+VhrxPDNFxCoVDrgBhmTiAuRjQv_A6SC91x8w0HmoQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 23 Jul 2019 19:03:29 +0200,
Andrey Konovalov wrote:
> 
> (Takashi, with your helper check syzkaller now generates a new bug
> report (not reported by syzbot yet due to breakage during kernel boot
> on 5.3-rc1, so see below) and I guess this has to do with a missing ep
> != NULL check).
> 
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN
> CPU: 1 PID: 74 Comm: kworker/1:1 Not tainted 5.3.0-rc1+ #40
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:snd_usb_pipe_sanity_check+0x80/0x130 sound/usb/helper.c:75
> Code: 48 c1 ea 03 80 3c 02 00 0f 85 b3 00 00 00 48 8b 6d 00 c1 eb 1e
> 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6
> 04 02 48 89 fa 83 e2 07 38 d0 7f 04 84 c0 75 7b 48 b8 00 00
> RSP: 0018:ffff88806c33f0a8 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: 0000000000000001 RCX: ffffffff833819c2
> RDX: 0000000000000000 RSI: ffffffff833819dc RDI: 0000000000000003
> RBP: 0000000000000000 R08: ffff88806c330000 R09: fffffbfff0d1a792
> R10: fffffbfff0d1a791 R11: ffffffff868d3c8f R12: 0000000000000000
> R13: dffffc0000000000 R14: ffff88806975cc80 R15: ffff88806975c4a0
> FS:  0000000000000000(0000) GS:ffff88806d100000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fcc3a48c000 CR3: 000000006861c003 CR4: 0000000000160ee0
> Call Trace:
>  snd_usb_accessmusic_boot_quirk sound/usb/quirks.c:835 [inline]
>  snd_usb_apply_boot_quirk+0xa19/0xc60 sound/usb/quirks.c:1267
>  usb_audio_probe+0x2ec/0x1f40 sound/usb/card.c:576
(snip)

So it's a NULL pointer returned from usb_pipe_endpoint() with an
invalid pipe.  The fix patch is attached below.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Fix NULL dereference at pipe sanity check

The newly introduced helper for a sanity check of a pipe causes an
Oops due to the NULL pointer returned from usb_pipe_endpoint() with an
invalid pipe.  Let's fix it.

Fixes: 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
Reported-by: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index 71d5f540334a..919d69e0aba3 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -72,6 +72,8 @@ int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
 	struct usb_host_endpoint *ep;
 
 	ep = usb_pipe_endpoint(dev, pipe);
+	if (!ep)
+		return -EINVAL;
 	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;
-- 
2.16.4

