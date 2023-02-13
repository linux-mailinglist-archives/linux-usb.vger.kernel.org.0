Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA96693EC2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 08:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjBMHKJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 02:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjBMHKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 02:10:07 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398EDEC7D
        for <linux-usb@vger.kernel.org>; Sun, 12 Feb 2023 23:10:02 -0800 (PST)
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PFb4x3YVnzRs0N;
        Mon, 13 Feb 2023 15:07:29 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 13 Feb
 2023 15:09:59 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>, <dan.scally@ideasonboard.com>,
        <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next v2] usb: gadget: uvc: fix missing mutex_unlock() if kstrtou8() fails
Date:   Mon, 13 Feb 2023 15:09:26 +0800
Message-ID: <20230213070926.776447-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If kstrtou8() fails, the mutex_unlock() is missed, move kstrtou8()
before mutex_lock() to fix it up.

Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Move kstrtou8 before mutex_lock().
---
 drivers/usb/gadget/function/uvc_configfs.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 18c6a1461b7e..62b759bb7613 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -590,6 +590,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	int result;
 	u8 num;
 
+	result = kstrtou8(page, 0, &num);
+	if (result)
+		return result;
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = group->cg_item.ci_parent->ci_parent->
@@ -597,10 +601,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 	cd = &opts->uvc_output_terminal;
 
-	result = kstrtou8(page, 0, &num);
-	if (result)
-		return result;
-
 	mutex_lock(&opts->lock);
 	cd->bSourceID = num;
 	mutex_unlock(&opts->lock);
@@ -707,15 +707,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
-
 	mutex_lock(&opts->lock);
 	xu->desc.bNumControls = num;
 	mutex_unlock(&opts->lock);
@@ -742,15 +742,15 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
-
 	mutex_lock(&opts->lock);
 
 	if (num == xu->desc.bNrInPins) {
@@ -795,15 +795,15 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
-
 	mutex_lock(&opts->lock);
 
 	if (num == xu->desc.bControlSize) {
-- 
2.25.1

