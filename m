Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFE611F4D7
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 23:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLNWS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 17:18:26 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:60876 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfLNWS0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Dec 2019 17:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576361904; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=Lh2mSaV5+GjnTCiZuP3ZS+WfNdWqHzrxBvAloH+axI4=;
        b=jTfUFpRDIIF3JGnOTH4T18L/QlKLbVlI4JL0ig0jYt9nLr78lDt3DY0woCBkQEXpCliuxf
        fUaCnct9sNLJStA5eTFH2lS3jFbEl/qGywAt/egMtOAGMRzzIGGKnEyXll2gKizIqRvwFi
        myImrUaO952cUZ9jOGQzVzSrBBjoHJE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] usb: musb: Disable pullup at init
Date:   Sat, 14 Dec 2019 23:18:15 +0100
Message-Id: <20191214221815.97483-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pullup may be already enabled before the driver is initialized. This
happens for instance on JZ4740.

It has to be disabled at init time, as we cannot guarantee that a gadget
driver will be bound to the UDC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 15cca912c53e..c91d5c2ed4ad 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2310,6 +2310,9 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	musb_disable_interrupts(musb);
 	musb_writeb(musb->mregs, MUSB_DEVCTL, 0);
 
+	/* MUSB_POWER_SOFTCONN might be already set, JZ4740 does this. */
+	musb_writeb(musb->mregs, MUSB_POWER, 0);
+
 	/* Init IRQ workqueue before request_irq */
 	INIT_DELAYED_WORK(&musb->irq_work, musb_irq_work);
 	INIT_DELAYED_WORK(&musb->deassert_reset_work, musb_deassert_reset);
-- 
2.24.0

