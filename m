Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC7F4CC77B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 22:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbiCCVBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 16:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiCCVBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 16:01:04 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 251C21CFD1
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 13:00:18 -0800 (PST)
Received: (qmail 1290092 invoked by uid 1000); 3 Mar 2022 16:00:17 -0500
Date:   Thu, 3 Mar 2022 16:00:17 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] usb: usbtmc: Fix bug in pipe direction for control transfers
Message-ID: <YiEsYTPEE6lOCOA5@rowland.harvard.edu>
References: <YiElaWLdXT+m/RJM@rowland.harvard.edu>
 <000000000000054cc905d95672fa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000054cc905d95672fa@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer reported a minor bug in the usbtmc driver:

usb 5-1: BOGUS control dir, pipe 80001e80 doesn't match bRequestType 0
WARNING: CPU: 0 PID: 3813 at drivers/usb/core/urb.c:412
usb_submit_urb+0x13a5/0x1970 drivers/usb/core/urb.c:410
Modules linked in:
CPU: 0 PID: 3813 Comm: syz-executor122 Not tainted
5.17.0-rc5-syzkaller-00306-g2293be58d6a1 #0
...
Call Trace:
 <TASK>
 usb_start_wait_urb+0x113/0x530 drivers/usb/core/message.c:58
 usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
 usb_control_msg+0x2a5/0x4b0 drivers/usb/core/message.c:153
 usbtmc_ioctl_request drivers/usb/class/usbtmc.c:1947 [inline]

The problem is that usbtmc_ioctl_request() uses usb_rcvctrlpipe() for
all of its transfers, whether they are in or out.  It's easy to fix.

Reported-and-tested-by: syzbot+a48e3d1a875240cab5de@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1973]


 drivers/usb/class/usbtmc.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -1919,6 +1919,7 @@ static int usbtmc_ioctl_request(struct u
 	struct usbtmc_ctrlrequest request;
 	u8 *buffer = NULL;
 	int rv;
+	unsigned int is_in, pipe;
 	unsigned long res;
 
 	res = copy_from_user(&request, arg, sizeof(struct usbtmc_ctrlrequest));
@@ -1928,12 +1929,14 @@ static int usbtmc_ioctl_request(struct u
 	if (request.req.wLength > USBTMC_BUFSIZE)
 		return -EMSGSIZE;
 
+	is_in = request.req.bRequestType & USB_DIR_IN;
+
 	if (request.req.wLength) {
 		buffer = kmalloc(request.req.wLength, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;
 
-		if ((request.req.bRequestType & USB_DIR_IN) == 0) {
+		if (!is_in) {
 			/* Send control data to device */
 			res = copy_from_user(buffer, request.data,
 					     request.req.wLength);
@@ -1944,8 +1947,12 @@ static int usbtmc_ioctl_request(struct u
 		}
 	}
 
+	if (is_in)
+		pipe = usb_rcvctrlpipe(data->usb_dev, 0);
+	else
+		pipe = usb_sndctrlpipe(data->usb_dev, 0);
 	rv = usb_control_msg(data->usb_dev,
-			usb_rcvctrlpipe(data->usb_dev, 0),
+			pipe,
 			request.req.bRequest,
 			request.req.bRequestType,
 			request.req.wValue,
@@ -1957,7 +1964,7 @@ static int usbtmc_ioctl_request(struct u
 		goto exit;
 	}
 
-	if (rv && (request.req.bRequestType & USB_DIR_IN)) {
+	if (rv && is_in) {
 		/* Read control data from device */
 		res = copy_to_user(request.data, buffer, rv);
 		if (res)
