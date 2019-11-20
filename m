Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC60103E2F
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 16:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfKTPWC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 10:22:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:43216 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727711AbfKTPWC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Nov 2019 10:22:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C96046A1CA;
        Wed, 20 Nov 2019 15:22:00 +0000 (UTC)
Message-ID: <1574263316.14298.36.camel@suse.com>
Subject: Re: WARNING in dln2_start_rx_urbs/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, linux-usb@vger.kernel.org
Date:   Wed, 20 Nov 2019 16:21:56 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

#syz test: https://github.com/google/kasan.git b1aa9d83

From 6f3de1e2c53fcee54d90a6891df9cea763eca86b Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 20 Nov 2019 16:15:13 +0100
Subject: [PATCH] mfd: dln2: more sanity checking for endpoints

It is not enough to check for the number of endpoints.
The types must also be correct.

Reported-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/mfd/dln2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 381593fbe50f..7841c11411d0 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -722,6 +722,8 @@ static int dln2_probe(struct usb_interface *interface,
 		      const struct usb_device_id *usb_id)
 {
 	struct usb_host_interface *hostif = interface->cur_altsetting;
+	struct usb_endpoint_descriptor *epin;
+	struct usb_endpoint_descriptor *epout;
 	struct device *dev = &interface->dev;
 	struct dln2_dev *dln2;
 	int ret;
@@ -731,12 +733,19 @@ static int dln2_probe(struct usb_interface *interface,
 	    hostif->desc.bNumEndpoints < 2)
 		return -ENODEV;
 
+	epin = &hostif->endpoint[0].desc;
+	epout = &hostif->endpoint[1].desc;
+	if (!usb_endpoint_is_bulk_out(epout))
+		return -ENODEV;
+	if (!usb_endpoint_is_bulk_in(epin))
+		return -ENODEV;
+
 	dln2 = kzalloc(sizeof(*dln2), GFP_KERNEL);
 	if (!dln2)
 		return -ENOMEM;
 
-	dln2->ep_out = hostif->endpoint[0].desc.bEndpointAddress;
-	dln2->ep_in = hostif->endpoint[1].desc.bEndpointAddress;
+	dln2->ep_out = epout->bEndpointAddress;
+	dln2->ep_in = epin->bEndpointAddress;
 	dln2->usb_dev = usb_get_dev(interface_to_usbdev(interface));
 	dln2->interface = interface;
 	usb_set_intfdata(interface, dln2);
-- 
2.16.4

