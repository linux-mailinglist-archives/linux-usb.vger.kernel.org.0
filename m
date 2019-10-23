Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 755DEE1848
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 12:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391006AbfJWKxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 06:53:09 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34189 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390491AbfJWKxI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 06:53:08 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG8-0006gS-J8; Wed, 23 Oct 2019 12:52:56 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG7-0004Jm-Nk; Wed, 23 Oct 2019 12:52:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Carsten Stelling <carsten.stelling@goerlitz.com>
Subject: [PATCH 2/3] usb: usb251xb: Document chip variant usb2422
Date:   Wed, 23 Oct 2019 12:52:49 +0200
Message-Id: <20191023105250.16537-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
References: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
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

The next patch introduces support for the USB2422. Add it to the list of
devices supported by the binding.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 17915f64b8ee..6e3356dc2e6d 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -7,7 +7,7 @@ Required properties :
  - compatible : Should be "microchip,usb251xb" or one of the specific types:
 	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
 	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
-	"microchip,usb2517", "microchip,usb2517i"
+	"microchip,usb2517", "microchip,usb2517i", "microchip,usb2422"
  - reg : I2C address on the selected bus (default is <0x2C>)
 
 Optional properties :
-- 
2.23.0

