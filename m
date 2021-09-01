Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E663FE00B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 18:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245426AbhIAQhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 12:37:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49567 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S245316AbhIAQhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 12:37:04 -0400
Received: (qmail 405992 invoked by uid 1000); 1 Sep 2021 12:36:06 -0400
Date:   Wed, 1 Sep 2021 12:36:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Michal Kubecek <mkubecek@suse.cz>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-input@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: [PATCH 3/3] HID: usbhid: Simplify code in hid_submit_ctrl()
Message-ID: <20210901163606.GC404634@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch makes a small simplification to the code in
hid_submit_ctrl().  The test for maxpacket being > 0 is unnecessary,
because endpoint 0 always has a maxpacket value which is >= 8.

Furthermore, endpoint 0's maxpacket value is always a power of 2, so
instead of open-coding the round-to-next-multiple computation we can
call the optimized round_up() routine.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

 drivers/hid/usbhid/hid-core.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -388,14 +388,10 @@ static int hid_submit_ctrl(struct hid_de
 		usbhid->urbctrl->pipe = usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
 		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
 					  usbhid->urbctrl->pipe, 0);
-		if (maxpacket > 0) {
-			len += (len == 0);    /* Don't allow 0-length reports */
-			len = DIV_ROUND_UP(len, maxpacket);
-			len *= maxpacket;
-			if (len > usbhid->bufsize)
-				len = usbhid->bufsize;
-		} else
-			len = 0;
+		len += (len == 0);	/* Don't allow 0-length reports */
+		len = round_up(len, maxpacket);
+		if (len > usbhid->bufsize)
+			len = usbhid->bufsize;
 	}
 	usbhid->urbctrl->transfer_buffer_length = len;
 	usbhid->urbctrl->dev = hid_to_usb_dev(hid);
