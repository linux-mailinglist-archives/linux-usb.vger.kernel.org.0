Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E09308591
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 07:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhA2GPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 01:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbhA2GPi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jan 2021 01:15:38 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FFFC061788
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id gx1so5795171pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BI9IdVQMVElpbGgcuBrXt08uYJZq0+pEMzt9hXMuZM0=;
        b=oTIxN96Pnswl2tahLxRkixF6JESSYgC+HYnLeLD1zsqufawE8A5Kr4wJ6lNzk+7mgf
         QVLIhUPQ0IWfBlseY0FlCjq7KlJjc0Lxe4k6MBtQNMt8B7JyLIfQc9MEzthLsyF+DfOk
         kwgWKxX4QbaqV0yiYtY23HHChP0Yiy6vzK0L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BI9IdVQMVElpbGgcuBrXt08uYJZq0+pEMzt9hXMuZM0=;
        b=jVwlYtXrMZSEMk/IHZZZOaVgt8MMWPJAdo5j9oS0o5pJSHdUrU1CXlcW7KQ5bwmQ3U
         psXd+K6Fryjtbh/cN6suwMacJ+zE+950MKYNSRbwnGlsbaRomRzNxRZiiDz8ntsy1WfV
         /r7s/AftYQewwtrEmjj+jFC5bPd4t3VulSCSmg9X8ZIEIrhmV2mfRr3b/tDs6wYkQubE
         PvCCQSRlw8EB6jz2mTkhs0hb7lP4+dD3yL/75712WIKjoU6sipHBTlnjoQozb79SbJrP
         Sp5zbq4TC+AH161R4/i7z22tO8eQHFMhuhraHZGiNcQZBB9D8M/L0tTt0/PneG77JMcQ
         4C0g==
X-Gm-Message-State: AOAM533y299hUyIZugdgOt9UGPOr3HH9Gc1UMd77fq/CvkrMaWQX9UVN
        ssqgGLP10+1XpX1xkLJ8Woe+Nw==
X-Google-Smtp-Source: ABdhPJwJiHpiyi13aNcOR2f6u6zQLioDumEXo8sinBNF0uzCVqXD/EGWhhQD+G6s9NXLzeNP9OvY5g==
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr3063664pjp.87.1611900860669;
        Thu, 28 Jan 2021 22:14:20 -0800 (PST)
Received: from bleung.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id 17sm7551013pfv.13.2021.01.28.22.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 22:14:20 -0800 (PST)
From:   Benson Leung <bleung@chromium.org>
To:     heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     groeck@chromium.org, bleung@google.com, bleung@chromium.org
Subject: [PATCH 3/6] usb: typec: Add typec_partner_set_pd_revision
Date:   Thu, 28 Jan 2021 22:14:03 -0800
Message-Id: <20210129061406.2680146-4-bleung@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129061406.2680146-1-bleung@chromium.org>
References: <20210129061406.2680146-1-bleung@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The partner's PD revision may be resolved later than the port partner
registration since the port partner creation may take place once
Type-C detects the port has changed state, but before PD communication is
completed.

Add a setter so that the partner's PD revision can be attached to it once
it becomes available.

If the revision is set to a valid version (not 0), the setter will also
refresh the partner's usb_pd flag and notify on "supports_usb_power_delivery"
sysfs property as well.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/class.c | 30 ++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index b5241f4756c2..b6ceab3dc16b 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -748,6 +748,36 @@ int typec_partner_set_identity(struct typec_partner *partner)
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_identity);
 
+/**
+ * typec_partner_set_pd_revision - Set the PD revision supported by the partner
+ * @partner: The partner to be updated.
+ * @pd_revision:  USB Power Delivery Specification Revision supported by partner
+ *
+ * This routine is used to report that the PD revision of the port partner has
+ * become available.
+ *
+ * Returns 0 on success or negative error number on failure.
+ */
+int typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision)
+{
+	int ret;
+
+	if (partner->pd_revision == pd_revision)
+		return 0;
+
+	partner->pd_revision = pd_revision;
+	sysfs_notify(&partner->dev.kobj, NULL, "usb_power_delivery_revision");
+	if (pd_revision != 0 && !partner->usb_pd) {
+		partner->usb_pd = 1;
+		sysfs_notify(&partner->dev.kobj, NULL,
+			     "supports_usb_power_delivery");
+	}
+	kobject_uevent(&partner->dev.kobj, KOBJ_CHANGE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(typec_partner_set_pd_revision);
+
 /**
  * typec_partner_set_num_altmodes - Set the number of available partner altmodes
  * @partner: The partner to be updated.
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 42c6b7c07a99..4946eca742d5 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -126,6 +126,7 @@ struct typec_altmode_desc {
 	enum typec_port_data	roles;
 };
 
+int typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
 int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes);
 struct typec_altmode
 *typec_partner_register_altmode(struct typec_partner *partner,
-- 
2.30.0.365.g02bc693789-goog

