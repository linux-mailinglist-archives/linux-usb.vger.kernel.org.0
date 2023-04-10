Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7A376DCBAF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 21:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDJTkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 15:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDJTkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 15:40:06 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C301B10D7
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 12:40:05 -0700 (PDT)
Received: (qmail 147943 invoked by uid 1000); 10 Apr 2023 15:40:05 -0400
Date:   Mon, 10 Apr 2023 15:40:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] media: radio-shark: Add endpoint checks
Message-ID: <e2858ab4-4adf-46e5-bbf6-c56742034547@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
 <48ef98f7-51ae-4f63-b8d3-0ef2004bb60a@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48ef98f7-51ae-4f63-b8d3-0ef2004bb60a@rowland.harvard.edu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer was able to provoke a WARNING from the radio-shark2
driver:

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 3271 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed2/0x1880 drivers/usb/core/urb.c:504
Modules linked in:
CPU: 0 PID: 3271 Comm: kworker/0:3 Not tainted 6.1.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xed2/0x1880 drivers/usb/core/urb.c:504
Code: 7c 24 18 e8 00 36 ea fb 48 8b 7c 24 18 e8 36 1c 02 ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 a0 b6 90 8a e8 9a 29 b8 03 <0f> 0b e9 58 f8 ff ff e8 d2 35 ea fb 48 81 c5 c0 05 00 00 e9 84 f7
RSP: 0018:ffffc90003876dd0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: ffff8880750b0040 RSI: ffffffff816152b8 RDI: fffff5200070edac
RBP: ffff8880172d81e0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff8880285c5040 R14: 0000000000000002 R15: ffff888017158200
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe03235b90 CR3: 000000000bc8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 usb_start_wait_urb+0x101/0x4b0 drivers/usb/core/message.c:58
 usb_bulk_msg+0x226/0x550 drivers/usb/core/message.c:387
 shark_write_reg+0x1ff/0x2e0 drivers/media/radio/radio-shark2.c:88
...

The problem was caused by the fact that the driver does not check
whether the endpoints it uses are actually present and have the
appropriate types.  This can be fixed by adding a simple check of
these endpoints (and similarly for the radio-shark driver).

Reported-and-tested-by: syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://syzkaller.appspot.com/bug?extid=4b3f8190f6e13b3efd74

---


[as1994]


 drivers/media/radio/radio-shark.c  |   10 ++++++++++
 drivers/media/radio/radio-shark2.c |   10 ++++++++++
 2 files changed, 20 insertions(+)

Index: usb-devel/drivers/media/radio/radio-shark.c
===================================================================
--- usb-devel.orig/drivers/media/radio/radio-shark.c
+++ usb-devel/drivers/media/radio/radio-shark.c
@@ -316,6 +316,16 @@ static int usb_shark_probe(struct usb_in
 {
 	struct shark_device *shark;
 	int retval = -ENOMEM;
+	static const u8 ep_addresses[] = {
+		SHARK_IN_EP | USB_DIR_IN,
+		SHARK_OUT_EP | USB_DIR_OUT,
+		0};
+
+	/* Are the expected endpoints present? */
+	if (!usb_check_int_endpoints(intf, ep_addresses)) {
+		dev_err(&intf->dev, "Invalid radioSHARK device\n");
+		return -EINVAL;
+	}
 
 	shark = kzalloc(sizeof(struct shark_device), GFP_KERNEL);
 	if (!shark)
Index: usb-devel/drivers/media/radio/radio-shark2.c
===================================================================
--- usb-devel.orig/drivers/media/radio/radio-shark2.c
+++ usb-devel/drivers/media/radio/radio-shark2.c
@@ -282,6 +282,16 @@ static int usb_shark_probe(struct usb_in
 {
 	struct shark_device *shark;
 	int retval = -ENOMEM;
+	static const u8 ep_addresses[] = {
+		SHARK_IN_EP | USB_DIR_IN,
+		SHARK_OUT_EP | USB_DIR_OUT,
+		0};
+
+	/* Are the expected endpoints present? */
+	if (!usb_check_int_endpoints(intf, ep_addresses)) {
+		dev_err(&intf->dev, "Invalid radioSHARK2 device\n");
+		return -EINVAL;
+	}
 
 	shark = kzalloc(sizeof(struct shark_device), GFP_KERNEL);
 	if (!shark)
