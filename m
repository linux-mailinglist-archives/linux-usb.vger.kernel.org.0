Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC8F48285F
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 20:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiAATwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 14:52:15 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35811 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232597AbiAATwP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 14:52:15 -0500
Received: (qmail 1154900 invoked by uid 1000); 1 Jan 2022 14:52:14 -0500
Date:   Sat, 1 Jan 2022 14:52:14 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Jonathan McDowell <noodles@earth.li>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix bug in resuming hub's handling of wakeup
 requests
Message-ID: <YdCw7nSfWYPKWQoD@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bugzilla #213839 reports a 7-port hub that doesn't work properly when
devices are plugged into some of the ports; the kernel goes into an
unending disconnect/reinitialize loop as shown in the bug report.

This "7-port hub" comprises two four-port hubs with one plugged into
the other; the failures occur when a device is plugged into one of the
downstream hub's ports.  (These hubs have other problems too.  For
example, they bill themselves as USB-2.0 compliant but they only run
at full speed.)

It turns out that the failures are caused by bugs in both the kernel
and the hub.  The hub's bug is that it reports a different
bmAttributes value in its configuration descriptor following a remote
wakeup (0xe0 before, 0xc0 after -- the wakeup-support bit has
changed).

The kernel's bug is inside the hub driver's resume handler.  When
hub_activate() sees that one of the hub's downstream ports got a
wakeup request from a child device, it notes this fact by setting the
corresponding bit in the hub->change_bits variable.  But this variable
is meant for connection changes, not wakeup events; setting it causes
the driver to believe the downstream port has been disconnected and
then connected again (in addition to having received a wakeup
request).

Because of this, the hub driver then tries to check whether the device
currently plugged into the downstream port is the same as the device
that had been attached there before.  Normally this check succeeds and
wakeup handling continues with no harm done (which is why the bug
remained undetected until now).  But with these dodgy hubs, the check
fails because the config descriptor has changed.  This causes the hub
driver to reinitialize the child device, leading to the
disconnect/reinitialize loop described in the bug report.

The proper way to note reception of a downstream wakeup request is
to set a bit in the hub->event_bits variable instead of
hub->change_bits.  That way the hub driver will realize that something
has happened to the port but will not think the port and child device
have been disconnected.  This patch makes that change.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Tested-by: Jonathan McDowell <noodles@earth.li>
Cc: <stable@vger.kernel.org>

---


[as1967]


Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1225,7 +1225,7 @@ static void hub_activate(struct usb_hub
 			 */
 			if (portchange || (hub_is_superspeed(hub->hdev) &&
 						port_resumed))
-				set_bit(port1, hub->change_bits);
+				set_bit(port1, hub->event_bits);
 
 		} else if (udev->persist_enabled) {
 #ifdef CONFIG_PM
