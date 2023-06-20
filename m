Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E677C73682A
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbjFTJoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjFTJod (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0674C128
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8ED62610AB
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B2BC433C0;
        Tue, 20 Jun 2023 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254268;
        bh=WrHiGQ4G0nlo3itO0qX44y0ndggKzbSUkqbQicIe6KE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z/KOcg2Ygyj5M5a+oWSWA0IvCX4THmYp72qvuRIwzW1p+qi8C7pfZfa5P+ZjbUlLs
         I0Kv2Lf0P7TCYLnP0m0xxmEU9ToX8t4Qnk3H8AVyTFp83rJI9mRN1fmVoj0HUwKOmB
         eDFqy0349s0QvGfENaDO3Nf9wF9xAXgV40BTwWss=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] USB: gadget: udc: core: make udc_class a static const structure
Date:   Tue, 20 Jun 2023 11:44:14 +0200
Message-ID: <20230620094412.508580-8-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620094412.508580-7-gregkh@linuxfoundation.org>
References: <20230620094412.508580-7-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414; i=gregkh@linuxfoundation.org; h=from:subject; bh=hlwpUa20fqzH5fJa2phVL0sHorL3wR0Q/5byiVVdq+U=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTS94/SD+e1ag058Fd/SLZNQeaFdUjO+Y9vOGzdm9zZ O3ylf3zOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiBeYM88ykDs7SWsz6zaVS 2O2+t+BTVZ9LaxgW3DDg2tHEGMzrbb/DOiCqP587OpkFAA==
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
memory, move the udc_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 52e6d2e84e35..b2bb6336902f 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -50,7 +50,7 @@ struct usb_udc {
 	bool				started;
 };
 
-static struct class *udc_class;
+static const struct class udc_class;
 static LIST_HEAD(udc_list);
 
 /* Protects udc_list, udc->driver, driver->is_bound, and related calls */
@@ -1312,7 +1312,7 @@ int usb_add_gadget(struct usb_gadget *gadget)
 
 	device_initialize(&udc->dev);
 	udc->dev.release = usb_udc_release;
-	udc->dev.class = udc_class;
+	udc->dev.class = &udc_class;
 	udc->dev.groups = usb_udc_attr_groups;
 	udc->dev.parent = gadget->dev.parent;
 	ret = dev_set_name(&udc->dev, "%s",
@@ -1774,6 +1774,11 @@ static int usb_udc_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static const struct class udc_class = {
+	.name		= "udc",
+	.dev_uevent	= usb_udc_uevent,
+};
+
 static const struct bus_type gadget_bus_type = {
 	.name = "gadget",
 	.probe = gadget_bind_driver,
@@ -1785,18 +1790,13 @@ static int __init usb_udc_init(void)
 {
 	int rc;
 
-	udc_class = class_create("udc");
-	if (IS_ERR(udc_class)) {
-		pr_err("failed to create udc class --> %ld\n",
-				PTR_ERR(udc_class));
-		return PTR_ERR(udc_class);
-	}
-
-	udc_class->dev_uevent = usb_udc_uevent;
+	rc = class_register(&udc_class);
+	if (rc)
+		return rc;
 
 	rc = bus_register(&gadget_bus_type);
 	if (rc)
-		class_destroy(udc_class);
+		class_unregister(&udc_class);
 	return rc;
 }
 subsys_initcall(usb_udc_init);
@@ -1804,7 +1804,7 @@ subsys_initcall(usb_udc_init);
 static void __exit usb_udc_exit(void)
 {
 	bus_unregister(&gadget_bus_type);
-	class_destroy(udc_class);
+	class_unregister(&udc_class);
 }
 module_exit(usb_udc_exit);
 
-- 
2.41.0

