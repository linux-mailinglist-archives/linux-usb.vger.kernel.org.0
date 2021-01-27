Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7919D30595F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbhA0LPW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:15:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:57054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236320AbhA0LBq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Jan 2021 06:01:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 495FB20724;
        Wed, 27 Jan 2021 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611745231;
        bh=RvZ/hYWHT4Qt7ok4a/jx1hiSJ4FokCUwo5Ss7uRODoo=;
        h=From:To:Cc:Subject:Date:From;
        b=GPDT39TsE0SucD7X8GXoi7FRPdK5bBzVjJlXQPj6TfjWOx65H24B6YyOS3LE0BTge
         DHG6w9jkm5eaZOCMNxy9MZFPWpbiHnlpeBQ2gEa6pO7+zg4KmuhND1yejmyyjLb8a3
         wSgjCxJW+hjyA/6JZk7v91Q9xczkLyG+D0myxBAY3olSNi0Aslmg2mUN3H5l3G0TqZ
         LE0M90Z+bOTqIDrkSCYYyhjWVZHFgoSw3LVGvsX0Proh9XXIgH+COLTxQNDgIIC+Fs
         zMSqTbw6l2V8YiI6sSse2Ur/+xLm82fV71Jn6OqXwkWzFUV8Slaj8gjoQAemfHtWed
         H7oY4CYyFB9sg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l4iZ0-0001LR-2N; Wed, 27 Jan 2021 12:00:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: ftdi_sio: restore divisor-encoding comments
Date:   Wed, 27 Jan 2021 12:00:28 +0100
Message-Id: <20210127110028.5127-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add back a few explanatory comments related to the divisor encoding
which got lost in a coding-style clean up many years ago.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 94398f89e600..a6837a60c06a 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1153,13 +1153,13 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 	divisor = divisor3 >> 3;
 	divisor3 &= 0x7;
 	if (divisor3 == 1)
-		divisor |= 0xc000;
+		divisor |= 0xc000;	/* +0.125 */
 	else if (divisor3 >= 4)
-		divisor |= 0x4000;
+		divisor |= 0x4000;	/* +0.5 */
 	else if (divisor3 != 0)
-		divisor |= 0x8000;
+		divisor |= 0x8000;	/* +0.25 */
 	else if (divisor == 1)
-		divisor = 0;	/* special case for maximum baud rate */
+		divisor = 0;		/* special case for maximum baud rate */
 	return divisor;
 }
 
@@ -1177,9 +1177,9 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
 	divisor = divisor3 >> 3;
 	divisor |= (u32)divfrac[divisor3 & 0x7] << 14;
 	/* Deal with special cases for highest baud rates. */
-	if (divisor == 1)
+	if (divisor == 1)		/* 1.0 */
 		divisor = 0;
-	else if (divisor == 0x4001)
+	else if (divisor == 0x4001)	/* 1.5 */
 		divisor = 1;
 	return divisor;
 }
@@ -1201,9 +1201,9 @@ static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
 	divisor = divisor3 >> 3;
 	divisor |= (u32)divfrac[divisor3 & 0x7] << 14;
 	/* Deal with special cases for highest baud rates. */
-	if (divisor == 1)
+	if (divisor == 1)		/* 1.0 */
 		divisor = 0;
-	else if (divisor == 0x4001)
+	else if (divisor == 0x4001)	/* 1.5 */
 		divisor = 1;
 	/*
 	 * Set this bit to turn off a divide by 2.5 on baud rate generator
-- 
2.26.2

