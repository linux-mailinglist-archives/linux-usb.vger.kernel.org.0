Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C8C35C303
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241489AbhDLJyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:54:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242536AbhDLJu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0967F61288;
        Mon, 12 Apr 2021 09:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220889;
        bh=MbuIECVA9D/u19XDPKwheS5aCWi1oiQz/L6V5WcnQ9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AFGrA74O5MYe6t79hBSil6E5tuQ69owe07UEkjsl69i7q3XB1nZs6w+TlLjwP8dHk
         Fm772KsymiKhQ01XyFT0C/sneSZrH0CCo09D1q7iTyN1S3yCxyko8hSWHwPRt9j2G1
         R1dIxw+ovJZC1qw+rfB18TrwonjAJiuaORMc3oI2fK6mWGbr3AWyI0zG/MEhcmue5+
         Ju2VrMKnuQdSkgMU2+/fKDiRYxLAkzE8XM+Im5ieri6p/QH0H2pHVEswqm81LB9BYD
         sxlf18ktgDGgCWKP5n/LmZuh0qr3iV7G2MnMM2MR+im/SNhWb8Z2Ej+pflD36wSpur
         +3PTfNXqeHSLg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000Gb-KU; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 09/10] USB: serial: ti_usb_3410_5052: use kernel types consistently
Date:   Mon, 12 Apr 2021 11:47:37 +0200
Message-Id: <20210412094738.944-10-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replace the remaining uses of user-space __XX types.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index f63ee11f41e8..aadcb00f1343 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -224,24 +224,24 @@ struct ti_write_data_bytes {
 } __packed;
 
 struct ti_read_data_request {
-	__u8	bAddrType;
-	__u8	bDataType;
-	__u8	bDataCounter;
+	u8	bAddrType;
+	u8	bDataType;
+	u8	bDataCounter;
 	__be16	wBaseAddrHi;
 	__be16	wBaseAddrLo;
 } __packed;
 
 struct ti_read_data_bytes {
-	__u8	bCmdCode;
-	__u8	bModuleId;
-	__u8	bErrorCode;
-	__u8	bData[];
+	u8	bCmdCode;
+	u8	bModuleId;
+	u8	bErrorCode;
+	u8	bData[];
 };
 
 /* Interrupt struct */
 struct ti_interrupt {
-	__u8	bICode;
-	__u8	bIInfo;
+	u8	bICode;
+	u8	bIInfo;
 };
 
 /* Interrupt codes */
@@ -333,10 +333,10 @@ static void ti_handle_new_msr(struct ti_port *tport, u8 msr);
 static void ti_stop_read(struct ti_port *tport, struct tty_struct *tty);
 static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty);
 
-static int ti_command_out_sync(struct usb_device *udev, __u8 command,
-		__u16 moduleid, __u16 value, void *data, int size);
-static int ti_command_in_sync(struct usb_device *udev, __u8 command,
-		__u16 moduleid, __u16 value, void *data, int size);
+static int ti_command_out_sync(struct usb_device *udev, u8 command,
+		u16 moduleid, u16 value, void *data, int size);
+static int ti_command_in_sync(struct usb_device *udev, u8 command,
+		u16 moduleid, u16 value, void *data, int size);
 static int ti_port_cmd_out(struct usb_serial_port *port, u8 command,
 		u16 value, void *data, int size);
 static int ti_port_cmd_in(struct usb_serial_port *port, u8 command,
@@ -1459,8 +1459,8 @@ static int ti_restart_read(struct ti_port *tport, struct tty_struct *tty)
 	return status;
 }
 
-static int ti_command_out_sync(struct usb_device *udev, __u8 command,
-	__u16 moduleid, __u16 value, void *data, int size)
+static int ti_command_out_sync(struct usb_device *udev, u8 command,
+		u16 moduleid, u16 value, void *data, int size)
 {
 	int status;
 
@@ -1473,8 +1473,8 @@ static int ti_command_out_sync(struct usb_device *udev, __u8 command,
 	return 0;
 }
 
-static int ti_command_in_sync(struct usb_device *udev, __u8 command,
-	__u16 moduleid, __u16 value, void *data, int size)
+static int ti_command_in_sync(struct usb_device *udev, u8 command,
+		u16 moduleid, u16 value, void *data, int size)
 {
 	int status;
 
-- 
2.26.3

