Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542223B6642
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 17:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbhF1P6E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 11:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235742AbhF1P56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 11:57:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DA8C06114A
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 08:53:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0002x5-KI; Mon, 28 Jun 2021 17:53:12 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0004Q9-8z; Mon, 28 Jun 2021 17:53:12 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v3 1/5] usb: dwc3: gadget: set gadgets parent to the right controller
Date:   Mon, 28 Jun 2021 17:53:07 +0200
Message-Id: <20210628155311.16762-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
References: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case of dwc3 it is possible that the sysdev is the parent of the
controller. To ensure the right dev is set to the gadget's dev parent we
will hand over sysdev instead of dev, which will always point to the
controller.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
   -> v2: first version of patch
   -> v3: -
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index af6d7f157989d..8a1b1daff2e97 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3990,7 +3990,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	}
 
 
-	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
+	usb_initialize_gadget(dwc->sysdev, dwc->gadget, dwc_gadget_release);
 	dev				= &dwc->gadget->dev;
 	dev->platform_data		= dwc;
 	dwc->gadget->ops		= &dwc3_gadget_ops;
-- 
2.30.2

