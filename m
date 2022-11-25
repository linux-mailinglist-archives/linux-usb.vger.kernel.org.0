Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05B363841D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 07:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKYGnN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 01:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKYGnM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 01:43:12 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4191A2A733
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 22:43:11 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJQK75mt8zmWBD;
        Fri, 25 Nov 2022 14:42:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 14:43:09 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 14:43:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <stern@rowland.harvard.edu>, <hch@lst.de>
CC:     <linux-usb@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] usb: core: hcd: Fix return value check in usb_hcd_setup_local_mem()
Date:   Fri, 25 Nov 2022 14:41:20 +0800
Message-ID: <20221125064120.2842452-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If dmam_alloc_attrs() fails, it returns NULL pointer and never
return ERR_PTR(), so repleace IS_ERR() with IS_ERR_OR_NULL()
and if it's NULL, returns -ENOMEM.

Fixes: 9ba26f5cecd8 ("ARM: sa1100/assabet: move dmabounce hack to ohci driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/core/hcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index faeaace0d197..8300baedafd2 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3128,18 +3128,22 @@ int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
 	if (phys_addr)
 		local_mem = devm_memremap(hcd->self.sysdev, phys_addr,
 					  size, MEMREMAP_WC);
 	else
 		local_mem = dmam_alloc_attrs(hcd->self.sysdev, size, &dma,
 					     GFP_KERNEL,
 					     DMA_ATTR_WRITE_COMBINE);
 
-	if (IS_ERR(local_mem))
+	if (IS_ERR_OR_NULL(local_mem)) {
+		if (!local_mem)
+			return -ENOMEM;
+
 		return PTR_ERR(local_mem);
+	}
 
 	/*
 	 * Here we pass a dma_addr_t but the arg type is a phys_addr_t.
 	 * It's not backed by system memory and thus there's no kernel mapping
 	 * for it.
 	 */
 	err = gen_pool_add_virt(hcd->localmem_pool, (unsigned long)local_mem,
 				dma, size, dev_to_node(hcd->self.sysdev));
-- 
2.25.1

