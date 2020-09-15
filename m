Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9827B269C3E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 05:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgIODEH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Sep 2020 23:04:07 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41516 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726123AbgIODEF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 23:04:05 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 799807E95A5CC351DBCE;
        Tue, 15 Sep 2020 11:04:02 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:53 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] usbip: simplify the return expression of usbip_core_init()
Date:   Tue, 15 Sep 2020 11:26:31 +0800
Message-ID: <20200915032631.1772673-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/usb/usbip/usbip_common.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index e4b96674c405..4ce6c6a45eb1 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -755,13 +755,7 @@ EXPORT_SYMBOL_GPL(usbip_recv_xbuff);
 
 static int __init usbip_core_init(void)
 {
-	int ret;
-
-	ret = usbip_init_eh();
-	if (ret)
-		return ret;
-
-	return 0;
+	return usbip_init_eh();
 }
 
 static void __exit usbip_core_exit(void)
-- 
2.25.1

