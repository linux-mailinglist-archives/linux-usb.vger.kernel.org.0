Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6106414A4
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 08:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiLCHMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Dec 2022 02:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiLCHMg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Dec 2022 02:12:36 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B74B6162
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 23:12:35 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NPLb93r5mzmVRP;
        Sat,  3 Dec 2022 15:11:49 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 3 Dec
 2022 15:12:33 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <samuel@sholland.org>
CC:     <linux-usb@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH] usb: typec: wusb3801: fix fwnode refcount leak in wusb3801_probe()
Date:   Sat, 3 Dec 2022 15:10:27 +0800
Message-ID: <20221203071027.3808308-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I got the following report while doing fault injection test:

  OF: ERROR: memory leak, expected refcount 1 instead of 4,
  of_node_get()/of_node_put() unbalanced - destroy cset entry:
  attach overlay node /i2c/tcpc@60/connector

If wusb3801_hw_init() fails, fwnode_handle_put() needs be called to
avoid refcount leak.

Fixes: d016cbe4d7ac ("usb: typec: Support the WUSB3801 port controller")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/typec/wusb3801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
index 3cc7a15ecbd3..a43a18d4b02e 100644
--- a/drivers/usb/typec/wusb3801.c
+++ b/drivers/usb/typec/wusb3801.c
@@ -364,7 +364,7 @@ static int wusb3801_probe(struct i2c_client *client)
 	/* Initialize the hardware with the devicetree settings. */
 	ret = wusb3801_hw_init(wusb3801);
 	if (ret)
-		return ret;
+		goto err_put_connector;
 
 	wusb3801->cap.revision		= USB_TYPEC_REV_1_2;
 	wusb3801->cap.accessory[0]	= TYPEC_ACCESSORY_AUDIO;
-- 
2.25.1

