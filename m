Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D2D1BB699
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 08:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgD1GcK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 02:32:10 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41526 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726042AbgD1GcK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 02:32:10 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E2778C5C09A958D67CCF;
        Tue, 28 Apr 2020 14:32:06 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:32:00 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <yanaijie@huawei.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: udc: s3c2410_udc: remove NULL check in s3c2410_udc_nuke()
Date:   Tue, 28 Apr 2020 14:31:26 +0800
Message-ID: <20200428063126.25952-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No need to check the address of queue which is a member of struct
s3c2410_ep.

struct s3c2410_ep {
	struct list_head                queue;
	......
};

This fixes a coccicheck warning:

drivers/usb/gadget/udc/s3c2410_udc.c:255:1-3: ERROR: test of a
variable/field address

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index 0507a2ca0f55..80002d97b59d 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -251,10 +251,6 @@ static void s3c2410_udc_done(struct s3c2410_ep *ep,
 static void s3c2410_udc_nuke(struct s3c2410_udc *udc,
 		struct s3c2410_ep *ep, int status)
 {
-	/* Sanity check */
-	if (&ep->queue == NULL)
-		return;
-
 	while (!list_empty(&ep->queue)) {
 		struct s3c2410_request *req;
 		req = list_entry(ep->queue.next, struct s3c2410_request,
-- 
2.21.1

