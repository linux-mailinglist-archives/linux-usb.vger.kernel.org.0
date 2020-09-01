Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32BA258F1A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 15:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgIANbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 09:31:41 -0400
Received: from first.geanix.com ([116.203.34.67]:55038 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbgIANa2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 09:30:28 -0400
Received: from localhost (80-62-117-118-mobile.dk.customer.tdc.net [80.62.117.118])
        by first.geanix.com (Postfix) with ESMTPSA id 0302DF02236;
        Tue,  1 Sep 2020 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1598966991; bh=WYzUXKIHoTwzILn/SDEEPW4IATWMUliwj4RFFLuJ4nI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=d6qguxdyz4jKFvbfpjfEyt0uwYge5Y9SJ+W0noSVuowFfVl4S5O3B4R+Rp3iR/cjN
         oKQFDleEP1o0YYre5yz7FTVsv1AHJM621elH1gU7Eywicpt6qyVahUBwsceX/Pp5Gz
         vqfOyelqSDC6BjmYdbBVwgQUPK4QErCO3S6x6vF52DhJ5O+Wud8sY9M8UL8g+qXXCK
         /wSHDopF7f1pDOSH3jv7fDL+1tMh05ZfAGMZ6hofWW0fqSjvv6+Y80sK5NQM3aa257
         kMNfaNx/65I+7rqLxY7LPM7rC3wWzBkzBpRJCjgbmjR/Qy82ohFe3hNGltqqT4hRiE
         gJuuWvbPhAZbQ==
From:   Esben Haabendal <esben@geanix.com>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v2] usb: musb: Fix use without CPPI 4.1 DMA controller on DA8xx
Date:   Tue,  1 Sep 2020 15:29:50 +0200
Message-Id: <e7e8c70295733c8cbc016943b8e42f450079cd4a.1598966671.git.esben@geanix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <570852f0a8c9f1a778e666a26f55b9b9186182f0.1598882094.git.esben@geanix.com>
References: <570852f0a8c9f1a778e666a26f55b9b9186182f0.1598882094.git.esben@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In commit d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller
to DA8xx") use of musb on da8xx without CPPI 4.1 DMA was broken.

Fixes: d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to DA8xx")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/usb/musb/da8xx.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 1c023c0091c4..4bdf704d078e 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -467,7 +467,10 @@ da8xx_dma_controller_create(struct musb *musb, void __iomem *base)
 
 static const struct musb_platform_ops da8xx_ops = {
 	.quirks		= MUSB_INDEXED_EP | MUSB_PRESERVE_SESSION |
-			  MUSB_DMA_CPPI41 | MUSB_DA8XX,
+#ifdef CONFIG_USB_TI_CPPI41_DMA
+			  MUSB_DMA_CPPI41 |
+#endif
+			  MUSB_DA8XX,
 	.init		= da8xx_musb_init,
 	.exit		= da8xx_musb_exit,
 
@@ -553,10 +556,12 @@ static int da8xx_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, glue);
 
-	ret = of_platform_populate(pdev->dev.of_node, NULL,
-				   da8xx_auxdata_lookup, &pdev->dev);
-	if (ret)
-		return ret;
+	if (IS_ENABLED(CONFIG_USB_TI_CPPI41_DMA)) {
+		ret = of_platform_populate(pdev->dev.of_node, NULL,
+					   da8xx_auxdata_lookup, &pdev->dev);
+		if (ret)
+			return ret;
+	}
 
 	memset(musb_resources, 0x00, sizeof(*musb_resources) *
 			ARRAY_SIZE(musb_resources));
-- 
2.28.0

