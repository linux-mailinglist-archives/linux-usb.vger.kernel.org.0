Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77231B4E3D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 22:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgDVUQc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 16:16:32 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34864 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726090AbgDVUQc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 16:16:32 -0400
Received: (qmail 11275 invoked by uid 2102); 22 Apr 2020 16:09:51 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 16:09:51 -0400
Date:   Wed, 22 Apr 2020 16:09:51 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Paul Zimmerman <pauldzim@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: hub: Fix handling of connect changes during sleep
Message-ID: <Pine.LNX.4.44L0.2004221602480.11262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 8099f58f1ecd ("USB: hub: Don't record a connect-change event
during reset-resume") wasn't very well conceived.  The problem it
tried to fix was that if a connect-change event occurred while the
system was asleep (such as a device disconnecting itself from the bus
when it is suspended and then reconnecting when it resumes)
requiring a reset-resume during the system wakeup transition, the hub
port's change_bit entry would remain set afterward.  This would cause
the hub driver to believe another connect-change event had occurred
after the reset-resume, which was wrong and would lead the driver to
send unnecessary requests to the device (which could interfere with a
firmware update).

The commit tried to fix this by not setting the change_bit during the
wakeup.  But this was the wrong thing to do; it means that when a
device is unplugged while the system is asleep, the hub driver doesn't
realize anything has happened: The change_bit flag which would tell it
to handle the disconnect event is clear.

The commit needs to be reverted and the problem fixed in a different
way.  Fortunately an alternative solution was noted in the commit's
Changelog: We can continue to set the change_bit entry in
hub_activate() but then clear it when a reset-resume occurs.  That way
the the hub driver will see the change_bit when a device is
disconnected but won't see it when the device is still present.

That's what this patch does.

Reported-and-tested-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 8099f58f1ecd ("USB: hub: Don't record a connect-change event during reset-resume")
Tested-by: Paul Zimmerman <pauldzim@gmail.com>
CC: <stable@vger.kernel.org>

---


[as1932]


 drivers/usb/core/hub.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1219,6 +1219,11 @@ static void hub_activate(struct usb_hub
 #ifdef CONFIG_PM
 			udev->reset_resume = 1;
 #endif
+			/* Don't set the change_bits when the device
+			 * was powered off.
+			 */
+			if (test_bit(port1, hub->power_bits))
+				set_bit(port1, hub->change_bits);
 
 		} else {
 			/* The power session is gone; tell hub_wq */
@@ -3084,6 +3089,15 @@ static int check_port_resume_type(struct
 		if (portchange & USB_PORT_STAT_C_ENABLE)
 			usb_clear_port_feature(hub->hdev, port1,
 					USB_PORT_FEAT_C_ENABLE);
+
+		/*
+		 * Whatever made this reset-resume necessary may have
+		 * turned on the port1 bit in hub->change_bits.  But after
+		 * a successful reset-resume we want the bit to be clear;
+		 * if it was on it would indicate that something happened
+		 * following the reset-resume.
+		 */
+		clear_bit(port1, hub->change_bits);
 	}
 
 	return status;

