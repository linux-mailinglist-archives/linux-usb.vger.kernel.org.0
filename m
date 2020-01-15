Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47D713C29E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgAONZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51342 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnuB100002;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=iuX7g5Q8X2uIO6Zfk9kqXSpkfUHJQthYb8dNMM/aSvs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UqRIcq3nqMeVCiQQ6gZGy/XIFeEB69fO6QZtpGIoNMtOl2GRkIP95UFrwFGcIj6Z8
         heFCIbmIQ4okVizntTeDlo/dULabEJBkqv2lB+OUk+tjRYWOJDUWThgy/iAc+Jh7Ry
         VXEjDoQ3rhX5A4655dsgZwblRhK4AwfsIolIFCds=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnsZ018804;
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm39066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 11/25] usb: musb: jz4740: Suppress useless field in priv structure
Date:   Wed, 15 Jan 2020 07:25:33 -0600
Message-ID: <20200115132547.364-12-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

The 'dev' field was never read anywhere.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index e3b8c84ccdb8..03c555679e5e 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -17,7 +17,6 @@
 #include "musb_core.h"
 
 struct jz4740_glue {
-	struct device           *dev;
 	struct platform_device  *musb;
 	struct clk		*clk;
 };
@@ -141,7 +140,6 @@ static int jz4740_probe(struct platform_device *pdev)
 
 	musb->dev.parent		= &pdev->dev;
 
-	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
 	glue->clk			= clk;
 
-- 
2.17.1

