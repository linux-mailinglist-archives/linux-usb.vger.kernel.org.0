Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A35218807
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgGHMuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38496 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbgGHMuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id 9so54049122ljv.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyXSfGSid1WnxNkWrZfC4q2C1FC22J+GRzpJHuNhHWc=;
        b=gYPU5aBXp0vFFZ7IBtgCMtTuGYFmww75hsx781ls8dNy4m33qGIbii4lm7x3UK69+S
         HHbd1JThzo/eCY+q5rUFvR1VluHHQbAWriVRAny0B9MyD5pdVqogt1pAx6NFapR+UUF0
         qDlpH5UzGoUONJmPOmj2Fcf4Mh9jH2pn80p+R3+d8z9LhjLZeKLWZ42zOkotVRTEsETY
         uAHxoiptpoxY6Rl013sQMzwqpPcnH08SpNZamXw5EtnB+OYuUaGlUoqOdXZ6AjizW3mS
         XHVT5LO2h/5SsFAZBDwr+f3GkB3m6nu+udx3uu61rYst56aGdIfusug2buLObdPzmxuA
         zftg==
X-Gm-Message-State: AOAM530DCEi/Uli7nnZTIj8jgWGAjFa7tUQvey1MUwnuCil8ymt+h3cu
        nc3L0cKJbZNdp6oLTE7PryaR3eXL4lk=
X-Google-Smtp-Source: ABdhPJx3/FGZJveh2pxLKt/xkyOCJ15rXQC1lREgg4kWpHcmZWG/3gn1fsRhZLRU1bW73ATu5neezA==
X-Received: by 2002:a2e:8e9a:: with SMTP id z26mr35133698ljk.470.1594212617976;
        Wed, 08 Jul 2020 05:50:17 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y24sm892222ljy.91.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045W-0b; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 01/10] USB: serial: ftdi_sio: make process-packet buffer unsigned
Date:   Wed,  8 Jul 2020 14:49:51 +0200
Message-Id: <20200708125000.15659-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use an unsigned type for the process-packet buffer argument and give it
a more apt name.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 9ad44a96dfe3..96b9e2768ac5 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2480,12 +2480,12 @@ static int ftdi_prepare_write_buffer(struct usb_serial_port *port,
 #define FTDI_RS_ERR_MASK (FTDI_RS_BI | FTDI_RS_PE | FTDI_RS_FE | FTDI_RS_OE)
 
 static int ftdi_process_packet(struct usb_serial_port *port,
-		struct ftdi_private *priv, char *packet, int len)
+		struct ftdi_private *priv, unsigned char *buf, int len)
 {
+	unsigned char status;
+	unsigned char *ch;
 	int i;
-	char status;
 	char flag;
-	char *ch;
 
 	if (len < 2) {
 		dev_dbg(&port->dev, "malformed packet\n");
@@ -2495,7 +2495,7 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 	/* Compare new line status to the old one, signal if different/
 	   N.B. packet may be processed more than once, but differences
 	   are only processed once.  */
-	status = packet[0] & FTDI_STATUS_B0_MASK;
+	status = buf[0] & FTDI_STATUS_B0_MASK;
 	if (status != priv->prev_status) {
 		char diff_status = status ^ priv->prev_status;
 
@@ -2521,7 +2521,7 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 	}
 
 	/* save if the transmitter is empty or not */
-	if (packet[1] & FTDI_RS_TEMT)
+	if (buf[1] & FTDI_RS_TEMT)
 		priv->transmit_empty = 1;
 	else
 		priv->transmit_empty = 0;
@@ -2535,29 +2535,29 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 	 * data payload to avoid over-reporting.
 	 */
 	flag = TTY_NORMAL;
-	if (packet[1] & FTDI_RS_ERR_MASK) {
+	if (buf[1] & FTDI_RS_ERR_MASK) {
 		/* Break takes precedence over parity, which takes precedence
 		 * over framing errors */
-		if (packet[1] & FTDI_RS_BI) {
+		if (buf[1] & FTDI_RS_BI) {
 			flag = TTY_BREAK;
 			port->icount.brk++;
 			usb_serial_handle_break(port);
-		} else if (packet[1] & FTDI_RS_PE) {
+		} else if (buf[1] & FTDI_RS_PE) {
 			flag = TTY_PARITY;
 			port->icount.parity++;
-		} else if (packet[1] & FTDI_RS_FE) {
+		} else if (buf[1] & FTDI_RS_FE) {
 			flag = TTY_FRAME;
 			port->icount.frame++;
 		}
 		/* Overrun is special, not associated with a char */
-		if (packet[1] & FTDI_RS_OE) {
+		if (buf[1] & FTDI_RS_OE) {
 			port->icount.overrun++;
 			tty_insert_flip_char(&port->port, 0, TTY_OVERRUN);
 		}
 	}
 
 	port->icount.rx += len;
-	ch = packet + 2;
+	ch = buf + 2;
 
 	if (port->port.console && port->sysrq) {
 		for (i = 0; i < len; i++, ch++) {
-- 
2.26.2

