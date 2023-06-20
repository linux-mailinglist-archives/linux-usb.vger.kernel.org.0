Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C53736835
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjFTJpP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjFTJov (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EAE185
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51DF66108B
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8ECC43395;
        Tue, 20 Jun 2023 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254286;
        bh=MIaYJpfW8Nm0eXsiV4+DhH7dVBgMDQmKZrQZ1KcdzP4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wkcZLekGnjDGVJkrxopxl+uDs9FMHWrP8BR+6iEfBasXTXD6SeTi1C85YZYg5/Mc2
         a9RfPOpr/+lB3bnlAjqbD6ID7lx+ocij/fLIlULG9LROIpvFwhkWljj3uIIUmsqfU5
         Ol14jXrsP2jyzMDvHeqRt8HsSOkXAFTNau5mbWa4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6/6] USB: file.c: make usb class a static const structure
Date:   Tue, 20 Jun 2023 11:44:18 +0200
Message-ID: <20230620094412.508580-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620094412.508580-7-gregkh@linuxfoundation.org>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852; i=gregkh@linuxfoundation.org; h=from:subject; bh=HYOn9kY0qERDPI3rrYa0VYrvwbfMFtmWMRiKx7UCy0s=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTSz6U+dtYv9rasfZ4e/vKO9sCmyZOnPVRRHnWZzkRz V2BPHKqHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARkU6G+eWGdywbX+xWevrW OfxOssgnczaWowzzgwq7Psodyz69bLbCXYXP94PMM6USAA==
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
memory, remove the class field of the usb_class structure and
create the usbmisc_class static class structure declared at build time
which places it into read-only memory, instead of having it to be
dynamically allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/file.c b/drivers/usb/core/file.c
index c4ed3310e069..0e16a9c048dd 100644
--- a/drivers/usb/core/file.c
+++ b/drivers/usb/core/file.c
@@ -59,7 +59,6 @@ static const struct file_operations usb_fops = {
 
 static struct usb_class {
 	struct kref kref;
-	struct class *class;
 } *usb_class;
 
 static char *usb_devnode(const struct device *dev, umode_t *mode)
@@ -72,6 +71,11 @@ static char *usb_devnode(const struct device *dev, umode_t *mode)
 	return drv->devnode(dev, mode);
 }
 
+static struct class usbmisc_class = {
+	.name		= "usbmisc",
+	.devnode	= usb_devnode,
+};
+
 static int init_usb_class(void)
 {
 	int result = 0;
@@ -88,15 +92,12 @@ static int init_usb_class(void)
 	}
 
 	kref_init(&usb_class->kref);
-	usb_class->class = class_create("usbmisc");
-	if (IS_ERR(usb_class->class)) {
-		result = PTR_ERR(usb_class->class);
-		printk(KERN_ERR "class_create failed for usb devices\n");
+	result = class_register(&usbmisc_class);
+	if (result) {
 		kfree(usb_class);
 		usb_class = NULL;
 		goto exit;
 	}
-	usb_class->class->devnode = usb_devnode;
 
 exit:
 	return result;
@@ -105,7 +106,7 @@ static int init_usb_class(void)
 static void release_usb_class(struct kref *kref)
 {
 	/* Ok, we cheat as we know we only have one usb_class */
-	class_destroy(usb_class->class);
+	class_unregister(&usbmisc_class);
 	kfree(usb_class);
 	usb_class = NULL;
 }
@@ -200,7 +201,7 @@ int usb_register_dev(struct usb_interface *intf,
 
 	/* create a usb class device for this usb interface */
 	snprintf(name, sizeof(name), class_driver->name, minor - minor_base);
-	intf->usb_dev = device_create(usb_class->class, &intf->dev,
+	intf->usb_dev = device_create(&usbmisc_class, &intf->dev,
 				      MKDEV(USB_MAJOR, minor), class_driver,
 				      "%s", kbasename(name));
 	if (IS_ERR(intf->usb_dev)) {
@@ -234,7 +235,7 @@ void usb_deregister_dev(struct usb_interface *intf,
 		return;
 
 	dev_dbg(&intf->dev, "removing %d minor\n", intf->minor);
-	device_destroy(usb_class->class, MKDEV(USB_MAJOR, intf->minor));
+	device_destroy(&usbmisc_class, MKDEV(USB_MAJOR, intf->minor));
 
 	down_write(&minor_rwsem);
 	usb_minors[intf->minor] = NULL;
-- 
2.41.0

