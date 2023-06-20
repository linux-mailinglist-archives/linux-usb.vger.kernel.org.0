Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2273736834
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjFTJpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjFTJoq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDD51B4
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE656108B
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D360C433C0;
        Tue, 20 Jun 2023 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254283;
        bh=bSDPLXuq92Cy/rayrdnqwJo1rXplrk1L9zzyVN0Ym2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qT1HCqjZch/xq4tDAX2FjR8kXe6rkKMNX/Zh4VhbljZ7/k+n5snSQyRJcgtORrj+Q
         +cCTYG2OgYSkX9JeyrlPwHwXK1oF46B2CD5zH3GJIJcWMZXU8mz76uLMWeTePxDYq6
         MCgYH2nLY+97NXQS2S3ZCkF4a5rj/b6oITNFWOxA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/6] USB: gadget: f_hid: make hidg_class a static const structure
Date:   Tue, 20 Jun 2023 11:44:17 +0200
Message-ID: <20230620094412.508580-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620094412.508580-7-gregkh@linuxfoundation.org>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=gregkh@linuxfoundation.org; h=from:subject; bh=5tKJZq9tYYar6vmT8FNxCJtg0X+isdG6KEzWo/U4Abo=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTSz4UXdU4u8no5amtGQoGrZMORTKapP1lb5x7odLad +IO0UN9HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRPc8Y5tm16ZXmvw98duiF h/Ch3o2WoXnaTgzzk1ZHMr6aZ5ad9y+zTOolr9fjmvJqAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ivan Orlov <ivan.orlov0322@gmail.com>

Now that the driver core allows for struct class to be in read-only
memory, move the hidg_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_hid.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 9f6b10134121..ea85e2c701a1 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -23,7 +23,11 @@
 #define HIDG_MINORS	4
 
 static int major, minors;
-static struct class *hidg_class;
+
+static const struct class hidg_class = {
+	.name = "hidg",
+};
+
 static DEFINE_IDA(hidg_ida);
 static DEFINE_MUTEX(hidg_ida_lock); /* protects access to hidg_ida */
 
@@ -1272,7 +1276,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 
 	device_initialize(&hidg->dev);
 	hidg->dev.release = hidg_release;
-	hidg->dev.class = hidg_class;
+	hidg->dev.class = &hidg_class;
 	hidg->dev.devt = MKDEV(major, opts->minor);
 	ret = dev_set_name(&hidg->dev, "hidg%d", opts->minor);
 	if (ret)
@@ -1325,17 +1329,13 @@ int ghid_setup(struct usb_gadget *g, int count)
 	int status;
 	dev_t dev;
 
-	hidg_class = class_create("hidg");
-	if (IS_ERR(hidg_class)) {
-		status = PTR_ERR(hidg_class);
-		hidg_class = NULL;
+	status = class_register(&hidg_class);
+	if (status)
 		return status;
-	}
 
 	status = alloc_chrdev_region(&dev, 0, count, "hidg");
 	if (status) {
-		class_destroy(hidg_class);
-		hidg_class = NULL;
+		class_unregister(&hidg_class);
 		return status;
 	}
 
@@ -1352,6 +1352,5 @@ void ghid_cleanup(void)
 		major = minors = 0;
 	}
 
-	class_destroy(hidg_class);
-	hidg_class = NULL;
+	class_unregister(&hidg_class);
 }
-- 
2.41.0

