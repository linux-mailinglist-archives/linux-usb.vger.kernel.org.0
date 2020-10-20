Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7472D28BED2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 19:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404085AbgJLRKq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 13:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404033AbgJLRKn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 13:10:43 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B6EC0613D1
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 10:10:41 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id f126so13157400qke.17
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 10:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=GiteUeefhedmcujA7Gl+XRhg8qxQ0VOJlBmMbUTsQlA=;
        b=BYygvMgshAwMaBLGICwa9MuOOg1BvZdzlLIfwZ66VS9B1bbJYsUSP6HJ9F4F4wpdz8
         0c1Izeu+rksBr5Sxqwzs0rQ9nYDE8i9TAa1R+S5t5lGlrlzLSH5ZLIy6NawmcN3yly75
         3xkQ4qxBtgBDDE9ycUeuFKXtQCvNA8NiVtdbKL6IazXpz97Ipo2Nc/0Uf1J2aN2nV+ff
         aCby2Phu5q9wakXFVGj60cvIA6MCJIYMSv5GQPJqZiPCKK51RBehxVG5mge2pnULcXPH
         0IfzQH/67YKbOo5tF60UomHITrDqqqO/LVdAQ84z4+Jui3IuuSQV8LIMOqFcnwf/uB1u
         PL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=GiteUeefhedmcujA7Gl+XRhg8qxQ0VOJlBmMbUTsQlA=;
        b=f9xwBx1GPxeMbGbFp8b9f+dUVHcKyKKGlQUs1Dp6N+EtWXTNgVGj74szX5pJ3voaCr
         uiGLc9U5E7Cune2VMAVnmxk9JlDDlOnLBa2gS3u/70NgOwL/Gfl4A0Dl5OSzHJVU6g9o
         fF78N1KzVG7WyCaczPPwZlfJV3NhJLQSlX802yvfd/eprhozWB/XZOHem17umF+EZCMF
         Su88tsYP/vPqLONFXC6wl20c7I8KWxxUMjgOftQOEtw4rA0xbLzN1iqa/KIyL/TH4G90
         JbfGqHwZIbqqHjLc8g+YD6fxBslNMg1FpA/uhvaxD3JqGX0uFwHOZWwG8YUwQ2sQUBBR
         tePg==
X-Gm-Message-State: AOAM533DBvjCC+qnUiBVVTx+5+ZE73mLibq+UVwUvJLs0rF5vOfjlUuQ
        GiR3TPpq/+AU/A7WvLlW0WK2S1f0hyznHno3
X-Google-Smtp-Source: ABdhPJxY9DkqxXQsHKgxJMC05bjZBAxx6CvmJ98+UShYdEPQMVKb99vgi2WaaVhG98qFwSt8Dz231r6OYnC9D/kf
Sender: "andreyknvl via sendgmr" <andreyknvl@andreyknvl3.muc.corp.google.com>
X-Received: from andreyknvl3.muc.corp.google.com ([2a00:79e0:15:13:7220:84ff:fe09:7e9d])
 (user=andreyknvl job=sendgmr) by 2002:a0c:c548:: with SMTP id
 y8mr19235733qvi.41.1602522640803; Mon, 12 Oct 2020 10:10:40 -0700 (PDT)
Date:   Mon, 12 Oct 2020 19:10:21 +0200
Message-Id: <c07a2deae7a75e394de272c1a33cfcc1f667af92.1602522185.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v2] kcov, usbip: collect coverage from vhci_rx_loop
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>
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
---

Changes v1->v2:
- Fix spacing issues.
- Add ifdef CONFIG_KCOV around kcov_handle in usbip_device struct.

---
 drivers/usb/usbip/usbip_common.h |  4 ++++
 drivers/usb/usbip/vhci_rx.c      |  3 +++
 drivers/usb/usbip/vhci_sysfs.c   | 12 +++++++-----
 3 files changed, 14 insertions(+), 5 deletions(-)

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
index 266024cbb64f..473f14587bd5 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2003-2008 Takahiro Hirofuchi
  */
 
+#include <linux/kcov.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
 
@@ -261,7 +262,9 @@ int vhci_rx_loop(void *data)
 		if (usbip_event_happened(ud))
 			break;
 
+		kcov_remote_start_common(ud->kcov_handle);
 		vhci_rx_pdu(ud);
+		kcov_remote_stop();
 	}
 
 	return 0;
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index be37aec250c2..966f1f5cafb1 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015-2016 Nobuo Iwata
  */
 
+#include <linux/kcov.h>
 #include <linux/kthread.h>
 #include <linux/file.h>
 #include <linux/net.h>
@@ -378,11 +379,12 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	dev_info(dev, "devid(%u) speed(%u) speed_str(%s)\n",
 		 devid, speed, usb_speed_string(speed));
 
-	vdev->devid         = devid;
-	vdev->speed         = speed;
-	vdev->ud.sockfd     = sockfd;
-	vdev->ud.tcp_socket = socket;
-	vdev->ud.status     = VDEV_ST_NOTASSIGNED;
+	vdev->devid          = devid;
+	vdev->speed          = speed;
+	vdev->ud.sockfd      = sockfd;
+	vdev->ud.tcp_socket  = socket;
+	vdev->ud.status      = VDEV_ST_NOTASSIGNED;
+	vdev->ud.kcov_handle = kcov_common_handle();
 
 	spin_unlock(&vdev->ud.lock);
 	spin_unlock_irqrestore(&vhci->lock, flags);
-- 
2.28.0.1011.ga647a8990f-goog

