Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298B0832D2
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 15:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730478AbfHFNhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 09:37:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:40684 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726092AbfHFNhR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 09:37:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C31ADADAA;
        Tue,  6 Aug 2019 13:37:16 +0000 (UTC)
Message-ID: <1565098635.8136.25.camel@suse.com>
Subject: Re: WARNING in __iforce_usb_xmit/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com>,
        gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Date:   Tue, 06 Aug 2019 15:37:15 +0200
In-Reply-To: <000000000000c4df6a058f5d6b70@google.com>
References: <000000000000c4df6a058f5d6b70@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 05.08.2019, 04:58 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=10809e0c600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=5efc10c005014d061a74
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15e40b1a600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=174a69d8600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git e96407b4

From 06be579ae09483c7c723067f4e5bf938ad302bda Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 6 Aug 2019 15:33:35 +0200
Subject: [PATCH] iforce: add sanity checks

The endpoint type should also be checked before a device
is accepted.

Reported-by: syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/input/joystick/iforce/iforce-usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
index 29abfeeef9a5..a481a226166c 100644
--- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -203,6 +203,11 @@ static int iforce_usb_probe(struct usb_interface *intf,
 	epirq = &interface->endpoint[0].desc;
 	epout = &interface->endpoint[1].desc;
 
+	if (!usb_endpoint_is_int_in(epirq))
+		return -ENODEV;
+	if (!usb_endpoint_is_int_out(epout))
+		return -ENODEV;
+
 	iforce_usb = kzalloc(sizeof(*iforce_usb), GFP_KERNEL);
 	if (!iforce_usb)
 		goto fail;
-- 
2.16.4

