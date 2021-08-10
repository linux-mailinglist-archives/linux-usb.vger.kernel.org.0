Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795D83DC1B9
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jul 2021 01:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhG3XxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 19:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhG3XxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 19:53:17 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B44C0613C1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 16:53:11 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e145-20020a2550970000b029056eb288352cso12271175ybb.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Ox2hs0+F8CfXOTYzfx5nEPha8nn14A17Bwv3nAYgtK4=;
        b=ZHG7sIcuCuCDCVvlE/ti2sNgndgc9dxoXcj1coJ902TUHXNE0c4n+emm24+aiKwIvp
         OdsIhCZwMuJbEqNPIIp1Ok4wz2DD3JCgptZo6VZ0odMPhfDy2Ff7W2nG8l0nFHql7VEq
         pxOjCB0p9LrKYPlghLCjHn6z8SXHsZJTsKFHYj9yYDYn45OjmXgO+JUOo7vW3Fmj8Yge
         HvwWLLSJupbrrKK8MIwTy0D5/++vp7TGmXi8BtWVTgUk+6BQbx/Pkc33YtEYt/tUsQ2K
         BoXDX9IxYZTsT4caJmu+mEE3ZTePB/EkdFxljArHyrDOvb0c5HyWfwXn0tKCjHuzxAlc
         ujpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Ox2hs0+F8CfXOTYzfx5nEPha8nn14A17Bwv3nAYgtK4=;
        b=hYvtzSl+29/qRQBFBZgpXcF86YpVl15W3QnGno4inixb2ZnAobrFSGyBV0AZ05cgQ1
         NvTARI5JVFxzpVNOJS6ypTV39RK4LYYX2c7iIRP/ZtOtFr4gXZQvYYzhn9adkvnXlTfU
         zmbj0+t+TcP7xU8yM7GSVYzwkWP4jLlNXcy9PX/AjpX/4kkkAyWAVEwObfnqsQMKjMTQ
         ZDNUmkodeQb8fIDgeFnCUD+83ypR0Gx9xp5AnGRwhVWY3WfD1GgBV3bBesj5wnofZrv4
         8hzz2GFgeMEXQBsE/GUBk0wbeWe+iodsC2q0Qbr5ZAfzHCv2hbhwObjaW9F3rX19124L
         jn9g==
X-Gm-Message-State: AOAM5331Cpqvl7QAgwLBWxf2Qgsy6lyD3VyB5SSY/Wsqk8uol29p415O
        hMypHvemU1SH81FJ6J751p6v3jny+DFz
X-Google-Smtp-Source: ABdhPJzZRQqffgQ8RP0oIj5SiwEqq5zbiya8zPLHgWOSxro0uWUdvptpFAXpXAE842jtv9Ev32i0B1F1eiIH
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:9a47:4e11:d65e:f24b])
 (user=rajatja job=sendgmr) by 2002:a25:642:: with SMTP id 63mr6110229ybg.465.1627689190503;
 Fri, 30 Jul 2021 16:53:10 -0700 (PDT)
Date:   Fri, 30 Jul 2021 16:53:04 -0700
Message-Id: <20210730235304.3179882-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v3] thunderbolt: For dev authorization changes, include the
 actual event in udev change notification
From:   Rajat Jain <rajatja@google.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For security, we would like to monitor and track when the thunderbolt
devices are authorized and deauthorized (i.e. when the thunderbolt sysfs
"authorized" attribute changes). Currently the userspace gets a udev
change notification when there is a change, but the state may have
changed (again) by the time we look at the authorized attribute in
sysfs. So an authorization event may go unnoticed. Thus make it easier
by informing the actual change (new value of authorized attribute) in
the udev change notification.

The change is included as a key value "authorized=<val>" where <val>
is the new value of sysfs attribute "authorized", and is described at
Documentation/ABI/testing/sysfs-bus-thunderbolt under
/sys/bus/thunderbolt/devices/.../authorized

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: rearrange the local variable definitions, add comments
v2: Commit log changes

 drivers/thunderbolt/switch.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 83b1ef3d5d03..dc2005bbd682 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1498,6 +1498,7 @@ static ssize_t authorized_show(struct device *dev,
 
 static int disapprove_switch(struct device *dev, void *not_used)
 {
+	char *envp[] = { "AUTHORIZED=0", NULL };
 	struct tb_switch *sw;
 
 	sw = tb_to_switch(dev);
@@ -1514,7 +1515,7 @@ static int disapprove_switch(struct device *dev, void *not_used)
 			return ret;
 
 		sw->authorized = 0;
-		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+		kobject_uevent_env(&sw->dev.kobj, KOBJ_CHANGE, envp);
 	}
 
 	return 0;
@@ -1522,7 +1523,9 @@ static int disapprove_switch(struct device *dev, void *not_used)
 
 static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 {
+	char envp_string[13];
 	int ret = -EINVAL;
+	char *envp[] = { envp_string, NULL };
 
 	if (!mutex_trylock(&sw->tb->lock))
 		return restart_syscall();
@@ -1559,8 +1562,12 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 
 	if (!ret) {
 		sw->authorized = val;
-		/* Notify status change to the userspace */
-		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+		/*
+		 * Notify status change to the userspace, informing the new
+		 * value of /sys/bus/thunderbolt/devices/.../authorized
+		 */
+		sprintf(envp_string, "AUTHORIZED=%u", sw->authorized);
+		kobject_uevent_env(&sw->dev.kobj, KOBJ_CHANGE, envp);
 	}
 
 unlock:
-- 
2.32.0.554.ge1b32706d8-goog

