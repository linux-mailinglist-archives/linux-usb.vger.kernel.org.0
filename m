Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9897A35C2F2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242112AbhDLJx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:35512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240405AbhDLJs0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:48:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC8AD6124C;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=1u6+2U/lTbZfvQi4wEkNsfyEubphBVem/KzYxzaR5fk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PuLFYrM/TE/PzmdjuXS0qCS9K0pxXjU8hB4ToUeJVF+74juHhcuWE3dceBUpG+IIO
         d3BKS1MxRZOA3c+E9Gi385FcQk7SEvKd2ZS5hIvKrgStOCkFtfjbLJOvwMrPwE2D5Z
         2YDqxOKRZSN5Jr6GyOfCPUdxGG4Lmg5feYw85Vh9nbqaOYvd50RIOMcYMXzQle8jxI
         p9X/ca9cKFAVF9mdDeuN7p0p2MP/q6CHUzMFoNLH/DdUcuriiDD11srgp0bhOIkoNo
         g7vNyHSNLQAE8C895/2SW+q4cxuE0+szfT2ITnPcxUYQxW/Ur7Qp2SyWE0653/LJNv
         PQi2rrvOnI66w==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GJ-2b; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 03/10] USB: serial: io_ti: add read-port-command helper
Date:   Mon, 12 Apr 2021 11:47:31 +0200
Message-Id: <20210412094738.944-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a read-port-command helper analogous to the send-port-command
helper to take care of the UART module id instead of open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index f65a712078ab..480a73aff78f 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -284,6 +284,14 @@ static int ti_vsend_sync(struct usb_device *dev, u8 request, u16 value,
 	return 0;
 }
 
+static int read_port_cmd(struct usb_serial_port *port, u8 command, u16 value,
+		void *data, int size)
+{
+	return ti_vread_sync(port->serial->dev, command, value,
+			UMPM_UART1_PORT + port->port_number,
+			data, size);
+}
+
 static int send_port_cmd(struct usb_serial_port *port, u8 command, u16 value,
 		void *data, int size)
 {
@@ -1826,7 +1834,6 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 	struct edgeport_serial *edge_serial;
 	struct usb_device *dev;
 	struct urb *urb;
-	int port_number;
 	int status;
 	u16 open_settings;
 	u8 transaction_timeout;
@@ -1834,8 +1841,6 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 	if (edge_port == NULL)
 		return -ENODEV;
 
-	port_number = port->port_number;
-
 	dev = port->serial->dev;
 
 	/* turn off loopback */
@@ -1892,9 +1897,7 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 	}
 
 	/* Read Initial MSR */
-	status = ti_vread_sync(dev, UMPC_READ_MSR, 0,
-				(__u16)(UMPM_UART1_PORT + port_number),
-				&edge_port->shadow_msr, 1);
+	status = read_port_cmd(port, UMPC_READ_MSR, 0, &edge_port->shadow_msr, 1);
 	if (status) {
 		dev_err(&port->dev, "%s - cannot send read MSR command, %d\n",
 							__func__, status);
-- 
2.26.3

