Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A8A31AECF
	for <lists+linux-usb@lfdr.de>; Sun, 14 Feb 2021 04:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhBNDbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Feb 2021 22:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhBNDbk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Feb 2021 22:31:40 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE308C061574
        for <linux-usb@vger.kernel.org>; Sat, 13 Feb 2021 19:30:59 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id h7so2999250qkf.16
        for <linux-usb@vger.kernel.org>; Sat, 13 Feb 2021 19:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=YrJTBBwLjoHKxPdL5FhIlxlSkWTvnTyZYkPeyIaD1xw=;
        b=l5hwQ2622VL/iTkcYGrDG9Ny6HUhIPJNPbGy1+MKdgcpvn5aoF5MKATbcv66eGp59k
         PUZcrPjLiBzOxSGCGfEf3njGfE6Zp86eJP6NHKSZ5qfS6fLrajqZLVVW7nfAQTzs35Bo
         QugRxmwtEDx3HjAFjoOYYZW/b3uTYrYQZG1dZ/rxkZ0ol0hhdoTPd5gndsjUSTWHBk7z
         RUUeCEzZW/yeZWgxEohefr+KpyljrGiE/cPuP1EbHGvouIIBcC8MBG+Jlo6p/ARrKJiz
         80GlwcrqR6lqFxQ5zVXfBcSjj0CAUcMBYQjbttYV2c0ADqr+u7+JQCajMBJzO8LeZyKM
         JDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=YrJTBBwLjoHKxPdL5FhIlxlSkWTvnTyZYkPeyIaD1xw=;
        b=f7ZG2ull0NYjZ4hX5ASK6XH5+kYbeAAkzsgcO3D86Vc3IGloZubBMkizKwYylGbgw5
         f/2bJHq/mjJ30IQIVuyMkfl/91xqJBSQs6x4LlFi8YL1QKsIxzPTl5fOjfHmUzTrQ2Qr
         PTAPhgSUKPQyQ378vmn3vmsAqrRpjj1n3WzM5egmjdd4yQbUds6iZFSkpo+k5+zAIZMJ
         R+BiqDqWe0qLx1thRxL5hIdBUGGaHODGA2tHT0HWL7H6sPdh5fd2PlbEX0u0duVkJwM6
         QXWPzcHXMvwgayuvQt1KZpV3hEG9zFFDSB+LlpqBZesBa8oXv3xTTb8jg51ct5Z/TqlC
         QzpA==
X-Gm-Message-State: AOAM531PKrNelbc+Vq0c0+lkEjUsAbAUyt9y3dyoRWs8En0tafY9EOKR
        6xpY327UAtxqt22t++0S+5MPF+mab341
X-Google-Smtp-Source: ABdhPJyDD0D6Q8Cu1HTh9Oa6/NsgLsl4obNfXsOVHhj1qxYkpYf37ENZpqPSU6/k2RxzNQDPAqmRAJCNlZn9
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:5de6:90a2:6272:c4ff])
 (user=kyletso job=sendgmr) by 2002:a0c:c583:: with SMTP id
 a3mr9426003qvj.15.1613273458822; Sat, 13 Feb 2021 19:30:58 -0800 (PST)
Date:   Sun, 14 Feb 2021 11:30:52 +0800
Message-Id: <20210214033052.1284385-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v2] usb: typec: tcpm: Export partner Source Capabilities
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export a function for other drivers to get the partner Source
Capabilities.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
Changes since v1:
- add a put function to free the memory

 drivers/usb/typec/tcpm/tcpm.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/usb/tcpm.h      |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index be0b6469dd3d..6c6d199f63b7 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5739,6 +5739,40 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	return 0;
 }
 
+/*
+ * Don't call this function in interrupt context. Caller needs to free the
+ * memory by calling tcpm_put_partner_src_caps.
+ */
+int tcpm_get_partner_src_caps(struct tcpm_port *port, u32 **src_pdo)
+{
+	unsigned int nr_pdo;
+
+	mutex_lock(&port->lock);
+	if (port->nr_source_caps == 0) {
+		mutex_unlock(&port->lock);
+		return -ENODATA;
+	}
+
+	*src_pdo = kcalloc(port->nr_source_caps, sizeof(u32), GFP_KERNEL);
+	if (!src_pdo) {
+		mutex_unlock(&port->lock);
+		return -ENOMEM;
+	}
+
+	nr_pdo = tcpm_copy_pdos(*src_pdo, port->source_caps,
+				port->nr_source_caps);
+	mutex_unlock(&port->lock);
+	return nr_pdo;
+}
+EXPORT_SYMBOL_GPL(tcpm_get_partner_src_caps);
+
+void tcpm_put_partner_src_caps(u32 **src_pdo)
+{
+	kfree(*src_pdo);
+	*src_pdo = NULL;
+}
+EXPORT_SYMBOL_GPL(tcpm_put_partner_src_caps);
+
 /* Power Supply access to expose source power information */
 enum tcpm_psy_online_states {
 	TCPM_PSY_OFFLINE = 0,
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 42fcfbe10590..f83d9ff89a13 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -161,5 +161,7 @@ void tcpm_pd_transmit_complete(struct tcpm_port *port,
 			       enum tcpm_transmit_status status);
 void tcpm_pd_hard_reset(struct tcpm_port *port);
 void tcpm_tcpc_reset(struct tcpm_port *port);
+int tcpm_get_partner_src_caps(struct tcpm_port *port, u32 **pdo);
+void tcpm_put_partner_src_caps(u32 **pdo);
 
 #endif /* __LINUX_USB_TCPM_H */
-- 
2.30.0.478.g8a0d178c01-goog

