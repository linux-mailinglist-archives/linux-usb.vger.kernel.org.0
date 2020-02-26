Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86AC91707F8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 19:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgBZSsW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 13:48:22 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:56129 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgBZSsV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 13:48:21 -0500
Received: by mail-wm1-f73.google.com with SMTP id p26so15217wmg.5
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2020 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=V/S5AKIJvKiSrpagse0M8LVn3gjInQdj5+INVxyxn2I=;
        b=tGJg3R31Zj0bw5T+Ojh2swhvw6fEuH8tx+JbbGhqjMHYK8aUl/oZEpua9K/FEXgpCA
         e6F/q0FmkqncBqL1s+jCkpDH5XL8nKftl87vwHvjmsyZdxlzmt+Uyt542I26E9czHULP
         zKLlzWW+PTLNcd2sOm1xaQwpw6/XY/wgZBEPgI2S1WzgUjSEIcRsAQfxUThDQldncdCA
         mdmnO0G4T5NgCYgQgbW2V2nGSYnLKhIHz1zZb63Aqmcxb3FAJUcCIxgStjFrOUlTNWp3
         C4Td3/t8NexkqdnI5Y6xr1Rgi3F8oBbVIclYvBHxxHKtup3pcGRnwcqNQeUT9t46bFn2
         FbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=V/S5AKIJvKiSrpagse0M8LVn3gjInQdj5+INVxyxn2I=;
        b=UO0ZqFy+pJf4nvLYp8MkyrSfa0wR6qNQetwbkmG6GNo1H4wpnuq3xMsFvTySXMwklO
         XfWCGAcVVgSwj7ibC6amVxp0K/x24iZg5z2C1DUEuAkaFoodTWJOpxnsIimRAf+hJJw3
         2pshdq/wodNZIctYM5C61STlcsLKIEkMkPLzWwuoYJpYGTM/M8aDlGYR5NLB+22pSH/4
         v0PsQPDWkNKiPZw28DywhvtSSu7n8VWKSHAzmZT0OPdiZt0o5OZqS3xIHVUfVUsXihmS
         Q4Z5amGO76ZNcWb21pH3ZuybSrpglHKdl0RCZ9fRjyGsYJSpV9D5RdWs2M12F3zWgYVO
         UflA==
X-Gm-Message-State: APjAAAVuORqYic7528weEF9RF9WsiEZxzzOJCp9/ahaQcRasFGbeHsEM
        zaenYkgl9LkttUGaJvuilJxGtxuD+4DJg0Ae
X-Google-Smtp-Source: APXvYqxnYIqu5RIPk3+vxEmo55GZWONPf+YbfenRNIMag/wlKvv9t8EPNFXq56EBLiPkam+Y1EHFdLGPDh2XpU+h
X-Received: by 2002:adf:fa05:: with SMTP id m5mr41963wrr.352.1582742896992;
 Wed, 26 Feb 2020 10:48:16 -0800 (PST)
Date:   Wed, 26 Feb 2020 19:48:07 +0100
In-Reply-To: <cover.1582742673.git.andreyknvl@google.com>
Message-Id: <126f4cc573d9335ce2296b0833ce7b6208b7c4f3.1582742673.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1582742673.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v1 1/3] kcov: cleanup debug messages
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previous commit left a lot of excessive debug messages, clean them up.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index f50354202dbe..f6bd119c9419 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -98,6 +98,7 @@ static struct kcov_remote *kcov_remote_find(u64 handle)
 	return NULL;
 }
 
+/* Must be called with kcov_remote_lock locked. */
 static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
 {
 	struct kcov_remote *remote;
@@ -119,16 +120,13 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
 	struct kcov_remote_area *area;
 	struct list_head *pos;
 
-	kcov_debug("size = %u\n", size);
 	list_for_each(pos, &kcov_remote_areas) {
 		area = list_entry(pos, struct kcov_remote_area, list);
 		if (area->size == size) {
 			list_del(&area->list);
-			kcov_debug("rv = %px\n", area);
 			return area;
 		}
 	}
-	kcov_debug("rv = NULL\n");
 	return NULL;
 }
 
@@ -136,7 +134,6 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
 static void kcov_remote_area_put(struct kcov_remote_area *area,
 					unsigned int size)
 {
-	kcov_debug("area = %px, size = %u\n", area, size);
 	INIT_LIST_HEAD(&area->list);
 	area->size = size;
 	list_add(&area->list, &kcov_remote_areas);
@@ -366,7 +363,6 @@ static void kcov_remote_reset(struct kcov *kcov)
 	hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
 		if (remote->kcov != kcov)
 			continue;
-		kcov_debug("removing handle %llx\n", remote->handle);
 		hash_del(&remote->hnode);
 		kfree(remote);
 	}
@@ -553,7 +549,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 
 	switch (cmd) {
 	case KCOV_INIT_TRACE:
-		kcov_debug("KCOV_INIT_TRACE\n");
 		/*
 		 * Enable kcov in trace mode and setup buffer size.
 		 * Must happen before anything else.
@@ -572,7 +567,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov->mode = KCOV_MODE_INIT;
 		return 0;
 	case KCOV_ENABLE:
-		kcov_debug("KCOV_ENABLE\n");
 		/*
 		 * Enable coverage for the current task.
 		 * At this point user must have been enabled trace mode,
@@ -598,7 +592,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov_get(kcov);
 		return 0;
 	case KCOV_DISABLE:
-		kcov_debug("KCOV_DISABLE\n");
 		/* Disable coverage for the current task. */
 		unused = arg;
 		if (unused != 0 || current->kcov != kcov)
@@ -610,7 +603,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov_put(kcov);
 		return 0;
 	case KCOV_REMOTE_ENABLE:
-		kcov_debug("KCOV_REMOTE_ENABLE\n");
 		if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
 			return -EINVAL;
 		t = current;
@@ -629,7 +621,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov->remote_size = remote_arg->area_size;
 		spin_lock(&kcov_remote_lock);
 		for (i = 0; i < remote_arg->num_handles; i++) {
-			kcov_debug("handle %llx\n", remote_arg->handles[i]);
 			if (!kcov_check_handle(remote_arg->handles[i],
 						false, true, false)) {
 				spin_unlock(&kcov_remote_lock);
@@ -644,8 +635,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			}
 		}
 		if (remote_arg->common_handle) {
-			kcov_debug("common handle %llx\n",
-					remote_arg->common_handle);
 			if (!kcov_check_handle(remote_arg->common_handle,
 						true, false, false)) {
 				spin_unlock(&kcov_remote_lock);
@@ -782,7 +771,6 @@ void kcov_remote_start(u64 handle)
 	spin_lock(&kcov_remote_lock);
 	remote = kcov_remote_find(handle);
 	if (!remote) {
-		kcov_debug("no remote found");
 		spin_unlock(&kcov_remote_lock);
 		return;
 	}
@@ -810,8 +798,6 @@ void kcov_remote_start(u64 handle)
 	/* Reset coverage size. */
 	*(u64 *)area = 0;
 
-	kcov_debug("area = %px, size = %u", area, size);
-
 	kcov_start(t, size, area, mode, sequence);
 
 }
@@ -881,10 +867,8 @@ void kcov_remote_stop(void)
 	unsigned int size = t->kcov_size;
 	int sequence = t->kcov_sequence;
 
-	if (!kcov) {
-		kcov_debug("no kcov found\n");
+	if (!kcov)
 		return;
-	}
 
 	kcov_stop(t);
 	t->kcov = NULL;
@@ -894,8 +878,6 @@ void kcov_remote_stop(void)
 	 * KCOV_DISABLE could have been called between kcov_remote_start()
 	 * and kcov_remote_stop(), hence the check.
 	 */
-	kcov_debug("move if: %d == %d && %d\n",
-		sequence, kcov->sequence, (int)kcov->remote);
 	if (sequence == kcov->sequence && kcov->remote)
 		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
 	spin_unlock(&kcov->lock);
-- 
2.25.1.481.gfbce0eb801-goog

