Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A963378F8
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhCKQPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:51312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234522AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EE1664FE2;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=1bzKS5UL0IvP/DsU+LZMEocUUgh5Q3Hsa9nuZCARpTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a8dyS3b37jkB6GKkoaX+OjQa6FuQkwZIU2zmElemzR4W9VF0ILboD1Wd2/NWZgz6K
         racoO/kA+774W+sZj/FigU5D3dMWePDSK9Dp61UKPkkK+pHNR1GDTZ9H5nOWTZOx0l
         XWBVplGa59sX5rHV0KjHdsekNuDm7EreHylcZENTZesji9W/Ve9wu49wO2YQE9acnj
         NOlO6ZaPUS7FpPJYVgEMarLbo2xUsihEQdmyMhg3hwpISp8TuPHa0bLmQtDX8Qw/i6
         qmiV8Ziv68JRDPOviJtKXsRvRawFYWyZK9XHnYKxiyhO72duMRnFL+gGKjEo8l0zuE
         P1JJmTtBDR5Lg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxw-0000PU-1h; Thu, 11 Mar 2021 17:15:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/5] USB: serial: pl2303: rename legacy PL2303H type
Date:   Thu, 11 Mar 2021 17:14:49 +0100
Message-Id: <20210311161451.1496-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311161451.1496-1-johan@kernel.org>
References: <20210311161451.1496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rename the legacy type which is supposedly a PL2303H which came in two
variants (and which we handle the same way).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 42dcc3cfb449..cd2acd8c5246 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -173,7 +173,7 @@ MODULE_DEVICE_TABLE(usb, id_table);
 static void pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
-	TYPE_01,	/* Type 0 and 1 (difference unknown) */
+	TYPE_H,
 	TYPE_HX,
 	TYPE_TA,
 	TYPE_TB,
@@ -203,7 +203,7 @@ struct pl2303_private {
 };
 
 static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
-	[TYPE_01] = {
+	[TYPE_H] = {
 		.max_baud_rate		= 1228800,
 		.quirks			= PL2303_QUIRK_LEGACY,
 		.no_autoxonxoff		= true,
@@ -382,16 +382,16 @@ static int pl2303_detect_type(struct usb_serial *serial)
 	u8 buf;
 
 	/*
-	 * Legacy types 0 and 1, difference unknown.
+	 * Legacy PL2303H, variants 0 and 1 (difference unknown).
 	 */
 	if (desc->bDeviceClass == 0x02)
-		return TYPE_01;		/* type 0 */
+		return TYPE_H;		/* variant 0 */
 
 	if (desc->bMaxPacketSize0 != 0x40) {
 		if (desc->bDeviceClass == 0x00 || desc->bDeviceClass == 0xff)
-			return TYPE_01;	/* type 1 */
+			return TYPE_H;	/* variant 1 */
 
-		return TYPE_01;		/* type 0 */
+		return TYPE_H;		/* variant 0 */
 	}
 
 	/*
-- 
2.26.2

