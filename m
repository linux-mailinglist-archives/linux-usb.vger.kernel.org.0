Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E17602976
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 12:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJRKhl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 06:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiJRKhe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 06:37:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB96B44B5
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 03:37:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyU-0002Gl-Ae; Tue, 18 Oct 2022 12:37:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyR-002G14-Rr; Tue, 18 Oct 2022 12:37:27 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyQ-00BIQn-O8; Tue, 18 Oct 2022 12:37:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Xu Yang <xu.yang.nxp@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2 1/4] usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel masks
Date:   Tue, 18 Oct 2022 12:37:22 +0200
Message-Id: <20221018103725.2580679-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221018103725.2580679-1-s.hauer@pengutronix.de>
References: <20221018103725.2580679-1-s.hauer@pengutronix.de>
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

According to the reference manual the masks for the
MX53_USB_CTRL_1_H*_XCVR_CLK_SEL bits are 0x3, not 0x11 (which were
probably meant as 0b11).

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
Link: https://lore.kernel.org/r/20221011082924.884123-2-s.hauer@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/chipidea/usbmisc_imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index bac0f5458cab9..8f805aa9c383c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -42,9 +42,9 @@
 #define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08
 #define MX53_USB_OTG_PHY_CTRL_1_OFFSET	0x0c
 #define MX53_USB_CTRL_1_OFFSET	        0x10
-#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x11 << 2)
+#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x3 << 2)
 #define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI BIT(2)
-#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x11 << 6)
+#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x3 << 6)
 #define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI BIT(6)
 #define MX53_USB_UH2_CTRL_OFFSET	0x14
 #define MX53_USB_UH3_CTRL_OFFSET	0x18
-- 
2.30.2

