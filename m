Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF8319A291
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731554AbgCaXhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:39 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49896 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731511AbgCaXhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:38 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRq-00010N-2q
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:36 +0200
Received: from [10.20.10.232] (port=36156 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRo-000qJk-SO; Wed, 01 Apr 2020 01:37:32 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRo-00086J-Ir; Tue, 31 Mar 2020 23:37:32 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 4/6] USB: serial: ch341: Name prescaler, divisor registers
Date:   Tue, 31 Mar 2020 23:37:20 +0000
Message-Id: <65cfdf4a0600e86e89b3a3fb839e733ecebee688.1585697281.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1585697281.git.public@hansmi.ch>
References: <cover.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add constants for the prescaler and divisor registers.

The 0x25 register is only used by CH341 chips before version 0x30 and is
involved in configuring the line control parameters. It's not known to
the author whether there any such chips in the wild, and the driver
never supported them (other registers are also treated differently). The
alternative would've been to not set the register, but that may have
unintended effects.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 67a5d4c3df42..9407e12d9fbc 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -61,7 +61,11 @@
 #define CH341_REQ_MODEM_CTRL   0xA4
 
 #define CH341_REG_BREAK        0x05
+#define CH341_REG_PRESCALER    0x12
+#define CH341_REG_DIVISOR      0x13
 #define CH341_REG_LCR          0x18
+#define CH341_REG_LCR2         0x25
+
 #define CH341_NBREAK_BITS      0x01
 
 #define CH341_LCR_ENABLE_RX    0x80
@@ -294,11 +298,19 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	 */
 	val |= BIT(7);
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
+			      CH341_REG_DIVISOR << 8 | CH341_REG_PRESCALER,
+			      val);
 	if (r)
 		return r;
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
+	/*
+	 * Chip versions before version 0x30 (read using
+	 * CH341_REQ_READ_VERSION) used separate registers for line control.
+	 * 0x30 and above use CH341_REG_LCR only.
+	 */
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
+			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
 	if (r)
 		return r;
 
-- 
2.20.1

