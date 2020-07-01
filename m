Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9DC2100FC
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 02:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgGAAb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 20:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGAAbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 20:31:55 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E15BC061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 17:31:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a14so5607252pfi.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 17:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKo6oaglSydwSdtHpON8xvKNOVdPkOj6C6m2pnkcfV8=;
        b=VUnkVkydgj3kBhMeje9+XBjUYPS1fpHc21BHbAea9UX8b3TuFifDfdPzbjcaWXLK1M
         vZMBVIJGJgusForm11N/XCMJqXrsxkgRIZBP5aLW9yCCmWD0hdXtgp8J9XMSoLV4toH5
         Ae6yzqknGleg4mRwotEIIeX+I0OQKz4qnBqpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKo6oaglSydwSdtHpON8xvKNOVdPkOj6C6m2pnkcfV8=;
        b=Zw38IkmKS5KA78kyDKCY1s82wqtMcZSoATMKivv8G/hWsKRjRT1PwY31/i8v9JpcrV
         7pPN/qbE/iLlZLV4MACoro/tqO0ayt3ERI7zVY+uZCRlbpuxZA/gIvWFjd7V5iB9/8am
         QvELA8S+8bF6Q5BSQEHuHCXNR/1BWsGc5nH58OGP9XDnchJYV2qlkmN5TfTn+JorpRtZ
         MDH9vq9zvSmXH2Gi/ahuPi3mLGa6XB/TrtYJNwYrHpiz2injTWMRDmDeiLI4Kv9u8DFj
         ISy3VqoUzROZJURj/9egXmbga6ukF4XUKrX1tH9M+1915MG7Hau1Z+/wA8d/GajslXrt
         uAAw==
X-Gm-Message-State: AOAM531Pq3aNdKXtvJ2lR5yL0khCdcmMaYsDRs5UfLu3Zc14OHWiAqAp
        pi42VDA7gFcUOR94PKGVcVWOTw==
X-Google-Smtp-Source: ABdhPJzZgWPdo2OTLyz94MwHpshOd9176RKhAvMMkP32xdFAg2xqXFaakMKnqOD2FQ1eo+QtZ5W5ZA==
X-Received: by 2002:a63:531e:: with SMTP id h30mr16700836pgb.165.1593563514657;
        Tue, 30 Jun 2020 17:31:54 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id l22sm3214699pjq.20.2020.06.30.17.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:31:54 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Subject: [PATCH] usb: typec: Add num_altmodes partner attribute
Date:   Tue, 30 Jun 2020 17:31:48 -0700
Message-Id: <20200701003149.3101219-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a user-visible attribute for the number of alt modes available in a
partner. This allows userspace to determine whether there are any
remaining alt modes left to be registered by the kernel driver. It can
begin implementing any policy state machine after all available alt
modes have been registered with the connector class framework.

This value is set to "-1" initially, which is an invalid value,
signifying that a valid number of alt modes haven't been set for the
partner.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/class.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c9234748537a..680cbcfbd427 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -33,6 +33,7 @@ struct typec_partner {
 	struct usb_pd_identity		*identity;
 	enum typec_accessory		accessory;
 	struct ida			mode_ids;
+	int				num_altmodes;
 };
 
 struct typec_port {
@@ -532,9 +533,18 @@ static ssize_t supports_usb_power_delivery_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(supports_usb_power_delivery);
 
+static ssize_t num_altmodes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct typec_partner *p = to_typec_partner(dev);
+
+	return sprintf(buf, "%d\n", p->num_altmodes);
+}
+static DEVICE_ATTR_RO(num_altmodes);
+
 static struct attribute *typec_partner_attrs[] = {
 	&dev_attr_accessory_mode.attr,
 	&dev_attr_supports_usb_power_delivery.attr,
+	&dev_attr_num_altmodes.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(typec_partner);
@@ -570,6 +580,29 @@ int typec_partner_set_identity(struct typec_partner *partner)
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_identity);
 
+/**
+ * typec_partner_set_num_altmodes - Update number of available altmodes
+ * @partner: The partner to be updated
+ * @num_alt_modes: The number of altmodes we want to specify as available
+ *
+ * This routine is used to report the number of alternate modes supported by the
+ * partner. This value is *not* enforced in alt mode registration routines.
+ *
+ * @partner.num_altmodes is set to -1 on partner registration, denoting that
+ * a valid value has not been set for it yet.
+ */
+int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes)
+{
+	if (num_altmodes < 0)
+		return -EINVAL;
+
+	partner->num_altmodes = num_altmodes;
+	sysfs_notify(&partner->dev.kobj, NULL, "num_altmodes");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(typec_partner_set_num_altmodes);
+
 /**
  * typec_partner_register_altmode - Register USB Type-C Partner Alternate Mode
  * @partner: USB Type-C Partner that supports the alternate mode
@@ -612,6 +645,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	ida_init(&partner->mode_ids);
 	partner->usb_pd = desc->usb_pd;
 	partner->accessory = desc->accessory;
+	partner->num_altmodes = -1;
 
 	if (desc->identity) {
 		/*
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 5daa1c49761c..ab523caa23a4 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -112,6 +112,7 @@ struct typec_altmode_desc {
 	enum typec_port_data	roles;
 };
 
+int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes);
 struct typec_altmode
 *typec_partner_register_altmode(struct typec_partner *partner,
 				const struct typec_altmode_desc *desc);
-- 
2.27.0.212.ge8ba1cc988-goog

