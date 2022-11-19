Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B07630DC6
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 10:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbiKSJXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Nov 2022 04:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSJXp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Nov 2022 04:23:45 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF3277217
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 01:23:44 -0800 (PST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDp9K0x7wzmVv9;
        Sat, 19 Nov 2022 17:23:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 17:23:43 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 19 Nov
 2022 17:23:42 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <jun.li@nxp.com>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH v2] usb: typec: tcpci: fix of node refcount leak in tcpci_register_port()
Date:   Sat, 19 Nov 2022 17:22:03 +0800
Message-ID: <20221119092203.1759097-1-yangyingliang@huawei.com>
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

I got the following report while doing device(mt6370-tcpc) load
test with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled:

  OF: ERROR: memory leak, expected refcount 1 instead of 2,
  of_node_get()/of_node_put() unbalanced - destroy cset entry:
  attach overlay node /i2c/pmic@34/tcpc/connector

The 'fwnode' set in tcpci_parse_config(), its node refcount is
increased in device_get_named_child_node(). It needs be put while
exiting, so call fwnode_handle_put() in the error path of
tcpci_register_port() and in tcpci_remove() to avoid leak.

Fixes: 5e85a04c8c0d ("usb: typec: add fwnode to tcpc")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v1 -> v2:
  Add description to how is the report generated and
  the review tag from Guenter.
---
 drivers/usb/typec/tcpm/tcpci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index b2bfcebe218f..ade0a53b40ef 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -794,8 +794,10 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 		return ERR_PTR(err);
 
 	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
-	if (IS_ERR(tcpci->port))
+	if (IS_ERR(tcpci->port)) {
+		fwnode_handle_put(tcpci->tcpc.fwnode);
 		return ERR_CAST(tcpci->port);
+	}
 
 	return tcpci;
 }
@@ -857,6 +859,7 @@ static void tcpci_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
 
 	tcpci_unregister_port(chip->tcpci);
+	fwnode_handle_put(chip->tcpci->tcpc.fwnode);
 }
 
 static const struct i2c_device_id tcpci_id[] = {
-- 
2.25.1

