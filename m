Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC863C6301
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 20:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236063AbhGLS50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 14:57:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50001 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235965AbhGLS50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 14:57:26 -0400
Received: (qmail 326980 invoked by uid 1000); 12 Jul 2021 14:54:36 -0400
Date:   Mon, 12 Jul 2021 14:54:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix incorrect pipe calculation in
 do_proc_control()
Message-ID: <20210712185436.GB326369@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the user submits a control URB via usbfs, the user supplies the
bRequestType value and the kernel uses it to compute the pipe value.
However, do_proc_control() performs this computation incorrectly in
the case where the bRequestType direction bit is set to USB_DIR_IN and
the URB's transfer length is 0: The pipe's direction is also set to IN
but it should be OUT, which is the direction the actual transfer will
use regardless of bRequestType.

Commit 5cc59c418fde ("USB: core: WARN if pipe direction != setup
packet direction") added a check to compare the direction bit in the
pipe value to a control URB's actual direction and to WARN if they are
different.  This can be triggered by the incorrect computation
mentioned above, as found by syzbot.

This patch fixes the computation, thus avoiding the WARNing.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+72af3105289dcb4c055b@syzkaller.appspotmail.com

---

Greg, I'm not sure which -stable kernels, if any, need this.  It should 
go into any kernel which contains 5cc59c418fde.


[as1963]


 drivers/usb/core/devio.c |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -1133,7 +1133,7 @@ static int do_proc_control(struct usb_de
 		"wIndex=%04x wLength=%04x\n",
 		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
 		ctrl->wIndex, ctrl->wLength);
-	if (ctrl->bRequestType & 0x80) {
+	if ((ctrl->bRequestType & USB_DIR_IN) && ctrl->wLength) {
 		pipe = usb_rcvctrlpipe(dev, 0);
 		snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
 
