Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE631BE82C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 22:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgD2ULl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 16:11:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47533 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726481AbgD2ULk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 16:11:40 -0400
Received: (qmail 25214 invoked by uid 500); 29 Apr 2020 16:11:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2020 16:11:39 -0400
Date:   Wed, 29 Apr 2020 16:11:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <ingrassia@epigenesys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
In-Reply-To: <000000000000357dce05a4240f67@google.com>
Message-ID: <Pine.LNX.4.44L0.2004291608270.24784-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 25 Apr 2020, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger crash:
> 
> Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

This is a two-pronged issue.  The first problem is that usbhid does 
something it shouldn't (it submits an URB while a device reset is in 
progress).  The second problem is that the USB core reports a driver 
bug if a an URB is submitted for ep0 at the wrong time during a reset.

The patch tested above fixes the second issue but not the first.  This 
patch attempts to fix the first issue; it makes usbhid check for a 
pending reset before submitting its URBs.

Alan Stern

#syz test: https://github.com/google/kasan.git 0fa84af8

Index: usb-devel/drivers/hid/usbhid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/usbhid/hid-core.c
+++ usb-devel/drivers/hid/usbhid/hid-core.c
@@ -87,6 +87,7 @@ static int hid_start_in(struct hid_devic
 	if (test_bit(HID_IN_POLLING, &usbhid->iofl) &&
 	    !test_bit(HID_DISCONNECTED, &usbhid->iofl) &&
 	    !test_bit(HID_SUSPENDED, &usbhid->iofl) &&
+	    !test_bit(HID_RESET_PENDING, &usbhid->iofl) &&
 	    !test_and_set_bit(HID_IN_RUNNING, &usbhid->iofl)) {
 		rc = usb_submit_urb(usbhid->urbin, GFP_ATOMIC);
 		if (rc != 0) {
@@ -273,6 +274,7 @@ static void hid_irq_in(struct urb *urb)
 	struct hid_device	*hid = urb->context;
 	struct usbhid_device	*usbhid = hid->driver_data;
 	int			status;
+	unsigned long		flags;
 
 	switch (urb->status) {
 	case 0:			/* success */
@@ -319,7 +321,12 @@ static void hid_irq_in(struct urb *urb)
 			 urb->status);
 	}
 
-	status = usb_submit_urb(urb, GFP_ATOMIC);
+	spin_lock_irqsave(&usbhid->lock, flags);
+	if (test_bit(HID_RESET_PENDING, &usbhid->iofl))
+		status = -EPERM;
+	else
+		status = usb_submit_urb(urb, GFP_ATOMIC);
+	spin_unlock_irqrestore(&usbhid->lock, flags);
 	if (status) {
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		if (status != -EPERM) {
@@ -339,6 +346,9 @@ static int hid_submit_out(struct hid_dev
 	struct usbhid_device *usbhid = hid->driver_data;
 	int r;
 
+	if (test_bit(HID_RESET_PENDING, &usbhid->iofl))
+		return -EAGAIN;
+
 	report = usbhid->out[usbhid->outtail].report;
 	raw_report = usbhid->out[usbhid->outtail].raw_report;
 
@@ -370,6 +380,9 @@ static int hid_submit_ctrl(struct hid_de
 	int len, r;
 	struct usbhid_device *usbhid = hid->driver_data;
 
+	if (test_bit(HID_RESET_PENDING, &usbhid->iofl))
+		return -EAGAIN;
+
 	report = usbhid->ctrl[usbhid->ctrltail].report;
 	raw_report = usbhid->ctrl[usbhid->ctrltail].raw_report;
 	dir = usbhid->ctrl[usbhid->ctrltail].dir;

