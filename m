Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A40C74077
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 22:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfGXUzg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 16:55:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:50682 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbfGXUzg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 16:55:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 72160ABC4;
        Wed, 24 Jul 2019 20:55:35 +0000 (UTC)
Message-ID: <1564001709.4670.10.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        linux-usb@vger.kernel.org
Date:   Wed, 24 Jul 2019 22:55:09 +0200
In-Reply-To: <000000000000bb4247058e589a20@google.com>
References: <000000000000bb4247058e589a20@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 23.07.2019, 05:48 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11b13e78600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> dashboard link: https://syzkaller.appspot.com/bug?extid=ef5de9c4f99c4edb4e49
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15482210600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1139b07c600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in usbhid_power+0xca/0xe0  
> /drivers/hid/usbhid/hid-core.c:1234
> Read of size 8 at addr ffff8881ce8a4008 by task syz-executor373/1763

#syz test: https://github.com/google/kasan.git usb-fuzzer

From a3455c4527bdfe86536856ea96288b7dcc36590b Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 24 Jul 2019 22:49:57 +0200
Subject: [PATCH] usbhid: test for disconnected state in raw opening

If the device has been disconnected, we should not proceed to use
runtime PM on it.

Reported-by: syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.de>
---
 drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..98b996ecf4d3 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device *hid, int lvl)
 	struct usbhid_device *usbhid = hid->driver_data;
 	int r = 0;
 
+	spin_lock_irq(&usbhid->lock);
+	if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
+		r = -ENODEV;
+		spin_unlock_irq(&usbhid->lock);
+		goto bail_out;
+	} else {
+		/* protect against disconnect */
+		usb_get_dev(interface_to_usbdev(usbhid->intf));
+		spin_unlock_irq(&usbhid->lock);
+	}
+
 	switch (lvl) {
 	case PM_HINT_FULLON:
 		r = usb_autopm_get_interface(usbhid->intf);
@@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device *hid, int lvl)
 		usb_autopm_put_interface(usbhid->intf);
 		break;
 	}
+	usb_put_dev(interface_to_usbdev(usbhid->intf));
 
+bail_out:
 	return r;
 }
 
-- 
2.16.4

