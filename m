Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815A435C301
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237377AbhDLJyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:54:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242532AbhDLJu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E49A1611AD;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220889;
        bh=g6aOx7cCccnc41Y05RH5FwlkJS7QwPbOY3agjMVQwDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TVCUGtChMN7sILus3D0WbcPr569NiN8Hs532h4XdMcl2juhtEo78i5YeZe/+KXY7s
         As3BYIuIZ5hx0nRmcOeT+CWMU6N9YyOC97JvcPJGav8UjcSwX1B4cahKofbWSMa39l
         E82MJ21rklowe8hSPYuIps6eTP2fbFRGyDXplJO9FEE2vHxluAGe1uxm+r1WyIrZfN
         frrNMdf7Vw9Ig0caoZtVqh0lHmDwatXOx8FZOCIfwKJcXlMn0R3Ur51x+Xw2PgKaVl
         pBiW8egTZDmdkOhqnOhJT3KUl0/0kvegLQmvcbTshtGehqVF0SZkNanxs97LY4B7n2
         bPh7LP3TXH9lA==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GY-HI; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 08/10] USB: serial: ti_usb_3410_5052: add port-command helpers
Date:   Mon, 12 Apr 2021 11:47:36 +0200
Message-Id: <20210412094738.944-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add two port-command helpers to handle the UART module-id parameter
instead of open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 95 +++++++++++++--------------
 1 file changed, 45 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index 25d5a6e83009..f63ee11f41e8 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -333,10 +333,14 @@ static void ti_handle_new_msr(struct ti_port *tport, u8 msr);
 static void ti_stop_read(struct ti_port *tport, struct tty_struct *tty);
 static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty);
 
-static int ti_command_out_sync(struct ti_device *tdev, __u8 command,
+static int ti_command_out_sync(struct usb_device *udev, __u8 command,
 		__u16 moduleid, __u16 value, void *data, int size);
-static int ti_command_in_sync(struct ti_device *tdev, __u8 command,
+static int ti_command_in_sync(struct usb_device *udev, __u8 command,
 		__u16 moduleid, __u16 value, void *data, int size);
+static int ti_port_cmd_out(struct usb_serial_port *port, u8 command,
+		u16 value, void *data, int size);
+static int ti_port_cmd_in(struct usb_serial_port *port, u8 command,
+		u16 value, void *data, int size);
 
 static int ti_write_byte(struct usb_serial_port *port, struct ti_device *tdev,
 			 unsigned long addr, u8 mask, u8 byte);
@@ -635,10 +639,10 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 	struct ti_device *tdev;
 	struct usb_device *dev;
 	struct urb *urb;
-	int port_number;
 	int status;
 	u16 open_settings;
 
+
 	open_settings = (TI_PIPE_MODE_CONTINUOUS |
 			 TI_PIPE_TIMEOUT_ENABLE |
 			 (TI_TRANSFER_TIMEOUT << 2));
@@ -650,8 +654,6 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (mutex_lock_interruptible(&tdev->td_open_close_lock))
 		return -ERESTARTSYS;
 
-	port_number = port->port_number;
-
 	tport->tp_msr = 0;
 	tport->tp_shadow_mcr |= (TI_MCR_RTS | TI_MCR_DTR);
 
@@ -675,31 +677,27 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (tty)
 		ti_set_termios(tty, port, &tty->termios);
 
-	status = ti_command_out_sync(tdev, TI_OPEN_PORT,
-		(__u8)(TI_UART1_PORT + port_number), open_settings, NULL, 0);
+	status = ti_port_cmd_out(port, TI_OPEN_PORT, open_settings, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send open command, %d\n",
 			__func__, status);
 		goto unlink_int_urb;
 	}
 
-	status = ti_command_out_sync(tdev, TI_START_PORT,
-		(__u8)(TI_UART1_PORT + port_number), 0, NULL, 0);
+	status = ti_port_cmd_out(port, TI_START_PORT, 0, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send start command, %d\n",
 							__func__, status);
 		goto unlink_int_urb;
 	}
 
-	status = ti_command_out_sync(tdev, TI_PURGE_PORT,
-		(__u8)(TI_UART1_PORT + port_number), TI_PURGE_INPUT, NULL, 0);
+	status = ti_port_cmd_out(port, TI_PURGE_PORT, TI_PURGE_INPUT, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot clear input buffers, %d\n",
 							__func__, status);
 		goto unlink_int_urb;
 	}
-	status = ti_command_out_sync(tdev, TI_PURGE_PORT,
-		(__u8)(TI_UART1_PORT + port_number), TI_PURGE_OUTPUT, NULL, 0);
+	status = ti_port_cmd_out(port, TI_PURGE_PORT, TI_PURGE_OUTPUT, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot clear output buffers, %d\n",
 							__func__, status);
@@ -714,16 +712,14 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (tty)
 		ti_set_termios(tty, port, &tty->termios);
 
-	status = ti_command_out_sync(tdev, TI_OPEN_PORT,
-		(__u8)(TI_UART1_PORT + port_number), open_settings, NULL, 0);
+	status = ti_port_cmd_out(port, TI_OPEN_PORT, open_settings, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send open command (2), %d\n",
 							__func__, status);
 		goto unlink_int_urb;
 	}
 
-	status = ti_command_out_sync(tdev, TI_START_PORT,
-		(__u8)(TI_UART1_PORT + port_number), 0, NULL, 0);
+	status = ti_port_cmd_out(port, TI_START_PORT, 0, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send start command (2), %d\n",
 							__func__, status);
@@ -764,7 +760,6 @@ static void ti_close(struct usb_serial_port *port)
 {
 	struct ti_device *tdev;
 	struct ti_port *tport;
-	int port_number;
 	int status;
 	unsigned long flags;
 
@@ -780,10 +775,7 @@ static void ti_close(struct usb_serial_port *port)
 	kfifo_reset_out(&port->write_fifo);
 	spin_unlock_irqrestore(&tport->tp_lock, flags);
 
-	port_number = port->port_number;
-
-	status = ti_command_out_sync(tdev, TI_CLOSE_PORT,
-		     (__u8)(TI_UART1_PORT + port_number), 0, NULL, 0);
+	status = ti_port_cmd_out(port, TI_CLOSE_PORT, 0, NULL, 0);
 	if (status)
 		dev_err(&port->dev,
 			"%s - cannot send close port command, %d\n"
@@ -904,7 +896,6 @@ static void ti_set_termios(struct tty_struct *tty,
 	struct ti_uart_config *config;
 	int baud;
 	int status;
-	int port_number = port->port_number;
 	unsigned int mcr;
 	u16 wbaudrate;
 	u16 wflags = 0;
@@ -998,12 +989,11 @@ static void ti_set_termios(struct tty_struct *tty,
 	config->wBaudRate = cpu_to_be16(wbaudrate);
 	config->wFlags = cpu_to_be16(wflags);
 
-	status = ti_command_out_sync(tport->tp_tdev, TI_SET_CONFIG,
-		(__u8)(TI_UART1_PORT + port_number), 0, config,
-		sizeof(*config));
+	status = ti_port_cmd_out(port, TI_SET_CONFIG, 0, config,
+			sizeof(*config));
 	if (status)
 		dev_err(&port->dev, "%s - cannot set config on port %d, %d\n",
-					__func__, port_number, status);
+				__func__, port->port_number, status);
 
 	/* SET_CONFIG asserts RTS and DTR, reset them correctly */
 	mcr = tport->tp_shadow_mcr;
@@ -1012,9 +1002,8 @@ static void ti_set_termios(struct tty_struct *tty,
 		mcr &= ~(TI_MCR_DTR | TI_MCR_RTS);
 	status = ti_set_mcr(tport, mcr);
 	if (status)
-		dev_err(&port->dev,
-			"%s - cannot set modem control on port %d, %d\n",
-						__func__, port_number, status);
+		dev_err(&port->dev, "%s - cannot set modem control on port %d, %d\n",
+				__func__, port->port_number, status);
 
 	kfree(config);
 }
@@ -1365,9 +1354,7 @@ static int ti_set_mcr(struct ti_port *tport, unsigned int mcr)
 static int ti_get_lsr(struct ti_port *tport, u8 *lsr)
 {
 	int size, status;
-	struct ti_device *tdev = tport->tp_tdev;
 	struct usb_serial_port *port = tport->tp_port;
-	int port_number = port->port_number;
 	struct ti_port_status *data;
 
 	size = sizeof(struct ti_port_status);
@@ -1375,8 +1362,7 @@ static int ti_get_lsr(struct ti_port *tport, u8 *lsr)
 	if (!data)
 		return -ENOMEM;
 
-	status = ti_command_in_sync(tdev, TI_GET_PORT_STATUS,
-		(__u8)(TI_UART1_PORT+port_number), 0, data, size);
+	status = ti_port_cmd_in(port, TI_GET_PORT_STATUS, 0, data, size);
 	if (status) {
 		dev_err(&port->dev,
 			"%s - get port status command failed, %d\n",
@@ -1473,34 +1459,28 @@ static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty)
 	return status;
 }
 
-
-static int ti_command_out_sync(struct ti_device *tdev, __u8 command,
+static int ti_command_out_sync(struct usb_device *udev, __u8 command,
 	__u16 moduleid, __u16 value, void *data, int size)
 {
 	int status;
 
-	status = usb_control_msg(tdev->td_serial->dev,
-		usb_sndctrlpipe(tdev->td_serial->dev, 0), command,
-		(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT),
-		value, moduleid, data, size, 1000);
-
+	status = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), command,
+			USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			value, moduleid, data, size, 1000);
 	if (status < 0)
 		return status;
 
 	return 0;
 }
 
-
-static int ti_command_in_sync(struct ti_device *tdev, __u8 command,
+static int ti_command_in_sync(struct usb_device *udev, __u8 command,
 	__u16 moduleid, __u16 value, void *data, int size)
 {
 	int status;
 
-	status = usb_control_msg(tdev->td_serial->dev,
-		usb_rcvctrlpipe(tdev->td_serial->dev, 0), command,
-		(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN),
-		value, moduleid, data, size, 1000);
-
+	status = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0), command,
+			USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+			value, moduleid, data, size, 1000);
 	if (status == size)
 		status = 0;
 	else if (status >= 0)
@@ -1509,6 +1489,21 @@ static int ti_command_in_sync(struct ti_device *tdev, __u8 command,
 	return status;
 }
 
+static int ti_port_cmd_out(struct usb_serial_port *port, u8 command,
+		u16 value, void *data, int size)
+{
+	return ti_command_out_sync(port->serial->dev, command,
+			TI_UART1_PORT + port->port_number,
+			value, data, size);
+}
+
+static int ti_port_cmd_in(struct usb_serial_port *port, u8 command,
+		u16 value, void *data, int size)
+{
+	return ti_command_in_sync(port->serial->dev, command,
+			TI_UART1_PORT + port->port_number,
+			value, data, size);
+}
 
 static int ti_write_byte(struct usb_serial_port *port,
 			 struct ti_device *tdev, unsigned long addr,
@@ -1534,8 +1529,8 @@ static int ti_write_byte(struct usb_serial_port *port,
 	data->bData[0] = mask;
 	data->bData[1] = byte;
 
-	status = ti_command_out_sync(tdev, TI_WRITE_DATA, TI_RAM_PORT, 0,
-			data, size);
+	status = ti_command_out_sync(port->serial->dev, TI_WRITE_DATA,
+			TI_RAM_PORT, 0, data, size);
 	if (status < 0)
 		dev_err(&port->dev, "%s - failed, %d\n", __func__, status);
 
-- 
2.26.3

