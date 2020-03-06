Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4608E17C5D0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 20:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCFTAy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 14:00:54 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:49958 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726162AbgCFTAy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 14:00:54 -0500
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDL-0003iY-AR
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 20:00:53 +0100
Received: from [10.20.10.230] (port=32480 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDK-00A725-3O; Fri, 06 Mar 2020 20:00:50 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jAIDJ-00061F-LU; Fri, 06 Mar 2020 19:00:49 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH 1/4] ch341: Name more registers
Date:   Fri,  6 Mar 2020 19:00:42 +0000
Message-Id: <7a9882c0c5deaa64dcd3199a2d892e9809e6cb8e.1583520568.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1583520568.git.public@hansmi.ch>
References: <cover.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add more #defines with register names.

Signed-off-by: Michael Hanselmann <public@hansmi.ch>
---
 drivers/usb/serial/ch341.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index c5ecdcd51ffc..518209072c50 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -59,6 +59,8 @@
 #define CH341_REQ_MODEM_CTRL   0xA4
 
 #define CH341_REG_BREAK        0x05
+#define CH341_REG_PRESCALER    0x12
+#define CH341_REG_DIVISOR      0x13
 #define CH341_REG_LCR          0x18
 #define CH341_NBREAK_BITS      0x01
 
@@ -221,6 +223,7 @@ static int ch341_get_divisor(speed_t speed)
 static int ch341_set_baudrate_lcr(struct usb_device *dev,
 				  struct ch341_private *priv, u8 lcr)
 {
+	uint16_t reg;
 	int val;
 	int r;
 
@@ -237,11 +240,15 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	 */
 	val |= BIT(7);
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
+	reg = ((uint16_t)CH341_REG_DIVISOR << 8) | CH341_REG_PRESCALER;
+
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, reg, val);
 	if (r)
 		return r;
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
+	reg = ((uint16_t)0x2500) | CH341_REG_LCR;
+
+	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, reg, lcr);
 	if (r)
 		return r;
 
-- 
2.20.1

