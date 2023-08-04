Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9A376FD63
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 11:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbjHDJeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 05:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjHDJdw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 05:33:52 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBA349D8
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 02:33:48 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHL952BZLzrS7v;
        Fri,  4 Aug 2023 17:32:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:45 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <leoyang.li@nxp.com>, <b-liu@ti.com>,
        <valentina.manea.m@gmail.com>, <shuah@kernel.org>, <i@zenithal.me>,
        <stern@rowland.harvard.edu>, <u.kleine-koenig@pengutronix.de>,
        <aaro.koskinen@iki.fi>, <void0red@gmail.com>,
        <linux-usb@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 5/5] USB: usbip: Remove an unnecessary NULL value
Date:   Fri, 4 Aug 2023 17:32:53 +0800
Message-ID: <20230804093253.91647-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804093253.91647-1-ruanjinjie@huawei.com>
References: <20230804093253.91647-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/usbip/vudc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 2bc428f2e261..8e42839e6060 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -489,7 +489,7 @@ static void vudc_device_unusable(struct usbip_device *ud)
 
 struct vudc_device *alloc_vudc_device(int devid)
 {
-	struct vudc_device *udc_dev = NULL;
+	struct vudc_device *udc_dev;
 
 	udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
 	if (!udc_dev)
-- 
2.34.1

