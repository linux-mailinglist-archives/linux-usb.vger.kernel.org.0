Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1969F187484
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbgCPVLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47690 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732647AbgCPVLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBcKV042926;
        Mon, 16 Mar 2020 16:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393098;
        bh=Axt/Is2g2PHVkFixtw4DSNQ9aJNRlcG6ps6IJ31AcDk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DkIacflnUz5U+WCILMkmyRqEc2vpxUYkMEMCj5U+y32IGSmSSfxlzI2D4WTPUg1Po
         CHkluXIdhduqtGfcs1SqtFP9ljEO/bnTd8jSwhcllkBUM5Qwf0GAou5ik/Lz6dNk90
         Otk7y78kwTERHwe3rmbWwM+4E99b7AnjMJbdu3ew=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBcBm024287
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLk119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 8/8] usb: musb: tusb6010: fix a possible missing data type replacement
Date:   Mon, 16 Mar 2020 16:11:36 -0500
Message-ID: <20200316211136.2274-9-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200316211136.2274-1-b-liu@ti.com>
References: <20200316211136.2274-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Macpaul Lin <macpaul.lin@mediatek.com>

Replace "unsigned" to "u32" for checkpatch fix to tusb_writeb().

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/tusb6010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 5d449089e3ad..99890d1bbfcb 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -156,7 +156,7 @@ static u8 tusb_readb(void __iomem *addr, u32 offset)
 	return val;
 }
 
-static void tusb_writeb(void __iomem *addr, unsigned offset, u8 data)
+static void tusb_writeb(void __iomem *addr, u32 offset, u8 data)
 {
 	u16 tmp;
 
-- 
2.17.1

