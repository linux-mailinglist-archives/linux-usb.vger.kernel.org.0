Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285BE1BBFB6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 15:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgD1Ni1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 09:38:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46552 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726846AbgD1Ni1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 09:38:27 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 840A11DD02B8EA81E182;
        Tue, 28 Apr 2020 21:38:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Apr 2020 21:38:18 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        zhengbin <zhengbin13@huawei.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: mass_storage: use module_usb_composite_driver to simplify the code
Date:   Tue, 28 Apr 2020 13:39:34 +0000
Message-ID: <20200428133934.73637-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

module_usb_composite_driver() makes the code simpler by
eliminating boilerplate code.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/legacy/mass_storage.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index f18f77584fc2..9ed22c5fb7fe 100644
--- a/drivers/usb/gadget/legacy/mass_storage.c
+++ b/drivers/usb/gadget/legacy/mass_storage.c
@@ -229,18 +229,8 @@ static struct usb_composite_driver msg_driver = {
 	.unbind		= msg_unbind,
 };
 
+module_usb_composite_driver(msg_driver);
+
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Michal Nazarewicz");
 MODULE_LICENSE("GPL");
-
-static int __init msg_init(void)
-{
-	return usb_composite_probe(&msg_driver);
-}
-module_init(msg_init);
-
-static void __exit msg_cleanup(void)
-{
-	usb_composite_unregister(&msg_driver);
-}
-module_exit(msg_cleanup);





