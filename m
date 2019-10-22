Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34626E002C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 10:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbfJVI7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 04:59:52 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:39367 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728832AbfJVI7w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 04:59:52 -0400
Received: by mail-pg1-f201.google.com with SMTP id m20so12121193pgv.6
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LZl6zNSvagqcd/4AyoUyx0eWouXvQtN7q4jWsmfi4io=;
        b=tfuy+tQwGzR8wBSj4bqW+++GTJLvz/JNlH7jUKHLm9iuvXEQfhb5ZNR9xHYc2Fezxa
         4JaEb5XDWhwEoZ4mxDhEpCWBwDg5Pts4SEkzpjZjI7XS1V1c/AhFAqoXPtUzk+0aa6Rk
         emCFtwda12zRaQHYEakvagoMbVU+Q0scW3GD6EJ8l6UOPl7t18ykbui3kBQZ3kSZShQ2
         ubjOmWTl30P4t5QBJ26DQzGRmoV9c9+9CY0j0iYxxaJBhcvtwsJNdoNsTbAkpK4mThGx
         7fA6ofgnYZwOsTSE63oMpJ3Hh3kYdWb4hASmlnUnKbPBWAWjY5/Xd1Yq5/KZJN55BADZ
         02IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LZl6zNSvagqcd/4AyoUyx0eWouXvQtN7q4jWsmfi4io=;
        b=Y/oScytQwVJDzxuBBm7BMi6P+T+uZtuMIPbe2KU8P/pjiElq0JYtQ2MssOXaXuUPlU
         XtR4cSo8mv00N+d5wcu/EyB0Z7/Jj4H2uzq6u3nN7+sLZhHjM1njlNki5oZh90siuiS4
         dVHSteycbnzcXO7yDJwC2ffHJhhbNZNpsrQwpqjNC4yEDWOuYZGMSL4m4GwGeQbdI8r2
         SqeGNepF2BlJXeygv6AICtvk9j2cQperRNz4mXCppajvfUx5iU303PFcDTvLPTteUZHY
         bxLGvtS7wxjjpzpCLIfHllIP5F50gqLYnFkIAe/ocOD6HIAKLDxUzBu0xnntHW9H+8f5
         lf8Q==
X-Gm-Message-State: APjAAAVRIe7TQ4yIhWH/R4ENv33IZBbU+1u0rK12wei+YkHE9hpsPVC8
        8/RnoQCUFfb1/8+b87607u7is7LVgKdx
X-Google-Smtp-Source: APXvYqzQ/rX6WZj13Gy2AaMaTZY65r5k/J8i4M18FF8gz4I4aUGooW8mDpkAcV8SY3HIrxQHuXL9DYahdITE
X-Received: by 2002:a65:609a:: with SMTP id t26mr643896pgu.349.1571734791388;
 Tue, 22 Oct 2019 01:59:51 -0700 (PDT)
Date:   Tue, 22 Oct 2019 16:59:24 +0800
Message-Id: <20191022085924.92783-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH V2] usb: typec: Add sysfs node to show connector orientation
From:   Puma Hsu <pumahsu@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, kyletso@google.com, albertccwang@google.com,
        rickyniu@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export the Type-C connector orientation so that user space
can get this information.

Signed-off-by: Puma Hsu <pumahsu@google.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++++++++++
 drivers/usb/typec/class.c                   | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index d7647b258c3c..b22f71801671 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -108,6 +108,17 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Revision number of the supported USB Type-C specification.
 
+What:		/sys/class/typec/<port>/connector_orientation
+Date:		October 2019
+Contact:	Puma Hsu <pumahsu@google.com>
+Description:
+		Indicates which typec connector orientation is configured now.
+		cc1 is defined as "normal" and cc2 is defined as "reversed".
+
+		Valid value:
+		- unknown (nothing configured)
+		- normal (configured in cc1 side)
+		- reversed (configured in cc2 side)
 
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 94a3eda62add..911d06676aeb 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1245,6 +1245,23 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
+static const char * const typec_connector_orientation[] = {
+	[TYPEC_ORIENTATION_NONE]		= "unknown",
+	[TYPEC_ORIENTATION_NORMAL]		= "normal",
+	[TYPEC_ORIENTATION_REVERSE]		= "reversed",
+};
+
+static ssize_t connector_orientation_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct typec_port *p = to_typec_port(dev);
+
+	return sprintf(buf, "%s\n",
+		       typec_connector_orientation[p->orientation]);
+}
+static DEVICE_ATTR_RO(connector_orientation);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1255,6 +1272,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_usb_typec_revision.attr,
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
+	&dev_attr_connector_orientation.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(typec);
-- 
2.23.0.866.gb869b98d4c-goog

