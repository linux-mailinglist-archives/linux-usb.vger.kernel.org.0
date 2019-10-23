Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D68E184A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 12:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404543AbfJWKxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 06:53:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51791 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404329AbfJWKxP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 06:53:15 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG8-0006gR-J8; Wed, 23 Oct 2019 12:52:56 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG7-0004Jk-N4; Wed, 23 Oct 2019 12:52:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Carsten Stelling <carsten.stelling@goerlitz.com>
Subject: [PATCH 1/3] usb: usb251xb: Drop some unused defines
Date:   Wed, 23 Oct 2019 12:52:48 +0200
Message-Id: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The five removed symbols are unused since they were introduced in commit
3ec72a2a1e5d ("usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
Driver") back in 2017.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 6ca9111d150a..d91ef9cf3623 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -26,10 +26,6 @@
 
 #define USB251XB_ADDR_PRODUCT_ID_LSB	0x02
 #define USB251XB_ADDR_PRODUCT_ID_MSB	0x03
-#define USB251XB_DEF_PRODUCT_ID_12	0x2512 /* USB2512B/12Bi */
-#define USB251XB_DEF_PRODUCT_ID_13	0x2513 /* USB2513B/13Bi */
-#define USB251XB_DEF_PRODUCT_ID_14	0x2514 /* USB2514B/14Bi */
-#define USB251XB_DEF_PRODUCT_ID_17	0x2517 /* USB2517/17i */
 
 #define USB251XB_ADDR_DEVICE_ID_LSB	0x04
 #define USB251XB_ADDR_DEVICE_ID_MSB	0x05
@@ -74,7 +70,6 @@
 
 #define USB251XB_ADDR_PRODUCT_STRING_LEN	0x14
 #define USB251XB_ADDR_PRODUCT_STRING		0x54
-#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi/7i"
 
 #define USB251XB_ADDR_SERIAL_STRING_LEN		0x15
 #define USB251XB_ADDR_SERIAL_STRING		0x92
-- 
2.23.0

