Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3DF8C94B8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 01:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfJBXQf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 19:16:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42422 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbfJBXQ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 19:16:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id z12so521257pgp.9
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uG2nqozuwo9BwCrw+RwCa9b6zn63vZVGMltNLgbwu2E=;
        b=ZexQjMb8Ay+ScAsdYaEJSxUduZsElYFnqjVAM6juLiP6Fsox2O9LsZ49VUNprld79k
         yBP6K7pziYnfii5w8mzqklI5RKVYedOPVgM7xovliKQz1keF3nTrVi+GR+05FrApjMAs
         9Uw1lPGgfpOdXKbVbu3CLelwgo+zZwuc9wBlA/ui6pFplAY9dX3GuXPymrl2AwaR4Eax
         yCsfoIiPsy6pkcJRids9x6uVw9zrmTg1TPcEjoAfnz87xXY1xEVxHhTxLGUcb1Xjvv57
         v4j0b7HFPL7fag3I61PBGiitShfvcvYx9DeQrv5AMIzbI/SPFMAj5K86qHipeZ6E4wPi
         naMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uG2nqozuwo9BwCrw+RwCa9b6zn63vZVGMltNLgbwu2E=;
        b=B1ooZty1ZbAzDb1n2fGtFieVs7hiagdIx6rUCXUoRisobj/Fpkbw1nd1OAYPXuwqBK
         DCxAtOYFWRqj0SYwkNWmKpWaogKUa9LPkld1d3JMMO3j72xCupFJNzfmAUzfJEE4kw6T
         Dd8jBgSb8zVfp/SWOWCZGppczf7s3mCb0BGk/ceY3r0bOMfI1wfj8mfSNpQQIXvVza1I
         DgRt8XdyT0l3Km93GuWb6tQ0pbN7ty4ff7e1JggWYYbf3iQ4EW62xce3TGonInqBiv1u
         UJg2dKixKIAaKLDdN7x4Hc5AChHKcYXpETzwGRsTAKbdSUNgSbVQde9LOVrOWBnKYBLk
         pauA==
X-Gm-Message-State: APjAAAWKUQ6ARvAHD8v17KPIknX17XP49Y1+BxkiEtkSa8DjyYw/edx7
        yoLoiB2jyBiy1To9mvJSZfVc1g==
X-Google-Smtp-Source: APXvYqxu2u/IQP/LPwB0sAmV4cVg8e5OqNfignEooLRI2THErLoK7DUvR6SLzQPli3BYyhMwbmSigA==
X-Received: by 2002:a63:225f:: with SMTP id t31mr6320256pgm.50.1570058185308;
        Wed, 02 Oct 2019 16:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l7sm288791pjy.12.2019.10.02.16.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 16:16:24 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date:   Wed,  2 Oct 2019 23:16:16 +0000
Message-Id: <20191002231617.3670-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002231617.3670-1-john.stultz@linaro.org>
References: <20191002231617.3670-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds notifier for drivers want to be informed of the usb role
switch.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/roles/class.c | 35 ++++++++++++++++++++++++++++++++++-
 include/linux/usb/role.h  | 16 ++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 94b4e7db2b94..418e762d5d72 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -20,6 +20,7 @@ struct usb_role_switch {
 	struct device dev;
 	struct mutex lock; /* device lock*/
 	enum usb_role role;
+	struct blocking_notifier_head nh;
 
 	/* From descriptor */
 	struct device *usb2_port;
@@ -49,8 +50,10 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	mutex_lock(&sw->lock);
 
 	ret = sw->set(sw->dev.parent, role);
-	if (!ret)
+	if (!ret) {
 		sw->role = role;
+		blocking_notifier_call_chain(&sw->nh, role, NULL);
+	}
 
 	mutex_unlock(&sw->lock);
 
@@ -58,6 +61,35 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
 
+int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+				      struct notifier_block *nb)
+{
+	int ret = blocking_notifier_chain_register(&sw->nh, nb);
+	enum usb_role role;
+
+	if (ret)
+		return ret;
+
+	/* Initialize the notifier that was just registered */
+	mutex_lock(&sw->lock);
+	if (sw->get)
+		role = sw->get(sw->dev.parent);
+	else
+		role = sw->role;
+	blocking_notifier_call_chain(&sw->nh, role, NULL);
+	mutex_unlock(&sw->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
+
+int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&sw->nh, nb);
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_unregister_notifier);
+
 /**
  * usb_role_switch_get_role - Get the USB role for a switch
  * @sw: USB role switch
@@ -296,6 +328,7 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&sw->lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
 
 	sw->allow_userspace_control = desc->allow_userspace_control;
 	sw->usb2_port = desc->usb2_port;
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index 2d77f97df72d..8dbf7940b7da 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -54,6 +54,10 @@ struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc);
 void usb_role_switch_unregister(struct usb_role_switch *sw);
+int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+				      struct notifier_block *nb);
+int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					struct notifier_block *nb);
 #else
 static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
 		enum usb_role role)
@@ -87,6 +91,18 @@ usb_role_switch_register(struct device *parent,
 }
 
 static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
+
+static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+					     struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+
+static int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					       struct notifier_block *nb)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.17.1

