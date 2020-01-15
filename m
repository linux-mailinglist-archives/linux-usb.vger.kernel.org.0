Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8C3E13C2AF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgAON0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:26:02 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49152 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729039AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnXv069002;
        Wed, 15 Jan 2020 07:25:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=CsvdqamM/+3ZHq5Xv+e/GUp3qjRTY5bF4VYeHFV8l3A=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BcqLl793mx7snOXtb93BN441St4DPnoJSKVRRyFDJ9WEDXeY6aX5nn2fR/R1WcOg3
         1AM+4CRZcKRXafDlbdeJ3yClq3PJdQ8+xPDuNqnJEoDV7IBw2ShztswvendicN/3uO
         3le2+CxMVT3mbdZ8efF9KFoH/DEbZyGVa24iZvPA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPnSf018807;
        Wed, 15 Jan 2020 07:25:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3C066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 14/25] usb: musb: jz4740: Rename platform_device field in priv struct
Date:   Wed, 15 Jan 2020 07:25:36 -0600
Message-ID: <20200115132547.364-15-b-liu@ti.com>
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

Name the platform_device pointer 'pdev' instead of 'musb'. Since the
driver also deal with pointers to 'struct musb', it can be very
confusing to have a pointer named after this struct but with a different
type.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/jz4740.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 1400e5763d44..64e0b0f8c45b 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -17,7 +17,7 @@
 #include "musb_core.h"
 
 struct jz4740_glue {
-	struct platform_device  *musb;
+	struct platform_device	*pdev;
 	struct clk		*clk;
 };
 
@@ -142,7 +142,7 @@ static int jz4740_probe(struct platform_device *pdev)
 
 	musb->dev.parent		= dev;
 
-	glue->musb			= musb;
+	glue->pdev			= musb;
 	glue->clk			= clk;
 
 	platform_set_drvdata(pdev, glue);
@@ -179,7 +179,7 @@ static int jz4740_remove(struct platform_device *pdev)
 {
 	struct jz4740_glue	*glue = platform_get_drvdata(pdev);
 
-	platform_device_unregister(glue->musb);
+	platform_device_unregister(glue->pdev);
 	clk_disable_unprepare(glue->clk);
 
 	return 0;
-- 
2.17.1

