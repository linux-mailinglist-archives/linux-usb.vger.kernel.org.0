Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E3B213C39
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 17:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgGCPBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 11:01:14 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42100 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgGCPBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 11:01:14 -0400
Received: by mail-lf1-f66.google.com with SMTP id y13so18659820lfe.9
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 08:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oBTK44olu+ltKJxauv411ixwTeMcZX65HPF6B/DqC7g=;
        b=aiaNczo+QQPOqKeoZrkVC62VJE1hVERi21gtluKRT9UQiRjCKSy9mEHtkyK2TWfVxj
         48FaVxdfZek8oGN51Q3bpqoR8ICByI+8PG40gP5HQQ+73WLKVEu4DgRoj7ljf+2ZM0d2
         KTOTL9drJDln44h3hpaq3710EopF9TDU8qS+DQ6tdxy0i8iMy7IL1qoLhUMooUw8xo/b
         N45Zc+yqSUPA6z7BkbsQSk+EMFK+l21mVFIBC+Uj5jONh3/KzVAzMPcifLrsH0PPP3+g
         r+fim/LAZoYKZyZP31kO6T71jYiDzukdy5ZgClGJy8vg7wxkv/PzzIDrNV5xciHmqFE5
         8lbQ==
X-Gm-Message-State: AOAM531wZzQocWGFXMLkkxJIQNiAJdLmR1bmOTumAesvdgkCRZfTBZgj
        s7kghVQgVA9l3/33FRCl36PMqa7sM7g=
X-Google-Smtp-Source: ABdhPJxVS3mwq9XG/MmQom6H/K2R6YlUUGd+p3SOsCjHLLuhT0K4qPvK5NLBHiTNPt/x4GHnyKIwJw==
X-Received: by 2002:a19:3f42:: with SMTP id m63mr22309490lfa.104.1593788469429;
        Fri, 03 Jul 2020 08:01:09 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id s8sm2511698ljh.74.2020.07.03.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 08:01:08 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jrNBY-0005C2-Bt; Fri, 03 Jul 2020 17:01:05 +0200
Date:   Fri, 3 Jul 2020 17:01:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200703150104.GE3453@localhost>
References: <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703074539.GB3453@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 09:45:39AM +0200, Johan Hovold wrote:
> On Wed, Jul 01, 2020 at 09:28:25PM +0200, Jerry wrote:
> > Johan Hovold wrote on 7/1/20 5:42 PM:
> > > It would be better if could detect both types of overrun.
> > >
> > > Did you try moving the purge command at close to after disabling the
> > > uart?
> > >
> > > Or perhaps we can add a "dummy" comm-status command after disabling the
> > > uart?
> 
> > I try to describe more details about this overrun problem:
> > 1) I tried only CP2102 because our company uses it, I have no idea whether 
> > the same apply for CP2104,2105... or not, I don't have another chip.
> > 2) Maybe I should note I'm always using even parity (because of STM32 
> > bootloader protocol).
> > 3) I thought the problem is created by unreaded data when closing because 
> > overrun was reported after closing if GET_COMM_STATUS shown positive 
> > ulAmountInInQueue before closing. Later I discovered that if I close the 
> > port, wait, send some data from outside, then open it, I will also get 
> > HW_OVERRUN flag.
> > 4) So currently I suppose that problem is usually created by any incoming 
> > data after disabling interface. If I remove UART_DISABLE from close method, 
> > no overrun ever reported.
> > 5) Unfortunately this overrun is not reported immediately after port 
> > opening but later after receiving first byte. I didn't find any way how to 
> > purge nor dummy read this flag before transmitting data.
> > 6) I didn't find this problem in a chip errata and nobody complaining about it.
> > 7) I successfully reproduced the same problem in MS Windows 10. If some 
> > data arrived to closed port, then I open it, everything is OK but after 
> > sending request and receiving reply I often get overrun indication from 
> > Win32 API ClearCommError()
> > 8) I removed HW_OVERRUN checking because I don't want to break anything but 
> > maybe Linux driver should work the same way as Windows and don't hide this 
> > problem?
> > 9) I needed just to detect parity error from user space and things 
> > complicate.  :-)
> 
> Heh, yeah, it tends to be that way. :) But thanks for the great summary
> of your findings!
> 
> I think it probably makes most sense to keep the error in as it's a
> quirk of the device rather than risk missing an actual overrun.
> 
> The problem here is that we're sort of violating the API and turning
> TIOCGICOUNT into a polling interface instead of just returning our error
> and interrupt counters. This means will always undercount any errors for
> a start.
> 
> The chip appears to have a mechanism for reporting errors in-band, but
> that would amount to processing every character received to look for the
> escape char, which adds overhead. I'm guessing that interface would also
> insert an overrun error when returning the first character.
> 
> But perhaps that it was we should be using as it allows parity the
> errors to be reported using the normal in-band methods. If we only
> enable it when parity checking is enabled then the overhead seems
> justified.
> 
> I did a quick test here and the event insertion appears to work well for
> parity errors. Didn't manage to get it to report break events yet, and
> modem-status changes are being buffered and not reported until the next
> character. But in theory we could expand the implementation to provide
> more features later.
> 
> I'll see if I can cook something up quickly.

Would you mind giving the below a try and see how that works in your
setup?

With this patch you'd be able to use PARMRK to be notified of any parity
errors, but I also wired up TIOCGICOUNT if you prefer to use that.

Also, could try and see if your device detects breaks properly? Mine
just return a NUL char.

Johan



From 5fc7de670489a6651e023c325e674666d65cfe14 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 3 Jul 2020 16:39:14 +0200
Subject: [PATCH] USB: serial: add support for line-status events

Add support for line-status events that can be used to detect and report
parity errors.

Enable the device's event-insertion mode whenever input-parity checking
is requested. This will insert line and modem status events into the
data stream.

Note that modem-status changes appear to be buffered until a character
is received and is therefore left unimplemented.

On at least one type of these chips, line breaks are also not detected
properly and is just reported as a NUL character. I'm therefore not
enabling event-insertion when !IGNBRK is requested.

Also wire up TIOCGICOUNT to allow for reading out the line-status
counters.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 207 +++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index f5143eedbc48..b5f8176ee7ab 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -50,6 +50,9 @@ static void cp210x_release(struct usb_serial *);
 static int cp210x_port_probe(struct usb_serial_port *);
 static int cp210x_port_remove(struct usb_serial_port *);
 static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
+static void cp210x_process_read_urb(struct urb *urb);
+static void cp210x_enable_event_mode(struct usb_serial_port *port);
+static void cp210x_disable_event_mode(struct usb_serial_port *port);
 
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x045B, 0x0053) }, /* Renesas RX610 RX-Stick */
@@ -253,9 +256,21 @@ struct cp210x_serial_private {
 	bool			use_actual_rate;
 };
 
+enum cp210x_event_state {
+	ES_DATA,
+	ES_ESCAPE,
+	ES_LSR,
+	ES_LSR_DATA_0,
+	ES_LSR_DATA_1,
+	ES_MSR
+};
+
 struct cp210x_port_private {
 	__u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
+	bool			event_mode;
+	enum cp210x_event_state event_state;
+	u8 lsr;
 };
 
 static struct usb_serial_driver cp210x_device = {
@@ -274,12 +289,14 @@ static struct usb_serial_driver cp210x_device = {
 	.tx_empty		= cp210x_tx_empty,
 	.tiocmget		= cp210x_tiocmget,
 	.tiocmset		= cp210x_tiocmset,
+	.get_icount		= usb_serial_generic_get_icount,
 	.attach			= cp210x_attach,
 	.disconnect		= cp210x_disconnect,
 	.release		= cp210x_release,
 	.port_probe		= cp210x_port_probe,
 	.port_remove		= cp210x_port_remove,
-	.dtr_rts		= cp210x_dtr_rts
+	.dtr_rts		= cp210x_dtr_rts,
+	.process_read_urb	= cp210x_process_read_urb,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {
@@ -401,6 +418,15 @@ struct cp210x_comm_status {
  */
 #define PURGE_ALL		0x000f
 
+/* CP210X_EMBED_EVENTS */
+#define CP210X_ESCCHAR		0xff
+
+#define CP210X_LSR_OVERRUN	BIT(1)
+#define CP210X_LSR_PARITY	BIT(2)
+#define CP210X_LSR_FRAME	BIT(3)
+#define CP210X_LSR_BREAK	BIT(4)
+
+
 /* CP210X_GET_FLOW/CP210X_SET_FLOW read/write these 0x10 bytes */
 struct cp210x_flow_ctl {
 	__le32	ulControlHandshake;
@@ -807,6 +833,7 @@ static int cp210x_get_line_ctl(struct usb_serial_port *port, u16 *ctl)
 
 static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
 	int result;
 
 	result = cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_ENABLE);
@@ -819,20 +846,151 @@ static int cp210x_open(struct tty_struct *tty, struct usb_serial_port *port)
 	cp210x_get_termios(tty, port);
 
 	/* The baud rate must be initialised on cp2104 */
-	if (tty)
+	if (tty) {
 		cp210x_change_speed(tty, port, NULL);
 
-	return usb_serial_generic_open(tty, port);
+		/* FIXME: handle from set_termios() only */
+		if (I_INPCK(tty))
+			cp210x_enable_event_mode(port);
+	}
+
+	result = usb_serial_generic_open(tty, port);
+	if (result)
+		goto err_disable;
+
+	return 0;
+
+err_disable:
+	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
+	port_priv->event_mode = false;
+
+	return result;
 }
 
 static void cp210x_close(struct usb_serial_port *port)
 {
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+
 	usb_serial_generic_close(port);
 
 	/* Clear both queues; cp2108 needs this to avoid an occasional hang */
 	cp210x_write_u16_reg(port, CP210X_PURGE, PURGE_ALL);
 
 	cp210x_write_u16_reg(port, CP210X_IFC_ENABLE, UART_DISABLE);
+
+	/* Disabling the interface disables event-insertion mode. */
+	port_priv->event_mode = false;
+}
+
+static char cp210x_process_lsr(struct usb_serial_port *port, unsigned char lsr)
+{
+	char flag = TTY_NORMAL;
+
+	if (lsr & CP210X_LSR_BREAK) {
+		flag = TTY_BREAK;
+		port->icount.brk++;
+		/* FIXME: no need to process sysrq chars without breaks... */
+		usb_serial_handle_break(port);
+	} else if (lsr & CP210X_LSR_PARITY) {
+		flag = TTY_PARITY;
+		port->icount.parity++;
+	} else if (lsr & CP210X_LSR_FRAME) {
+		flag = TTY_FRAME;
+		port->icount.frame++;
+	}
+
+	if (lsr & CP210X_LSR_OVERRUN) {
+		port->icount.overrun++;
+		tty_insert_flip_char(&port->port, 0, TTY_OVERRUN);
+	}
+
+	return flag;
+}
+
+static bool cp210x_process_event_char(struct usb_serial_port *port, unsigned char *ch, char *flag)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+
+	switch(port_priv->event_state) {
+	case ES_DATA:
+		if (*ch == CP210X_ESCCHAR) {
+			port_priv->event_state = ES_ESCAPE;
+			break;
+		}
+		return false;
+	case ES_ESCAPE:
+		switch (*ch) {
+		case 0:
+			dev_dbg(&port->dev, "%s - escape char\n", __func__);
+			*ch = CP210X_ESCCHAR;
+			port_priv->event_state = ES_DATA;
+			return false;
+		case 1:
+			port_priv->event_state = ES_LSR_DATA_0;
+			break;
+		case 2:
+			port_priv->event_state = ES_LSR;
+			break;
+		case 3:
+			port_priv->event_state = ES_MSR;
+			break;
+		default:
+			dev_err(&port->dev, "malformed event 0x%02x\n", *ch);
+			port_priv->event_state = ES_DATA;
+			break;
+		}
+		break;
+	case ES_LSR_DATA_0:
+		port_priv->lsr = *ch;
+		port_priv->event_state = ES_LSR_DATA_1;
+		break;
+	case ES_LSR_DATA_1:
+		dev_dbg(&port->dev, "%s - lsr = 0x%02x, data = 0x%02x\n",
+				__func__, port_priv->lsr, *ch);
+		*flag = cp210x_process_lsr(port, port_priv->lsr);
+		port_priv->event_state = ES_DATA;
+		return false;
+	case ES_LSR:
+		dev_dbg(&port->dev, "%s - lsr = 0x%02x\n", __func__, *ch);
+		port_priv->lsr = *ch;
+		cp210x_process_lsr(port, port_priv->lsr);
+		port_priv->event_state = ES_DATA;
+		break;
+	case ES_MSR:
+		dev_dbg(&port->dev, "%s - msr = 0x%02x\n", __func__, *ch);
+		/* unimplemented */
+		port_priv->event_state = ES_DATA;
+		break;
+	}
+
+	return true;
+}
+
+static void cp210x_process_read_urb(struct urb *urb)
+{
+	struct usb_serial_port *port = urb->context;
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	unsigned char *ch = urb->transfer_buffer;
+	char flag;
+	int i;
+
+	if (!urb->actual_length)
+		return;
+
+	if (!port_priv->event_mode && !(port->port.console && port->sysrq)) {
+		tty_insert_flip_string(&port->port, ch, urb->actual_length);
+	} else {
+		for (i = 0; i < urb->actual_length; i++, ch++) {
+			flag = TTY_NORMAL;
+
+			if (cp210x_process_event_char(port, ch, &flag))
+				continue;
+
+			if (!usb_serial_handle_sysrq_char(port, *ch))
+				tty_insert_flip_char(&port->port, *ch, flag);
+		}
+	}
+	tty_flip_buffer_push(&port->port);
 }
 
 /*
@@ -1148,6 +1306,41 @@ static void cp210x_change_speed(struct tty_struct *tty,
 	tty_encode_baud_rate(tty, baud, baud);
 }
 
+static void cp210x_enable_event_mode(struct usb_serial_port *port)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+
+	if (port_priv->event_mode)
+		return;
+
+	port_priv->event_state = ES_DATA;
+	port_priv->event_mode = true;
+
+	ret = cp210x_write_u16_reg(port, CP210X_EMBED_EVENTS, CP210X_ESCCHAR);
+	if (ret) {
+		dev_err(&port->dev, "failed to enable events: %d\n", ret);
+		port_priv->event_mode = false;
+	}
+}
+
+static void cp210x_disable_event_mode(struct usb_serial_port *port)
+{
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+
+	if (!port_priv->event_mode)
+		return;
+
+	ret = cp210x_write_u16_reg(port, CP210X_EMBED_EVENTS, 0);
+	if (ret) {
+		dev_err(&port->dev, "failed to disable events: %d\n", ret);
+		return;
+	}
+
+	port_priv->event_mode = false;
+}
+
 static void cp210x_set_termios(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
@@ -1270,6 +1463,14 @@ static void cp210x_set_termios(struct tty_struct *tty,
 				sizeof(flow_ctl));
 	}
 
+	/*
+	 * Enable event-insertion mode only if input parity checking is
+	 * enabled for now.
+	 */
+	if (I_INPCK(tty))
+		cp210x_enable_event_mode(port);
+	else
+		cp210x_disable_event_mode(port);
 }
 
 static int cp210x_tiocmset(struct tty_struct *tty,
-- 
2.26.2

