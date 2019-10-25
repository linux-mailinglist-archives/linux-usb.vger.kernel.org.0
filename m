Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0443E4A4F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 13:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503817AbfJYLrw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 07:47:52 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56498 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502199AbfJYLrw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Oct 2019 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1572004042; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kbyr+nLKwMc3HEXehadLYJ4V81bK8hSdN4NUOQzouq4=;
        b=KJfmhsCY18bg8zshwuW6SJQb9TwNLkY8so3+eozeyjA0nTZeDnF78kevfTVMVOzo4Z9tsI
        fXHqlJ+HYNwsFdX+nmNM4bxGuBc+Hs0tXyTcf7n7dYq7v7AEQkh7msssK16OCeAbN03CoQ
        TqyUmmDECfH3mwHjQ7PCaSn60WbiV7A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 5/6] usb: musb: jz4740: Silence error if code is -EPROBE_DEFER
Date:   Fri, 25 Oct 2019 13:47:09 +0200
Message-Id: <20191025114710.13222-5-paul@crapouillou.net>
In-Reply-To: <20191025114710.13222-1-paul@crapouillou.net>
References: <20191025114710.13222-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Avoid printing any error message if the error code is -EPROBE_DEFER.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 drivers/usb/musb/jz4740.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index bbecfdee6ea1..5e885fa26829 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -81,14 +81,17 @@ static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
 static int jz4740_musb_init(struct musb *musb)
 {
 	struct device *dev = musb->controller->parent;
+	int err;
 
 	if (dev->of_node)
 		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 	else
 		musb->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(musb->xceiv)) {
-		dev_err(dev, "No transceiver configured\n");
-		return PTR_ERR(musb->xceiv);
+		err = PTR_ERR(musb->xceiv);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "No transceiver configured: %d", err);
+		return err;
 	}
 
 	/* Silicon does not implement ConfigData register.
-- 
2.23.0

