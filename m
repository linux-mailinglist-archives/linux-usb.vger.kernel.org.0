Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A3276FD62
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 11:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjHDJeE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 05:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbjHDJdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 05:33:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26CC49F3
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 02:33:47 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHL941xGGzrS7f;
        Fri,  4 Aug 2023 17:32:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:44 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <leoyang.li@nxp.com>, <b-liu@ti.com>,
        <valentina.manea.m@gmail.com>, <shuah@kernel.org>, <i@zenithal.me>,
        <stern@rowland.harvard.edu>, <u.kleine-koenig@pengutronix.de>,
        <aaro.koskinen@iki.fi>, <void0red@gmail.com>,
        <linux-usb@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 4/5] usb: musb: Remove an unnecessary NULL value
Date:   Fri, 4 Aug 2023 17:32:52 +0800
Message-ID: <20230804093253.91647-5-ruanjinjie@huawei.com>
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
 drivers/usb/musb/musb_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 31c44325e828..051c6da7cf6d 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1130,7 +1130,7 @@ static int musb_gadget_disable(struct usb_ep *ep)
 struct usb_request *musb_alloc_request(struct usb_ep *ep, gfp_t gfp_flags)
 {
 	struct musb_ep		*musb_ep = to_musb_ep(ep);
-	struct musb_request	*request = NULL;
+	struct musb_request	*request;
 
 	request = kzalloc(sizeof *request, gfp_flags);
 	if (!request)
-- 
2.34.1

