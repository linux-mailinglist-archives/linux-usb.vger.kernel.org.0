Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE85E8579
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 11:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbfJ2K0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 06:26:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35961 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbfJ2K0X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 06:26:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id w18so13023741wrt.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 03:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6sgKQh/jeviAiKxhkuPYoJYMnhcj1Qowe4cypLyUC0=;
        b=E7Ew4GGRsOvJJ4g1Nj6yN3X5aKr9FepS1VeC9AXvDPyGMSrfyDlNqg0pOzz+z31hVf
         V69NLJaJgajcXLquvOSF/j5r1aTTPTYReMZFoFzzfJ1NnTmgQK0tmY4lbeN6x1ZO7tr5
         Xb+8zTH1UJeC15LDkDXQQXrFjseT/up/sDXMn4IN2RFmnpJCyzgXaRhhOplMKkfv748K
         U43qRj/uuNJu3XKzvYMXMDtcDnggb0Win2fBtX/eX8PdptvUgMzMunPgWof7/LhP+Qvx
         Xu10gK/lMyoU4plaxJhcxiSPQv/aFN1bTirQpJ6XjqaIieuNZQrzrwDclC8tCIsfuc+1
         O6wg==
X-Gm-Message-State: APjAAAVCrRnYytHQ9g5dXvjybq5s+8WQNUGIJXTysAwmxJ7hmHI1a+rP
        Ydz+cbgVF3m/YTHwYDqa5sQ=
X-Google-Smtp-Source: APXvYqzT1A7V6IPdf7HU0XmLZnGG8uvdicz+UWSDD0n9QuhGMakoscYPD9Zx80pukR27EOdjfSaxWQ==
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr19959377wru.126.1572344781479;
        Tue, 29 Oct 2019 03:26:21 -0700 (PDT)
Received: from pi (100.50.158.77.rev.sfr.net. [77.158.50.100])
        by smtp.gmail.com with ESMTPSA id y2sm1578845wmy.2.2019.10.29.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:26:20 -0700 (PDT)
Received: from johan by pi with local (Exim 4.92.2)
        (envelope-from <johan@pi>)
        id 1iPOgQ-0002pu-Db; Tue, 29 Oct 2019 11:25:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/2] USB: serial: whiteheat: fix line-speed endianness
Date:   Tue, 29 Oct 2019 11:23:54 +0100
Message-Id: <20191029102354.2733-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191029102354.2733-1-johan@kernel.org>
References: <20191029102354.2733-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add missing endianness conversion when setting the line speed so that
this driver might work also on big-endian machines.

Also use an unsigned format specifier in the corresponding debug
message.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/whiteheat.c | 9 ++++++---
 drivers/usb/serial/whiteheat.h | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index 76cabcb30d21..ca3bd58f2025 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -636,6 +636,7 @@ static void firm_setup_port(struct tty_struct *tty)
 	struct device *dev = &port->dev;
 	struct whiteheat_port_settings port_settings;
 	unsigned int cflag = tty->termios.c_cflag;
+	speed_t baud;
 
 	port_settings.port = port->port_number + 1;
 
@@ -696,11 +697,13 @@ static void firm_setup_port(struct tty_struct *tty)
 	dev_dbg(dev, "%s - XON = %2x, XOFF = %2x\n", __func__, port_settings.xon, port_settings.xoff);
 
 	/* get the baud rate wanted */
-	port_settings.baud = tty_get_baud_rate(tty);
-	dev_dbg(dev, "%s - baud rate = %d\n", __func__, port_settings.baud);
+	baud = tty_get_baud_rate(tty);
+	port_settings.baud = cpu_to_le32(baud);
+	dev_dbg(dev, "%s - baud rate = %u\n", __func__, baud);
 
 	/* fixme: should set validated settings */
-	tty_encode_baud_rate(tty, port_settings.baud, port_settings.baud);
+	tty_encode_baud_rate(tty, baud, baud);
+
 	/* handle any settings that aren't specified in the tty structure */
 	port_settings.lloop = 0;
 
diff --git a/drivers/usb/serial/whiteheat.h b/drivers/usb/serial/whiteheat.h
index 00398149cd8d..269e727a92f9 100644
--- a/drivers/usb/serial/whiteheat.h
+++ b/drivers/usb/serial/whiteheat.h
@@ -87,7 +87,7 @@ struct whiteheat_simple {
 
 struct whiteheat_port_settings {
 	__u8	port;		/* port number (1 to N) */
-	__u32	baud;		/* any value 7 - 460800, firmware calculates
+	__le32	baud;		/* any value 7 - 460800, firmware calculates
 				   best fit; arrives little endian */
 	__u8	bits;		/* 5, 6, 7, or 8 */
 	__u8	stop;		/* 1 or 2, default 1 (2 = 1.5 if bits = 5) */
-- 
2.23.0

