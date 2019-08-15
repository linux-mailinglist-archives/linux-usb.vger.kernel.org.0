Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933D18EE27
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 16:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbfHOO2y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 10:28:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:47780 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731030AbfHOO2x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 10:28:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 904F7ABDC;
        Thu, 15 Aug 2019 14:28:52 +0000 (UTC)
Message-ID: <1565879328.5780.9.camel@suse.com>
Subject: Re: divide error in usbtmc_generic_read
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        steve_bayless@keysight.com, gregkh@linuxfoundation.org,
        guido.kiener@rohde-schwarz.com, linux-usb@vger.kernel.org
Date:   Thu, 15 Aug 2019 16:28:48 +0200
In-Reply-To: <000000000000c4157e0590123002@google.com>
References: <000000000000c4157e0590123002@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 04:38 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    d0847550 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=16295d4a600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
> dashboard link: https://syzkaller.appspot.com/bug?extid=55b0304b360654a7537b
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1288a31c600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15282e86600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git d0847550

From df64f5cd2e6a9b43c75bb7e3276b8805a225db75 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 14 Aug 2019 15:21:41 +0200
Subject: [PATCH] usbtmc: more sanity checking for packet size

A malicious device can make the driver divide ny zero
with a nonsense maximum packet size.

V2: return a sensible error code

SIgned-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/usbtmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 4942122b2346..36858ddd8d9b 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2362,8 +2362,11 @@ static int usbtmc_probe(struct usb_interface *intf,
 		goto err_put;
 	}
 
+	retcode = -EINVAL;
 	data->bulk_in = bulk_in->bEndpointAddress;
 	data->wMaxPacketSize = usb_endpoint_maxp(bulk_in);
+	if (!data->wMaxPacketSize)
+		goto err_put;
 	dev_dbg(&intf->dev, "Found bulk in endpoint at %u\n", data->bulk_in);
 
 	data->bulk_out = bulk_out->bEndpointAddress;
-- 
2.16.4

