Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7582F5399
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 20:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbhAMTpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 14:45:51 -0500
Received: from netrider.rowland.org ([192.131.102.5]:39947 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728387AbhAMTpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 14:45:51 -0500
Received: (qmail 1290922 invoked by uid 1000); 13 Jan 2021 14:45:10 -0500
Date:   Wed, 13 Jan 2021 14:45:10 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: dummy-hcd: Fix errors in port-reset handling
Message-ID: <20210113194510.GA1290698@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit c318840fb2a4 ("USB: Gadget: dummy-hcd: Fix shift-out-of-bounds
bug") messed up the way dummy-hcd handles requests to turn on the
RESET port feature (I didn't notice that the original switch case
ended with a fallthrough).  The call to set_link_state() was
inadvertently removed, as was the code to set the USB_PORT_STAT_RESET
flag when the speed is USB2.

In addition, the original code never checked whether the port was
connected before handling the port-reset request.  There was a check
for the port being powered, but it was removed by that commit!  In
practice this doesn't matter much because the kernel doesn't try to
reset disconnected ports, but it's still bad form.

This patch fixes these problems by changing the fallthrough to break,
adding back in the missing set_link_state() call, setting the
port-reset status flag, adding a port-is-connected test, and removing
a redundant assignment statement.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: c318840fb2a4 ("USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug")
CC: <stable@vger.kernel.org>

---


[as1952]


 drivers/usb/gadget/udc/dummy_hcd.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2266,17 +2266,20 @@ static int dummy_hub_control(
 			}
 			fallthrough;
 		case USB_PORT_FEAT_RESET:
+			if (!(dum_hcd->port_status & USB_PORT_STAT_CONNECTION))
+				break;
 			/* if it's already enabled, disable */
 			if (hcd->speed == HCD_USB3) {
-				dum_hcd->port_status = 0;
 				dum_hcd->port_status =
 					(USB_SS_PORT_STAT_POWER |
 					 USB_PORT_STAT_CONNECTION |
 					 USB_PORT_STAT_RESET);
-			} else
+			} else {
 				dum_hcd->port_status &= ~(USB_PORT_STAT_ENABLE
 					| USB_PORT_STAT_LOW_SPEED
 					| USB_PORT_STAT_HIGH_SPEED);
+				dum_hcd->port_status |= USB_PORT_STAT_RESET;
+			}
 			/*
 			 * We want to reset device status. All but the
 			 * Self powered feature
@@ -2288,7 +2291,8 @@ static int dummy_hub_control(
 			 * interval? Is it still 50msec as for HS?
 			 */
 			dum_hcd->re_timeout = jiffies + msecs_to_jiffies(50);
-			fallthrough;
+			set_link_state(dum_hcd);
+			break;
 		case USB_PORT_FEAT_C_CONNECTION:
 		case USB_PORT_FEAT_C_RESET:
 		case USB_PORT_FEAT_C_ENABLE:
