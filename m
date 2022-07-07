Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D7B56A1A4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 13:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235645AbiGGL6y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 07:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbiGGL6i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 07:58:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700F65C9F2
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 04:56:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o9Q7J-0001WW-GI; Thu, 07 Jul 2022 13:56:21 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o9Q7E-004wbI-31; Thu, 07 Jul 2022 13:56:19 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o9Q7G-00BbIm-PC; Thu, 07 Jul 2022 13:56:18 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, w36195@motorola.com,
        kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: fix changing interface name via configfs
Date:   Thu,  7 Jul 2022 13:56:12 +0200
Message-Id: <20220707115612.2760569-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When setting the function name, it is always truncated by one char since
snprintf is always including the null-termination in the len parameter.
We use strscpy and fix the size setting to use len + 1 instead.

Fixes: 324e4f85070f ("usb: gadget: uvc: allow changing interface name via configfs")
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_configfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index e5a6b6e36b3dd8..4303a3283ba0a3 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2371,6 +2371,7 @@ static ssize_t f_uvc_opts_string_##cname##_store(struct config_item *item,\
 					  const char *page, size_t len)	\
 {									\
 	struct f_uvc_opts *opts = to_f_uvc_opts(item);			\
+	int size = min(sizeof(opts->aname), len + 1);			\
 	int ret = 0;							\
 									\
 	mutex_lock(&opts->lock);					\
@@ -2379,8 +2380,9 @@ static ssize_t f_uvc_opts_string_##cname##_store(struct config_item *item,\
 		goto end;						\
 	}								\
 									\
-	ret = snprintf(opts->aname, min(sizeof(opts->aname), len),	\
-			"%s", page);					\
+	ret = strscpy(opts->aname, page, size);				\
+	if (ret == -E2BIG)						\
+		ret = size - 1;						\
 									\
 end:									\
 	mutex_unlock(&opts->lock);					\
-- 
2.30.2

