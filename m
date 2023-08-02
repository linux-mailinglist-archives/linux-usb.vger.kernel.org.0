Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBB776D611
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbjHBRun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 13:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbjHBRuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 13:50:25 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DDE333A9D
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 10:49:30 -0700 (PDT)
Received: (qmail 213157 invoked by uid 1000); 2 Aug 2023 13:49:02 -0400
Date:   Wed, 2 Aug 2023 13:49:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] usb-storage: alauda: Fix uninit-value in alauda_check_media()
Message-ID: <693d5d5e-f09b-42d0-8ed9-1f96cd30bcce@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000f72f670601f39d9e@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot got KMSAN to complain about access to an uninitialized value in
the alauda subdriver of usb-storage:

BUG: KMSAN: uninit-value in alauda_transport+0x462/0x57f0  
drivers/usb/storage/alauda.c:1137
CPU: 0 PID: 12279 Comm: usb-storage Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x13a/0x2b0 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:250
  alauda_check_media+0x344/0x3310 drivers/usb/storage/alauda.c:460

The problem is that alauda_check_media() doesn't verify that its USB
transfer succeeded before trying to use the received data.  What
should happen if the transfer fails isn't entirely clear, but a
reasonably conservative approach is to pretend that no media is
present.

A similar problem exists in a usb_stor_dbg() call in
alauda_get_media_status().  In this case, when an error occurs the
call is redundant, because usb_stor_ctrl_transfer() already will print
a debugging message.

Finally, unrelated to the uninitialized memory access, is the fact
that alauda_check_media() performs DMA to a buffer on the stack.
Fortunately usb-storage provides a general purpose DMA-able buffer for
uses like this.  We'll use it instead.

Reported-and-tested-by: syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/0000000000007d25ff059457342d@google.com/T/
Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: e80b0fade09e ("[PATCH] USB Storage: add alauda support")
Cc: <stable@vger.kernel.org>

---

 drivers/usb/storage/alauda.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/storage/alauda.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/alauda.c
+++ usb-devel/drivers/usb/storage/alauda.c
@@ -318,7 +318,8 @@ static int alauda_get_media_status(struc
 	rc = usb_stor_ctrl_transfer(us, us->recv_ctrl_pipe,
 		command, 0xc0, 0, 1, data, 2);
 
-	usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
+	if (rc == USB_STOR_XFER_GOOD)
+		usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
 
 	return rc;
 }
@@ -454,9 +455,14 @@ static int alauda_init_media(struct us_d
 static int alauda_check_media(struct us_data *us)
 {
 	struct alauda_info *info = (struct alauda_info *) us->extra;
-	unsigned char status[2];
+	unsigned char *status = us->iobuf;
+	int rc;
 
-	alauda_get_media_status(us, status);
+	rc = alauda_get_media_status(us, status);
+	if (rc != USB_STOR_XFER_GOOD) {
+		status[0] = 0xF0;	/* Pretend there's no media */
+		status[1] = 0;
+	}
 
 	/* Check for no media or door open */
 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
