Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306F163964A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 15:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiKZOP3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Nov 2022 09:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKZOP2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Nov 2022 09:15:28 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7A61D30B
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 06:15:27 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NKDJV3cFTzRpLZ;
        Sat, 26 Nov 2022 22:14:50 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 26 Nov 2022 22:15:24 +0800
From:   Wang Yufen <wangyufen@huawei.com>
To:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <abailon@baylibre.com>,
        Wang Yufen <wangyufen@huawei.com>
Subject: [PATCH] usb: musb: fix error return code in da8xx_musb_init()
Date:   Sat, 26 Nov 2022 22:35:32 +0800
Message-ID: <1669473332-14165-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix to return a negative error code -ENODEV instead of 0 as before
commit 09721ba6daa1 ("usb: musb: da8xx: Call earlier
clk_prepare_enable()") did.

Fixes: 09721ba6daa1 ("usb: musb: da8xx: Call earlier clk_prepare_enable()")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 drivers/usb/musb/da8xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index a4e55b0..d47e5c9 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -368,8 +368,10 @@ static int da8xx_musb_init(struct musb *musb)
 
 	/* Returns zero if e.g. not clocked */
 	rev = musb_readl(reg_base, DA8XX_USB_REVISION_REG);
-	if (!rev)
+	if (!rev) {
+		ret = -ENODEV;
 		goto fail;
+	}
 
 	musb->xceiv = usb_get_phy(USB_PHY_TYPE_USB2);
 	if (IS_ERR_OR_NULL(musb->xceiv)) {
-- 
1.8.3.1

