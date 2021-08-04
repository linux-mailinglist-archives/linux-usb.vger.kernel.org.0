Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632DD3E0ADA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 01:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235512AbhHDXcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 19:32:31 -0400
Received: from perseus.uberspace.de ([95.143.172.134]:35316 "EHLO
        perseus.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbhHDXca (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 19:32:30 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Aug 2021 19:32:30 EDT
Received: (qmail 21912 invoked from network); 4 Aug 2021 23:25:34 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by perseus.uberspace.de with SMTP; 4 Aug 2021 23:25:34 -0000
From:   David Bauer <mail@david-bauer.net>
To:     johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM v2
Date:   Thu,  5 Aug 2021 01:25:22 +0200
Message-Id: <20210804232522.43330-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Auto-M§ OP-COM v2 is a OBD diagnostic device using a FTD232 for the
USB connection.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 4a1f3a95d017..33bbb3470ca3 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -219,6 +219,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(FTDI_VID, FTDI_MTXORB_6_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_R2000KU_TRUE_RNG) },
 	{ USB_DEVICE(FTDI_VID, FTDI_VARDAAN_PID) },
+	{ USB_DEVICE(FTDI_VID, FTDI_AUTO_M3_OP_COM_V2_PID) },
 	{ USB_DEVICE(MTXORB_VID, MTXORB_FTDI_RANGE_0100_PID) },
 	{ USB_DEVICE(MTXORB_VID, MTXORB_FTDI_RANGE_0101_PID) },
 	{ USB_DEVICE(MTXORB_VID, MTXORB_FTDI_RANGE_0102_PID) },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index add602bebd82..755858ca20ba 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -159,6 +159,9 @@
 /* Vardaan Enterprises Serial Interface VEUSB422R3 */
 #define FTDI_VARDAAN_PID	0xF070
 
+/* Auto-M3 Ltd. - OP-COM USB V2 - OBD interface Adapter */
+#define FTDI_AUTO_M3_OP_COM_V2_PID	0x4f50
+
 /*
  * Xsens Technologies BV products (http://www.xsens.com).
  */
-- 
2.32.0

