Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F1435C300
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbhDLJxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242534AbhDLJu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D415A6125F;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220889;
        bh=9d+kzp2tdUev6VliW4VYKC4a67tJ2oBEUnHcE9oQ61c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZW2rPSEiGrBVbCTC1p9Fj5FL2DLwxNlk9Ug+Lpu2p1SHgfOembV4cyX3alw+GoBA
         RZPOTDoXJqXHHaUVJw9Yd7FsdV7DBrK+dgOAsmHVPNfp2T9KJ2Ic5WKfWYtF1bQR1e
         ct2gjf6AEmgmUanRuRPn/1wkrcLlWnm7I6z7vUVl7ojBnGPDV3ePnl4quXXfDrFvZZ
         SLw5C3S2uaRGJQjc4eFiWsHg+XBGBumjlizVbBMbYh5LE9/8JJ33PheWPVoqB/Uevv
         9h196MEPoS5Yb6RvMfggI6PAWhoU1qQe/RlVcXcFM8bzmmQqex/900GhGgWQo8YXsJ
         TwS/u8l5PAUYw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GV-E6; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 07/10] USB: serial: ti_usb_3410_5052: clean up vendor-request helpers
Date:   Mon, 12 Apr 2021 11:47:35 +0200
Message-Id: <20210412094738.944-8-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make the vendor-request helpers data parameters be void pointers and
drop the caller casts.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index 11e6792981b7..25d5a6e83009 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -334,9 +334,9 @@ static void ti_stop_read(struct ti_port *tport, struct tty_struct *tty);
 static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty);
 
 static int ti_command_out_sync(struct ti_device *tdev, __u8 command,
-	__u16 moduleid, __u16 value, __u8 *data, int size);
+		__u16 moduleid, __u16 value, void *data, int size);
 static int ti_command_in_sync(struct ti_device *tdev, __u8 command,
-	__u16 moduleid, __u16 value, __u8 *data, int size);
+		__u16 moduleid, __u16 value, void *data, int size);
 
 static int ti_write_byte(struct usb_serial_port *port, struct ti_device *tdev,
 			 unsigned long addr, u8 mask, u8 byte);
@@ -999,7 +999,7 @@ static void ti_set_termios(struct tty_struct *tty,
 	config->wFlags = cpu_to_be16(wflags);
 
 	status = ti_command_out_sync(tport->tp_tdev, TI_SET_CONFIG,
-		(__u8)(TI_UART1_PORT + port_number), 0, (__u8 *)config,
+		(__u8)(TI_UART1_PORT + port_number), 0, config,
 		sizeof(*config));
 	if (status)
 		dev_err(&port->dev, "%s - cannot set config on port %d, %d\n",
@@ -1376,7 +1376,7 @@ static int ti_get_lsr(struct ti_port *tport, u8 *lsr)
 		return -ENOMEM;
 
 	status = ti_command_in_sync(tdev, TI_GET_PORT_STATUS,
-		(__u8)(TI_UART1_PORT+port_number), 0, (__u8 *)data, size);
+		(__u8)(TI_UART1_PORT+port_number), 0, data, size);
 	if (status) {
 		dev_err(&port->dev,
 			"%s - get port status command failed, %d\n",
@@ -1475,7 +1475,7 @@ static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty)
 
 
 static int ti_command_out_sync(struct ti_device *tdev, __u8 command,
-	__u16 moduleid, __u16 value, __u8 *data, int size)
+	__u16 moduleid, __u16 value, void *data, int size)
 {
 	int status;
 
@@ -1492,7 +1492,7 @@ static int ti_command_out_sync(struct ti_device *tdev, __u8 command,
 
 
 static int ti_command_in_sync(struct ti_device *tdev, __u8 command,
-	__u16 moduleid, __u16 value, __u8 *data, int size)
+	__u16 moduleid, __u16 value, void *data, int size)
 {
 	int status;
 
@@ -1535,8 +1535,7 @@ static int ti_write_byte(struct usb_serial_port *port,
 	data->bData[1] = byte;
 
 	status = ti_command_out_sync(tdev, TI_WRITE_DATA, TI_RAM_PORT, 0,
-		(__u8 *)data, size);
-
+			data, size);
 	if (status < 0)
 		dev_err(&port->dev, "%s - failed, %d\n", __func__, status);
 
-- 
2.26.3

