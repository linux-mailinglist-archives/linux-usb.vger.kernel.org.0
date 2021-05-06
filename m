Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751BD374C7A
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 02:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhEFApZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 20:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhEFApY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 20:45:24 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F269C061761
        for <linux-usb@vger.kernel.org>; Wed,  5 May 2021 17:44:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a7-20020a5b00070000b02904ed415d9d84so4282824ybp.0
        for <linux-usb@vger.kernel.org>; Wed, 05 May 2021 17:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=FIYfWaI3YWf0DYz8YdznL9GRGAZ6Fujs7G6sHSJoW08=;
        b=F81HM63dfakzEtPzPGJfAvVwabd9GULG3vw+sE1lsDWClbnnmHcUG6+0B/zSPxVJLZ
         Lr9H9/0Nf1Oc+9FXEMGfgPGWxG2kUfHxnHdSYCQqUhiSluugfSdBdIvSogMCzWTEdlEX
         MIcufUtVUNccgFzr1x5NgfDAyQKogQjwVv2Ug2+G/X94Fh+7iYFEq7dSXgohySMdxz4x
         3pBsNZ885BulHmlf7UHqpHKrCe9bYVy6dFlLJHoyAaheg7nPN2n1ABkVtp1HCuGGjp1H
         Npa7NT6c05Nye4sVNxeQ9IIWT+PGLMAh4EHXtbIPGLVkkIHUYQtEKbe0/QiaY7SGlIhX
         cA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=FIYfWaI3YWf0DYz8YdznL9GRGAZ6Fujs7G6sHSJoW08=;
        b=mKHVSIp8ycKVLySmwQyBY0B+3T1lufji6cD51Zw9eKaxL7iZeaomCy+Ij/3OiNY4pF
         3FA47zpEkBnwnEM/J7uM3LAj/1KGBniKNtoLGHch6bP07I3pCeFws8DoW2vOi3c6LcWH
         bATCGg6TqDxF+voNQW8J6dOQtZxRoeyUdrDGV2M7sIkaYlbagYaD5mF2MKlQHMXjc3VQ
         LSs8qq3LZ5vQ/+gENaLD3qdqawwKG17OIM+I843pMNdh6LFiheeHwRXTrMZ1wdJAL8TK
         vp5z2k8DapIaIypz6SqAt5hfUuURgt5WGCBnBE2CffDY2Izs1kVhgFqqzhETd2jGhgv+
         KW+A==
X-Gm-Message-State: AOAM532QNZIR3qONwjVAtpFUK/+Lg5Z8oS0HZYU4BH/CetCOnnjZGQFj
        SAemt/DhAg8//yWJAacJ14luIU040B5N3Q0=
X-Google-Smtp-Source: ABdhPJywu5JWRxK+B9j2uRu1VgtWzYJwE2BP9lNYPJ54EuyBhnjLhVD53mw4Mxt1fpFfj3XMCqVb9fY4YZ7pxCE=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7dba:15b:e3fd:a2e5])
 (user=saravanak job=sendgmr) by 2002:a5b:f02:: with SMTP id
 x2mr2082887ybr.99.1620261866544; Wed, 05 May 2021 17:44:26 -0700 (PDT)
Date:   Wed,  5 May 2021 17:44:22 -0700
Message-Id: <20210506004423.345199-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH v1] usb: typec: tcpm: Don't block probing of consumers of
 "connector" nodes
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     John Stultz <john.stultz@linaro.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

fw_devlink expects DT device nodes with "compatible" property to have
struct devices created for them. Since the connector node might not be
populated as a device, mark it as such so that fw_devlink knows not to
wait on this fwnode being populated as a struct device.

Without this patch, USB functionality can be broken on some boards.

Fixes: f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
Greg,

Probably better to take this in driver-core in case I need more fixes
for fw_devlink on top of this. Those fixes are more likely to land in
driver-core.

Hi John,

Can you please test this and give a Tested-by?

-Saravana

 drivers/base/core.c           | 3 ++-
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 include/linux/fwnode.h        | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4a8bf8cda52b..628e33939aca 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -150,7 +150,7 @@ void fwnode_links_purge(struct fwnode_handle *fwnode)
 	fwnode_links_purge_consumers(fwnode);
 }
 
-static void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode)
+void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode)
 {
 	struct fwnode_handle *child;
 
@@ -164,6 +164,7 @@ static void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode)
 	fwnode_for_each_available_child_node(fwnode, child)
 		fw_devlink_purge_absent_suppliers(child);
 }
+EXPORT_SYMBOL_GPL(fw_devlink_purge_absent_suppliers);
 
 #ifdef CONFIG_SRCU
 static DEFINE_MUTEX(device_links_lock);
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c4fdc00a3bc8..bffa342d4e38 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5754,6 +5754,15 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	if (!fwnode)
 		return -EINVAL;
 
+	/*
+	 * This fwnode has a "compatible" property, but is never populated as a
+	 * struct device. Instead we simply parse it to read the properties.
+	 * This it breaks fw_devlink=on. To maintain backward compatibility
+	 * with existing DT files, we work around this by deleting any
+	 * fwnode_links to/from this fwnode.
+	 */
+	fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* USB data support is optional */
 	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
 	if (ret == 0) {
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index ed4e67a7ff1c..59828516ebaf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -187,5 +187,6 @@ extern u32 fw_devlink_get_flags(void);
 extern bool fw_devlink_is_strict(void);
 int fwnode_link_add(struct fwnode_handle *con, struct fwnode_handle *sup);
 void fwnode_links_purge(struct fwnode_handle *fwnode);
+void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
 
 #endif
-- 
2.31.1.527.g47e6f16901-goog

