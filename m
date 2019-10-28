Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898FAE7412
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 15:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfJ1Oy1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 10:54:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37456 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727227AbfJ1Oy1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 10:54:27 -0400
Received: (qmail 3406 invoked by uid 2102); 28 Oct 2019 10:54:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Oct 2019 10:54:26 -0400
Date:   Mon, 28 Oct 2019 10:54:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Felipe Balbi <balbi@kernel.org>
cc:     Jacky.Cao@sony.com, <andreyknvl@google.com>,
        <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: gadget: Reject endpoints with 0 maxpacket value
In-Reply-To: <00000000000030af530595acdd8b@google.com>
Message-ID: <Pine.LNX.4.44L0.1910281052370.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Endpoints with a maxpacket length of 0 are probably useless.  They
can't transfer any data, and it's not at all unlikely that a UDC will
crash or hang when trying to handle a non-zero-length usb_request for
such an endpoint.  Indeed, dummy-hcd gets a divide error when trying
to calculate the remainder of a transfer length by the maxpacket
value, as discovered by the syzbot fuzzer.

Currently the gadget core does not check for endpoints having a
maxpacket value of 0.  This patch adds a check to usb_ep_enable(),
preventing such endpoints from being used.

As far as I know, none of the gadget drivers in the kernel tries to
create an endpoint with maxpacket = 0, but until now there has been
nothing to prevent userspace programs under gadgetfs or configfs from
doing it.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---


[as1925]


 drivers/usb/gadget/udc/core.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -98,6 +98,17 @@ int usb_ep_enable(struct usb_ep *ep)
 	if (ep->enabled)
 		goto out;
 
+	/* UDC drivers can't handle endpoints with maxpacket size 0 */
+	if (usb_endpoint_maxp(ep->desc) == 0) {
+		/*
+		 * We should log an error message here, but we can't call
+		 * dev_err() because there's no way to find the gadget
+		 * given only ep.
+		 */
+		ret = -EINVAL;
+		goto out;
+	}
+
 	ret = ep->ops->enable(ep, ep->desc);
 	if (ret)
 		goto out;

