Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F152476FD5F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 11:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjHDJd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 05:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjHDJdr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 05:33:47 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE464236
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 02:33:44 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHL8C0NySzVjwb;
        Fri,  4 Aug 2023 17:31:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:41 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <leoyang.li@nxp.com>, <b-liu@ti.com>,
        <valentina.manea.m@gmail.com>, <shuah@kernel.org>, <i@zenithal.me>,
        <stern@rowland.harvard.edu>, <u.kleine-koenig@pengutronix.de>,
        <aaro.koskinen@iki.fi>, <void0red@gmail.com>,
        <linux-usb@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/5] usb: gadget: udc: Remove unnecessary NULL values
Date:   Fri, 4 Aug 2023 17:32:49 +0800
Message-ID: <20230804093253.91647-2-ruanjinjie@huawei.com>
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c  | 4 ++--
 drivers/usb/gadget/udc/mv_udc_core.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 5265ca418cde..ee5705d336e3 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -671,7 +671,7 @@ static int fsl_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 fsl_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct fsl_req *req = NULL;
+	struct fsl_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 3473048a85f5..2a421f0ff931 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -665,7 +665,7 @@ static int  mv_u3d_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 mv_u3d_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct mv_u3d_req *req = NULL;
+	struct mv_u3d_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
@@ -1779,7 +1779,7 @@ static void mv_u3d_remove(struct platform_device *dev)
 
 static int mv_u3d_probe(struct platform_device *dev)
 {
-	struct mv_u3d *u3d = NULL;
+	struct mv_u3d *u3d;
 	struct mv_usb_platform_data *pdata = dev_get_platdata(&dev->dev);
 	int retval = 0;
 	struct resource *r;
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index 79db74e2040b..d888dcda2bc8 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -595,7 +595,7 @@ static int  mv_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 mv_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct mv_req *req = NULL;
+	struct mv_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
-- 
2.34.1

