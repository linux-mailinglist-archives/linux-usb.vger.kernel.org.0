Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC3E5E640A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 15:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiIVNqg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 09:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiIVNpw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:45:52 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59278D74EC
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 06:45:46 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGfL74jSzWgtp;
        Thu, 22 Sep 2022 21:41:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:45:44 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:45:43 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: typec: stusb160x: Switch to use dev_err_probe() helper
Date:   Thu, 22 Sep 2022 21:52:28 +0800
Message-ID: <20220922135228.2206755-1-yangyingliang@huawei.com>
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

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs. It's more simple in error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/typec/stusb160x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 8638f1d39896..494b371151e0 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -750,11 +750,8 @@ static int stusb160x_probe(struct i2c_client *client)
 	if (client->irq) {
 		chip->role_sw = fwnode_usb_role_switch_get(fwnode);
 		if (IS_ERR(chip->role_sw)) {
-			ret = PTR_ERR(chip->role_sw);
-			if (ret != -EPROBE_DEFER)
-				dev_err(chip->dev,
-					"Failed to get usb role switch: %d\n",
-					ret);
+			ret = dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
+					    "Failed to get usb role switch\n");
 			goto port_unregister;
 		}
 
-- 
2.25.1

