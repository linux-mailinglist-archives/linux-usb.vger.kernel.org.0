Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0750C292C8D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 19:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730691AbgJSRUt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 13:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730186AbgJSRUs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 13:20:48 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842BEC0613D0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 10:20:48 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id f191so65536wmf.9
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=oLyFbvVyh8t1G2Jgr/VNnQVbLfRE2s2oaGoLMyVB/+Y=;
        b=QA/gpvn/weCYDRfAhPS9AHRvT3Ox7xsd0qyTMybRFASSfVHCFwFSrLrfWREgdpgQfU
         LgpwvVs26QB34xOwyyVVivzhL0IjPWpKLvkHdiQs51v+R/Cmlu2w9ax5zs+FaHbtl9LE
         TqmE7eKQGxmcIN2eHzc3icH5+z8f5EH95PLCxUexv+x+02pLABWP625QKzv4v7meH81l
         ARKHqxzR/FKoaGmj7HFW8R3B71tpkYLFSn61Gk7J4hCaaQvZiVbSL1PPZXQRNdWh3Aqd
         k8j8G3LobkyNrsE6Or7q5E6lt2d29E0ngxP+1hbpTceIOm88Qy0JJH7DBMQh4sKEOXwg
         qB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=oLyFbvVyh8t1G2Jgr/VNnQVbLfRE2s2oaGoLMyVB/+Y=;
        b=o8aoZ0R59Cyyffz57JJ4K4GFbeRdDi5YjCD/t11MoukFh5buoCly6/c2dAnvgFXltM
         F/nfAcn+OnDZ7L4FMnQhJZw7dA2CP8Nii+aTj9QRhCsuDDJbk6Hy4ydTyZCNLWIWh9R7
         mpSxAeRWJA0y61vqatmfO81NgdcGkxKnJXPShvlc/GUPe5o0ohslC+D0HvcKVtExjVpB
         2NiojsprtzgfAUrYItw0AcKm1EzRoGZn63ObKVlL+VEkMAFtN3CYOoSu8mU/fiZNj4Qx
         +LNrVN+YvIofkytyfxhMMb023dXhDrX8SfZDLZzH73vHcmqrOeNIwbYOkr8gurq0N0Pk
         vCNA==
X-Gm-Message-State: AOAM53244QtqcIRlkzUZ/b22tCho8KXsp8EofshceMDeB8yek82ZF7se
        0C6GRokN7euk1Ey3TjJzioGfxVu9jy+gg+kx
X-Google-Smtp-Source: ABdhPJxht0EJX4I6pAo/83wjoOyt+kuKsluu4Kq97PXwynyRClGvKWnoO2xTq/zOMOse1zYq2CwA9mFap7eKNXb+
Sender: "andreyknvl via sendgmr" <andreyknvl@andreyknvl3.muc.corp.google.com>
X-Received: from andreyknvl3.muc.corp.google.com ([2a00:79e0:15:13:7220:84ff:fe09:7e9d])
 (user=andreyknvl job=sendgmr) by 2002:a1c:7518:: with SMTP id
 o24mr243180wmc.137.1603128046330; Mon, 19 Oct 2020 10:20:46 -0700 (PDT)
Date:   Mon, 19 Oct 2020 19:20:42 +0200
Message-Id: <e626ad10573bdc561c6f00667a31c87ee7725044.1603127827.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v3] kcov, usbip: collect coverage from vhci_rx_loop
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Nazime Hande Harputluoglu <handeharputlu@google.com>

Add kcov_remote_start()/kcov_remote_stop() annotations to the
vhci_rx_loop() function, which is responsible for parsing USB/IP packets
coming into USB/IP client.

Since vhci_rx_loop() threads are spawned per vhci_hcd device instance, the
common kcov handle is used for kcov_remote_start()/stop() annotations
(see Documentation/dev-tools/kcov.rst for details). As the result kcov
can now be used to collect coverage from vhci_rx_loop() threads.

Signed-off-by: Nazime Hande Harputluoglu <handeharputlu@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

Changes v2->v3:
- Fix build without KCOV enabled.

---
 drivers/usb/usbip/usbip_common.h | 4 ++++
 drivers/usb/usbip/vhci_rx.c      | 7 +++++++
 drivers/usb/usbip/vhci_sysfs.c   | 4 ++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 8be857a4fa13..0906182011d6 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -277,6 +277,10 @@ struct usbip_device {
 		void (*reset)(struct usbip_device *);
 		void (*unusable)(struct usbip_device *);
 	} eh_ops;
+
+#ifdef CONFIG_KCOV
+	u64 kcov_handle;
+#endif
 };
 
 #define kthread_get_run(threadfn, data, namefmt, ...)			   \
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index 266024cbb64f..68ec0aa64f69 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2003-2008 Takahiro Hirofuchi
  */
 
+#include <linux/kcov.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
 
@@ -261,7 +262,13 @@ int vhci_rx_loop(void *data)
 		if (usbip_event_happened(ud))
 			break;
 
+#ifdef CONFIG_KCOV
+		kcov_remote_start_common(ud->kcov_handle);
+#endif
 		vhci_rx_pdu(ud);
+#ifdef CONFIG_KCOV
+		kcov_remote_stop();
+#endif
 	}
 
 	return 0;
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index be37aec250c2..e167b8a445ad 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015-2016 Nobuo Iwata
  */
 
+#include <linux/kcov.h>
 #include <linux/kthread.h>
 #include <linux/file.h>
 #include <linux/net.h>
@@ -383,6 +384,9 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	vdev->ud.sockfd     = sockfd;
 	vdev->ud.tcp_socket = socket;
 	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
+#ifdef CONFIG_KCOV
+	vdev->ud.kcov_handle = kcov_common_handle();
+#endif
 
 	spin_unlock(&vdev->ud.lock);
 	spin_unlock_irqrestore(&vhci->lock, flags);
-- 
2.29.0.rc1.297.gfa9743e501-goog

