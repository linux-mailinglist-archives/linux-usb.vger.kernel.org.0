Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D4A11F4CB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 23:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfLNWMB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 17:12:01 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:55008 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLNWMA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Dec 2019 17:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576361494; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wO86ve54NEKdhdaSZv4eNbfzAoNfLippFMfAu/0tZxw=;
        b=EDeuY7byW2/Fcijm901XMG1DJ11Ea+QXHZPuZjhXT0tLJB83Rg8mpvBjLDG1JXgi8t0CXt
        N1OliQhJVUoyiqQ4yUZECLOFaG+ZQMbsbEtfDkd/TcggaZIQ2MG1VQa3hM5ilZkW5Gk4Dc
        jUZcvZHyQI8wbICe/5LjWPTiZ69ayi0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     od@zcrc.me, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/6] usb: musb: jz4740: Comments fix
Date:   Sat, 14 Dec 2019 23:11:25 +0100
Message-Id: <20191214221126.93116-5-paul@crapouillou.net>
In-Reply-To: <20191214221126.93116-1-paul@crapouillou.net>
References: <20191214221126.93116-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a /* sentinel */ comment to the sentinel entry of the devicetree ID
table, and fix a multi-line comment not having its opening token on a
separate line.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index e2baa1b6bad6..a8cd2ba2ed06 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -88,7 +88,8 @@ static int jz4740_musb_init(struct musb *musb)
 		return err;
 	}
 
-	/* Silicon does not implement ConfigData register.
+	/*
+	 * Silicon does not implement ConfigData register.
 	 * Set dyn_fifo to avoid reading EP config from hardware.
 	 */
 	musb->dyn_fifo = true;
@@ -197,7 +198,7 @@ static int jz4740_remove(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id jz4740_musb_of_match[] = {
 	{ .compatible = "ingenic,jz4740-musb" },
-	{},
+	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
 #endif
-- 
2.24.0

