Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888CD100602
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 13:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfKRM6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 07:58:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:45950 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726490AbfKRM6x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 07:58:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D9017B12C;
        Mon, 18 Nov 2019 12:58:51 +0000 (UTC)
Message-ID: <1574081930.2698.5.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in chaoskey_disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 18 Nov 2019 13:58:50 +0100
In-Reply-To: <0000000000006062280596203360@google.com>
References: <0000000000006062280596203360@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 30.10.2019, 05:52 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    ff6409a6 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=15e1ba24e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3230c37d442895b7
> dashboard link: https://syzkaller.appspot.com/bug?extid=6d8505fcdf25f00ac276
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169b8904e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166f3104e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git ff6409a6

From ca453a46d8ecd1e41ce4a39d99a17efb4ee76ab8 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 18 Nov 2019 13:55:17 +0100
Subject: [PATCH] chaoskey: DEBUGGING ONLY

THIS IS A SANITY TEST
---
 drivers/usb/misc/chaoskey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 87067c3d6109..252817bc1087 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -202,7 +202,7 @@ static int chaoskey_probe(struct usb_interface *interface,
 	dev->hwrng.read = chaoskey_rng_read;
 	dev->hwrng.quality = 1024;
 
-	dev->hwrng_registered = (hwrng_register(&dev->hwrng) == 0);
+	//dev->hwrng_registered = (hwrng_register(&dev->hwrng) == 0);
 	if (!dev->hwrng_registered)
 		usb_err(interface, "Unable to register with hwrng");
 
-- 
2.16.4

