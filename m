Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1E1F2F56
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388446AbfKGN3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40432 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfKGN3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:33 -0500
Received: by mail-lj1-f195.google.com with SMTP id q2so2269072ljg.7
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gPkHGr+kZtYXp1ld78eLFZejzjsMmO71ZxEl+Do5Yd4=;
        b=dFCflJapnQVJVSMqfYRIySaHtcMF0GNQVQmcK5mq+BP9iB9gIOj1i1BBpGMFMOq2t4
         MZj0ljcBC6Y7hbF66tXviDjofukmlL/NOpDbSTrsz+Ig7hy45ZrU9TpC3/c5BGl8qRPg
         dI1UlawSnvkxaBDhJ+B09awz4q0peav7Pj9ZkdJD741212okz1eqGlM7oATlatWOS7yD
         dx52rj1cKeaPJlRCXUCWrl+GQY+oojzE53HW1x1tS1wezmj+R/CvZNtagESG08WJ+1nv
         fqWQcB4YPhLPL+JPXKdMdRGaHRDpaOjZ2Wp3QDEzTjBYt/1ok69/+f1hRXKG66fPtukj
         K1ug==
X-Gm-Message-State: APjAAAUG7r3NSNHi0TTY/mYPsydtlt4biI3ug/+4JrlrHHynj8elJfiu
        lk27NE12TgsFM9G+HCez7LI=
X-Google-Smtp-Source: APXvYqyqk/S1bNpX84B28/h5BXtuB4SfT5og740EeFH0NJ5Xifj0Wz+sG2QJcEk3A28DqmDb8A7umA==
X-Received: by 2002:a2e:9083:: with SMTP id l3mr2534109ljg.127.1573133370445;
        Thu, 07 Nov 2019 05:29:30 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id v203sm1093487lfa.25.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:26 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000df-HB; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 04/11] USB: serial: mos7840: rip out broken interrupt handling
Date:   Thu,  7 Nov 2019 14:28:57 +0100
Message-Id: <20191107132904.2379-5-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The interrupt handling is completely broken and has in fact never been
been enabled due to an inverted test for an interrupt endpoint in
open() that prevented the interrupt URB from being submitted.

Other highlights include missing interrupt URB resubmission (had it
ever been submitted), missing locking when managing the open-port count,
and NULL-pointer dereferences that could have been triggered by a
malicious device.

Rip out this broken crap which is beyond repair instead of pretending
we support this feature.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 294 +----------------------------------
 1 file changed, 3 insertions(+), 291 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index ddd8db3be110..9c5956fbd600 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -156,7 +156,6 @@
 #define LED_OFF_MS	500
 
 enum mos7840_flag {
-	MOS7840_FLAG_CTRL_BUSY,
 	MOS7840_FLAG_LED_BUSY,
 };
 
@@ -200,18 +199,12 @@ struct moschip_port {
 	__u8 shadowLCR;		/* last LCR value received */
 	__u8 shadowMCR;		/* last MCR value received */
 	char open;
-	char open_ports;
 	struct usb_serial_port *port;	/* loop back to the owner of this object */
 
 	/* Offsets */
 	__u8 SpRegOffset;
 	__u8 ControlRegOffset;
 	__u8 DcrRegOffset;
-	/* for processing control URBS in interrupt context */
-	struct urb *control_urb;
-	struct usb_ctrlrequest *dr;
-	char *ctrl_buf;
-	int MsrLsr;
 
 	spinlock_t pool_lock;
 	struct urb *write_urb_pool[NUM_URBS];
@@ -371,55 +364,6 @@ static inline struct moschip_port *mos7840_get_port_private(struct
 	return (struct moschip_port *)usb_get_serial_port_data(port);
 }
 
-static void mos7840_handle_new_msr(struct moschip_port *port, __u8 new_msr)
-{
-	struct moschip_port *mos7840_port;
-	struct async_icount *icount;
-	mos7840_port = port;
-	if (new_msr &
-	    (MOS_MSR_DELTA_CTS | MOS_MSR_DELTA_DSR | MOS_MSR_DELTA_RI |
-	     MOS_MSR_DELTA_CD)) {
-		icount = &mos7840_port->port->icount;
-
-		/* update input line counters */
-		if (new_msr & MOS_MSR_DELTA_CTS)
-			icount->cts++;
-		if (new_msr & MOS_MSR_DELTA_DSR)
-			icount->dsr++;
-		if (new_msr & MOS_MSR_DELTA_CD)
-			icount->dcd++;
-		if (new_msr & MOS_MSR_DELTA_RI)
-			icount->rng++;
-
-		wake_up_interruptible(&port->port->port.delta_msr_wait);
-	}
-}
-
-static void mos7840_handle_new_lsr(struct moschip_port *port, __u8 new_lsr)
-{
-	struct async_icount *icount;
-
-	if (new_lsr & SERIAL_LSR_BI) {
-		/*
-		 * Parity and Framing errors only count if they
-		 * occur exclusive of a break being
-		 * received.
-		 */
-		new_lsr &= (__u8) (SERIAL_LSR_OE | SERIAL_LSR_BI);
-	}
-
-	/* update input line counters */
-	icount = &port->port->icount;
-	if (new_lsr & SERIAL_LSR_BI)
-		icount->brk++;
-	if (new_lsr & SERIAL_LSR_OE)
-		icount->overrun++;
-	if (new_lsr & SERIAL_LSR_PE)
-		icount->parity++;
-	if (new_lsr & SERIAL_LSR_FE)
-		icount->frame++;
-}
-
 /************************************************************************/
 /************************************************************************/
 /*            U S B  C A L L B A C K   F U N C T I O N S                */
@@ -427,76 +371,6 @@ static void mos7840_handle_new_lsr(struct moschip_port *port, __u8 new_lsr)
 /************************************************************************/
 /************************************************************************/
 
-static void mos7840_control_callback(struct urb *urb)
-{
-	unsigned char *data;
-	struct moschip_port *mos7840_port;
-	struct device *dev = &urb->dev->dev;
-	__u8 regval = 0x0;
-	int status = urb->status;
-
-	mos7840_port = urb->context;
-
-	switch (status) {
-	case 0:
-		/* success */
-		break;
-	case -ECONNRESET:
-	case -ENOENT:
-	case -ESHUTDOWN:
-		/* this urb is terminated, clean up */
-		dev_dbg(dev, "%s - urb shutting down with status: %d\n", __func__, status);
-		goto out;
-	default:
-		dev_dbg(dev, "%s - nonzero urb status received: %d\n", __func__, status);
-		goto out;
-	}
-
-	dev_dbg(dev, "%s urb buffer size is %d\n", __func__, urb->actual_length);
-	if (urb->actual_length < 1)
-		goto out;
-
-	dev_dbg(dev, "%s mos7840_port->MsrLsr is %d port %d\n", __func__,
-		mos7840_port->MsrLsr, mos7840_port->port_num);
-	data = urb->transfer_buffer;
-	regval = (__u8) data[0];
-	dev_dbg(dev, "%s data is %x\n", __func__, regval);
-	if (mos7840_port->MsrLsr == 0)
-		mos7840_handle_new_msr(mos7840_port, regval);
-	else if (mos7840_port->MsrLsr == 1)
-		mos7840_handle_new_lsr(mos7840_port, regval);
-out:
-	clear_bit_unlock(MOS7840_FLAG_CTRL_BUSY, &mos7840_port->flags);
-}
-
-static int mos7840_get_reg(struct moschip_port *mcs, __u16 Wval, __u16 reg,
-			   __u16 *val)
-{
-	struct usb_device *dev = mcs->port->serial->dev;
-	struct usb_ctrlrequest *dr = mcs->dr;
-	unsigned char *buffer = mcs->ctrl_buf;
-	int ret;
-
-	if (test_and_set_bit_lock(MOS7840_FLAG_CTRL_BUSY, &mcs->flags))
-		return -EBUSY;
-
-	dr->bRequestType = MCS_RD_RTYPE;
-	dr->bRequest = MCS_RDREQ;
-	dr->wValue = cpu_to_le16(Wval);	/* 0 */
-	dr->wIndex = cpu_to_le16(reg);
-	dr->wLength = cpu_to_le16(2);
-
-	usb_fill_control_urb(mcs->control_urb, dev, usb_rcvctrlpipe(dev, 0),
-			     (unsigned char *)dr, buffer, 2,
-			     mos7840_control_callback, mcs);
-	mcs->control_urb->transfer_buffer_length = 2;
-	ret = usb_submit_urb(mcs->control_urb, GFP_ATOMIC);
-	if (ret)
-		clear_bit_unlock(MOS7840_FLAG_CTRL_BUSY, &mcs->flags);
-
-	return ret;
-}
-
 static void mos7840_set_led_callback(struct urb *urb)
 {
 	switch (urb->status) {
@@ -572,100 +446,6 @@ static void mos7840_led_activity(struct usb_serial_port *port)
 				jiffies + msecs_to_jiffies(LED_ON_MS));
 }
 
-/*****************************************************************************
- * mos7840_interrupt_callback
- *	this is the callback function for when we have received data on the
- *	interrupt endpoint.
- *****************************************************************************/
-
-static void mos7840_interrupt_callback(struct urb *urb)
-{
-	int result;
-	int length;
-	struct moschip_port *mos7840_port;
-	struct usb_serial *serial;
-	__u16 Data;
-	unsigned char *data;
-	__u8 sp[5];
-	int i, rv = 0;
-	__u16 wval, wreg = 0;
-	int status = urb->status;
-
-	switch (status) {
-	case 0:
-		/* success */
-		break;
-	case -ECONNRESET:
-	case -ENOENT:
-	case -ESHUTDOWN:
-		/* this urb is terminated, clean up */
-		dev_dbg(&urb->dev->dev, "%s - urb shutting down with status: %d\n",
-			__func__, status);
-		return;
-	default:
-		dev_dbg(&urb->dev->dev, "%s - nonzero urb status received: %d\n",
-			__func__, status);
-		goto exit;
-	}
-
-	length = urb->actual_length;
-	data = urb->transfer_buffer;
-
-	serial = urb->context;
-
-	/* Moschip get 5 bytes
-	 * Byte 1 IIR Port 1 (port.number is 0)
-	 * Byte 2 IIR Port 2 (port.number is 1)
-	 * Byte 3 IIR Port 3 (port.number is 2)
-	 * Byte 4 IIR Port 4 (port.number is 3)
-	 * Byte 5 FIFO status for both */
-
-	if (length > 5) {
-		dev_dbg(&urb->dev->dev, "%s", "Wrong data !!!\n");
-		return;
-	}
-
-	sp[0] = (__u8) data[0];
-	sp[1] = (__u8) data[1];
-	sp[2] = (__u8) data[2];
-	sp[3] = (__u8) data[3];
-
-	for (i = 0; i < serial->num_ports; i++) {
-		mos7840_port = mos7840_get_port_private(serial->port[i]);
-		wval = ((__u16)serial->port[i]->port_number + 1) << 8;
-		if (mos7840_port->open) {
-			if (sp[i] & 0x01) {
-				dev_dbg(&urb->dev->dev, "SP%d No Interrupt !!!\n", i);
-			} else {
-				switch (sp[i] & 0x0f) {
-				case SERIAL_IIR_RLS:
-					dev_dbg(&urb->dev->dev, "Serial Port %d: Receiver status error or \n", i);
-					dev_dbg(&urb->dev->dev, "address bit detected in 9-bit mode\n");
-					mos7840_port->MsrLsr = 1;
-					wreg = LINE_STATUS_REGISTER;
-					break;
-				case SERIAL_IIR_MS:
-					dev_dbg(&urb->dev->dev, "Serial Port %d: Modem status change\n", i);
-					mos7840_port->MsrLsr = 0;
-					wreg = MODEM_STATUS_REGISTER;
-					break;
-				}
-				rv = mos7840_get_reg(mos7840_port, wval, wreg, &Data);
-			}
-		}
-	}
-	if (!(rv < 0))
-		/* the completion handler for the control urb will resubmit */
-		return;
-exit:
-	result = usb_submit_urb(urb, GFP_ATOMIC);
-	if (result) {
-		dev_err(&urb->dev->dev,
-			"%s - Error %d submitting interrupt urb\n",
-			__func__, result);
-	}
-}
-
 static int mos7840_port_paranoia_check(struct usb_serial_port *port,
 				       const char *function)
 {
@@ -836,7 +616,6 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 	__u16 Data;
 	int status;
 	struct moschip_port *mos7840_port;
-	struct moschip_port *port0;
 
 	if (mos7840_port_paranoia_check(port, __func__))
 		return -ENODEV;
@@ -847,14 +626,11 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 		return -ENODEV;
 
 	mos7840_port = mos7840_get_port_private(port);
-	port0 = mos7840_get_port_private(serial->port[0]);
-
-	if (mos7840_port == NULL || port0 == NULL)
+	if (mos7840_port == NULL)
 		return -ENODEV;
 
 	usb_clear_halt(serial->dev, port->write_urb->pipe);
 	usb_clear_halt(serial->dev, port->read_urb->pipe);
-	port0->open_ports++;
 
 	/* Initialising the write urb pool */
 	for (j = 0; j < NUM_URBS; ++j) {
@@ -1005,41 +781,6 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
 	status = mos7840_set_reg_sync(port, mos7840_port->ControlRegOffset,
 									Data);
 
-	/* Check to see if we've set up our endpoint info yet    *
-	 * (can't set it up in mos7840_startup as the structures *
-	 * were not set up at that time.)                        */
-	if (port0->open_ports == 1) {
-		/* FIXME: Buffer never NULL, so URB is not submitted. */
-		if (serial->port[0]->interrupt_in_buffer == NULL) {
-			/* set up interrupt urb */
-			usb_fill_int_urb(serial->port[0]->interrupt_in_urb,
-				serial->dev,
-				usb_rcvintpipe(serial->dev,
-				serial->port[0]->interrupt_in_endpointAddress),
-				serial->port[0]->interrupt_in_buffer,
-				serial->port[0]->interrupt_in_urb->
-				transfer_buffer_length,
-				mos7840_interrupt_callback,
-				serial,
-				serial->port[0]->interrupt_in_urb->interval);
-
-			/* start interrupt read for mos7840 */
-			response =
-			    usb_submit_urb(serial->port[0]->interrupt_in_urb,
-					   GFP_KERNEL);
-			if (response) {
-				dev_err(&port->dev, "%s - Error %d submitting "
-					"interrupt urb\n", __func__, response);
-			}
-
-		}
-
-	}
-
-	/* see if we've set up our endpoint info yet   *
-	 * (can't set it up in mos7840_startup as the  *
-	 * structures were not set up at that time.)   */
-
 	dev_dbg(&port->dev, "port number is %d\n", port->port_number);
 	dev_dbg(&port->dev, "minor number is %d\n", port->minor);
 	dev_dbg(&port->dev, "Bulkin endpoint is %d\n", port->bulk_in_endpointAddress);
@@ -1142,7 +883,6 @@ static void mos7840_close(struct usb_serial_port *port)
 {
 	struct usb_serial *serial;
 	struct moschip_port *mos7840_port;
-	struct moschip_port *port0;
 	int j;
 	__u16 Data;
 
@@ -1154,9 +894,7 @@ static void mos7840_close(struct usb_serial_port *port)
 		return;
 
 	mos7840_port = mos7840_get_port_private(port);
-	port0 = mos7840_get_port_private(serial->port[0]);
-
-	if (mos7840_port == NULL || port0 == NULL)
+	if (mos7840_port == NULL)
 		return;
 
 	for (j = 0; j < NUM_URBS; ++j)
@@ -1173,15 +911,6 @@ static void mos7840_close(struct usb_serial_port *port)
 	usb_kill_urb(mos7840_port->read_urb);
 	mos7840_port->read_urb_busy = false;
 
-	port0->open_ports--;
-	dev_dbg(&port->dev, "%s in close%d\n", __func__, port0->open_ports);
-	if (port0->open_ports == 0) {
-		if (serial->port[0]->interrupt_in_urb) {
-			dev_dbg(&port->dev, "Shutdown interrupt_in_urb\n");
-			usb_kill_urb(serial->port[0]->interrupt_in_urb);
-		}
-	}
-
 	Data = 0x0;
 	mos7840_set_uart_reg(port, MODEM_CONTROL_REGISTER, Data);
 
@@ -2238,15 +1967,6 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			dev_dbg(&port->dev, "ZLP_REG%d Writing success status%d\n", pnum + 1, status);
 
 	}
-	mos7840_port->control_urb = usb_alloc_urb(0, GFP_KERNEL);
-	mos7840_port->ctrl_buf = kmalloc(16, GFP_KERNEL);
-	mos7840_port->dr = kmalloc(sizeof(struct usb_ctrlrequest),
-			GFP_KERNEL);
-	if (!mos7840_port->control_urb || !mos7840_port->ctrl_buf ||
-			!mos7840_port->dr) {
-		status = -ENOMEM;
-		goto error;
-	}
 
 	mos7840_port->has_led = device_flags & MCS_LED;
 
@@ -2276,9 +1996,6 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 error:
 	kfree(mos7840_port->led_dr);
 	usb_free_urb(mos7840_port->led_urb);
-	kfree(mos7840_port->dr);
-	kfree(mos7840_port->ctrl_buf);
-	usb_free_urb(mos7840_port->control_urb);
 	kfree(mos7840_port);
 
 	return status;
@@ -2301,10 +2018,7 @@ static int mos7840_port_remove(struct usb_serial_port *port)
 		usb_free_urb(mos7840_port->led_urb);
 		kfree(mos7840_port->led_dr);
 	}
-	usb_kill_urb(mos7840_port->control_urb);
-	usb_free_urb(mos7840_port->control_urb);
-	kfree(mos7840_port->ctrl_buf);
-	kfree(mos7840_port->dr);
+
 	kfree(mos7840_port);
 
 	return 0;
@@ -2334,12 +2048,10 @@ static struct usb_serial_driver moschip7840_4port_device = {
 	.break_ctl = mos7840_break,
 	.tiocmget = mos7840_tiocmget,
 	.tiocmset = mos7840_tiocmset,
-	.tiocmiwait = usb_serial_generic_tiocmiwait,
 	.get_icount = usb_serial_generic_get_icount,
 	.port_probe = mos7840_port_probe,
 	.port_remove = mos7840_port_remove,
 	.read_bulk_callback = mos7840_bulk_in_callback,
-	.read_int_callback = mos7840_interrupt_callback,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {
-- 
2.23.0

