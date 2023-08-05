Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58298770DCD
	for <lists+linux-usb@lfdr.de>; Sat,  5 Aug 2023 06:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjHEE5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Aug 2023 00:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHEE5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Aug 2023 00:57:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2A44ED3
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 21:57:13 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHqwm1W4QzGpsl;
        Sat,  5 Aug 2023 12:53:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 5 Aug
 2023 12:57:10 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-usb@vger.kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] USB: usbip: Remove an unnecessary goto
Date:   Sat, 5 Aug 2023 12:56:30 +0800
Message-ID: <20230805045631.1858638-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When udc_dev = NULL, it is not necessary to goto out to return, just
return NULL directly. And the out goto label can be removed.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/usbip/vudc_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 2bc428f2e261..bed21b83de68 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -493,7 +493,7 @@ struct vudc_device *alloc_vudc_device(int devid)
 
 	udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
 	if (!udc_dev)
-		goto out;
+		return NULL;
 
 	INIT_LIST_HEAD(&udc_dev->dev_entry);
 
@@ -503,7 +503,6 @@ struct vudc_device *alloc_vudc_device(int devid)
 		udc_dev = NULL;
 	}
 
-out:
 	return udc_dev;
 }
 
-- 
2.34.1

