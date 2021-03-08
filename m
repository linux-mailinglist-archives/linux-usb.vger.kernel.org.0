Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73617330A68
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 10:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhCHJkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 04:40:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:13449 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhCHJkE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Mar 2021 04:40:04 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DvCvb0LFzzjWdq;
        Mon,  8 Mar 2021 17:38:35 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Mar 2021 17:39:50 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: typec: tps6598x: Fix return value check in tps6598x_probe()
Date:   Mon, 8 Mar 2021 09:48:41 +0000
Message-ID: <20210308094841.3587751-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function device_get_named_child_node() returns
NULL pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: 18a6c866bb19 ("usb: typec: tps6598x: Add USB role switching logic")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/typec/tps6598x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index a4ec8e56c2b9..2c4ab90e16e7 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -629,8 +629,8 @@ static int tps6598x_probe(struct i2c_client *client)
 		return ret;
 
 	fwnode = device_get_named_child_node(&client->dev, "connector");
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
+	if (!fwnode)
+		return -ENODEV;
 
 	tps->role_sw = fwnode_usb_role_switch_get(fwnode);
 	if (IS_ERR(tps->role_sw)) {

