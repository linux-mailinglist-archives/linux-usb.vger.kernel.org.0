Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47DFE777E5A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 18:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbjHJQeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 12:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbjHJQeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 12:34:16 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 10A5FC5
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 09:34:13 -0700 (PDT)
Received: (qmail 241459 invoked by uid 1000); 10 Aug 2023 12:34:13 -0400
Date:   Thu, 10 Aug 2023 12:34:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Message-ID: <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 09:47:14PM -0400, Alan Stern wrote:
> On Thu, Aug 10, 2023 at 12:28:27AM +0000, Thinh Nguyen wrote:

> > Testing from Greg's usb-next branch, this series causes problem with
> > device enumeration:
> > 
> > [   31.650759] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
> > [   31.663107] usb 2-1: device descriptor read/8, error -71
> > [   31.952697] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 3 using xhci_hcd
> > [   31.965122] usb 2-1: device descriptor read/8, error -71
> > [   32.080991] usb usb2-port1: attempt power cycle
> > [   34.826893] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 5 using xhci_hcd
> > [   34.839241] usb 2-1: device descriptor read/8, error -71
> > [   35.129908] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
> > [   35.142264] usb 2-1: device descriptor read/8, error -71
> > [   35.257155] usb usb2-port1: attempt power cycle
> > [   37.258922] usb 1-1: new high-speed USB device number 5 using xhci_hcd
> > [   38.115053] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 8 using xhci_hcd
> > [   38.127407] usb 2-1: device descriptor read/8, error -71
> > [   38.417066] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
> > [   38.429428] usb 2-1: device descriptor read/8, error -71
> > [   38.545315] usb usb2-port1: attempt power cycle
> > [   43.347312] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
> > [   43.359659] usb 2-2: device descriptor read/8, error -71
> > [   43.649323] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 12 using xhci_hcd
> > [   43.661681] usb 2-2: device descriptor read/8, error -71
> > [   43.777566] usb usb2-port2: attempt power cycle
> > 
> > I was testing with our host along with other common vendor hosts with a
> > few 3.x devices. Reverting this series resolves the issue. I didn't do
> > extensive tests for various speeds or debug it. I just want to notify
> > this first perhaps you can figure out the issue right away.
> > 
> > I can look into it and provide more info later this week. If you want to
> > print any debug, let me know and I can provide later this week.
> 
> Thanks for the notification.  The problem is almost certainly caused by 
> the first patch in the series, which changes the way that the initial 
> read/8 thing is done.  However, I have no idea what part of the patch 
> could be causing these errors.  I would appreciate anything you can find 
> out.
> 
> You should concentrate your initial investigation on the new 
> get_bMaxPacketSize0() routine.  In particular, does the -EPROTO error 
> value arise as the return value from the usb_control_msg() call, or does 
> it happen because of the values stored in buf?  In the first case, how 
> does this call differ from the one that used to be made by 
> usb_get_device_descriptor()?  And in the second case, what are the 
> values of rc, buf->bMaxPacketSize0, and buf->bDescriptorType?

Never mind; I found the problem.  I had forgotten that at SuperSpeed or 
faster, the device descriptor uses a logarithmic encoding for 
bMaxPacketSize0.

The patch below should fix things up.  Let me know how it goes.

Alan Stern



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

