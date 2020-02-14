Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F7715D785
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 13:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgBNMhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 07:37:12 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37557 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgBNMhM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Feb 2020 07:37:12 -0500
Received: by mail-pg1-f195.google.com with SMTP id z12so4923269pgl.4
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2020 04:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VQWYsV9y3Ombsei9FudPH6Z1Ir+D9qaqTk/ltuxkoxE=;
        b=Y0+PcYZBM1qTMK/c/FwdjwzV/hoYbi91KVZhFJ5i+g+GvPpJYYaOaVaBnmWECC5VTR
         ca1bLnFZ4pVQCPwfI0bXOtr2zfKapRLixf4q6Aq/CFF+Ojylm9tZ/KUQMlVHVssbDnI9
         tdgKyQO9zKs6FG4i+rUCaseIVe5bBtZGuzm/ntloNgqkgYmcod51mnSEbehHmaiTm11F
         /pcUj6ArCRTkIkB4RN9R2U/rVvgmUBPy/909/ZxQgl2jhLeRzvOYVcUbXIVkn9g/nWe2
         bEiZG4azfr0l9d10+8sV6e0CMCu0GQaPFP6MAQm8HCD6mRNCsjz9BxSQEvjnAdupEzLo
         fLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VQWYsV9y3Ombsei9FudPH6Z1Ir+D9qaqTk/ltuxkoxE=;
        b=mZYqCuNIi3j2AWS4G4SGOD9u+TF8bO1Re/CY46118Tz3j//jbD05Xccwj9VghdWshr
         dMKKJmjOT+Z75Fgko5JZwy+p8YUIqpSsCrUoVD6xGmv2VIvICEa5p8QlVvvRYzxEtknK
         B1VgXXdd0kCQmnupzk2DVGXcTvOC8vTh2J04QuOMdbjFeHH/4uFSVAqtvu2vzjM3rrxc
         HR1WH1+74QSJOj4BwgcN+CsjNCHz+RGqYSr2ajg980C/dpKYHSnTpAO+n8pMWUbKS3Kl
         MAEA2/vOA00YjA4/HanxRcyH3iOWN40D2imX02BCap5VSqIylZNMzoC5YqpeXmV+vqSO
         UNVg==
X-Gm-Message-State: APjAAAUSH9+xpwBaforXjRK1ba14/+70JRUYOu9RZlYBptDd/+7GCUsS
        x+mfv5ir+eCEbzeMsK4Sc74=
X-Google-Smtp-Source: APXvYqzuiDh2x2zjuac8Vw6NurCrKekWv5n6ywqo+pEZQizOiUj3Wtmx3Gzdf3qo5bt91eC1/mBlvA==
X-Received: by 2002:a62:2cd8:: with SMTP id s207mr3238649pfs.247.1581683831362;
        Fri, 14 Feb 2020 04:37:11 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id r9sm7162869pfl.136.2020.02.14.04.37.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Feb 2020 04:37:10 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     gregkh@linuxfoundation.org, tweek@google.com,
        heikki.krogerus@linux.intel.com, suzuki.poulose@arm.com,
        chunfeng.yun@mediatek.com, mathieu.poirier@linaro.org,
        wenyang@linux.alibaba.com
Cc:     linux-usb@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] usb: use kobj_to_dev() API
Date:   Fri, 14 Feb 2020 20:37:00 +0800
Message-Id: <1581683820-9978-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use kobj_to_dev() API instead of container_of().

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/usb/core/sysfs.c  | 6 +++---
 drivers/usb/roles/class.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index f19694e..9f4320b 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -849,7 +849,7 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 static umode_t dev_string_attrs_are_visible(struct kobject *kobj,
 		struct attribute *a, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct usb_device *udev = to_usb_device(dev);
 
 	if (a == &dev_attr_manufacturer.attr) {
@@ -883,7 +883,7 @@ static umode_t dev_string_attrs_are_visible(struct kobject *kobj,
 		struct bin_attribute *attr,
 		char *buf, loff_t off, size_t count)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct usb_device *udev = to_usb_device(dev);
 	size_t nleft = count;
 	size_t srclen, n;
@@ -1233,7 +1233,7 @@ static ssize_t interface_authorized_store(struct device *dev,
 static umode_t intf_assoc_attrs_are_visible(struct kobject *kobj,
 		struct attribute *a, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct usb_interface *intf = to_usb_interface(dev);
 
 	if (intf->intf_assoc == NULL)
diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 63a00ff..486b0b1 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -199,7 +199,7 @@ struct usb_role_switch *
 static umode_t
 usb_role_switch_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {
-	struct device *dev = container_of(kobj, typeof(*dev), kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct usb_role_switch *sw = to_role_switch(dev);
 
 	if (sw->allow_userspace_control)
-- 
1.9.1

