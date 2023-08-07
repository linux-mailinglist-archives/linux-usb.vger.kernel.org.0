Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9D17724A9
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 14:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjHGMra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 08:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjHGMr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 08:47:29 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42941BEF
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 05:47:08 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKGGL1yfzz1Z1WL;
        Mon,  7 Aug 2023 20:43:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 20:46:41 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <gregkh@linuxfoundation.org>, <hadess@hadess.net>,
        <benjamin.tissoires@redhat.com>, <herve.codina@bootlin.com>,
        <robh@kernel.org>, <mailhol.vincent@wanadoo.fr>,
        <linux-usb@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] USB: core: Switch to use kmemdup_nul() helper
Date:   Mon, 7 Aug 2023 20:46:10 +0800
Message-ID: <20230807124610.2283583-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use kmemdup_nul() helper instead of open-coding it to simplify the code.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/core/message.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 0d2bfc909019..5762fd04f0d5 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1029,10 +1029,9 @@ char *usb_cache_string(struct usb_device *udev, int index)
 	if (buf) {
 		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
 		if (len > 0) {
-			smallbuf = kmalloc(++len, GFP_NOIO);
+			smallbuf = kmemdup_nul(buf, len, GFP_NOIO);
 			if (!smallbuf)
 				return buf;
-			memcpy(smallbuf, buf, len);
 		}
 		kfree(buf);
 	}
-- 
2.34.1

