Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7FD7A680B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 14:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfICMFL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 08:05:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50186 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726936AbfICMFL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 08:05:11 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E4CCB86AD5A64D6FD21B;
        Tue,  3 Sep 2019 20:05:08 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Sep 2019
 20:04:59 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <pawell@cadence.com>,
        <felipe.balbi@linux.intel.com>, <yuehaibing@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: cdns3: remove set but not used variable 'priv_dev'
Date:   Tue, 3 Sep 2019 20:04:45 +0800
Message-ID: <20190903120445.22204-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/cdns3/gadget.c: In function '__cdns3_gadget_init':
drivers/usb/cdns3/gadget.c:2665:23: warning:
 variable 'priv_dev' set but not used [-Wunused-but-set-variable]
drivers/usb/cdns3/gadget.c: In function cdns3_start_all_request:
drivers/usb/cdns3/gadget.c:357:24: warning:
 variable priv_req set but not used [-Wunused-but-set-variable]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/cdns3/gadget.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 3094ad6..ddac638 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -354,13 +354,11 @@ enum usb_device_speed cdns3_get_speed(struct cdns3_device *priv_dev)
 static int cdns3_start_all_request(struct cdns3_device *priv_dev,
 				   struct cdns3_endpoint *priv_ep)
 {
-	struct cdns3_request *priv_req;
 	struct usb_request *request;
 	int ret = 0;
 
 	while (!list_empty(&priv_ep->deferred_req_list)) {
 		request = cdns3_next_request(&priv_ep->deferred_req_list);
-		priv_req = to_cdns3_request(request);
 
 		ret = cdns3_ep_run_transfer(priv_ep, request);
 		if (ret)
@@ -2664,7 +2662,6 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 
 static int __cdns3_gadget_init(struct cdns3 *cdns)
 {
-	struct cdns3_device *priv_dev;
 	int ret = 0;
 
 	cdns3_drd_switch_gadget(cdns, 1);
@@ -2674,8 +2671,6 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
 	if (ret)
 		return ret;
 
-	priv_dev = cdns->gadget_dev;
-
 	/*
 	 * Because interrupt line can be shared with other components in
 	 * driver it can't use IRQF_ONESHOT flag here.
-- 
2.7.4


