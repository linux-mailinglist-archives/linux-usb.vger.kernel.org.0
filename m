Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498D95BB754
	for <lists+linux-usb@lfdr.de>; Sat, 17 Sep 2022 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiIQIrw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Sep 2022 04:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQIrv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Sep 2022 04:47:51 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B8131EC7
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 01:47:50 -0700 (PDT)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MV4Gq0BrQzlVkv;
        Sat, 17 Sep 2022 16:43:47 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 17 Sep 2022 16:47:48 +0800
From:   Xiu Jianfeng <xiujianfeng@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <michael.christie@oracle.com>, <r.bolshakov@yadro.com>,
        <martin.petersen@oracle.com>, <d.bogdanov@yadro.com>
CC:     <linux-usb@vger.kernel.org>, <xiujianfeng@huawei.com>
Subject: [PATCH] usb: gadget: add _init/__exit annotations to module init/exit funcs
Date:   Sat, 17 Sep 2022 16:44:13 +0800
Message-ID: <20220917084413.23957-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add missing _init/__exit annotations to module init/exit funcs.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/usb/gadget/function/f_tcm.c    | 4 ++--
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 8e17ac831be0..658e2e21fdd0 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2306,7 +2306,7 @@ static struct usb_function *tcm_alloc(struct usb_function_instance *fi)
 
 DECLARE_USB_FUNCTION(tcm, tcm_alloc_inst, tcm_alloc);
 
-static int tcm_init(void)
+static int __init tcm_init(void)
 {
 	int ret;
 
@@ -2322,7 +2322,7 @@ static int tcm_init(void)
 }
 module_init(tcm_init);
 
-static void tcm_exit(void)
+static void __exit tcm_exit(void)
 {
 	target_unregister_template(&usbg_ops);
 	usb_function_unregister(&tcmusb_func);
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 6f68cbeeee7c..7538279f9817 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1443,7 +1443,7 @@ void gserial_resume(struct gserial *gser)
 }
 EXPORT_SYMBOL_GPL(gserial_resume);
 
-static int userial_init(void)
+static int __init userial_init(void)
 {
 	struct tty_driver *driver;
 	unsigned			i;
@@ -1496,7 +1496,7 @@ static int userial_init(void)
 }
 module_init(userial_init);
 
-static void userial_cleanup(void)
+static void __exit userial_cleanup(void)
 {
 	tty_unregister_driver(gs_tty_driver);
 	tty_driver_kref_put(gs_tty_driver);
-- 
2.17.1

