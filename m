Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEC06410D7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Dec 2022 23:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbiLBWsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 17:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiLBWsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 17:48:06 -0500
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A18DA06CF
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 14:48:04 -0800 (PST)
Received: by mail-io1-xd49.google.com with SMTP id l21-20020a5d9315000000b006df7697880aso5849238ion.23
        for <linux-usb@vger.kernel.org>; Fri, 02 Dec 2022 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0T1pgiMYpCvdig9Y/8aobVm5Xu54pAwpfqLNShdHMY=;
        b=Z7v+z+IwVUZK/AlbMeBHs81PzaHdZaOivRiZ9GgiMwNfs2wwPL53ecIB4AEN/DjARc
         8tJhA4wzXXBNUOnMja42hDHidI3OXv/rkAVJC6CrchNrRCFL38S+hoX+YIKXezmDseTD
         lOIY0w95Fa1nChba2iZIflZMF8qjsDWr9FhimNVGAz0qAGE1K1hgefhtCMjfwv1LX+HN
         EvNBWmVa7A5+EOjVkDc+XIZKhJ6SdaUPlW8ZLfYK3uWI9Rzl3nkzMNag2pxB94BZuPnm
         VVB/P5stQ+dVTBXS1bZsSaMrnnsoJfstqIldT6ruSdRurJjx6rP56RZTTQhBBfG1qVXi
         WZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0T1pgiMYpCvdig9Y/8aobVm5Xu54pAwpfqLNShdHMY=;
        b=JBLfPWxw1e+M6zd3kfqbCkMnrYcR4QDn44QkbmZC6D7qiDy9xrt/mvIjZn0R6cNlPX
         gMLICfw98iPEGC6JNoorfAQWljFn9cGR8KYWtAV92UoF7z/MfL2wJWH5j1MNDbYcl29i
         0kj6rwzERVwlYgCAWpDrP3dMNYrqIgNeQRw2CQPejm75I+rLvgQcSSvzZiM7XyRcSNoT
         Hea1Wn1lYJesd+6BBBt93E8ho3tsiY7h5FmNoImspspY/oa1ax4IQesVlH1AgJ7NsXmy
         eQ7+WDVdYM6xLAdp/F3t7uBo6eTt7h4edEfuKmVeZiN5YMuA9I8KLudmrrYLCCwphr5K
         XpzQ==
X-Gm-Message-State: ANoB5pngqUJ2pf1lE7hzqudYdi+3+lj7C7kauK5yuZeDsgyFB7mS7oY0
        8u6SFWsKKpXn2dEZy8p7en5qyBoYcsIQpXw=
X-Google-Smtp-Source: AA0mqf454uOaBRdpMH7tQImIKU8IeKBYSabjea74gyZ46dDF++UaofNevPRXdyplXUheey6pXGyw7mFiDxiEwU4=
X-Received: from allenwebb.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:12e8])
 (user=allenwebb job=sendgmr) by 2002:a6b:f414:0:b0:6d1:88ee:a64f with SMTP id
 i20-20020a6bf414000000b006d188eea64fmr25213041iog.61.1670021283902; Fri, 02
 Dec 2022 14:48:03 -0800 (PST)
Date:   Fri,  2 Dec 2022 16:47:42 -0600
In-Reply-To: <20221202224744.1447448-1-allenwebb@google.com>
Mime-Version: 1.0
References: <20221202224540.1446952-1-allenwebb@google.com> <20221202224744.1447448-1-allenwebb@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221202224744.1447448-3-allenwebb@google.com>
Subject: [PATCH v6 3/5] Implement modalias sysfs attribute for modules
From:   Allen Webb <allenwebb@google.com>
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Allen Webb <allenwebb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the modalias attribute is read, invoke a subsystem-specific
callback for each driver registered by the specific module.

The intent of the new modalias attribute is to expose the
match-id-based modaliases to userspace for builtin and loaded kernel
modules.

Signed-off-by: Allen Webb <allenwebb@google.com>
---
 include/linux/device/bus.h |  7 +++++
 kernel/module/sysfs.c      | 57 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 82a5583437099..cce0bedec63d9 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -61,6 +61,10 @@ struct fwnode_handle;
  *			this bus.
  * @dma_cleanup:	Called to cleanup DMA configuration on a device on
  *			this bus.
+ * @drv_to_modalias:    Called to convert the matching IDs in a
+ *                      struct device_driver to their corresponding modaliases.
+ *                      Note that the struct device_driver is expected to belong
+ *                      to this bus.
  * @pm:		Power management operations of this bus, callback the specific
  *		device driver's pm-ops.
  * @iommu_ops:  IOMMU specific operations for this bus, used to attach IOMMU
@@ -107,6 +111,9 @@ struct bus_type {
 	int (*dma_configure)(struct device *dev);
 	void (*dma_cleanup)(struct device *dev);
 
+	ssize_t (*drv_to_modalias)(struct device_driver *drv, char *buf,
+				   size_t count);
+
 	const struct dev_pm_ops *pm;
 
 	const struct iommu_ops *iommu_ops;
diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
index 8dafec7455fbe..651c677c4ab96 100644
--- a/kernel/module/sysfs.c
+++ b/kernel/module/sysfs.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2008 Rusty Russell
  */
 
+#include <linux/device/bus.h>
+#include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/fs.h>
@@ -240,11 +242,64 @@ static inline void add_notes_attrs(struct module *mod, const struct load_info *i
 static inline void remove_notes_attrs(struct module *mod) { }
 #endif /* CONFIG_KALLSYMS */
 
+/* Track of the buffer and module identity in callbacks when walking the list of
+ * drivers for each bus.
+ */
+struct modalias_bus_print_state {
+	struct module_kobject *mk;
+	char *buf;
+	size_t count;
+	ssize_t len;
+};
+
+static int print_modalias_for_drv(struct device_driver *drv, void *p)
+{
+	struct modalias_bus_print_state *s = p;
+	struct module_kobject *mk = s->mk;
+	ssize_t len;
+	/* Skip drivers that do not match this module. */
+	if (mk->mod) {
+		if (mk->mod != drv->owner)
+			return 0;
+	} else if (!mk->kobj.name || !drv->mod_name ||
+		   strcmp(mk->kobj.name, drv->mod_name))
+		return 0;
+
+	if (drv->bus && drv->bus->drv_to_modalias) {
+		len = drv->bus->drv_to_modalias(drv, s->buf + s->len,
+						s->count - s->len);
+		if (len < 0)
+			return len;
+		s->len += len;
+	}
+	return 0;
+}
+
+static int print_modalias_for_bus(struct bus_type *type, void *p)
+{
+	return bus_for_each_drv(type, NULL, p, print_modalias_for_drv);
+}
+
 static ssize_t module_modalias_read(struct file *filp, struct kobject *kobj,
 				    struct bin_attribute *bin_attr,
 				    char *buf, loff_t pos, size_t count)
 {
-	return 0;
+	struct module_kobject *mk = container_of(kobj, struct module_kobject,
+						 kobj);
+	struct modalias_bus_print_state state = {mk, buf, count, 0};
+	int error = 0;
+
+	if (pos != 0)
+		return -EINVAL;
+
+	error = bus_for_each(&state, print_modalias_for_bus);
+	if (error)
+		return error;
+
+	/*
+	 * The caller checked the pos and count against our size.
+	 */
+	return state.len;
 }
 
 /* Used in kernel/params.c for builtin modules.
-- 
2.37.3

