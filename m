Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DCA2C3B5A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 09:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgKYItq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 03:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgKYItp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 03:49:45 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3B7C0613D4
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 00:49:33 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id s21so1633884pfu.13
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 00:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2uwajG3CxRUDHB7vBWCIv/Ki2W9TnG3exx+vXLzSoo=;
        b=kYBbA8lp6mxajAikjU6kMO65tlbWy7UktZtUnCGR6blskKlku9P8QUyIA/cA7Dio1p
         tp9ktDi2JNreA8gPZxhc8VsZeSYHzBjFULix//m3lKHd1StJ4waE82yY2gnd0oluD/0B
         2a/2uSRbUmFsqrjcj7NBzs099KTFX3xN6A1EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2uwajG3CxRUDHB7vBWCIv/Ki2W9TnG3exx+vXLzSoo=;
        b=HtV8qgV9A+8/jIxa9obbobxZmyqHg/56HHLEQKavhcT+//s7vs098M04H0BILS+xQ6
         aiDLvxJmfJ8hzINWhYJDRgMJqSZsDBmvNl3vf8zmFN925GObL0LQl+xbKs7H2ZuuO2r+
         EKXHsE21qD+XkB3b/zBCxsh+LjP+g3bBhtZy7OAUxMkkGb/6jPywqqAaNMf5YJ7sc4Ti
         7YwUn6YKFTsdyq/DO/ufiFdRJ4+nrH4mbuXb+IEff1LR8Bx1Kr/ZgjncMSwCJPRJV4iy
         c1SXY/6O6VV6ml5Rh6O1igbyTT4X8PV4PZh/AgyAxSCjTy4En3zsuzVKy1NLEP2RU4jc
         BrHA==
X-Gm-Message-State: AOAM531B9mR93FCppDgkFmAw13Mt4fhy/20620YmWQZrYstRFgZhOM2M
        RAVT0keG+/Q8esCWyUgHN2FGYA==
X-Google-Smtp-Source: ABdhPJyrpuVK5ePMHRJfRGDGX76gEoJyMmbZpv/GCtDsR15xASFOiZhJ0WcCFGEiN8gF27zDd9+Bxg==
X-Received: by 2002:a17:90a:6287:: with SMTP id d7mr2868356pjj.80.1606294172684;
        Wed, 25 Nov 2020 00:49:32 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id x30sm1554565pgc.86.2020.11.25.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 00:49:32 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v5 2/2] usb: typec: Expose Product Type VDOs via sysfs
Date:   Wed, 25 Nov 2020 00:49:11 -0800
Message-Id: <20201125084911.1077462-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201125084911.1077462-1-pmalani@chromium.org>
References: <20201125084911.1077462-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A PD-capable device can return up to 3 Product Type VDOs as part of its
DiscoverIdentity Response (USB PD Spec, Rev 3.0, Version 2.0, Section
6.4.4.3.1). Add sysfs attributes to expose these to userspace.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v5:
- No changes.

Changes in v4:
- Added Reviewed-by tag from v3's review.
- Rebased on top of usb-next + Patch 1/2

Changes in v3:
- Split each product type VDO into a separate attribute.
- Changed sprintf() to sysfs_emit().
- Changed ABI documentation based on consolidation of identity VDO
  descriptions in the previous patch (1/2).

Changes in v2:
- Added sysfs_notify() call for the attribute.
- Added description for the attribute in
  Documentation/ABI/testing/sysfs-class-typec.

 Documentation/ABI/testing/sysfs-class-typec | 24 +++++++++++++++
 drivers/usb/typec/class.c                   | 33 +++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 88ffc14d4cd2..619c4c67432b 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -228,6 +228,30 @@ Description:
 		will show 0 until Discover Identity command result becomes
 		available. The value can be polled.
 
+What:		/sys/class/typec/<port>-{partner|cable}/identity/product_type_vdo1
+Date:		October 2020
+Contact:	Prashant Malani <pmalani@chromium.org>
+Description:
+		1st Product Type VDO of Discover Identity command result.
+		The value will show 0 until Discover Identity command result becomes
+		available and a valid Product Type VDO is returned.
+
+What:		/sys/class/typec/<port>-{partner|cable}/identity/product_type_vdo2
+Date:		October 2020
+Contact:	Prashant Malani <pmalani@chromium.org>
+Description:
+		2nd Product Type VDO of Discover Identity command result.
+		The value will show 0 until Discover Identity command result becomes
+		available and a valid Product Type VDO is returned.
+
+What:		/sys/class/typec/<port>-{partner|cable}/identity/product_type_vdo3
+Date:		October 2020
+Contact:	Prashant Malani <pmalani@chromium.org>
+Description:
+		3rd Product Type VDO of Discover Identity command result.
+		The value will show 0 until Discover Identity command result becomes
+		available and a valid Product Type VDO is returned.
+
 
 USB Type-C port alternate mode devices.
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index cb1362187a7c..df4478baf95b 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -124,10 +124,40 @@ static ssize_t product_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(product);
 
+static ssize_t product_type_vdo1_show(struct device *dev, struct device_attribute *attr,
+				      char *buf)
+{
+	struct usb_pd_identity *id = get_pd_identity(dev);
+
+	return sysfs_emit(buf, "0x%08x\n", id->vdo[0]);
+}
+static DEVICE_ATTR_RO(product_type_vdo1);
+
+static ssize_t product_type_vdo2_show(struct device *dev, struct device_attribute *attr,
+				      char *buf)
+{
+	struct usb_pd_identity *id = get_pd_identity(dev);
+
+	return sysfs_emit(buf, "0x%08x\n", id->vdo[1]);
+}
+static DEVICE_ATTR_RO(product_type_vdo2);
+
+static ssize_t product_type_vdo3_show(struct device *dev, struct device_attribute *attr,
+				      char *buf)
+{
+	struct usb_pd_identity *id = get_pd_identity(dev);
+
+	return sysfs_emit(buf, "0x%08x\n", id->vdo[2]);
+}
+static DEVICE_ATTR_RO(product_type_vdo3);
+
 static struct attribute *usb_pd_id_attrs[] = {
 	&dev_attr_id_header.attr,
 	&dev_attr_cert_stat.attr,
 	&dev_attr_product.attr,
+	&dev_attr_product_type_vdo1.attr,
+	&dev_attr_product_type_vdo2.attr,
+	&dev_attr_product_type_vdo3.attr,
 	NULL
 };
 
@@ -146,6 +176,9 @@ static void typec_report_identity(struct device *dev)
 	sysfs_notify(&dev->kobj, "identity", "id_header");
 	sysfs_notify(&dev->kobj, "identity", "cert_stat");
 	sysfs_notify(&dev->kobj, "identity", "product");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo1");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo2");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo3");
 }
 
 /* ------------------------------------------------------------------------- */
-- 
2.29.2.454.gaff20da3a2-goog

