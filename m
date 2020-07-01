Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2C9211148
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 18:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732807AbgGAQyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 12:54:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45308 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732739AbgGAQyO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id t25so23410419lji.12
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8+XYERuEbaOaHVA/xOkb+c87xOkSEUM/pBHDX8Fe5c=;
        b=atvw8v9tvsLyAp9TDRm3X1LrM8XXDRuLwOQiJR4hCwaIjC85eiyLsB6JNj17RR4KG/
         Ba2aEtnGT3/gwIhZcm3fzpM0DRClG9i+xjdLFhmCBmr8AyVovG08aHKzCKKdWMnkC0Xa
         B0CNls5QdyBLC1+lh8zb3MSmI7DRmzftEnADV/05oGNzVdle4UlUKNpMNq9926rJLXcf
         4qVwnHM+9Kzksrx8h7Li9VXxwTDqEv98TMCnBXiseKAswgZyaVnqcmGQghblTg0kQDHt
         xas9zphH3++/qVCObHFL/2iqvkj24rYb4iYEzqQb91bf8pFZ7Y2l67rFvo7PSYtXlys4
         fTTw==
X-Gm-Message-State: AOAM532GNa6SHPjZ3yCoCTMGU74aPFcpf70Fq9uSs/fPexkM3U3Ydvyd
        e/g40hsjizoq8BNKooHMv4A=
X-Google-Smtp-Source: ABdhPJxkw3CUXK1L6CdQ985miuHN01lOaXDKkKGh6Jr4MnDHiOrbOFVbaUzZpfxLHAA6uqB3YwIk/g==
X-Received: by 2002:a2e:8783:: with SMTP id n3mr11600004lji.317.1593622451984;
        Wed, 01 Jul 2020 09:54:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id n3sm1988777ljc.114.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-00042A-Fa; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/5] USB: serial: iuu_phoenix: drop unused URB submission results
Date:   Wed,  1 Jul 2020 18:53:39 +0200
Message-Id: <20200701165342.15448-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver is submitting URBs in various completion callbacks without
bothering to log errors yet still assigned the return value to temporary
variables. Let's drop those temporaries.

This suppresses the corresponding W=1 (-Wunused-but-set-variable)
warnings.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/iuu_phoenix.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index d5bff69b1769..6336616fee49 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -158,7 +158,6 @@ static int iuu_tiocmget(struct tty_struct *tty)
 static void iuu_rxcmd(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	int result;
 	int status = urb->status;
 
 	if (status) {
@@ -174,7 +173,7 @@ static void iuu_rxcmd(struct urb *urb)
 					  port->bulk_out_endpointAddress),
 			  port->write_urb->transfer_buffer, 1,
 			  read_rxcmd_callback, port);
-	result = usb_submit_urb(port->write_urb, GFP_ATOMIC);
+	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
 
 static int iuu_reset(struct usb_serial_port *port, u8 wt)
@@ -241,7 +240,6 @@ static void iuu_update_status_callback(struct urb *urb)
 static void iuu_status_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	int result;
 	int status = urb->status;
 
 	dev_dbg(&port->dev, "%s - status = %d\n", __func__, status);
@@ -250,7 +248,7 @@ static void iuu_status_callback(struct urb *urb)
 					  port->bulk_in_endpointAddress),
 			  port->read_urb->transfer_buffer, 256,
 			  iuu_update_status_callback, port);
-	result = usb_submit_urb(port->read_urb, GFP_ATOMIC);
+	usb_submit_urb(port->read_urb, GFP_ATOMIC);
 }
 
 static int iuu_status(struct usb_serial_port *port)
@@ -351,7 +349,6 @@ static void iuu_rgbf_fill_buffer(u8 *buf, u8 r1, u8 r2, u8 g1, u8 g2, u8 b1,
 static void iuu_led_activity_on(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	int result;
 	char *buf_ptr = port->write_urb->transfer_buffer;
 	*buf_ptr++ = IUU_SET_LED;
 	if (xmas) {
@@ -366,13 +363,12 @@ static void iuu_led_activity_on(struct urb *urb)
 					  port->bulk_out_endpointAddress),
 			  port->write_urb->transfer_buffer, 8 ,
 			  iuu_rxcmd, port);
-	result = usb_submit_urb(port->write_urb, GFP_ATOMIC);
+	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
 
 static void iuu_led_activity_off(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	int result;
 	char *buf_ptr = port->write_urb->transfer_buffer;
 	if (xmas) {
 		iuu_rxcmd(urb);
@@ -386,7 +382,7 @@ static void iuu_led_activity_off(struct urb *urb)
 					  port->bulk_out_endpointAddress),
 			  port->write_urb->transfer_buffer, 8 ,
 			  iuu_rxcmd, port);
-	result = usb_submit_urb(port->write_urb, GFP_ATOMIC);
+	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
 
 
-- 
2.26.2

