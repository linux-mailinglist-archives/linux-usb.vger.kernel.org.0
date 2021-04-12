Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B9235C309
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239060AbhDLJ4q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:56:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244728AbhDLJ4g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:56:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7682E6121D;
        Mon, 12 Apr 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618221378;
        bh=iPfrSBItyWuMu42ZaE4BnzALTKfr/Gm8n1bEr5jU74I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BafLs0hZzkqV5ck0p4Hnvf2vlH7YzVr26+TRLhh7jdQ+vBVW5liJOwd1ZJhUfgwSp
         9Vbgn9UWdSIZ3hm/Xm2cpHxTgnqCUg8U1PzF4kugbUk1yBmpfysEoiGVjUrUYArEv0
         WyqOeV6aezo+++FTBy8KIK01GLVk70VZDOEAJo5ArcjLhvJRqP3stqJX/vuqFdY9j3
         TyKc4J6mBbgv2ke/HOGMl4m7c7ID4yf5IoWZMMDRbW7CjHDuyZYRAK8qWA6NOGuktA
         QLO0AQL9MFucH4BImOat9z1MDr10u2RT8CYmTRdg6auHWV/gQs50DbE/neNE+QZzj1
         gNQpyYsoaj00A==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtIi-0000Kd-Mq; Mon, 12 Apr 2021 11:56:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] USB: serial: xr: rename GPIO-pin defines
Date:   Mon, 12 Apr 2021 11:55:48 +0200
Message-Id: <20210412095557.1213-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412095557.1213-1-johan@kernel.org>
References: <20210412095557.1213-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rename the GPIO-pin defines so that they reflect how they are used.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index a600448c6016..f5087a8b6c86 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -57,12 +57,12 @@ struct xr_txrx_clk_mask {
 #define XR21V141X_UART_ENABLE_TX	0x1
 #define XR21V141X_UART_ENABLE_RX	0x2
 
-#define XR21V141X_UART_MODE_RI		BIT(0)
-#define XR21V141X_UART_MODE_CD		BIT(1)
-#define XR21V141X_UART_MODE_DSR		BIT(2)
-#define XR21V141X_UART_MODE_DTR		BIT(3)
-#define XR21V141X_UART_MODE_CTS		BIT(4)
-#define XR21V141X_UART_MODE_RTS		BIT(5)
+#define XR21V141X_GPIO_RI		BIT(0)
+#define XR21V141X_GPIO_CD		BIT(1)
+#define XR21V141X_GPIO_DSR		BIT(2)
+#define XR21V141X_GPIO_DTR		BIT(3)
+#define XR21V141X_GPIO_CTS		BIT(4)
+#define XR21V141X_GPIO_RTS		BIT(5)
 
 #define XR21V141X_UART_BREAK_ON		0xff
 #define XR21V141X_UART_BREAK_OFF	0
@@ -250,12 +250,12 @@ static int xr_tiocmget(struct tty_struct *tty)
 	 * Modem control pins are active low, so reading '0' means it is active
 	 * and '1' means not active.
 	 */
-	ret = ((status & XR21V141X_UART_MODE_DTR) ? 0 : TIOCM_DTR) |
-	      ((status & XR21V141X_UART_MODE_RTS) ? 0 : TIOCM_RTS) |
-	      ((status & XR21V141X_UART_MODE_CTS) ? 0 : TIOCM_CTS) |
-	      ((status & XR21V141X_UART_MODE_DSR) ? 0 : TIOCM_DSR) |
-	      ((status & XR21V141X_UART_MODE_RI) ? 0 : TIOCM_RI) |
-	      ((status & XR21V141X_UART_MODE_CD) ? 0 : TIOCM_CD);
+	ret = ((status & XR21V141X_GPIO_DTR) ? 0 : TIOCM_DTR) |
+	      ((status & XR21V141X_GPIO_RTS) ? 0 : TIOCM_RTS) |
+	      ((status & XR21V141X_GPIO_CTS) ? 0 : TIOCM_CTS) |
+	      ((status & XR21V141X_GPIO_DSR) ? 0 : TIOCM_DSR) |
+	      ((status & XR21V141X_GPIO_RI) ? 0 : TIOCM_RI) |
+	      ((status & XR21V141X_GPIO_CD) ? 0 : TIOCM_CD);
 
 	return ret;
 }
@@ -269,13 +269,13 @@ static int xr_tiocmset_port(struct usb_serial_port *port,
 
 	/* Modem control pins are active low, so set & clr are swapped */
 	if (set & TIOCM_RTS)
-		gpio_clr |= XR21V141X_UART_MODE_RTS;
+		gpio_clr |= XR21V141X_GPIO_RTS;
 	if (set & TIOCM_DTR)
-		gpio_clr |= XR21V141X_UART_MODE_DTR;
+		gpio_clr |= XR21V141X_GPIO_DTR;
 	if (clear & TIOCM_RTS)
-		gpio_set |= XR21V141X_UART_MODE_RTS;
+		gpio_set |= XR21V141X_GPIO_RTS;
 	if (clear & TIOCM_DTR)
-		gpio_set |= XR21V141X_UART_MODE_DTR;
+		gpio_set |= XR21V141X_GPIO_DTR;
 
 	/* Writing '0' to gpio_{set/clr} bits has no effect, so no need to do */
 	if (gpio_clr)
@@ -545,7 +545,7 @@ static int xr_open(struct tty_struct *tty, struct usb_serial_port *port)
 	 * Configure DTR and RTS as outputs and RI, CD, DSR and CTS as
 	 * inputs.
 	 */
-	gpio_dir = XR21V141X_UART_MODE_DTR | XR21V141X_UART_MODE_RTS;
+	gpio_dir = XR21V141X_GPIO_DTR | XR21V141X_GPIO_RTS;
 	xr_set_reg_uart(port, XR21V141X_REG_GPIO_DIR, gpio_dir);
 
 	/* Setup termios */
-- 
2.26.3

