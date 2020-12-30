Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AE82E7B05
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 17:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgL3QVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Dec 2020 11:21:25 -0500
Received: from netrider.rowland.org ([192.131.102.5]:55779 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726290AbgL3QVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Dec 2020 11:21:25 -0500
Received: (qmail 728335 invoked by uid 1000); 30 Dec 2020 11:20:44 -0500
Date:   Wed, 30 Dec 2020 11:20:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>, Felipe Balbi <balbi@kernel.org>
Cc:     gustavoars@kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug
Message-ID: <20201230162044.GA727759@rowland.harvard.edu>
References: <20201229164314.GB694118@rowland.harvard.edu>
 <0000000000009f3cf405b79d5267@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000009f3cf405b79d5267@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dummy-hcd driver was written under the assumption that all the
parameters in URBs sent to its root hub would be valid.  With URBs
sent from userspace via usbfs, that assumption can be violated.

In particular, the driver doesn't fully check the port-feature values
stored in the wValue entry of Clear-Port-Feature and Set-Port-Feature
requests.  Values that are too large can cause the driver to perform
an invalid left shift of more than 32 bits.  Ironically, two of those
left shifts are unnecessary, because they implement Set-Port-Feature
requests that hubs are not required to support, according to section
11.24.2.13 of the USB-2.0 spec.

This patch adds the appropriate checks for the port feature selector
values and removes the unnecessary feature settings.  It also rejects
requests to set the TEST feature or to set or clear the INDICATOR and
C_OVERCURRENT features, as none of these are relevant to dummy-hcd's
root-hub emulation.

Reported-and-tested-by: syzbot+5925509f78293baa7331@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1951]


 drivers/usb/gadget/udc/dummy_hcd.c |   35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2114,9 +2114,21 @@ static int dummy_hub_control(
 				dum_hcd->port_status &= ~USB_PORT_STAT_POWER;
 			set_link_state(dum_hcd);
 			break;
-		default:
+		case USB_PORT_FEAT_ENABLE:
+		case USB_PORT_FEAT_C_ENABLE:
+		case USB_PORT_FEAT_C_SUSPEND:
+			/* Not allowed for USB-3 */
+			if (hcd->speed == HCD_USB3)
+				goto error;
+			fallthrough;
+		case USB_PORT_FEAT_C_CONNECTION:
+		case USB_PORT_FEAT_C_RESET:
 			dum_hcd->port_status &= ~(1 << wValue);
 			set_link_state(dum_hcd);
+			break;
+		default:
+		/* Disallow INDICATOR and C_OVER_CURRENT */
+			goto error;
 		}
 		break;
 	case GetHubDescriptor:
@@ -2277,18 +2289,17 @@ static int dummy_hub_control(
 			 */
 			dum_hcd->re_timeout = jiffies + msecs_to_jiffies(50);
 			fallthrough;
+		case USB_PORT_FEAT_C_CONNECTION:
+		case USB_PORT_FEAT_C_RESET:
+		case USB_PORT_FEAT_C_ENABLE:
+		case USB_PORT_FEAT_C_SUSPEND:
+			/* Not allowed for USB-3, and ignored for USB-2 */
+			if (hcd->speed == HCD_USB3)
+				goto error;
+			break;
 		default:
-			if (hcd->speed == HCD_USB3) {
-				if ((dum_hcd->port_status &
-				     USB_SS_PORT_STAT_POWER) != 0) {
-					dum_hcd->port_status |= (1 << wValue);
-				}
-			} else
-				if ((dum_hcd->port_status &
-				     USB_PORT_STAT_POWER) != 0) {
-					dum_hcd->port_status |= (1 << wValue);
-				}
-			set_link_state(dum_hcd);
+		/* Disallow TEST, INDICATOR, and C_OVER_CURRENT */
+			goto error;
 		}
 		break;
 	case GetPortErrorCount:
