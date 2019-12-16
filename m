Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DA411F4C2
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 23:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfLNWLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 17:11:34 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:54688 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLNWLd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Dec 2019 17:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576361491; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=YGTjqsjkFY5d1JzvIrkAqXwCnX4OlYTC+XoMTNK/XsY=;
        b=JLRzrQLdCHDbhY2XsOJo63XAS1mqNv9Z69+2UtdLysoWQ5xKroBJ4LEJLurdQRP6lYnoDh
        /E5QACsw4VmXFdoTPr/IMxfVenRDU0wTGVsc8Iupt9aekmHMLYJ564oZmVxo/287EZQa7X
        7gcZM9ERcgDqZAq0CwCZ0E3rlxZcJG0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/6] usb: musb: jz4740: Suppress useless field in priv structure
Date:   Sat, 14 Dec 2019 23:11:21 +0100
Message-Id: <20191214221126.93116-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The 'dev' field was never read anywhere.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 5e885fa26829..16d4120ba145 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -17,7 +17,6 @@
 #include "musb_core.h"
 
 struct jz4740_glue {
-	struct device           *dev;
 	struct platform_device  *musb;
 	struct clk		*clk;
 };
@@ -150,7 +149,6 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
 
-	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
 	glue->clk			= clk;
 
-- 
2.24.0

