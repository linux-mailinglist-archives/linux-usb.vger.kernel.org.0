Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865C073682B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbjFTJok (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjFTJod (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:44:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB79F1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:44:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 120CD60E9D
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 09:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CEBC433C8;
        Tue, 20 Jun 2023 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687254271;
        bh=ORDrTxe/QL9CwXo0rl8o78wjPYr164OQasmrja0hGqw=;
        h=From:To:Cc:Subject:Date:From;
        b=t/fyj2k7xcGqILxfuuLQ00s4HbSpkZHU8XU78K6WSu7vipQdBmcpo+BoeUAAVjY18
         DCJuGVJzI1VBQDW8cEUWV90i/8Gr0WnEzTs5prEWLw+bhbFl9VK2Dcm4iwuq6vYtpd
         rNWzoGMi1gfxRoWAANIoA0qGgviu7gipbpYPFqyM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/6] USB: roles: make role_class a static const structure
Date:   Tue, 20 Jun 2023 11:44:13 +0200
Message-ID: <20230620094412.508580-7-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=gregkh@linuxfoundation.org; h=from:subject; bh=w+0XbWy3w89qDNuFAd+9cVMaRXZ3bM6VgTJ4hWkOG4Q=; b=owGbwMvMwCRo6H6F97bub03G02pJDCkTS94+8C7fNs0rYq+7YP+VjcZCTxU/X/Hen2h3b+uVm L3C2vKsHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRbTIMc/gfbZvzs/PYHRbf gEX8Hk3FXpf9BBjmyp67arNp7ya9Ng+Poo3njuzbn33kLwA=
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
memory, move the role_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at load time.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/roles/class.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 0395bd5dbd3e..ae41578bd014 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -14,7 +14,9 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
-static struct class *role_class;
+static const struct class role_class = {
+	.name = "usb_role",
+};
 
 struct usb_role_switch {
 	struct device dev;
@@ -95,7 +97,7 @@ static void *usb_role_switch_match(const struct fwnode_handle *fwnode, const cha
 	if (id && !fwnode_property_present(fwnode, id))
 		return NULL;
 
-	dev = class_find_device_by_fwnode(role_class, fwnode);
+	dev = class_find_device_by_fwnode(&role_class, fwnode);
 
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
@@ -111,7 +113,7 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 		return NULL;
 	}
 
-	dev = class_find_device_by_fwnode(role_class, parent);
+	dev = class_find_device_by_fwnode(&role_class, parent);
 	fwnode_handle_put(parent);
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
@@ -191,7 +193,7 @@ usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
 	if (!fwnode)
 		return NULL;
 
-	dev = class_find_device_by_fwnode(role_class, fwnode);
+	dev = class_find_device_by_fwnode(&role_class, fwnode);
 	if (dev)
 		WARN_ON(!try_module_get(dev->parent->driver->owner));
 
@@ -338,7 +340,7 @@ usb_role_switch_register(struct device *parent,
 
 	sw->dev.parent = parent;
 	sw->dev.fwnode = desc->fwnode;
-	sw->dev.class = role_class;
+	sw->dev.class = &role_class;
 	sw->dev.type = &usb_role_dev_type;
 	dev_set_drvdata(&sw->dev, desc->driver_data);
 	dev_set_name(&sw->dev, "%s-role-switch",
@@ -392,14 +394,13 @@ EXPORT_SYMBOL_GPL(usb_role_switch_get_drvdata);
 
 static int __init usb_roles_init(void)
 {
-	role_class = class_create("usb_role");
-	return PTR_ERR_OR_ZERO(role_class);
+	return class_register(&role_class);
 }
 subsys_initcall(usb_roles_init);
 
 static void __exit usb_roles_exit(void)
 {
-	class_destroy(role_class);
+	class_unregister(&role_class);
 }
 module_exit(usb_roles_exit);
 
-- 
2.41.0

