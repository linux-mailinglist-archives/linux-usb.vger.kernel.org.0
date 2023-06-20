Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D88E736833
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjFTJpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjFTJol (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BC51AC
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB9C361199
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03444C433C9;
        Tue, 20 Jun 2023 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254279;
        bh=wGFyBsJ+k/1d5IwCojYRRNN0WrHJLopY5t08nnBhxpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AOIX1FhfYCqYMYCtXs/JAcR9oB3yKEIXQ6q5RTX0sF8zSVw2oyNNFtsGKnI3SUya4
         9PgB7f+NN8VoZn0AKkjSG3gL1NAWnwnrYQq+q5aSwGtmfh8bru6gmtzaF9jnxDkDVT
         3atM4YXH12m2+LwTwa28vPovVDvxnOrCiuKWbUYA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4/6] USB: gadget: f_printer: make usb_gadget_class a static const structure
Date:   Tue, 20 Jun 2023 11:44:16 +0200
Message-ID: <20230620094412.508580-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620094412.508580-7-gregkh@linuxfoundation.org>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070; i=gregkh@linuxfoundation.org; h=from:subject; bh=BCduruOLEGMu4mO3rQQDhiPJWai3nuz61jR3tcpLUAI=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTSz4EvZ3w5rHARnETgVQhmdqwPerhB3fut75b3/Llc sbFPzZpHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARq9kMCxaeNLDh/sz2uPr4 vfNzi94ss9i14QDDggk/d5y77H/qpFbbW/0lATuunLkeXggA
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
memory, move the usb_gadget_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_printer.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 28db3e336e7d..bf41a4fa7502 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -54,7 +54,10 @@
 #define DEFAULT_Q_LEN		10 /* same as legacy g_printer gadget */
 
 static int major, minors;
-static struct class *usb_gadget_class;
+static const struct class usb_gadget_class = {
+	.name = "usb_printer_gadget",
+};
+
 static DEFINE_IDA(printer_ida);
 static DEFINE_MUTEX(printer_ida_lock); /* protects access do printer_ida */
 
@@ -1120,7 +1123,7 @@ static int printer_func_bind(struct usb_configuration *c,
 
 	/* Setup the sysfs files for the printer gadget. */
 	devt = MKDEV(major, dev->minor);
-	pdev = device_create(usb_gadget_class, NULL, devt,
+	pdev = device_create(&usb_gadget_class, NULL, devt,
 				  NULL, "g_printer%d", dev->minor);
 	if (IS_ERR(pdev)) {
 		ERROR(dev, "Failed to create device: g_printer\n");
@@ -1143,7 +1146,7 @@ static int printer_func_bind(struct usb_configuration *c,
 	return 0;
 
 fail_cdev_add:
-	device_destroy(usb_gadget_class, devt);
+	device_destroy(&usb_gadget_class, devt);
 
 fail_rx_reqs:
 	while (!list_empty(&dev->rx_reqs)) {
@@ -1410,7 +1413,7 @@ static void printer_func_unbind(struct usb_configuration *c,
 
 	dev = func_to_printer(f);
 
-	device_destroy(usb_gadget_class, MKDEV(major, dev->minor));
+	device_destroy(&usb_gadget_class, MKDEV(major, dev->minor));
 
 	/* Remove Character Device */
 	cdev_del(&dev->printer_cdev);
@@ -1512,19 +1515,14 @@ static int gprinter_setup(int count)
 	int status;
 	dev_t devt;
 
-	usb_gadget_class = class_create("usb_printer_gadget");
-	if (IS_ERR(usb_gadget_class)) {
-		status = PTR_ERR(usb_gadget_class);
-		usb_gadget_class = NULL;
-		pr_err("unable to create usb_gadget class %d\n", status);
+	status = class_register(&usb_gadget_class);
+	if (status)
 		return status;
-	}
 
 	status = alloc_chrdev_region(&devt, 0, count, "USB printer gadget");
 	if (status) {
 		pr_err("alloc_chrdev_region %d\n", status);
-		class_destroy(usb_gadget_class);
-		usb_gadget_class = NULL;
+		class_unregister(&usb_gadget_class);
 		return status;
 	}
 
@@ -1540,6 +1538,5 @@ static void gprinter_cleanup(void)
 		unregister_chrdev_region(MKDEV(major, 0), minors);
 		major = minors = 0;
 	}
-	class_destroy(usb_gadget_class);
-	usb_gadget_class = NULL;
+	class_unregister(&usb_gadget_class);
 }
-- 
2.41.0

