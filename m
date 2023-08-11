Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41926779643
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 19:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbjHKRis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 13:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbjHKRis (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 13:38:48 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A2460A8
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 10:38:47 -0700 (PDT)
Received: (qmail 289596 invoked by uid 1000); 11 Aug 2023 13:38:46 -0400
Date:   Fri, 11 Aug 2023 13:38:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix oversight in SuperSpeed initialization
Message-ID: <8809e6c5-59d5-4d2d-ac8f-6d106658ad73@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
 <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
 <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
 <20230811170500.xbjyzmcslvajs2qv@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811170500.xbjyzmcslvajs2qv@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 85d07c556216 ("USB: core: Unite old scheme and new scheme
descriptor reads") altered the way USB devices are enumerated
following detection, and in the process it messed up the
initialization of SuperSpeed (or faster) devices:

[   31.650759] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
[   31.663107] usb 2-1: device descriptor read/8, error -71
[   31.952697] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 3 using xhci_hcd
[   31.965122] usb 2-1: device descriptor read/8, error -71
[   32.080991] usb usb2-port1: attempt power cycle
...

The problem was caused by the commit forgetting that in SuperSpeed or
faster devices, the device descriptor uses a logarithmic encoding of
the bMaxPacketSize0 value.  (For some reason I thought the 255 case in
the switch statement was meant for these devices, but it isn't -- it
was meant for Wireless USB and is no longer needed.)

We can fix the oversight by testing for buf->bMaxPacketSize0 = 9
(meaning 512, the actual maxpacket size for ep0 on all SuperSpeed
devices) and straightening out the logic that checks and adjusts our
initial guesses of the maxpacket value.

Reported-and-tested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Closes: https://lore.kernel.org/linux-usb/20230810002257.nadxmfmrobkaxgnz@synopsys.com/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads")

---

 drivers/usb/core/hub.c |   36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -4705,7 +4705,7 @@ static int get_bMaxPacketSize0(struct us
 				buf, size,
 				initial_descriptor_timeout);
 		switch (buf->bMaxPacketSize0) {
-		case 8: case 16: case 32: case 64: case 255:
+		case 8: case 16: case 32: case 64: case 9:
 			if (buf->bDescriptorType == USB_DT_DEVICE) {
 				rc = buf->bMaxPacketSize0;
 				break;
@@ -4992,23 +4992,35 @@ hub_port_init(struct usb_hub *hub, struc
 	if (retval)
 		goto fail;
 
-	if (maxp0 == 0xff || udev->speed >= USB_SPEED_SUPER)
-		i = 512;
-	else
-		i = maxp0;
-	if (usb_endpoint_maxp(&udev->ep0.desc) != i) {
-		if (udev->speed == USB_SPEED_LOW ||
-				!(i == 8 || i == 16 || i == 32 || i == 64)) {
-			dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", i);
-			retval = -EMSGSIZE;
-			goto fail;
-		}
+	/*
+	 * Check the ep0 maxpacket guess and correct it if necessary.
+	 * maxp0 is the value stored in the device descriptor;
+	 * i is the value it encodes (logarithmic for SuperSpeed or greater).
+	 */
+	i = maxp0;
+	if (udev->speed >= USB_SPEED_SUPER) {
+		if (maxp0 <= 16)
+			i = 1 << maxp0;
+		else
+			i = 0;		/* Invalid */
+	}
+	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
+		;	/* Initial ep0 maxpacket guess is right */
+	} else if ((udev->speed == USB_SPEED_FULL ||
+				udev->speed == USB_SPEED_HIGH) &&
+			(i == 8 || i == 16 || i == 32 || i == 64)) {
+		/* Initial guess is wrong; use the descriptor's value */
 		if (udev->speed == USB_SPEED_FULL)
 			dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);
 		else
 			dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
 		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
 		usb_ep0_reinit(udev);
+	} else {
+		/* Initial guess is wrong and descriptor's value is invalid */
+		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
+		retval = -EMSGSIZE;
+		goto fail;
 	}
 
 	descr = usb_get_device_descriptor(udev);
