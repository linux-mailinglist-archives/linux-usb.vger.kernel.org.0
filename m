Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED96253879
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 21:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHZTq1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 15:46:27 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35949 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726783AbgHZTq0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 15:46:26 -0400
Received: (qmail 413667 invoked by uid 1000); 26 Aug 2020 15:46:24 -0400
Date:   Wed, 26 Aug 2020 15:46:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>,
        Jean-Christophe Barnoud <jcbarnoud@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: quirks: Ignore duplicate endpoint on Sound Devices
 MixPre-D
Message-ID: <20200826194624.GA412633@rowland.harvard.edu>
References: <a8e7a061-e788-9c57-59fc-243d0daae851@gmail.com>
 <20200825004845.GC350601@rowland.harvard.edu>
 <5fbc016f-95f2-6c5c-5749-e8ea3250d18c@gmail.com>
 <20200825145743.GB365901@rowland.harvard.edu>
 <45b3ef46-0b24-fc82-838d-1dab47a61b30@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45b3ef46-0b24-fc82-838d-1dab47a61b30@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Sound Devices MixPre-D audio card suffers from the same defect
as the Sound Devices USBPre2: an endpoint shared between a normal
audio interface and a vendor-specific interface, in violation of the
USB spec.  Since the USB core now treats duplicated endpoints as bugs
and ignores them, the audio endpoint isn't available and the card
can't be used for audio capture.

Along the same lines as commit bdd1b147b802 ("USB: quirks: blacklist
duplicate ep on Sound Devices USBPre2"), this patch adds a quirks
entry saying to ignore ep5in for interface 1, leaving it available for
use with standard audio interface 2.

Reported-and-tested-by: Jean-Christophe Barnoud <jcbarnoud@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>
Fixes: 3e4f8e21c4f2 ("USB: core: fix check for duplicate endpoints")

---


[as1943]


 drivers/usb/core/quirks.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/usb/core/quirks.c
===================================================================
--- usb-devel.orig/drivers/usb/core/quirks.c
+++ usb-devel/drivers/usb/core/quirks.c
@@ -370,6 +370,10 @@ static const struct usb_device_id usb_qu
 	{ USB_DEVICE(0x0926, 0x0202), .driver_info =
 			USB_QUIRK_ENDPOINT_IGNORE },
 
+	/* Sound Devices MixPre-D */
+	{ USB_DEVICE(0x0926, 0x0208), .driver_info =
+			USB_QUIRK_ENDPOINT_IGNORE },
+
 	/* Keytouch QWERTY Panel keyboard */
 	{ USB_DEVICE(0x0926, 0x3333), .driver_info =
 			USB_QUIRK_CONFIG_INTF_STRINGS },
@@ -509,6 +513,7 @@ static const struct usb_device_id usb_am
  */
 static const struct usb_device_id usb_endpoint_ignore[] = {
 	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0202, 1), .driver_info = 0x85 },
+	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0208, 1), .driver_info = 0x85 },
 	{ }
 };
 
