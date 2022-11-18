Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7C162F71D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 15:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242294AbiKROUh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 09:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242268AbiKROUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 09:20:36 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42902F35
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 06:20:34 -0800 (PST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDJkK4H3fzqSXw;
        Fri, 18 Nov 2022 22:16:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 22:20:31 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 22:20:31 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <gregkh@linuxfoundation.org>, <chunfeng.yun@mediatek.com>
CC:     <linux-usb@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
Date:   Fri, 18 Nov 2022 22:18:50 +0800
Message-ID: <20221118141850.806564-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I got the following report:

  OF: ERROR: memory leak, expected refcount 1 instead of 2,
  of_node_get()/of_node_put() unbalanced - destroy cset entry:
  attach overlay node /i2c/pmic@34

The 'parent' returned by fwnode_get_parent() with refcount incremented.
it needs be put after using.

Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/roles/class.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index dfaed7eee94f..289950e5fcfb 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -106,10 +106,14 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
 	struct device *dev;
 
-	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
+	if (!parent || !fwnode_property_present(parent, "usb-role-switch")) {
+		if (parent)
+			fwnode_handle_put(parent);
 		return NULL;
+	}
 
 	dev = class_find_device_by_fwnode(role_class, parent);
+	fwnode_handle_put(parent);
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
-- 
2.25.1

