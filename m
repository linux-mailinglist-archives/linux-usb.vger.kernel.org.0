Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8485297902
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 23:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756818AbgJWVob (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 17:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756816AbgJWVob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 17:44:31 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75745C0613CE
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:44:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o9so1699965plx.10
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OgG2cGSuxI7ea5daz1551HiYcFBT61V4iIj710jhN0I=;
        b=E0ZZgtQqIuU5Eu+Gzpgp2TpPQqm1KKLr/1uXfjE0U7UK601Irv+sl6b3Nr8PcjLhwc
         GUGpSGMA2kdBNbc8m5ksM9L0k+zkvGIPUSMqgyXwNHfLzvgoMwtR06Ux0Vwgu+1qCDRf
         Hbt9i+FCR32Bx80rVlDC29mD/G9w67PY2Idyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OgG2cGSuxI7ea5daz1551HiYcFBT61V4iIj710jhN0I=;
        b=X6uipdstGAalngiopit0wknFc94YD5rDd8j724LBEDq8itn65Z7Ch4ZqTSC94pk1jQ
         SRJrLIClpsLOXkuNyeDGQ3WS/da4f806ECrKmR6QD8824Wzydc5HN4fNFfqqDeLWn+Eg
         HcgrHsj2qeUvrIYL84YTpp4kSRnt8/2XGEScvlopNidbs4jKpt1fl0Z1Bo80LNWI6LBB
         YCacAiLUQ1kKa1A0sCOKY04lCwjE3oCw+7AhCg8uYCS2kustS+eYDU5SAINIFtrZH6WX
         L7W6R8B+l1vpl77OxRhLjQdptunTPlf6FVnaW9XZQ2sGHcZRWd95Nxnj5YSHAmO5g6po
         9OVw==
X-Gm-Message-State: AOAM530Co04Rz7F7kimSxA4/C8EFh0R1pfBUzQLQtBjQsaZRWd7o1cXX
        yKeG90dVQNTqVJP9oDlh8VHVpw==
X-Google-Smtp-Source: ABdhPJw+CkVchg93BnA/tfTFgbR/AhlF0j+e1r8rg+XOIzaKeyNLYg80hlXgbhPsLje8SomihdWAvg==
X-Received: by 2002:a17:902:76c5:b029:d3:db7d:7d85 with SMTP id j5-20020a17090276c5b02900d3db7d7d85mr4376730plt.24.1603489470987;
        Fri, 23 Oct 2020 14:44:30 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id j8sm3167338pfr.121.2020.10.23.14.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 14:44:29 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v3 2/2] usb: typec: Expose Product Type VDOs via sysfs
Date:   Fri, 23 Oct 2020 14:43:28 -0700
Message-Id: <20201023214328.1262883-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201023214328.1262883-1-pmalani@chromium.org>
References: <20201023214328.1262883-1-pmalani@chromium.org>
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
---

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
index 0f839fd022f1..0ac144bc5927 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -205,6 +205,30 @@ Description:
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
index 35eec707cb51..a2c88594b044 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -122,10 +122,40 @@ static ssize_t product_show(struct device *dev, struct device_attribute *attr,
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
 
@@ -144,6 +174,9 @@ static void typec_report_identity(struct device *dev)
 	sysfs_notify(&dev->kobj, "identity", "id_header");
 	sysfs_notify(&dev->kobj, "identity", "cert_stat");
 	sysfs_notify(&dev->kobj, "identity", "product");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo1");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo2");
+	sysfs_notify(&dev->kobj, "identity", "product_type_vdo3");
 }
 
 /* ------------------------------------------------------------------------- */
-- 
2.29.0.rc1.297.gfa9743e501-goog

