Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F7E6F35C3
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 20:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjEASWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 14:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjEASWi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 14:22:38 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id EC7B913A
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 11:22:35 -0700 (PDT)
Received: (qmail 312068 invoked by uid 1000); 1 May 2023 14:22:35 -0400
Date:   Mon, 1 May 2023 14:22:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: usbtmc: Fix direction for 0-length ioctl control
 messages
Message-ID: <ede1ee02-b718-49e7-a44c-51339fec706b@rowland.harvard.edu>
References: <38c0a2fd-cd9c-43b3-99f0-4f9ed2fdc69f@rowland.harvard.edu>
 <0000000000004b903305faa3ad0c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000004b903305faa3ad0c@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a problem in the usbtmc driver: When a user
submits an ioctl for a 0-length control transfer, the driver does not
check that the direction is set to OUT:


------------[ cut here ]------------
usb 3-1: BOGUS control dir, pipe 80000b80 doesn't match bRequestType fd
WARNING: CPU: 0 PID: 5100 at drivers/usb/core/urb.c:411 usb_submit_urb+0x14a7/0x1880 drivers/usb/core/urb.c:411
Modules linked in:
CPU: 0 PID: 5100 Comm: syz-executor428 Not tainted 6.3.0-syzkaller-12049-g58390c8ce1bd #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/14/2023
RIP: 0010:usb_submit_urb+0x14a7/0x1880 drivers/usb/core/urb.c:411
Code: 7c 24 40 e8 1b 13 5c fb 48 8b 7c 24 40 e8 21 1d f0 fe 45 89 e8 44 89 f1 4c 89 e2 48 89 c6 48 c7 c7 e0 b5 fc 8a e8 19 c8 23 fb <0f> 0b e9 9f ee ff ff e8 ed 12 5c fb 0f b6 1d 12 8a 3c 08 31 ff 41
RSP: 0018:ffffc90003d2fb00 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8880789e9058 RCX: 0000000000000000
RDX: ffff888029593b80 RSI: ffffffff814c1447 RDI: 0000000000000001
RBP: ffff88801ea742f8 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff88802915e528
R13: 00000000000000fd R14: 0000000080000b80 R15: ffff8880222b3100
FS:  0000555556ca63c0(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9ef4d18150 CR3: 0000000073e5b000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x101/0x4b0 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x320/0x4a0 drivers/usb/core/message.c:153
 usbtmc_ioctl_request drivers/usb/class/usbtmc.c:1954 [inline]
 usbtmc_ioctl+0x1b3d/0x2840 drivers/usb/class/usbtmc.c:2097


To fix this, we must override the direction in the bRequestType field
of the control request structure when the length is 0.

Reported-and-tested-by: syzbot+ce77725b89b7bd52425c@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/000000000000716a3705f9adb8ee@google.com/
CC: <stable@vger.kernel.org>

---

 drivers/usb/class/usbtmc.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -1928,6 +1928,8 @@ static int usbtmc_ioctl_request(struct u
 
 	if (request.req.wLength > USBTMC_BUFSIZE)
 		return -EMSGSIZE;
+	if (request.req.wLength == 0)	/* Length-0 requests are never IN */
+		request.req.bRequestType &= ~USB_DIR_IN;
 
 	is_in = request.req.bRequestType & USB_DIR_IN;
 
