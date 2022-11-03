Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB92618920
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 20:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiKCT6Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 15:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbiKCT57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 15:57:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A17205D1
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 12:57:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLK-0006b3-P9; Thu, 03 Nov 2022 20:57:38 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLK-00287a-L5; Thu, 03 Nov 2022 20:57:37 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLI-0073Zz-OP; Thu, 03 Nov 2022 20:57:36 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org
Subject: [PATCH 1/4] usb: gadget: at91-udc: simplify at91rm9200_udc_pullup callback
Date:   Thu,  3 Nov 2022 20:57:27 +0100
Message-Id: <20221103195730.1681967-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103195730.1681967-1-m.grzeschik@pengutronix.de>
References: <20221103195730.1681967-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just simplify the use of is_on and get rid of superfluous condition.

Cc: gregkh@linuxfoundation.org
Cc: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: linux-usb@vger.kernel.org
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/udc/at91_udc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index a9a7b3fc60ec96..922b4187004b03 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1628,10 +1628,7 @@ static int at91rm9200_udc_init(struct at91_udc *udc)
 
 static void at91rm9200_udc_pullup(struct at91_udc *udc, int is_on)
 {
-	if (is_on)
-		gpiod_set_value(udc->board.pullup_pin, 1);
-	else
-		gpiod_set_value(udc->board.pullup_pin, 0);
+	gpiod_set_value(udc->board.pullup_pin, is_on);
 }
 
 static const struct at91_udc_caps at91rm9200_udc_caps = {
-- 
2.30.2

