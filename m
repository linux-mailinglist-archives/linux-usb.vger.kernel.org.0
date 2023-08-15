Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8022777C8D1
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 09:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbjHOHrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 03:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbjHOHrK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 03:47:10 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6261737
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 00:47:08 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQ3Fp3dkKzVk2s;
        Tue, 15 Aug 2023 15:45:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 15:47:06 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <lizetao1@huawei.com>, <linux-usb@vger.kernel.org>
Subject: [PATCH -next] usb: core: Use module_led_trigger macro to simplify the code
Date:   Tue, 15 Aug 2023 15:46:48 +0800
Message-ID: <20230815074648.1015175-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the module_led_trigger macro to simplify the code, which is the
same as declaring with module_init() and module_exit().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/usb/core/ledtrig-usbport.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index ba371a24ff78..85c999f71ad7 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -350,18 +350,7 @@ static struct led_trigger usbport_led_trigger = {
 	.deactivate = usbport_trig_deactivate,
 };
 
-static int __init usbport_trig_init(void)
-{
-	return led_trigger_register(&usbport_led_trigger);
-}
-
-static void __exit usbport_trig_exit(void)
-{
-	led_trigger_unregister(&usbport_led_trigger);
-}
-
-module_init(usbport_trig_init);
-module_exit(usbport_trig_exit);
+module_led_trigger(usbport_led_trigger);
 
 MODULE_AUTHOR("Rafał Miłecki <rafal@milecki.pl>");
 MODULE_DESCRIPTION("USB port trigger");
-- 
2.34.1

