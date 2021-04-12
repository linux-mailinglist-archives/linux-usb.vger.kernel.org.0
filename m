Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B01635C2F7
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242273AbhDLJxe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240566AbhDLJs0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:48:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF1346121E;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=jyhRk8cJ8FQuSo/Iw3sX9HwF9/KVoQaDVz5B1ASHdI4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XPaUOUpB+0kxraLQBpf3gTrDC3Q3s2uJmutlYmtepjNtFgV4HxPV820uDbp3c3mr8
         2cVdpz9cgP4L+prUFnGz+idvBpDT1BWWx4/a821ZPt0iBeRPGRDUv4WpFFS0dBq0Pj
         rjBNqU/IAwNl/MfrdYQx6hTQNHPDA0Tc8wvTiKH+jOB+ZPBwzuOspFv5oI4KxcjkcP
         Ao6lxxKbK8O+83h0AoiDVECl9I6Egivz/8xH9QgRo1iRGHYkrUxFinoIfe8votVKVb
         k2MkvaFoRzOFOqow183Tuv2xL2Qdx7Iacu57kHK4OCHHt8sJt3AMm8Dr1MFrxu2vnU
         /WPlGNZtkdjBQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GF-05; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 02/10] USB: serial: io_ti: add send-port-command helper
Date:   Mon, 12 Apr 2021 11:47:30 +0200
Message-Id: <20210412094738.944-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a send-port-command helper which takes care of determining the UART
module id when sending commands instead of doing so at every call site.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 41 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 5d99e6d25c11..f65a712078ab 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -284,11 +284,12 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
 	return 0;
 }
 
-static int send_cmd(struct usb_device *dev, u8 command, u8 moduleid,
-		u16 value, void *data, int size)
+static int send_port_cmd(struct usb_serial_port *port, u8 command, u16 value,
+		void *data, int size)
 {
-	return ti_vsend_sync(dev, command, value, moduleid, data, size,
-			TI_VSEND_TIMEOUT_DEFAULT);
+	return ti_vsend_sync(port->serial->dev, command, value,
+			UMPM_UART1_PORT + port->port_number,
+			data, size, TI_VSEND_TIMEOUT_DEFAULT);
 }
 
 /* clear tx/rx buffers and fifo in TI UMP */
@@ -298,12 +299,7 @@ static int purge_port(struct usb_serial_port *port, __u16 mask)
 
 	dev_dbg(&port->dev, "%s - port %d, mask %x\n", __func__, port_number, mask);
 
-	return send_cmd(port->serial->dev,
-					UMPC_PURGE_PORT,
-					(__u8)(UMPM_UART1_PORT + port_number),
-					mask,
-					NULL,
-					0);
+	return send_port_cmd(port, UMPC_PURGE_PORT, mask, NULL, 0);
 }
 
 /**
@@ -1500,12 +1496,9 @@ static int do_boot_mode(struct edgeport_serial *serial,
 
 static int ti_do_config(struct edgeport_port *port, int feature, int on)
 {
-	int port_number = port->port->port_number;
-
 	on = !!on;	/* 1 or 0 not bitmask */
-	return send_cmd(port->port->serial->dev,
-			feature, (__u8)(UMPM_UART1_PORT + port_number),
-			on, NULL, 0);
+
+	return send_port_cmd(port->port, feature, on, NULL, 0);
 }
 
 static int restore_mcr(struct edgeport_port *port, __u8 mcr)
@@ -1874,8 +1867,7 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 	dev_dbg(&port->dev, "%s - Sending UMPC_OPEN_PORT\n", __func__);
 
 	/* Tell TI to open and start the port */
-	status = send_cmd(dev, UMPC_OPEN_PORT,
-		(u8)(UMPM_UART1_PORT + port_number), open_settings, NULL, 0);
+	status = send_port_cmd(port, UMPC_OPEN_PORT, open_settings, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send open command, %d\n",
 							__func__, status);
@@ -1883,8 +1875,7 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 	}
 
 	/* Start the DMA? */
-	status = send_cmd(dev, UMPC_START_PORT,
-		(u8)(UMPM_UART1_PORT + port_number), 0, NULL, 0);
+	status = send_port_cmd(port, UMPC_START_PORT, 0, NULL, 0);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send start DMA command, %d\n",
 							__func__, status);
@@ -1967,9 +1958,7 @@ static void edge_close(struct usb_serial_port *port)
 {
 	struct edgeport_serial *edge_serial;
 	struct edgeport_port *edge_port;
-	struct usb_serial *serial = port->serial;
 	unsigned long flags;
-	int port_number;
 
 	edge_serial = usb_get_serial_data(port->serial);
 	edge_port = usb_get_serial_port_data(port);
@@ -1990,9 +1979,7 @@ static void edge_close(struct usb_serial_port *port)
 	spin_unlock_irqrestore(&edge_port->ep_lock, flags);
 
 	dev_dbg(&port->dev, "%s - send umpc_close_port\n", __func__);
-	port_number = port->port_number;
-	send_cmd(serial->dev, UMPC_CLOSE_PORT,
-		     (__u8)(UMPM_UART1_PORT + port_number), 0, NULL, 0);
+	send_port_cmd(port, UMPC_CLOSE_PORT, 0, NULL, 0);
 
 	mutex_lock(&edge_serial->es_lock);
 	--edge_port->edge_serial->num_ports_open;
@@ -2225,7 +2212,6 @@ static void change_port_settings(struct tty_struct *tty,
 	int baud;
 	unsigned cflag;
 	int status;
-	int port_number = edge_port->port->port_number;
 
 	config = kmalloc (sizeof (*config), GFP_KERNEL);
 	if (!config) {
@@ -2351,9 +2337,8 @@ static void change_port_settings(struct tty_struct *tty,
 	cpu_to_be16s(&config->wFlags);
 	cpu_to_be16s(&config->wBaudRate);
 
-	status = send_cmd(edge_port->port->serial->dev, UMPC_SET_CONFIG,
-				(__u8)(UMPM_UART1_PORT + port_number),
-				0, config, sizeof(*config));
+	status = send_port_cmd(edge_port->port, UMPC_SET_CONFIG, 0, config,
+			sizeof(*config));
 	if (status)
 		dev_dbg(dev, "%s - error %d when trying to write config to device\n",
 			__func__, status);
-- 
2.26.3

