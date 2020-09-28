Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F9B27B0D2
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 17:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgI1PWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 11:22:19 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50347 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726424AbgI1PWT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 11:22:19 -0400
Received: (qmail 136930 invoked by uid 1000); 28 Sep 2020 11:22:17 -0400
Date:   Mon, 28 Sep 2020 11:22:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     yasushi asano <yazzep@gmail.com>, andrew_gabbasov@mentor.com,
        "Rosca, Eugeniu \(ADITG/ESM1\)" <erosca@de.adit-jv.com>,
        Baxter Jim <jim_baxter@mentor.com>, linux-usb@vger.kernel.org,
        "Nishiguchi, Naohiro \(ADITJ/SWG\)" <nnishiguchi@jp.adit-jv.com>,
        "Natsume, Wataru \(ADITJ/SWG\)" <wnatsume@jp.adit-jv.com>,
        =?utf-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Subject: [Patch 2/2]: USB: hub: Add Kconfig option to reduce number of port
 initialization retries
Message-ID: <20200928152217.GB134701@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
 <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu>
 <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu>
 <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
 <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com>
 <20200925184153.GA53451@rowland.harvard.edu>
 <CAEt1Rjo_H5f0CD+o5y-jDBfU8__gEPie0PvqzsV48aaakO7JkA@mail.gmail.com>
 <20200928152050.GA134701@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200928152050.GA134701@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Description based on one by Yasushi Asano:

According to 6.7.22 A-UUT “Device No Response” for connection timeout
of USB OTG and EH automated compliance plan v1.2, enumeration failure
has to be detected within 30 seconds.  However, the old and new
enumeration schemes each make a total of 12 attempts, and each attempt
can take 5 seconds to time out, so the PET test fails.

This patch adds a new Kconfig option (CONFIG_USB_FEW_INIT_RETRIES);
when the option is set all the initialization retry loops except the
outermost are reduced to a single iteration.  This reduces the total
number of attempts to four, allowing Linux hosts to pass the PET test.

The new option is disabled by default to preserve the existing
behavior.  The reduced number of retries may fail to initialize a few
devices that currently do work, but for the most part there should be
no change.  And in cases where the initialization does fail, it will
fail much more quickly.

Reported-and-tested-by: yasushi asano <yazzep@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1945]


 drivers/usb/core/Kconfig |   14 ++++++++++++++
 drivers/usb/core/hub.c   |   13 ++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/core/Kconfig
===================================================================
--- usb-devel.orig/drivers/usb/core/Kconfig
+++ usb-devel/drivers/usb/core/Kconfig
@@ -32,6 +32,20 @@ config USB_DEFAULT_PERSIST
 	  If you have any questions about this, say Y here, only say N
 	  if you know exactly what you are doing.
 
+config USB_FEW_INIT_RETRIES
+	bool "Limit USB device initialization to only a few retries"
+	help
+	  When a new USB device is detected, the kernel tries very hard
+	  to initialize and enumerate it, with lots of nested retry loops.
+	  This almost always works, but when it fails it can take a long time.
+	  This option tells the kernel to make only a few retry attempts,
+	  so that the total time required for a failed initialization is
+	  no more than 30 seconds (as required by the USB OTG spec).
+
+	  Say N here unless you require new-device enumeration failure to
+	  occur within 30 seconds (as might be needed in an embedded
+	  application).
+
 config USB_DYNAMIC_MINORS
 	bool "Dynamic USB minor allocation"
 	help
Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2705,10 +2705,20 @@ static unsigned hub_is_wusb(struct usb_h
 }
 
 
+#ifdef CONFIG_USB_FEW_INIT_RETRIES
+#define PORT_RESET_TRIES	2
+#define SET_ADDRESS_TRIES	1
+#define GET_DESCRIPTOR_TRIES	1
+#define GET_MAXPACKET0_TRIES	1
+#define PORT_INIT_TRIES		4
+
+#else
 #define PORT_RESET_TRIES	5
 #define SET_ADDRESS_TRIES	2
 #define GET_DESCRIPTOR_TRIES	2
+#define GET_MAXPACKET0_TRIES	3
 #define PORT_INIT_TRIES		4
+#endif	/* CONFIG_USB_FEW_INIT_RETRIES */
 
 #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
 #define HUB_SHORT_RESET_TIME	10
@@ -4691,7 +4701,8 @@ hub_port_init(struct usb_hub *hub, struc
 			 * 255 is for WUSB devices, we actually need to use
 			 * 512 (WUSB1.0[4.8.1]).
 			 */
-			for (operations = 0; operations < 3; ++operations) {
+			for (operations = 0; operations < GET_MAXPACKET0_TRIES;
+					++operations) {
 				buf->bMaxPacketSize0 = 0;
 				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
 					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
