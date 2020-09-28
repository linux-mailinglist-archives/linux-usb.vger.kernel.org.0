Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D88D27B0CF
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 17:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgI1PUw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 11:20:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60855 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726465AbgI1PUv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 11:20:51 -0400
Received: (qmail 136874 invoked by uid 1000); 28 Sep 2020 11:20:50 -0400
Date:   Mon, 28 Sep 2020 11:20:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     yasushi asano <yazzep@gmail.com>, andrew_gabbasov@mentor.com,
        "Rosca, Eugeniu \(ADITG/ESM1\)" <erosca@de.adit-jv.com>,
        Baxter Jim <jim_baxter@mentor.com>, linux-usb@vger.kernel.org,
        "Nishiguchi, Naohiro \(ADITJ/SWG\)" <nnishiguchi@jp.adit-jv.com>,
        "Natsume, Wataru \(ADITJ/SWG\)" <wnatsume@jp.adit-jv.com>,
        =?utf-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Subject: [Patch 1/2]: USB: hub: Clean up use of port initialization schemes
 and retries
Message-ID: <20200928152050.GA134701@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
 <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu>
 <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu>
 <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
 <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com>
 <20200925184153.GA53451@rowland.harvard.edu>
 <CAEt1Rjo_H5f0CD+o5y-jDBfU8__gEPie0PvqzsV48aaakO7JkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEt1Rjo_H5f0CD+o5y-jDBfU8__gEPie0PvqzsV48aaakO7JkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SET_CONFIG_TRIES macro in hub.c is badly named; it controls the
number of port-initialization retry attempts rather than the number of
Set-Configuration attempts.  Furthermore, the USE_NEW_SCHEME macro and
use_new_scheme() function are written in a very confusing manner,
making it almost impossible to figure out exactly what they do or
check that they are correct.

This patch renames SET_CONFIG_TRIES to PORT_INIT_TRIES, removes
USE_NEW_SCHEME entirely, and rewrites use_new_scheme() to be much more
transparent, with added comments explaining how it works.  The patch
also pulls the single call site of use_new_scheme() out from the
Get-Descriptor retry loop (where it returns the same value each time)
and renames the local variable used to store the result.

The overall effect is a minor cleanup.  However, there is one
functional change: If the "use_both_schemes" module parameter isn't
set (by default it is set), the existing code does only two retry
iterations.  After this patch it will always perform four, regardless
of the parameter's value.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1944]


 drivers/usb/core/hub.c |   49 ++++++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2708,8 +2708,7 @@ static unsigned hub_is_wusb(struct usb_h
 #define PORT_RESET_TRIES	5
 #define SET_ADDRESS_TRIES	2
 #define GET_DESCRIPTOR_TRIES	2
-#define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
-#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
+#define PORT_INIT_TRIES		4
 
 #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
 #define HUB_SHORT_RESET_TIME	10
@@ -2717,23 +2716,31 @@ static unsigned hub_is_wusb(struct usb_h
 #define HUB_LONG_RESET_TIME	200
 #define HUB_RESET_TIMEOUT	800
 
-/*
- * "New scheme" enumeration causes an extra state transition to be
- * exposed to an xhci host and causes USB3 devices to receive control
- * commands in the default state.  This has been seen to cause
- * enumeration failures, so disable this enumeration scheme for USB3
- * devices.
- */
 static bool use_new_scheme(struct usb_device *udev, int retry,
 			   struct usb_port *port_dev)
 {
 	int old_scheme_first_port =
-		port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
+		(port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME) ||
+		old_scheme_first;
 
+	/*
+	 * "New scheme" enumeration causes an extra state transition to be
+	 * exposed to an xhci host and causes USB3 devices to receive control
+	 * commands in the default state.  This has been seen to cause
+	 * enumeration failures, so disable this enumeration scheme for USB3
+	 * devices.
+	 */
 	if (udev->speed >= USB_SPEED_SUPER)
 		return false;
 
-	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first);
+	/*
+	 * If use_both_schemes is set, use the first scheme (whichever
+	 * it is) for the larger half of the retries, then use the other
+	 * scheme.  Otherwise, use the first scheme for all the retries.
+	 */
+	if (use_both_schemes && retry >= (PORT_INIT_TRIES + 1) / 2)
+		return old_scheme_first_port;	/* Second half */
+	return !old_scheme_first_port;		/* First half or all */
 }
 
 /* Is a USB 3.0 port in the Inactive or Compliance Mode state?
@@ -4545,6 +4552,7 @@ hub_port_init(struct usb_hub *hub, struc
 	const char		*speed;
 	int			devnum = udev->devnum;
 	const char		*driver_name;
+	bool			do_new_scheme;
 
 	/* root hub ports have a slightly longer reset period
 	 * (from USB 2.0 spec, section 7.1.7.5)
@@ -4657,14 +4665,13 @@ hub_port_init(struct usb_hub *hub, struc
 	 * first 8 bytes of the device descriptor to get the ep0 maxpacket
 	 * value.
 	 */
-	for (retries = 0; retries < GET_DESCRIPTOR_TRIES; (++retries, msleep(100))) {
-		bool did_new_scheme = false;
+	do_new_scheme = use_new_scheme(udev, retry_counter, port_dev);
 
-		if (use_new_scheme(udev, retry_counter, port_dev)) {
+	for (retries = 0; retries < GET_DESCRIPTOR_TRIES; (++retries, msleep(100))) {
+		if (do_new_scheme) {
 			struct usb_device_descriptor *buf;
 			int r = 0;
 
-			did_new_scheme = true;
 			retval = hub_enable_device(udev);
 			if (retval < 0) {
 				dev_err(&udev->dev,
@@ -4773,11 +4780,7 @@ hub_port_init(struct usb_hub *hub, struc
 			 *  - read ep0 maxpacket even for high and low speed,
 			 */
 			msleep(10);
-			/* use_new_scheme() checks the speed which may have
-			 * changed since the initial look so we cache the result
-			 * in did_new_scheme
-			 */
-			if (did_new_scheme)
+			if (do_new_scheme)
 				break;
 		}
 
@@ -5106,7 +5109,7 @@ static void hub_port_connect(struct usb_
 		unit_load = 100;
 
 	status = 0;
-	for (i = 0; i < SET_CONFIG_TRIES; i++) {
+	for (i = 0; i < PORT_INIT_TRIES; i++) {
 
 		/* reallocate for each attempt, since references
 		 * to the previous one can escape in various ways
@@ -5239,7 +5242,7 @@ loop:
 			break;
 
 		/* When halfway through our retry count, power-cycle the port */
-		if (i == (SET_CONFIG_TRIES / 2) - 1) {
+		if (i == (PORT_INIT_TRIES - 1) / 2) {
 			dev_info(&port_dev->dev, "attempt power cycle\n");
 			usb_hub_set_port_power(hdev, hub, port1, false);
 			msleep(2 * hub_power_on_good_delay(hub));
@@ -5770,7 +5773,7 @@ static int usb_reset_and_verify_device(s
 	bos = udev->bos;
 	udev->bos = NULL;
 
-	for (i = 0; i < SET_CONFIG_TRIES; ++i) {
+	for (i = 0; i < PORT_INIT_TRIES; ++i) {
 
 		/* ep0 maxpacket size may change; let the HCD know about it.
 		 * Other endpoints will be handled by re-enumeration. */
