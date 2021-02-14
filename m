Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E32031B030
	for <lists+linux-usb@lfdr.de>; Sun, 14 Feb 2021 12:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhBNLSR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Feb 2021 06:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhBNLSQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Feb 2021 06:18:16 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D611C061574
        for <linux-usb@vger.kernel.org>; Sun, 14 Feb 2021 03:17:36 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 127so5887643ybc.19
        for <linux-usb@vger.kernel.org>; Sun, 14 Feb 2021 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=SGmWA9oI5nZQdHI5sNTZ3umBqHnrYt7Efta3S6WPUxc=;
        b=gJkjWnPLpTrexdnGdMPJ6dT4iFPbc3lzvISJTZ6a2HqE362PfR2zuqGQEAPlf/wGOf
         0AkyWeW9buwkW2FzTs5YOjs54UUHlglLHq61JfVON776EKo7AUIfevbVHEIHDfxixloD
         JxwPHm+GeKnp0wNioWzTVS4/FymIQUpzybP60M5GVEXc8lulrIlWcAzca8w1quwanee3
         ps4et42Sy8pVUkj9RR7F4p0b5QL2DkfO/A1rDy/SSxbCY09Ol6sl8zyxuXe9+Mg9Xpd1
         YVb+/FHFKO9QOMbQxcOTGnEbzcnwrCaVKsaQeIuJWM4SrhrmDQvpBg687DD4fAKtRLHa
         BNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=SGmWA9oI5nZQdHI5sNTZ3umBqHnrYt7Efta3S6WPUxc=;
        b=XztKGE4gMUkG/B6f7SVrtAVqGt2n6esTgHb7CIiSn4EC9miagy7CIxIrDDbeUCZxFb
         /faE/9YKwWFOzh+SSvnESWKPBw+9JxTCoifMYg/KbWMF1aJteUoBy8q4hCpWpATD4SLx
         OHYdNlBkhp061KpwpUm0NX9WAIfYjeXR+rLYgVt89d3MVUTYXIzLzznm+c7nOiB15yEY
         R6avxyzVMJJFRyH2PifAE3kfZmTCVos3952YMfKC7TUTkRTHp4EnvRmRdCvh/M436Q/r
         KwGyi4ZZBv1xIMRhjnR2lh3GLaOtwddOy3bkm0IEPpM7UywP9BWAPgmUZkqmR0bx9SXD
         KFPQ==
X-Gm-Message-State: AOAM531Nihst5XqfWQ6QhU3l0N3ic3rWl1YsAGu0VaAne5o9NXLjK3Bo
        B5qiaKZqYDtxAcYYUYWkn7ilKejc3lH0
X-Google-Smtp-Source: ABdhPJwaoUK3VVdfbpMNN8A/i+sUORwPfXJusAy2uS2dzKtFS6qwjq3vCw6xjtRfvFCL7i1nqI4jk4lUbZ4q
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:943b:acd7:4add:2791])
 (user=kyletso job=sendgmr) by 2002:a25:260b:: with SMTP id
 m11mr16897330ybm.231.1613301455619; Sun, 14 Feb 2021 03:17:35 -0800 (PST)
Date:   Sun, 14 Feb 2021 19:17:30 +0800
Message-Id: <20210214111730.1436506-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3] usb: typec: tcpm: Export partner Source Capabilities
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

Changes since v2:
- bring back the function tcpm_copy_pdos

 drivers/usb/typec/tcpm/tcpm.c | 47 +++++++++++++++++++++++++++++++++++
 include/linux/usb/tcpm.h      |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index be0b6469dd3d..1679c75e5a3d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5739,6 +5739,53 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	return 0;
 }
 
+static int tcpm_copy_pdos(u32 *dest_pdo, const u32 *src_pdo, unsigned int nr_pdo)
+{
+	unsigned int i;
+
+	if (nr_pdo > PDO_MAX_OBJECTS)
+		nr_pdo = PDO_MAX_OBJECTS;
+
+	for (i = 0; i < nr_pdo; i++)
+		dest_pdo[i] = src_pdo[i];
+
+	return nr_pdo;
+}
+
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

