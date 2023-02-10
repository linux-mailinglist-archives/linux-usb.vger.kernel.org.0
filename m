Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FB169190B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 08:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjBJHSN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 02:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjBJHSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 02:18:13 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389896F20D
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 23:18:09 -0800 (PST)
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PClM75vD3zJqwg;
        Fri, 10 Feb 2023 15:13:23 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 15:18:02 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>, <dan.scally@ideasonboard.com>,
        <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: gadget: uvc: fix missing mutex_unlock() if kstrtou8() fails
Date:   Fri, 10 Feb 2023 15:17:18 +0800
Message-ID: <20230210071718.4072995-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add missing mutex_unlock() if kstrtou8() fails in store functions.

Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 18c6a1461b7e..c2f0eb1c1f87 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -598,8 +598,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	cd = &opts->uvc_output_terminal;
 
 	result = kstrtou8(page, 0, &num);
-	if (result)
+	if (result) {
+		mutex_unlock(su_mutex);
 		return result;
+	}
 
 	mutex_lock(&opts->lock);
 	cd->bSourceID = num;
@@ -713,8 +715,10 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 
 	ret = kstrtou8(page, 0, &num);
-	if (ret)
+	if (ret) {
+		mutex_unlock(su_mutex);
 		return ret;
+	}
 
 	mutex_lock(&opts->lock);
 	xu->desc.bNumControls = num;
@@ -748,8 +752,10 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 
 	ret = kstrtou8(page, 0, &num);
-	if (ret)
+	if (ret) {
+		mutex_unlock(su_mutex);
 		return ret;
+	}
 
 	mutex_lock(&opts->lock);
 
@@ -801,8 +807,10 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 
 	ret = kstrtou8(page, 0, &num);
-	if (ret)
+	if (ret) {
+		mutex_unlock(su_mutex);
 		return ret;
+	}
 
 	mutex_lock(&opts->lock);
 
-- 
2.25.1

