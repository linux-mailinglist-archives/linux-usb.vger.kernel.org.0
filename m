Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0A278AF6
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 13:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387699AbfG2L4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 07:56:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:46892 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387398AbfG2L4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jul 2019 07:56:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 61E48AF8C;
        Mon, 29 Jul 2019 11:56:21 +0000 (UTC)
Message-ID: <1564401374.25582.9.camel@suse.com>
Subject: Re: WARNING in iguanair_probe/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com>,
        gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Date:   Mon, 29 Jul 2019 13:56:14 +0200
In-Reply-To: <0000000000009af3e9058e94ac05@google.com>
References: <0000000000009af3e9058e94ac05@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 26.07.2019, 05:28 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=164ab1f0600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> dashboard link: https://syzkaller.appspot.com/bug?extid=01a77b82edaa374068e1
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143d7978600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134623f4600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git usb-fuzzer-usb-testing-2019.07.11

From 0b0a7f7e980973e0c0d17f1dfe2bd7742492bfcc Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 29 Jul 2019 11:49:00 +0200
Subject: [PATCH] iguanair: add sanity checks

The driver needs to check the endpoint types, too, as opposed
to the number of endpoints. This also requires moving the check earlier.

Reported-by: syzbot+01a77b82edaa374068e1@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/iguanair.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index ea05e125016a..663083a6b399 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -413,6 +413,10 @@ static int iguanair_probe(struct usb_interface *intf,
 	int ret, pipein, pipeout;
 	struct usb_host_interface *idesc;
 
+	idesc = intf->altsetting;
+	if (idesc->desc.bNumEndpoints < 2)
+		return -ENODEV;
+
 	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
 	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
 	if (!ir || !rc) {
@@ -427,18 +431,13 @@ static int iguanair_probe(struct usb_interface *intf,
 	ir->urb_in = usb_alloc_urb(0, GFP_KERNEL);
 	ir->urb_out = usb_alloc_urb(0, GFP_KERNEL);
 
-	if (!ir->buf_in || !ir->packet || !ir->urb_in || !ir->urb_out) {
+	if (!ir->buf_in || !ir->packet || !ir->urb_in || !ir->urb_out ||
+			!usb_endpoint_is_int_in(&idesc->endpoint[0].desc) ||
+			!usb_endpoint_is_int_out(&idesc->endpoint[1].desc)) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	idesc = intf->altsetting;
-
-	if (idesc->desc.bNumEndpoints < 2) {
-		ret = -ENODEV;
-		goto out;
-	}
-
 	ir->rc = rc;
 	ir->dev = &intf->dev;
 	ir->udev = udev;

