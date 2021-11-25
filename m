Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2197E45D0E3
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 00:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345029AbhKXXO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 18:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243588AbhKXXO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 18:14:59 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD14C061574
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 15:11:48 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so6247327pjb.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TE1Z/Xi+OjPPDx97RwQJKa7AShoD/XLwj4AePbmASlU=;
        b=F/XCG8n1Soe5ZK62nwbIDpsjeqSHRKrNr9+ZOSH3olHwakVVyfgjNlwEzZ9dz6pL6D
         mf1pUbV0feoeL66wRtyKbdbyq+5cju3VW2bfzLX19BlF8BtEHWp1Efup6DZq5c13/yCD
         Qqz/njkA0f53UNVXVjvIF0C3UH1Y1nMSAGUgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TE1Z/Xi+OjPPDx97RwQJKa7AShoD/XLwj4AePbmASlU=;
        b=mo4ZMFauoZS+D1quFbZJIppiPyPi5k/LGqm3EPz+wQhEgYtAlGr0q72xY8FmbBF7Zt
         cCiaNqtOB9o6VDajm+/KYfeENk/ZYk+TWzfw3bUKDlrlPECIyWcv4wb5n3oMED5PBKOa
         u6tfLvehZA0Xih9olp0FgLKi3jxV2THkwxN46x1kwlFLFtRCBAtF8+TjSwLuQjl++H+x
         WHrBRn5CSUaew8XDTjpFbl8zaSfjiFuVtZNdkmSe9kCPq9a9tQwpIkJOAu+B4/MDBSgd
         YE64pTJD0M33UHk5bsJaKQRCKarMlLOtHn+jbojaDrgcJ6Ucn5rVJJ4wBn3xeEofLbel
         UpHg==
X-Gm-Message-State: AOAM532BlgkjGDgt8Pgr091HizQ7Toak5/PPbV6Uc1yyCgLFHDTIOT4/
        P4oxLX0T/1Kj7fetN40g71AehQ==
X-Google-Smtp-Source: ABdhPJxVRfQ1dfuT+6moICN/yNXN7KqyJjWOBBOC/GNduuV7aRk56mOyLufWL0e5A6GeRsI3Z4tHEA==
X-Received: by 2002:a17:90b:3a89:: with SMTP id om9mr1024253pjb.29.1637795508361;
        Wed, 24 Nov 2021 15:11:48 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:6bc9:896a:9df2:5d61])
        by smtp.gmail.com with ESMTPSA id nn15sm5783296pjb.11.2021.11.24.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:11:48 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     wonchung@google.com, bleung@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] usb: typec: Add port registration notifier
Date:   Wed, 24 Nov 2021 15:10:08 -0800
Message-Id: <20211124231028.696982-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211124231028.696982-1-pmalani@chromium.org>
References: <20211124231028.696982-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce a blocking notifier to be called when a new Type C port gets
registered with the connector class framework.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
NOTE: typec_port_registration_register_notify() is a bit long,
so please let me know if you have any shorter suggestions for naming
this function.

 drivers/usb/typec/class.c | 30 ++++++++++++++++++++++++++++++
 include/linux/usb/typec.h | 13 +++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index aeef453aa658..14b82109b0f5 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -16,6 +16,8 @@
 #include "bus.h"
 #include "class.h"
 
+static BLOCKING_NOTIFIER_HEAD(typec_port_registration_notifier);
+
 static DEFINE_IDA(typec_index_ida);
 
 struct class typec_class = {
@@ -1979,6 +1981,32 @@ void typec_port_register_altmodes(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
 
+/**
+ *  typec_port_registration_register_notify - Register a notifier for Type C port registration.
+ *  @nb: notifier block to signal
+ *
+ *  This function allows callers to get a notification when a Type C port is registered with
+ *  the connector class.
+ */
+int typec_port_registration_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_port_registration_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(typec_port_registration_register_notify);
+
+/**
+ *  typec_port_registration_unregister_notify - Unregister a notifier for Type C port registration.
+ *  @nb: notifier block to unregister
+ *
+ *  This function allows callers to unregister notifiers which were previously registered using
+ *  typec_port_registration_register_notify().
+ */
+int typec_port_registration_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_port_registration_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(typec_port_registration_unregister_notify);
+
 /**
  * typec_register_port - Register a USB Type-C Port
  * @parent: Parent device
@@ -2086,6 +2114,8 @@ struct typec_port *typec_register_port(struct device *parent,
 	if (ret)
 		dev_warn(&port->dev, "failed to create symlinks (%d)\n", ret);
 
+	blocking_notifier_call_chain(&typec_port_registration_notifier, 0, port);
+
 	return port;
 }
 EXPORT_SYMBOL_GPL(typec_register_port);
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index e2e44bb1dad8..398317835f24 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -3,6 +3,7 @@
 #ifndef __LINUX_USB_TYPEC_H
 #define __LINUX_USB_TYPEC_H
 
+#include <linux/notifier.h>
 #include <linux/types.h>
 
 /* USB Type-C Specification releases */
@@ -308,6 +309,8 @@ int typec_get_negotiated_svdm_version(struct typec_port *port);
 #if IS_REACHABLE(CONFIG_TYPEC)
 int typec_link_port(struct device *port);
 void typec_unlink_port(struct device *port);
+int typec_port_registration_register_notify(struct notifier_block *nb);
+int typec_port_registration_unregister_notify(struct notifier_block *nb);
 #else
 static inline int typec_link_port(struct device *port)
 {
@@ -315,6 +318,16 @@ static inline int typec_link_port(struct device *port)
 }
 
 static inline void typec_unlink_port(struct device *port) { }
+
+int typec_port_registration_register_notify(struct notifier_block *nb)
+{
+	return 0;
+}
+
+int typec_port_registration_unregister_notify(struct notifier_block *nb)
+{
+	return 0;
+}
 #endif
 
 #endif /* __LINUX_USB_TYPEC_H */
-- 
2.34.0.rc2.393.gf8c9666880-goog

