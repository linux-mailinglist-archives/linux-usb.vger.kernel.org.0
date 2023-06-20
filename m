Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE25A73682C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbjFTJol (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbjFTJoh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ECD130
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 416AF610AB
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1D0C433C0;
        Tue, 20 Jun 2023 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254275;
        bh=jRoxHpEH6o3hriylQl2EejlWbKyFU4k4XcAWEeQP31c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XS98Sg7wZbPaFyd5rOQO2wITqjOgGEfhAuQPlg2y3jA3OGzU2yai1ILsxZLVHLiDd
         VFHkNsJKDqW3zq0TwWRZpfRXF5evjsma9P1s+M+XT+qQOyyb90QAq3Bbxp3nQ0MFI0
         rrJaUwiXoG4F1Xl02YgxVii8hb1shlP3qIYvo4VU=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/6] USB: mon: make mon_bin_class a static const structure
Date:   Tue, 20 Jun 2023 11:44:15 +0200
Message-ID: <20230620094412.508580-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620094412.508580-7-gregkh@linuxfoundation.org>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451; i=gregkh@linuxfoundation.org; h=from:subject; bh=Sg3k3k+cW+qn7rgFBlXisILddDj1GQWBllomMvxjyJI=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTS97reupWi4mVbWk5zqfeevyMTvMqSa3HpVdPTHzY/ qBnmkJJRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzk1FyG+W4Jn1kuMz6Pzdv5 M3v5cpvKDpNn6QwLLhz6eJ7P3FcvRGff6uYWa6dI05wvAA==
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
memory, move the mon_bin_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/mon/mon_bin.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index 952c56789258..9ca9305243fe 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -213,7 +213,10 @@ static unsigned char xfer_to_pipe[4] = {
 	PIPE_CONTROL, PIPE_ISOCHRONOUS, PIPE_BULK, PIPE_INTERRUPT
 };
 
-static struct class *mon_bin_class;
+static const struct class mon_bin_class = {
+	.name = "usbmon",
+};
+
 static dev_t mon_bin_dev0;
 static struct cdev mon_bin_cdev;
 
@@ -1360,7 +1363,7 @@ int mon_bin_add(struct mon_bus *mbus, const struct usb_bus *ubus)
 	if (minor >= MON_BIN_MAX_MINOR)
 		return 0;
 
-	dev = device_create(mon_bin_class, ubus ? ubus->controller : NULL,
+	dev = device_create(&mon_bin_class, ubus ? ubus->controller : NULL,
 			    MKDEV(MAJOR(mon_bin_dev0), minor), NULL,
 			    "usbmon%d", minor);
 	if (IS_ERR(dev))
@@ -1372,18 +1375,16 @@ int mon_bin_add(struct mon_bus *mbus, const struct usb_bus *ubus)
 
 void mon_bin_del(struct mon_bus *mbus)
 {
-	device_destroy(mon_bin_class, mbus->classdev->devt);
+	device_destroy(&mon_bin_class, mbus->classdev->devt);
 }
 
 int __init mon_bin_init(void)
 {
 	int rc;
 
-	mon_bin_class = class_create("usbmon");
-	if (IS_ERR(mon_bin_class)) {
-		rc = PTR_ERR(mon_bin_class);
+	rc = class_register(&mon_bin_class);
+	if (rc)
 		goto err_class;
-	}
 
 	rc = alloc_chrdev_region(&mon_bin_dev0, 0, MON_BIN_MAX_MINOR, "usbmon");
 	if (rc < 0)
@@ -1401,7 +1402,7 @@ int __init mon_bin_init(void)
 err_add:
 	unregister_chrdev_region(mon_bin_dev0, MON_BIN_MAX_MINOR);
 err_dev:
-	class_destroy(mon_bin_class);
+	class_unregister(&mon_bin_class);
 err_class:
 	return rc;
 }
@@ -1410,5 +1411,5 @@ void mon_bin_exit(void)
 {
 	cdev_del(&mon_bin_cdev);
 	unregister_chrdev_region(mon_bin_dev0, MON_BIN_MAX_MINOR);
-	class_destroy(mon_bin_class);
+	class_unregister(&mon_bin_class);
 }
-- 
2.41.0

