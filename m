Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF2E3378F6
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhCKQPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:51314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234523AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8174364FEB;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=+CpZJ+g402OOdXJ2CV7TsiSzCSM/A8MZ4PDGoxW/HOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uwUx5hMSeYN2Rau3kokwyTUw/k0+3s/vxHardNuCBTwQ4rN0LUyFU1pGpFag3EqRO
         lzZo3aWDgOTQRpO5UARKHSN4NW1370SW5ycRqHtysch4usDTKtoqAPE5WFrpUQAIhl
         pr5tjkruVnaPjJOnxr55FGpNHM4iXd3yB8zS7OxJg2htROeJtqQanPTi5fVVY+ut1X
         XxpU2bwHa9+J/8Y6AuHipnjrDTx3+KEbGRPA1PtyEO53OmWG95a4Q/VgBI240Qp+4i
         8tbb1WwlPauJ/uxY1SQETXMZceYdfYH+SSSQLvHPg0cEMsgYb8Mrj8oIKv1WkQqSim
         k132lb4CfZ8ig==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxw-0000Pb-8N; Thu, 11 Mar 2021 17:15:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] USB: serial: pl2303: add device-type names
Date:   Thu, 11 Mar 2021 17:14:51 +0100
Message-Id: <20210311161451.1496-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311161451.1496-1-johan@kernel.org>
References: <20210311161451.1496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add names for the device types to be printed at probe when debugging is
enabled.

Note that the HXN type is referred to as G for now as that is the name
the vendor uses.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/pl2303.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index e742187c8a7f..7208966891d0 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -183,6 +183,7 @@ enum pl2303_type {
 };
 
 struct pl2303_type_data {
+	const char *name;
 	speed_t max_baud_rate;
 	unsigned long quirks;
 	unsigned int no_autoxonxoff:1;
@@ -204,23 +205,29 @@ struct pl2303_private {
 
 static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 	[TYPE_H] = {
+		.name			= "H",
 		.max_baud_rate		= 1228800,
 		.quirks			= PL2303_QUIRK_LEGACY,
 		.no_autoxonxoff		= true,
 	},
 	[TYPE_HX] = {
+		.name			= "HX",
 		.max_baud_rate		= 6000000,
 	},
 	[TYPE_TA] = {
+		.name			= "TA",
 		.max_baud_rate		= 6000000,
 	},
 	[TYPE_TB] = {
+		.name			= "TB",
 		.max_baud_rate		= 12000000,
 	},
 	[TYPE_HXD] = {
+		.name			= "HXD",
 		.max_baud_rate		= 12000000,
 	},
 	[TYPE_HXN] = {
+		.name			= "G",
 		.max_baud_rate		= 12000000,
 		.no_divisors		= true,
 	},
@@ -444,7 +451,7 @@ static int pl2303_startup(struct usb_serial *serial)
 		return ret;
 
 	type = ret;
-	dev_dbg(&serial->interface->dev, "device type: %d\n", type);
+	dev_dbg(&serial->interface->dev, "device type: %s\n", pl2303_type_data[type].name);
 
 	spriv = kzalloc(sizeof(*spriv), GFP_KERNEL);
 	if (!spriv)
-- 
2.26.2

