Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF4076FD21
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjHDJVv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 05:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjHDJV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 05:21:29 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE72449E4
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 02:17:53 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RHKpl1PR7z1KCDS;
        Fri,  4 Aug 2023 17:16:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:17:51 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] USB: cytherm: Correct the code style issue of redundant spaces
Date:   Fri, 4 Aug 2023 17:17:12 +0800
Message-ID: <20230804091713.41503-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ther are many redundant spaces, which is not consistent with
the kernel code style, so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/misc/cytherm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 3e3802aaefa3..9504178f5c89 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -307,17 +307,17 @@ static int cytherm_probe(struct usb_interface *interface,
 	struct usb_cytherm *dev = NULL;
 	int retval = -ENOMEM;
 
-	dev = kzalloc (sizeof(struct usb_cytherm), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct usb_cytherm), GFP_KERNEL);
 	if (!dev)
 		goto error_mem;
 
 	dev->udev = usb_get_dev(udev);
 
-	usb_set_intfdata (interface, dev);
+	usb_set_intfdata(interface, dev);
 
 	dev->brightness = 0xFF;
 
-	dev_info (&interface->dev,
+	dev_info(&interface->dev,
 		  "Cypress thermometer device now attached\n");
 	return 0;
 
@@ -329,10 +329,10 @@ static void cytherm_disconnect(struct usb_interface *interface)
 {
 	struct usb_cytherm *dev;
 
-	dev = usb_get_intfdata (interface);
+	dev = usb_get_intfdata(interface);
 
 	/* first remove the files, then NULL the pointer */
-	usb_set_intfdata (interface, NULL);
+	usb_set_intfdata(interface, NULL);
 
 	usb_put_dev(dev->udev);
 
-- 
2.34.1

