Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1EE788359
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 11:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjHYJQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 05:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244231AbjHYJQU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 05:16:20 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24972115
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 02:15:59 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXDlf46PYzfbfq;
        Fri, 25 Aug 2023 17:13:50 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 17:15:22 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <yuehaibing@huawei.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -next] USB: c67x00: Remove unused declaration c67x00_hcd_msg_received()
Date:   Fri, 25 Aug 2023 17:15:18 +0800
Message-ID: <20230825091518.22180-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")
declared but never implemented this.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/usb/c67x00/c67x00-hcd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/c67x00/c67x00-hcd.h b/drivers/usb/c67x00/c67x00-hcd.h
index 6332a6b5dce6..6ba5adced61c 100644
--- a/drivers/usb/c67x00/c67x00-hcd.h
+++ b/drivers/usb/c67x00/c67x00-hcd.h
@@ -109,7 +109,6 @@ int c67x00_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status);
 void c67x00_endpoint_disable(struct usb_hcd *hcd,
 			     struct usb_host_endpoint *ep);
 
-void c67x00_hcd_msg_received(struct c67x00_sie *sie, u16 msg);
 void c67x00_sched_kick(struct c67x00_hcd *c67x00);
 int c67x00_sched_start_scheduler(struct c67x00_hcd *c67x00);
 void c67x00_sched_stop_scheduler(struct c67x00_hcd *c67x00);
-- 
2.34.1

