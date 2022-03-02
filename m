Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED914C9C32
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 04:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234799AbiCBDiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 22:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiCBDiX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 22:38:23 -0500
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FAA1FCF6
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 19:37:40 -0800 (PST)
X-QQ-mid: bizesmtp65t1646192242t89gbo78
Received: from localhost.localdomain ( [58.240.82.166])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 02 Mar 2022 11:37:18 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: dpyQmELDBxF9Prl52JgMRPjgodJe3WWVa84v1DaukhPHZqksTih2wpOdExClV
        +7SFqNDhjW+FqQE5TPGdcnfwpkQDCWwVA5g6iS1mS1yOOzzImVFQqRCF8bApQXJnOX1/jpN
        3xgpc2ogtaCj1Pxnd7a2fNjF0jv1OYicRF+iNmaDMUqnbSTnmBQIabJsSMVPcQsvPawY7Ut
        XG8+DJkPyI73KXoIiWlozIdvvYkuB+D2H+PFoHCYYtfM1X8dWYZpdmCvXkIgnZpTUmU8OrX
        TRsNWUqzPg/+G8oCSLJuQjoBwNq4TfE7DtD+EkA74KTT6bNoOn+jETXbv4RNxYJXQzJciIn
        DW/3rBxedTmCBWIedM=
X-QQ-GoodBg: 2
From:   Zhen Ni <nizhen@uniontech.com>
To:     ok@artecdesign.ee, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhen Ni <nizhen@uniontech.com>
Subject: [PATCH] USB: host: isp116x: check return value after calling platform_get_resource()
Date:   Wed,  2 Mar 2022 11:37:16 +0800
Message-Id: <20220302033716.31272-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It will cause null-ptr-deref if platform_get_resource() returns NULL,
we need check the return value.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/usb/host/isp116x-hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 8835f6bd528e..8c7f0991c21b 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -1541,10 +1541,12 @@ static int isp116x_remove(struct platform_device *pdev)
 
 	iounmap(isp116x->data_reg);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	release_mem_region(res->start, 2);
+	if (res)
+		release_mem_region(res->start, 2);
 	iounmap(isp116x->addr_reg);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, 2);
+	if (res)
+		release_mem_region(res->start, 2);
 
 	usb_put_hcd(hcd);
 	return 0;
-- 
2.20.1



