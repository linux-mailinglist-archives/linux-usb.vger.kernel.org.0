Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C84E187486
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732660AbgCPVLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47686 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732608AbgCPVLi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbHN042922;
        Mon, 16 Mar 2020 16:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393097;
        bh=7K6KXYbrGHLGIzljUmRv7QQUayc+Q2Dt62k71k4PDWc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rcTwSEnDtwD41v3AqkSiBVFltsiif7HYK0S4cJ841GjMlaF4Y0Wa9VcGhtsAx+I1t
         j7hz5DRr9LzI8DXE5pScUXMh9PreqKznMQU5WIZouHXiCnmUBCnH3NlhFUrh9Hpr2v
         lx1gRZs9NQbxwaYvGNrgVVCwGrsVwvy+yT2JTnLM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GLBbQi076998
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 16:11:37 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLd119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 1/8] usb: musb: remove redundant assignment to variable ret
Date:   Mon, 16 Mar 2020 16:11:29 -0500
Message-ID: <20200316211136.2274-2-b-liu@ti.com>
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

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being initialized with a value that is never read,
it is assigned a new value later on. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index a627f4133d6b..6196b0e8d77d 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -448,7 +448,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	struct platform_device_info pinfo;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	int ret = -ENOMEM;
+	int ret;
 
 	glue = devm_kzalloc(dev, sizeof(*glue), GFP_KERNEL);
 	if (!glue)
-- 
2.17.1

