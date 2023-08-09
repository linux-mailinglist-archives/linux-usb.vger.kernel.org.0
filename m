Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9C57755DE
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjHIItc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 04:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjHIItb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 04:49:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A3B10C6
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 01:49:30 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RLNxW6fx8zmXK3;
        Wed,  9 Aug 2023 16:48:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 16:49:27 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <frank.li@vivo.com>, <robh@kernel.org>,
        <u.kleine-koenig@pengutronix.de>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] usb: gadget/snps_udc_plat: Remove redundant of_match_ptr()
Date:   Wed, 9 Aug 2023 16:48:49 +0800
Message-ID: <20230809084849.2410477-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr() here. Remove of_match_ptr() and CONFIG_OF.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 35c7a149b977..547af2ed9e5e 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -300,7 +300,6 @@ static const struct dev_pm_ops udc_plat_pm_ops = {
 };
 #endif
 
-#if defined(CONFIG_OF)
 static const struct of_device_id of_udc_match[] = {
 	{ .compatible = "brcm,ns2-udc", },
 	{ .compatible = "brcm,cygnus-udc", },
@@ -308,14 +307,13 @@ static const struct of_device_id of_udc_match[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_udc_match);
-#endif
 
 static struct platform_driver udc_plat_driver = {
 	.probe		= udc_plat_probe,
 	.remove_new	= udc_plat_remove,
 	.driver		= {
 		.name	= "snps-udc-plat",
-		.of_match_table = of_match_ptr(of_udc_match),
+		.of_match_table = of_udc_match,
 #ifdef CONFIG_PM_SLEEP
 		.pm	= &udc_plat_pm_ops,
 #endif
-- 
2.34.1

