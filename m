Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401701BAF3A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 22:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgD0UVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 16:21:25 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:40806 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgD0UVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 16:21:25 -0400
Received: from localhost.localdomain ([93.22.148.32])
        by mwinf5d25 with ME
        id XwML2200L0iASfR03wMMSk; Mon, 27 Apr 2020 22:21:21 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 27 Apr 2020 22:21:21 +0200
X-ME-IP: 93.22.148.32
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: phy: twl6030-usb: Fix a resource leak in an error handling path in 'twl6030_usb_probe()'
Date:   Mon, 27 Apr 2020 22:21:16 +0200
Message-Id: <20200427202116.94380-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A call to 'regulator_get()' is hidden in 'twl6030_usb_ldo_init()'. A
corresponding put must be performed in the error handling path, as
already done in the remove function.

While at it, also move a 'free_irq()' call in the error handling path in
order to be consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Maybe adding a 'twl6030_usb_ldo_uninit()' function would be more explicit.
---
 drivers/usb/phy/phy-twl6030-usb.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index bfebf1f2e991..9a7e655d5280 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -377,7 +377,7 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	if (status < 0) {
 		dev_err(&pdev->dev, "can't get IRQ %d, err %d\n",
 			twl->irq1, status);
-		return status;
+		goto err_put_regulator;
 	}
 
 	status = request_threaded_irq(twl->irq2, NULL, twl6030_usb_irq,
@@ -386,8 +386,7 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	if (status < 0) {
 		dev_err(&pdev->dev, "can't get IRQ %d, err %d\n",
 			twl->irq2, status);
-		free_irq(twl->irq1, twl);
-		return status;
+		goto err_free_irq1;
 	}
 
 	twl->asleep = 0;
@@ -396,6 +395,13 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Initialized TWL6030 USB module\n");
 
 	return 0;
+
+err_free_irq1:
+	free_irq(twl->irq1, twl);
+err_put_regulator:
+	regulator_put(twl->usb3v3);
+
+	return status;
 }
 
 static int twl6030_usb_remove(struct platform_device *pdev)
-- 
2.25.1

