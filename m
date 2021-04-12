Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CE635C2FA
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242438AbhDLJxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242473AbhDLJuS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C20FA61261;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=SacsNMsD7qMpaC8Pm4RXTvMaz/GI6AhSy077SEOrgQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rYCmJy8BralkeK7z6eMO0ONYpy3yr/RePhfiJBCpyBki4nkjfKvtNi7ZV/pv32PzD
         iMCwg2a16ZIh4C2nZU+VG9RO0cac39tGz/gob1WqnLbi38dbma+Yx9kCokg5xt8AyM
         /Zq2AY0eD0fVYQr4stXtG2QPEFxB4/umN5h6mgCuNY1u9T9okG5TdBy3Br4+nm2j2Y
         HUM6QYWKSkCnW8QPsQ/ONhAeAAxQG+OwjnN+zf7/YDT47J04YZd4QPoFjOgiCcov3g
         NNBBZ92/GcAVTnfsROcrrNDFWzVLVdynPZpHHLBiCJwFNWbtLN2WiXy9zvI09IGxhs
         fwxnpMBO8S3PA==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GP-8u; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 05/10] USB: serial: io_ti: drop unnecessary packed attributes
Date:   Mon, 12 Apr 2021 11:47:33 +0200
Message-Id: <20210412094738.944-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop unnecessary packed attributes from structures that don't need it
and use the __packed macro consistently.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 2 +-
 drivers/usb/serial/io_ti.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index b2e41ddd757e..39503fdccebf 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -65,7 +65,7 @@
 struct product_info {
 	int	TiMode;			/* Current TI Mode  */
 	u8	hardware_type;		/* Type of hardware */
-} __attribute__((packed));
+} __packed;
 
 /*
  * Edgeport firmware header
diff --git a/drivers/usb/serial/io_ti.h b/drivers/usb/serial/io_ti.h
index e31406c252dd..24fe1312c84d 100644
--- a/drivers/usb/serial/io_ti.h
+++ b/drivers/usb/serial/io_ti.h
@@ -141,7 +141,7 @@ struct out_endpoint_desc_block {
 	u8 YBufAddr;
 	u8 YByteCount;
 	u8 BufferSize;
-} __attribute__((packed));
+};
 
 
 /*
@@ -159,7 +159,7 @@ struct ump_uart_config {
 	char cXoff;		/* XOFF character                   */
 	u8 bUartMode;		/* Will be updated when a user      */
 				/* interface is defined             */
-} __attribute__((packed));
+};
 
 
 /*
@@ -170,7 +170,7 @@ struct ump_uart_config {
 struct ump_interrupt {
 	u8 bICode;			/* Interrupt code (interrupt num)   */
 	u8 bIInfo;			/* Interrupt information            */
-}  __attribute__((packed));
+};
 
 
 #define TIUMP_GET_PORT_FROM_CODE(c)	(((c) >> 6) & 0x01)
-- 
2.26.3

