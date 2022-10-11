Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B04315FAE5E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJKI3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 04:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiJKI3n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 04:29:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71A1BC0
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 01:29:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdl-0005Sr-77; Tue, 11 Oct 2022 10:29:29 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdj-000r76-BI; Tue, 11 Oct 2022 10:29:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oiAdi-003iNg-Br; Tue, 11 Oct 2022 10:29:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/6] usb: chipidea: usbmisc_imx: Fix setting i.MX6SX wakeup source
Date:   Tue, 11 Oct 2022 10:29:20 +0200
Message-Id: <20221011082924.884123-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221011082924.884123-1-s.hauer@pengutronix.de>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

MX6SX_USB_VBUS_WAKEUP_SOURCE are two bits containing an enum value,
so when read/modify/write that we have to clear both bits bits before
setting the desired bits. The clearing of the bits was forgotten, add
it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 8f805aa9c383c..e1b4b7f9b3f31 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -551,6 +551,7 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
 		spin_lock_irqsave(&usbmisc->lock, flags);
 		/* Set vbus wakeup source as bvalid */
 		val = readl(reg);
+		val &= ~MX6SX_USB_VBUS_WAKEUP_SOURCE(3);
 		writel(val | MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID, reg);
 		/*
 		 * Disable dp/dm wakeup in device mode when vbus is
-- 
2.30.2

