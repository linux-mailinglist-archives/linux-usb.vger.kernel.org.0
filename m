Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E80F214EFC7
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 16:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgAaPj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 10:39:28 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56008 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728752AbgAaPj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 10:39:27 -0500
Received: (qmail 3459 invoked by uid 2102); 31 Jan 2020 10:39:26 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 Jan 2020 10:39:26 -0500
Date:   Fri, 31 Jan 2020 10:39:26 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Paul Zimmerman <pauldzim@gmail.com>,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: hub: Don't record a connect-change event during
 reset-resume
Message-ID: <Pine.LNX.4.44L0.2001311037460.1577-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Paul Zimmerman reports that his USB Bluetooth adapter sometimes
crashes following system resume, when it receives a
Get-Device-Descriptor request while it is busy doing something else.

Such a request was added by commit a4f55d8b8c14 ("usb: hub: Check
device descriptor before resusciation").  It gets sent when the hub
driver's work thread checks whether a connect-change event on an
enabled port really indicates a new device has been connected, as
opposed to an old device momentarily disconnecting and then
reconnecting (which can happen with xHCI host controllers, since they
automatically enable connected ports).

The same kind of thing occurs when a port's power session is lost
during system suspend.  When the system wakes up it sees a
connect-change event on the port, and if the child device's
persist_enabled flag was set then hub_activate() sets the device's
reset_resume flag as well as the port's bit in hub->change_bits.  The
reset-resume code then takes responsibility for checking that the same
device is still attached to the port, and it does this as part of the
device's resume pathway.  By the time the hub driver's work thread
starts up again, the device has already been fully reinitialized and
is busy doing its own thing.  There's no need for the work thread to
do the same check a second time, and in fact this unnecessary check is
what caused the problem that Paul observed.

Note that performing the unnecessary check is not actually a bug.
Devices are supposed to be able to send descriptors back to the host
even when they are busy doing something else.  The underlying cause of
Paul's problem lies in his Bluetooth adapter.  Nevertheless, we
shouldn't perform the same check twice in a row -- and as a nice side
benefit, removing the extra check allows the Bluetooth adapter to work
more reliably.

The work thread performs its check when it sees that the port's bit is
set in hub->change_bits.  In this situation that bit is interpreted as
though a connect-change event had occurred on the port _after_ the
reset-resume, which is not what actually happened.

One possible fix would be to make the reset-resume code clear the
port's bit in hub->change_bits.  But it seems simpler to just avoid
setting the bit during hub_activate() in the first place.  That's what
this patch does.

(Proving that the patch is correct when CONFIG_PM is disabled requires
a little thought.  In that setting hub_activate() will be called only
for initialization and resets, since there won't be any resumes or
reset-resumes.  During initialization and hub resets the hub doesn't
have any child devices, and so this code path never gets executed.)

Reported-and-tested-by: Paul Zimmerman <pauldzim@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://marc.info/?t=157949360700001&r=1&w=2
CC: David Heinzelmann <heinzelmann.david@gmail.com>
CC: <stable@vger.kernel.org>

---

[as1930]


 drivers/usb/core/hub.c |    5 -----
 1 file changed, 5 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1216,11 +1216,6 @@ static void hub_activate(struct usb_hub
 #ifdef CONFIG_PM
 			udev->reset_resume = 1;
 #endif
-			/* Don't set the change_bits when the device
-			 * was powered off.
-			 */
-			if (test_bit(port1, hub->power_bits))
-				set_bit(port1, hub->change_bits);
 
 		} else {
 			/* The power session is gone; tell hub_wq */

