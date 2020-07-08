Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A83218805
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgGHMuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:22 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38498 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgGHMuV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:21 -0400
Received: by mail-lj1-f194.google.com with SMTP id 9so54049169ljv.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mu6uFgak7+P+k9FraJxtiqlzNSqZXEgXJp0cM19Q/s=;
        b=Vlo1y/6OIDO4xNwn2eBcDeqZ02iycr+DoaCqXpe0tGdY501199bXWb1W5fuO1NW+WI
         HCPl9iUIl4KzqgUQEv20HTRu7qgMMjFtw51wx0Zzza3v4Ckmnh6BSJxzriaW2xZcKbvc
         ICivHxE5ATfoDVnsAEaO7xpxfcgF71CNwiT4omjhRQ5Fmr6I9DsLd4TPPVRQ5M/LO62a
         YejEpKankqFH/eB/J2+sEAWjJKsJYKQODRpioiQjNG7FORTckZJXmR4FC1BRUax7j84f
         HOifxiziUL80bbKFg+qPWygZTNSPSSeroOcgGa/L/wLAb+rg6PA2UX9CA/KYO7u0gbIH
         bsfQ==
X-Gm-Message-State: AOAM532n8Hpo6wJU8WQGjPtJ3gQEaaIBqAo6IN7GUkwV+mRokhSYKAH6
        0e2d3hiGvCX9lm6juVWavV4VwCoQims=
X-Google-Smtp-Source: ABdhPJwR3a1JUDrhEb9j0lgLkrexj0FwxYjJxI7W/4aTLm1a+l/Y9ZwfgyJaWzeLFxQ2EdCY8ZHinw==
X-Received: by 2002:a2e:960a:: with SMTP id v10mr23534284ljh.223.1594212618462;
        Wed, 08 Jul 2020 05:50:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r19sm896346ljn.40.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045b-32; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 02/10] USB: serial: ftdi_sio: clean up receive processing
Date:   Wed,  8 Jul 2020 14:49:52 +0200
Message-Id: <20200708125000.15659-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clean up receive processing by dropping the character pointer and
keeping the length argument unchanged throughout the function.

Also make it more apparent that sysrq processing can consume a
characters by adding an explicit continue.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 96b9e2768ac5..33f1cca7eaa6 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2483,7 +2483,6 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 		struct ftdi_private *priv, unsigned char *buf, int len)
 {
 	unsigned char status;
-	unsigned char *ch;
 	int i;
 	char flag;
 
@@ -2526,8 +2525,7 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 	else
 		priv->transmit_empty = 0;
 
-	len -= 2;
-	if (!len)
+	if (len == 2)
 		return 0;	/* status only */
 
 	/*
@@ -2556,19 +2554,20 @@ static int ftdi_process_packet(struct usb_serial_port *port,
 		}
 	}
 
-	port->icount.rx += len;
-	ch = buf + 2;
+	port->icount.rx += len - 2;
 
 	if (port->port.console && port->sysrq) {
-		for (i = 0; i < len; i++, ch++) {
-			if (!usb_serial_handle_sysrq_char(port, *ch))
-				tty_insert_flip_char(&port->port, *ch, flag);
+		for (i = 2; i < len; i++) {
+			if (usb_serial_handle_sysrq_char(port, buf[i]))
+				continue;
+			tty_insert_flip_char(&port->port, buf[i], flag);
 		}
 	} else {
-		tty_insert_flip_string_fixed_flag(&port->port, ch, flag, len);
+		tty_insert_flip_string_fixed_flag(&port->port, buf + 2, flag,
+				len - 2);
 	}
 
-	return len;
+	return len - 2;
 }
 
 static void ftdi_process_read_urb(struct urb *urb)
-- 
2.26.2

