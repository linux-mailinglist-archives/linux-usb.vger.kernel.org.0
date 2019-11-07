Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7928CF2F54
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbfKGN3c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:32 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45163 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbfKGN3b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:31 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so2252440ljg.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KV6FgkZT3tBNc1qg/Lz1AkNLOCRRjfwbev+8vDOiJp4=;
        b=YHTcXjmVeGroMDLq2uQQJ/C/sbJsO7wcdUpx6uFDs3yTw4RW9+PxZI+WHDgOMnhxwD
         uPv49JsenNSsCyiqN63Cj2D34liFmZ90um2Hw5QzEwcvGDgbuEPjGwhJ04YHWsV7jZad
         xBSX509GeIRgAs0JJgU82tyYaZR+QqoO5B7/VvkJwWV8jGZtucL48OiaVAwgORx3kWNO
         Q96WhPrV+L7S4j8DV/cxAB3D8WWrNxTreW3bhecWAOWMLfH1hluPTaOaoSrHlISVjYF6
         0js88Y08m/fIakV33273WS6WSFQX4iiDuSy3Oyb1yyjNnBMW6chrjVi8u6hv0bRGFSve
         cM2g==
X-Gm-Message-State: APjAAAUxJklA7T9CPZBtuUB+1kffEvuAA6HaLs+Sm+qO8u0wgCHATUnp
        w88XQcPLmQo+8hbFrvRi+4w=
X-Google-Smtp-Source: APXvYqxpFCshqccB/E/oEqKT+p5364/UGH9bR/GLB6mpvxJJzao9wP7mlQlFqO1jKC+9bIgw+RaBjg==
X-Received: by 2002:a2e:9b89:: with SMTP id z9mr2573775lji.185.1573133368792;
        Thu, 07 Nov 2019 05:29:28 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id y18sm1249830lja.12.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:25 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000da-Dw; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 03/11] USB: serial: mos7840: fix probe error handling
Date:   Thu,  7 Nov 2019 14:28:56 +0100
Message-Id: <20191107132904.2379-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver would return success and leave the port structures
half-initialised if any of the register accesses during probe fails.

This would specifically leave the port control urb unallocated,
something which could trigger a NULL pointer dereference on interrupt
events.

Fortunately the interrupt implementation is completely broken and has
never even been enabled...

Note that the zero-length-enable register write used to set the zle-flag
for all ports is moved to attach.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 48 +++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 6de41a3c2dab..ddd8db3be110 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -2066,6 +2066,23 @@ static int mos7840_calc_num_ports(struct usb_serial *serial,
 	return num_ports;
 }
 
+static int mos7840_attach(struct usb_serial *serial)
+{
+	struct device *dev = &serial->interface->dev;
+	int status;
+	u16 val;
+
+	/* Zero Length flag enable */
+	val = 0x0f;
+	status = mos7840_set_reg_sync(serial->port[0], ZLP_REG5, val);
+	if (status < 0)
+		dev_dbg(dev, "Writing ZLP_REG5 failed status-0x%x\n", status);
+	else
+		dev_dbg(dev, "ZLP_REG5 Writing success status%d\n", status);
+
+	return status;
+}
+
 static int mos7840_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
@@ -2123,7 +2140,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			mos7840_port->ControlRegOffset, &Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Reading ControlReg failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "ControlReg Reading success val is %x, status%d\n", Data, status);
 	Data |= 0x08;	/* setting driver done bit */
@@ -2135,7 +2152,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			mos7840_port->ControlRegOffset, Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing ControlReg failed(rx_disable) status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "ControlReg Writing success(rx_disable) status%d\n", status);
 
@@ -2146,7 +2163,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			(__u16) (mos7840_port->DcrRegOffset + 0), Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing DCR0 failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "DCR0 Writing success status%d\n", status);
 
@@ -2155,7 +2172,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			(__u16) (mos7840_port->DcrRegOffset + 1), Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing DCR1 failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "DCR1 Writing success status%d\n", status);
 
@@ -2164,7 +2181,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 			(__u16) (mos7840_port->DcrRegOffset + 2), Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing DCR2 failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "DCR2 Writing success status%d\n", status);
 
@@ -2173,7 +2190,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 	status = mos7840_set_reg_sync(port, CLK_START_VALUE_REGISTER, Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing CLK_START_VALUE_REGISTER failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "CLK_START_VALUE_REGISTER Writing success status%d\n", status);
 
@@ -2190,7 +2207,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 	status = mos7840_set_uart_reg(port, SCRATCH_PAD_REGISTER, Data);
 	if (status < 0) {
 		dev_dbg(&port->dev, "Writing SCRATCH_PAD_REGISTER failed status-0x%x\n", status);
-		goto out;
+		goto error;
 	} else
 		dev_dbg(&port->dev, "SCRATCH_PAD_REGISTER Writing success status%d\n", status);
 
@@ -2204,7 +2221,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 				(__u16)(ZLP_REG1 + ((__u16) mos7840_port->port_num)));
 		if (status < 0) {
 			dev_dbg(&port->dev, "Writing ZLP_REG%d failed status-0x%x\n", pnum + 2, status);
-			goto out;
+			goto error;
 		} else
 			dev_dbg(&port->dev, "ZLP_REG%d Writing success status%d\n", pnum + 2, status);
 	} else {
@@ -2216,7 +2233,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 				(__u16)(ZLP_REG1 + ((__u16) mos7840_port->port_num) - 0x1));
 		if (status < 0) {
 			dev_dbg(&port->dev, "Writing ZLP_REG%d failed status-0x%x\n", pnum + 1, status);
-			goto out;
+			goto error;
 		} else
 			dev_dbg(&port->dev, "ZLP_REG%d Writing success status%d\n", pnum + 1, status);
 
@@ -2254,17 +2271,7 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 		/* Turn off LED */
 		mos7840_set_led_sync(port, MODEM_CONTROL_REGISTER, 0x0300);
 	}
-out:
-	if (pnum == serial->num_ports - 1) {
-		/* Zero Length flag enable */
-		Data = 0x0f;
-		status = mos7840_set_reg_sync(serial->port[0], ZLP_REG5, Data);
-		if (status < 0) {
-			dev_dbg(&port->dev, "Writing ZLP_REG5 failed status-0x%x\n", status);
-			goto error;
-		} else
-			dev_dbg(&port->dev, "ZLP_REG5 Writing success status%d\n", status);
-	}
+
 	return 0;
 error:
 	kfree(mos7840_port->led_dr);
@@ -2320,6 +2327,7 @@ static struct usb_serial_driver moschip7840_4port_device = {
 	.unthrottle = mos7840_unthrottle,
 	.calc_num_ports = mos7840_calc_num_ports,
 	.probe = mos7840_probe,
+	.attach = mos7840_attach,
 	.ioctl = mos7840_ioctl,
 	.get_serial = mos7840_get_serial_info,
 	.set_termios = mos7840_set_termios,
-- 
2.23.0

