Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D492DB3AB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 19:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436904AbfJQRod (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 13:44:33 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:39673 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436714AbfJQRob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 13:44:31 -0400
Received: by mail-wr1-f73.google.com with SMTP id j14so1038786wrm.6
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2019 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DZyz5ifI341bXtuxQKpF9qIDEXiA9LUCP3qLu12KvmI=;
        b=rDCONwuGL9P/UjsBrRTvqq4TgaTmw0JEo3OY3q/6WL+pk/uigSe3SL+epvmUJXHWOw
         ivTZfPGKIDlx0EJn0Hy/yOoijYg+0K9rgA1mGUUaCTXhMBuIz3E4pQv4Io6pwdQtpsHY
         E5931ZpIiE4s7MJhbSraBFa1126ts0ujrXQJeXupw/QoCkgE8GlJCOaDc1DbZid4roP9
         /7tYjDAD27kYK7kAxIdvh85LhQbCvUwYPXZDG+Qltrcd0EgaEF7ZrG8QRC9gpP0rDVWT
         hz+R8liNNfnbZjhTfD8gdghobnJbzydh2gVwx+rkM5Y570nwG7vvWCcDamkj0rR/Lq65
         5K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DZyz5ifI341bXtuxQKpF9qIDEXiA9LUCP3qLu12KvmI=;
        b=dZRykd0QsDmtLCjycrf54c6noL36yGLKJ/5VUDQRxoZAXp/XoOhO/ztcqHdWxgdi6s
         TGOOFGlf6R4+DE+b4BLDgwFZUbqi/ZW3XO5lNp9+ZvG1vu8kUwBBDixCSN1NwDYgT5+U
         fuycGKJxt7hZpo4mmDgu4/6hdO3Rz59frE2c9c/RELmxOyZ6WkpHH6MtFCN5w8nlkQW7
         0j8FWBe5X2Mrp1gf8+xfS0nxDEvh9JD3+y6a4vCGwwPWKWgV7VEkZ2BlVGH62e4cto8s
         DSRd/Sv/vVOsxytOoE1E39nBfX57VkEjA4RJM2oTz+TUWE7cmJTjpQvGMswg9rCX5tAm
         7KfQ==
X-Gm-Message-State: APjAAAVg9faS2/fh5VoJ/nMFzTeW8BDb0wy5b49d+rxVdic4ovUSsx+w
        a7h+j16PbD6LCTV5sJEo9BtCG6uRLBfcyWsk+hBDcWMVozR47vyza8+3FXuij4Z18COb2ukSlVh
        pyLvXtqglksKPf2skoPi5vsbH4YdOBAvsitkOTcG1WYc6xOu08m8+3BK2d99/TzOI9zZ5GAB91U
        cD
X-Google-Smtp-Source: APXvYqyQfzmOGIC6uE4UWoekhXejv7paAyEONnZV9FBZpte7RHsOxbLKwJiyn7qvRZmdNM6/kofHt4VnE4gL2e+C
X-Received: by 2002:adf:ee10:: with SMTP id y16mr4077481wrn.67.1571334268533;
 Thu, 17 Oct 2019 10:44:28 -0700 (PDT)
Date:   Thu, 17 Oct 2019 19:44:15 +0200
In-Reply-To: <cover.1571333592.git.andreyknvl@google.com>
Message-Id: <af26317c0efd412dd660e81d548a173942f8a0ad.1571333592.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571333592.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH RFC 3/3] vhost, kcov: collect coverage from vhost_worker
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds kcov_remote_start/kcov_remote_stop annotations to the
vhost_worker function, which is responsible for processing vhost works.
Since vhost_worker is spawned when a vhost device instance is created,
the common kcov handle is used for kcov_remote_start/stop annotations.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/vhost/vhost.c | 15 +++++++++++++++
 drivers/vhost/vhost.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 36ca2cf419bf..71a349f6b352 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -357,7 +357,13 @@ static int vhost_worker(void *data)
 		llist_for_each_entry_safe(work, work_next, node, node) {
 			clear_bit(VHOST_WORK_QUEUED, &work->flags);
 			__set_current_state(TASK_RUNNING);
+#ifdef CONFIG_KCOV
+			kcov_remote_start(dev->kcov_handle);
+#endif
 			work->fn(work);
+#ifdef CONFIG_KCOV
+			kcov_remote_stop();
+#endif
 			if (need_resched())
 				schedule();
 		}
@@ -546,6 +552,9 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 
 	/* No owner, become one */
 	dev->mm = get_task_mm(current);
+#ifdef CONFIG_KCOV
+	dev->kcov_handle = current->kcov_handle;
+#endif
 	worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
 	if (IS_ERR(worker)) {
 		err = PTR_ERR(worker);
@@ -571,6 +580,9 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 	if (dev->mm)
 		mmput(dev->mm);
 	dev->mm = NULL;
+#ifdef CONFIG_KCOV
+	dev->kcov_handle = 0;
+#endif
 err_mm:
 	return err;
 }
@@ -682,6 +694,9 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
 	if (dev->worker) {
 		kthread_stop(dev->worker);
 		dev->worker = NULL;
+#ifdef CONFIG_KCOV
+		dev->kcov_handle = 0;
+#endif
 	}
 	if (dev->mm)
 		mmput(dev->mm);
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e9ed2722b633..010ca1ebcbd5 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -173,6 +173,9 @@ struct vhost_dev {
 	int iov_limit;
 	int weight;
 	int byte_weight;
+#ifdef CONFIG_KCOV
+	u64 kcov_handle;
+#endif
 };
 
 bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
-- 
2.23.0.866.gb869b98d4c-goog

