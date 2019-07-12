Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A92664AD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfGLCyB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:54:01 -0400
Received: from gate.crashing.org ([63.228.1.57]:54427 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729051AbfGLCyA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:54:00 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGc010240;
        Thu, 11 Jul 2019 21:53:54 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 01/12] usb: gadget: aspeed: Don't set port enable change bit on reset
Date:   Fri, 12 Jul 2019 12:53:37 +1000
Message-Id: <20190712025348.21019-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This bit should be only set when the port enable goes down, for
example, on errors. Not when it gets set after a port reset. Some
USB stacks seem to be sensitive to this and fails enumeration.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
index 7c040f56100e..0755115fd90d 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
@@ -449,8 +449,15 @@ static void ast_vhub_change_port_stat(struct ast_vhub *vhub,
 		       USB_PORT_STAT_C_OVERCURRENT |
 		       USB_PORT_STAT_C_RESET |
 		       USB_PORT_STAT_C_L1;
-		p->change |= chg;
 
+		/*
+		 * We only set USB_PORT_STAT_C_ENABLE if we are disabling
+		 * the port as per USB spec, otherwise MacOS gets upset
+		 */
+		if (p->status & USB_PORT_STAT_ENABLE)
+			chg &= ~USB_PORT_STAT_C_ENABLE;
+
+		p->change = chg;
 		ast_vhub_update_hub_ep1(vhub, port);
 	}
 }
-- 
2.17.1

