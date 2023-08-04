Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5D776FD60
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 11:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjHDJd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 05:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjHDJdr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 05:33:47 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C47049EE
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 02:33:45 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHL766VQZz1Z1Sc;
        Fri,  4 Aug 2023 17:30:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:43 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <leoyang.li@nxp.com>, <b-liu@ti.com>,
        <valentina.manea.m@gmail.com>, <shuah@kernel.org>, <i@zenithal.me>,
        <stern@rowland.harvard.edu>, <u.kleine-koenig@pengutronix.de>,
        <aaro.koskinen@iki.fi>, <void0red@gmail.com>,
        <linux-usb@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/5] USB: misc: Remove unnecessary NULL values
Date:   Fri, 4 Aug 2023 17:32:50 +0800
Message-ID: <20230804093253.91647-3-ruanjinjie@huawei.com>
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
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/usb/misc/cypress_cy7c63.c | 2 +-
 drivers/usb/misc/cytherm.c        | 2 +-
 drivers/usb/misc/usbsevseg.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 14faec51d7a5..cecd7693b741 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -203,7 +203,7 @@ ATTRIBUTE_GROUPS(cypress);
 static int cypress_probe(struct usb_interface *interface,
 			 const struct usb_device_id *id)
 {
-	struct cypress *dev = NULL;
+	struct cypress *dev;
 	int retval = -ENOMEM;
 
 	/* allocate memory for our device state and initialize it */
diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 3e3802aaefa3..918833b471ea 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -304,7 +304,7 @@ static int cytherm_probe(struct usb_interface *interface,
 			 const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct usb_cytherm *dev = NULL;
+	struct usb_cytherm *dev;
 	int retval = -ENOMEM;
 
 	dev = kzalloc (sizeof(struct usb_cytherm), GFP_KERNEL);
diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index c3114d9bd128..546deff754ba 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -305,7 +305,7 @@ static int sevseg_probe(struct usb_interface *interface,
 	const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct usb_sevsegdev *mydev = NULL;
+	struct usb_sevsegdev *mydev;
 	int rc = -ENOMEM;
 
 	mydev = kzalloc(sizeof(struct usb_sevsegdev), GFP_KERNEL);
-- 
2.34.1

