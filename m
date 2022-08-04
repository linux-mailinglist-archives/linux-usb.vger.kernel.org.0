Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2DA589F0D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 18:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiHDQDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 12:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiHDQDN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 12:03:13 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BB05F138
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 09:03:12 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 4104A200002;
        Thu,  4 Aug 2022 16:03:10 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Bastien Nocera <hadess@hadess.net>
Subject: [RFC v2 2/2] usb: Implement usb_revoke() BPF function
Date:   Thu,  4 Aug 2022 18:03:06 +0200
Message-Id: <20220804160306.134014-3-hadess@hadess.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220804160306.134014-1-hadess@hadess.net>
References: <20220804160306.134014-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This functionality allows a sufficiently privileged user-space process
to upload a script that will call to usb_revoke_device() as if it were
a kernel API.

This functionality will be used by logind to revoke access to devices on
fast user-switching to start with.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/usb.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 2f71636af6e1..8cac72271a8a 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -38,6 +38,8 @@
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <linux/usb/of.h>
+#include <linux/btf.h>
+#include <linux/btf_ids.h>
 
 #include <asm/io.h>
 #include <linux/scatterlist.h>
@@ -438,6 +440,41 @@ static int usb_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+struct revoke_data {
+	struct usb_revoke_match match;
+	int ret;
+};
+
+static int
+__usb_revoke(struct usb_device *udev, void *data)
+{
+	struct revoke_data *revoke_data = data;
+	struct usb_revoke_match match = revoke_data->match;
+	int ret;
+
+	ret = usb_revoke(udev, &match);
+	if (ret == 0)
+		revoke_data->ret = 0;
+	else if (revoke_data->ret == 1)
+		revoke_data->ret = ret;
+	return 0;
+}
+
+noinline int
+usb_revoke_device(int busnum, int devnum, unsigned int euid)
+{
+	struct revoke_data revoke_data;
+
+	revoke_data.match.busnum = busnum;
+	revoke_data.match.devnum = devnum;
+	revoke_data.match.euid = euid;
+	revoke_data.ret = 1;
+
+	usb_for_each_dev(&revoke_data, __usb_revoke);
+
+	return revoke_data.ret;
+}
+
 #ifdef	CONFIG_PM
 
 /* USB device Power-Management thunks.
@@ -1004,6 +1041,15 @@ static void usb_debugfs_cleanup(void)
 /*
  * Init
  */
+BTF_SET_START(usbdev_kfunc_ids)
+BTF_ID(func, usb_revoke_device)
+BTF_SET_END(usbdev_kfunc_ids)
+
+static const struct btf_kfunc_id_set usbdev_kfunc_set = {
+	.owner     = THIS_MODULE,
+	.check_set = &usbdev_kfunc_ids,
+};
+
 static int __init usb_init(void)
 {
 	int retval;
@@ -1035,9 +1081,14 @@ static int __init usb_init(void)
 	if (retval)
 		goto hub_init_failed;
 	retval = usb_register_device_driver(&usb_generic_driver, THIS_MODULE);
+	if (retval)
+		goto register_failed;
+	retval = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &usbdev_kfunc_set);
 	if (!retval)
 		goto out;
+	usb_deregister_device_driver(&usb_generic_driver);
 
+register_failed:
 	usb_hub_cleanup();
 hub_init_failed:
 	usb_devio_cleanup();
-- 
2.36.1

