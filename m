Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D48E4FC03
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfD3O7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:59:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36736 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfD3O7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:59:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UExhZd103370;
        Tue, 30 Apr 2019 09:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636383;
        bh=TKwqF1mn5UZq6Ne7irRh1Ifzitv+7iEKMhnWYsCLUI4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yXaMQw2MswpLddt6NmjmNitBTfRVuggg3X3FintZGBzhH7q2mi2GhTfiXpD8djb8j
         dTuQFb9iKJQD90TIuobnL8CsRCImaPrg94KwDN5rLhWhaHtBde/xrDXPXthqAtgFsM
         8DwZzjJYh0RcffrQKSeUAxUmikY3ZXC5YqoHcsg8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UExhqv045784
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 09:59:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 09:59:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 09:59:42 -0500
Received: from uda0271908.am.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UExgrF071248;
        Tue, 30 Apr 2019 09:59:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 5/7] usb: musb: jz4740: Let the platform probe the PHY
Date:   Tue, 30 Apr 2019 09:59:39 -0500
Message-ID: <20190430145942.1128-6-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430145942.1128-1-b-liu@ti.com>
References: <20190430145942.1128-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

By registering a generic USB PHY from within the driver, we may shadow
the USB PHY registered by the platform, which might be different.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index a60627bf7be3..ad35e09f90bd 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -74,7 +74,6 @@ static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
 
 static int jz4740_musb_init(struct musb *musb)
 {
-	usb_phy_generic_register();
 	musb->xceiv = usb_get_phy(USB_PHY_TYPE_USB2);
 	if (IS_ERR(musb->xceiv)) {
 		pr_err("HS UDC: no transceiver configured\n");
@@ -183,7 +182,6 @@ static int jz4740_remove(struct platform_device *pdev)
 	struct jz4740_glue	*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
 	clk_disable_unprepare(glue->clk);
 
 	return 0;
-- 
2.17.1

