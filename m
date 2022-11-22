Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791B4633B06
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 12:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbiKVLRT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 06:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbiKVLQq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 06:16:46 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4E35E3C4
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 03:14:15 -0800 (PST)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NGhTJ3hp3zmW6G;
        Tue, 22 Nov 2022 19:13:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 19:14:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 22 Nov
 2022 19:14:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <gregkh@linuxfoundation.org>, <chunfeng.yun@mediatek.com>,
        <heikki.krogerus@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v4] usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
Date:   Tue, 22 Nov 2022 19:12:26 +0800
Message-ID: <20221122111226.251588-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I got the following report while doing device(mt6370-tcpc) load
test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:

  OF: ERROR: memory leak, expected refcount 1 instead of 2,
  of_node_get()/of_node_put() unbalanced - destroy cset entry:
  attach overlay node /i2c/pmic@34

The 'parent' returned by fwnode_get_parent() with refcount incremented.
it needs be put after using.

Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2 -> v4:
  Remove not needed null pointer check.

v1 -> v2:
  Add description to how is the report generated.
---
 drivers/usb/roles/class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index dfaed7eee94f..32e6d19f7011 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -106,10 +106,13 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
 	struct device *dev;
 
-	if (!parent || !fwnode_property_present(parent, "usb-role-switch"))
+	if (!fwnode_property_present(parent, "usb-role-switch")) {
+		fwnode_handle_put(parent);
 		return NULL;
+	}
 
 	dev = class_find_device_by_fwnode(role_class, parent);
+	fwnode_handle_put(parent);
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
-- 
2.25.1

