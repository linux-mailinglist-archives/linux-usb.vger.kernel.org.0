Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB7139E036
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 17:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhFGPZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 11:25:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59403 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230226AbhFGPZA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 11:25:00 -0400
Received: (qmail 1769730 invoked by uid 1000); 7 Jun 2021 11:23:07 -0400
Date:   Mon, 7 Jun 2021 11:23:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] USB: core: Avoid WARNings for 0-length descriptor requests
Message-ID: <20210607152307.GD1768031@rowland.harvard.edu>
References: <20210603014354.GA1626048@rowland.harvard.edu>
 <0000000000007450cd05c3d3905d@google.com>
 <20210604161039.GI1676809@rowland.harvard.edu>
 <YL3RdAOH1dVriPe3@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL3RdAOH1dVriPe3@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB core has utility routines to retrieve various types of
descriptors.  These routines will now provoke a WARN if they are asked
to retrieve 0 bytes (USB "receive" requests must not have zero
length), so avert this by checking the size argument at the start.

Reported-and-tested-by: syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Johan Hovold <johan@kernel.org>

---

v2: Added extra blank lines following the sanity tests.


[as1962b]


 drivers/usb/core/message.c |    6 ++++++
 1 file changed, 6 insertions(+)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -783,6 +783,9 @@ int usb_get_descriptor(struct usb_device
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	memset(buf, 0, size);	/* Make sure we parse really received data */
 
 	for (i = 0; i < 3; ++i) {
@@ -832,6 +835,9 @@ static int usb_get_string(struct usb_dev
 	int i;
 	int result;
 
+	if (size <= 0)		/* No point in asking for no data */
+		return -EINVAL;
+
 	for (i = 0; i < 3; ++i) {
 		/* retry on length 0 or stall; some devices are flakey */
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),

