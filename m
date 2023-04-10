Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4AC6DCBAC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 21:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjDJTiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 15:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjDJTiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 15:38:24 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A29B210D7
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 12:38:23 -0700 (PDT)
Received: (qmail 147828 invoked by uid 1000); 10 Apr 2023 15:38:22 -0400
Date:   Mon, 10 Apr 2023 15:38:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/3] USB: sisusbvga: Add endpoint checks
Message-ID: <48ef98f7-51ae-4f63-b8d3-0ef2004bb60a@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer was able to provoke a WARNING from the sisusbvga driver:

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 26 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Modules linked in:
CPU: 1 PID: 26 Comm: kworker/1:1 Not tainted 6.2.0-rc5-syzkaller-00199-g5af6ce704936 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Code: 7c 24 18 e8 6c 50 80 fb 48 8b 7c 24 18 e8 62 1a 01 ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 60 b1 fa 8a e8 84 b0 be 03 <0f> 0b e9 58 f8 ff ff e8 3e 50 80 fb 48 81 c5 c0 05 00 00 e9 84 f7
RSP: 0018:ffffc90000a1ed18 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888012783a80 RSI: ffffffff816680ec RDI: fffff52000143d95
RBP: ffff888079020000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: 0000000000000003
R13: ffff888017d33370 R14: 0000000000000003 R15: ffff888021213600
FS:  0000000000000000(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005592753a60b0 CR3: 0000000022899000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 sisusb_bulkout_msg drivers/usb/misc/sisusbvga/sisusbvga.c:224 [inline]
 sisusb_send_bulk_msg.constprop.0+0x904/0x1230 drivers/usb/misc/sisusbvga/sisusbvga.c:379
 sisusb_send_bridge_packet drivers/usb/misc/sisusbvga/sisusbvga.c:567 [inline]
 sisusb_do_init_gfxdevice drivers/usb/misc/sisusbvga/sisusbvga.c:2077 [inline]
 sisusb_init_gfxdevice+0x87b/0x4000 drivers/usb/misc/sisusbvga/sisusbvga.c:2177
 sisusb_probe+0x9cd/0xbe2 drivers/usb/misc/sisusbvga/sisusbvga.c:2869
...

The problem was caused by the fact that the driver does not check
whether the endpoints it uses are actually present and have the
appropriate types.  This can be fixed by adding a simple check of
the endpoints.

Reported-and-tested-by: syzbot+23be03b56c5259385d79@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://syzkaller.appspot.com/bug?extid=23be03b56c5259385d79

---


[as1993]


 drivers/usb/misc/sisusbvga/sisusbvga.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

Index: usb-devel/drivers/usb/misc/sisusbvga/sisusbvga.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ usb-devel/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2778,6 +2778,20 @@ static int sisusb_probe(struct usb_inter
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct sisusb_usb_data *sisusb;
 	int retval = 0, i;
+	static const u8 ep_addresses[] = {
+		SISUSB_EP_GFX_IN | USB_DIR_IN,
+		SISUSB_EP_GFX_OUT | USB_DIR_OUT,
+		SISUSB_EP_GFX_BULK_OUT | USB_DIR_OUT,
+		SISUSB_EP_GFX_LBULK_OUT | USB_DIR_OUT,
+		SISUSB_EP_BRIDGE_IN | USB_DIR_IN,
+		SISUSB_EP_BRIDGE_OUT | USB_DIR_OUT,
+		0};
+
+	/* Are the expected endpoints present? */
+	if (!usb_check_bulk_endpoints(intf, ep_addresses)) {
+		dev_err(&intf->dev, "Invalid USB2VGA device\n");
+		return -EINVAL;
+	}
 
 	dev_info(&dev->dev, "USB2VGA dongle found at address %d\n",
 			dev->devnum);
