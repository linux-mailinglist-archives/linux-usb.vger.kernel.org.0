Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3B2750A93
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 16:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbjGLOPO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 10:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjGLOPN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 10:15:13 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B00C61998
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 07:15:11 -0700 (PDT)
Received: (qmail 1397081 invoked by uid 1000); 12 Jul 2023 10:15:10 -0400
Date:   Wed, 12 Jul 2023 10:15:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Jakub Kicinski <kuba@kernel.org>, Oliver Neukum <oneukum@suse.com>,
        netdev@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2] net: usbnet: Fix WARNING in
 usbnet_start_xmit/usb_submit_urb
Message-ID: <ea152b6d-44df-4f8a-95c6-4db51143dcc1@rowland.harvard.edu>
References: <000000000000a56e9105d0cec021@google.com>
 <000000000000e298cd05fecc07d4@google.com>
 <0f685f2f-06df-4cf2-9387-34f5e3c8b7b7@rowland.harvard.edu>
 <7330e6c0-eb73-499e-8699-dc1754d90cad@rowland.harvard.edu>
 <413fb529-477c-7ac9-881e-550b4613d38c@suse.com>
 <38ff51d4-2734-4dd7-8638-ae2fc8572c0d@rowland.harvard.edu>
 <20230711131205.53b3e5e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711131205.53b3e5e4@kernel.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer identified a problem in the usbnet driver:

usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 754 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Modules linked in:
CPU: 0 PID: 754 Comm: kworker/0:2 Not tainted 6.4.0-rc7-syzkaller-00014-g692b7dc87ca6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Workqueue: mld mld_ifc_work
RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Code: 7c 24 18 e8 2c b4 5b fb 48 8b 7c 24 18 e8 42 07 f0 fe 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 a0 c9 fc 8a e8 5a 6f 23 fb <0f> 0b e9 58 f8 ff ff e8 fe b3 5b fb 48 81 c5 c0 05 00 00 e9 84 f7
RSP: 0018:ffffc9000463f568 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff88801eb28000 RSI: ffffffff814c03b7 RDI: 0000000000000001
RBP: ffff8881443b7190 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000003
R13: ffff88802a77cb18 R14: 0000000000000003 R15: ffff888018262500
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000556a99c15a18 CR3: 0000000028c71000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 usbnet_start_xmit+0xfe5/0x2190 drivers/net/usb/usbnet.c:1453
 __netdev_start_xmit include/linux/netdevice.h:4918 [inline]
 netdev_start_xmit include/linux/netdevice.h:4932 [inline]
 xmit_one net/core/dev.c:3578 [inline]
 dev_hard_start_xmit+0x187/0x700 net/core/dev.c:3594
...

This bug is caused by the fact that usbnet trusts the bulk endpoint
addresses its probe routine receives in the driver_info structure, and
it does not check to see that these endpoints actually exist and have
the expected type and directions.

The fix is simply to add such a check.

Reported-and-tested-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/000000000000a56e9105d0cec021@google.com/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Oliver Neukum <oneukum@suse.com>

---

v2: Updated the formatting of the definition of ep_addrs[].


 drivers/net/usb/usbnet.c |    6 ++++++
 1 file changed, 6 insertions(+)

Index: usb-devel/drivers/net/usb/usbnet.c
===================================================================
--- usb-devel.orig/drivers/net/usb/usbnet.c
+++ usb-devel/drivers/net/usb/usbnet.c
@@ -1775,6 +1775,10 @@ usbnet_probe (struct usb_interface *udev
 	} else if (!info->in || !info->out)
 		status = usbnet_get_endpoints (dev, udev);
 	else {
+		u8 ep_addrs[3] = {
+			info->in + USB_DIR_IN, info->out + USB_DIR_OUT, 0
+		};
+
 		dev->in = usb_rcvbulkpipe (xdev, info->in);
 		dev->out = usb_sndbulkpipe (xdev, info->out);
 		if (!(info->flags & FLAG_NO_SETINT))
@@ -1784,6 +1788,8 @@ usbnet_probe (struct usb_interface *udev
 		else
 			status = 0;
 
+		if (status == 0 && !usb_check_bulk_endpoints(udev, ep_addrs))
+			status = -EINVAL;
 	}
 	if (status >= 0 && dev->status)
 		status = init_status (dev, udev);
