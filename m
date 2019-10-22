Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949E9E0987
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 18:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389560AbfJVQqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 12:46:48 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:36862 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389555AbfJVQqs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 12:46:48 -0400
Received: by mail-vk1-f201.google.com with SMTP id q70so2404756vke.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xeTajp2gTwNneRzmHl8dZLgjRVR+or7Oc8/MveRSES4=;
        b=czPv6bG/woLawvFL6EeJ3IomrWe7WJLXIS8Q5s7BYzv4jeVZUhKcqUrBD6MHE4X3Wy
         gaVhDh9xU1/SIXHSLB3HhPMakMrFItvpEYLIRd8RhTeumsOEr/W5opNycN3wSNR5Nfq+
         8Uvg/NpAVip0msYuEOWDd/Xwyy3mpXkakREkO3YQmRdtrusv2aVekVFQ4qy0KchHUYZk
         +EJV75GDzrZF1ylqrZahxNQZVzB02D9UYp4RkPTJWVv8C3gzX45NJnepvMKF4XDAM3hC
         Al/gAJqFg/Q7YP5ygCC7hd/ANdsR33IrEuArt2jLW5EYKkKEipmUTt4vKFi6vvM+JTA0
         rQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xeTajp2gTwNneRzmHl8dZLgjRVR+or7Oc8/MveRSES4=;
        b=ZAMtLYUDG6YQ4VQ6kMVARibNWjVonYHFtTvLROlEx7ZL4VjoJz7vAfxNnnCawttsAt
         XY/wcWgOT5BnASGenNDqxDXmO4EFOuXXt7mwUySlviDJCfmbZAByFIo/GEEYIlDRH2gd
         IypMOB8ZUCI1bXn9nhMhSVSCGf1BAdy63FjhH+bQnMk0X5vK5dPoXOvlmzmAo6aiLFVu
         Ow3vsmawAP1VxenkzT17PgRP6Om7DEhZfQO8cwmcQDfU7fNPk/vzOOHURoGjn+twznw0
         NM/3dJycLxSwW3MsNd+ePUu05lIMtrO7MFvHLegnzYby7lHkzK6p+OTDCSuUiO55w1A7
         Ho3w==
X-Gm-Message-State: APjAAAWQBHIz3bRtfIpMF/K2o1V0S3BeoNp02IeBinRB1dgeiQ6xDu0j
        IyoMcRjVtlS4MTz7R6dO2BJKMAqU1IdreUh8iD2+BdiKDH63XID42Z1q/3nPN6+Tnq6WSFYkFOU
        iZo0xG2jQylIjOhiafP9S5zNsqD8jWubO7SGAz3pE2ImAJToGssf6/9kSO3BvK62j575d3YAhQg
        Yt
X-Google-Smtp-Source: APXvYqztA3K2JUb94+WtUgiu0B8Mrp7aoBsl8U36U8bVoUlttXs4+RNS1hzM4glUCN7mveu0ffdpO/JosmE95cWz
X-Received: by 2002:ab0:1896:: with SMTP id t22mr2506869uag.82.1571762807067;
 Tue, 22 Oct 2019 09:46:47 -0700 (PDT)
Date:   Tue, 22 Oct 2019 18:46:33 +0200
In-Reply-To: <cover.1571762488.git.andreyknvl@google.com>
Message-Id: <26e088ae3ebcaa30afe957aeabaa9f0c653df7d0.1571762488.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 3/3] vhost, kcov: collect coverage from vhost_worker
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

This patch adds kcov_remote_start()/kcov_remote_stop() annotations to the
vhost_worker() function, which is responsible for processing vhost works.
Since vhost_worker() threads are spawned per vhost device instance
the common kcov handle is used for kcov_remote_start()/stop() annotations
(see Documentation/dev-tools/kcov.rst for details). As the result kcov can
now be used to collect coverage from vhost worker threads.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/vhost/vhost.c | 6 ++++++
 drivers/vhost/vhost.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 36ca2cf419bf..a5a557c4b67f 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -30,6 +30,7 @@
 #include <linux/sched/signal.h>
 #include <linux/interval_tree_generic.h>
 #include <linux/nospec.h>
+#include <linux/kcov.h>
 
 #include "vhost.h"
 
@@ -357,7 +358,9 @@ static int vhost_worker(void *data)
 		llist_for_each_entry_safe(work, work_next, node, node) {
 			clear_bit(VHOST_WORK_QUEUED, &work->flags);
 			__set_current_state(TASK_RUNNING);
+			kcov_remote_start(dev->kcov_handle);
 			work->fn(work);
+			kcov_remote_stop();
 			if (need_resched())
 				schedule();
 		}
@@ -546,6 +549,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 
 	/* No owner, become one */
 	dev->mm = get_task_mm(current);
+	dev->kcov_handle = current->kcov_handle;
 	worker = kthread_create(vhost_worker, dev, "vhost-%d", current->pid);
 	if (IS_ERR(worker)) {
 		err = PTR_ERR(worker);
@@ -571,6 +575,7 @@ long vhost_dev_set_owner(struct vhost_dev *dev)
 	if (dev->mm)
 		mmput(dev->mm);
 	dev->mm = NULL;
+	dev->kcov_handle = 0;
 err_mm:
 	return err;
 }
@@ -682,6 +687,7 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
 	if (dev->worker) {
 		kthread_stop(dev->worker);
 		dev->worker = NULL;
+		dev->kcov_handle = 0;
 	}
 	if (dev->mm)
 		mmput(dev->mm);
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index e9ed2722b633..a123fd70847e 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -173,6 +173,7 @@ struct vhost_dev {
 	int iov_limit;
 	int weight;
 	int byte_weight;
+	u64 kcov_handle;
 };
 
 bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
-- 
2.23.0.866.gb869b98d4c-goog

