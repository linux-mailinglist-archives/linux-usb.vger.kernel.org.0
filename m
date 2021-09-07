Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B859D40262B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Sep 2021 11:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhIGJ2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Sep 2021 05:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhIGJ2P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Sep 2021 05:28:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A7AC061575
        for <linux-usb@vger.kernel.org>; Tue,  7 Sep 2021 02:27:09 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mNXNj-0007tQ-69; Tue, 07 Sep 2021 11:27:07 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: hd3ss3220: Use regmap_write_bits()
Date:   Tue,  7 Sep 2021 11:27:06 +0200
Message-Id: <20210907092706.31748-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the regmap_write_bits() macro instead of regmap_update_bits_base().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/usb/typec/hd3ss3220.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index f633ec15b1a1..cd47c3597e19 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -125,11 +125,9 @@ static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
 	int err;
 
 	hd3ss3220_set_role(hd3ss3220);
-	err = regmap_update_bits_base(hd3ss3220->regmap,
-				      HD3SS3220_REG_CN_STAT_CTRL,
-				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
-				      HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
-				      NULL, false, true);
+	err = regmap_write_bits(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
+				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
+				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
 	if (err < 0)
 		return IRQ_NONE;
 
-- 
2.30.2

