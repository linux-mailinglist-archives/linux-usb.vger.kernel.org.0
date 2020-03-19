Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA1A18C2C9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgCSWMA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:12:00 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:42584 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgCSWL7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:11:59 -0400
Received: by mail-vs1-f74.google.com with SMTP id r185so786666vsr.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ld+R5siiu+UwqEtDb2zf/maAwFxPn7jOV9EKhch9NhQ=;
        b=vi4yd//XT/ycSMaTNHQqhaOLWRGn33ZoH4GU+cE7Gp4hJydy8CkIKJ71fjfYqHiaoq
         3qyUHWxlOqDPc4jUzTgEvVFzYwBbk6sKcVhdkQVm8rP07jXijGRrptyfiDB5E0CLEg3J
         NGYp7tysmwQ3rGZWUTBaAn7OUHk+SgQ6WnUMN+F/qZG30yBCuQghffizGGc+rOo7s5SG
         3LQnqDXks6FYQspWrcYVuSZZNjULqkxKrR8/FgnnNjZwm0BzxrQvrHXc3oZDSybxhttw
         0LIuSRGeri1Et75dEh4xe6YlRaZoLSPuhZTR+aNNvKzLU+mMQ1yHzHsbsAdsPodMOK/O
         m9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ld+R5siiu+UwqEtDb2zf/maAwFxPn7jOV9EKhch9NhQ=;
        b=o6XHw83b0zonfBOKg7ZIAxAbOXkqqIaGuN16CY4Cqz3fIjEDTmNa8M7Tqi03Rdx+VU
         BFi3/69XM5TVeMLwMaFymg1rJ1xmvPYz2bXrBNFDHz+QBZzRn2ga15+J9XG4OTs+GLL2
         1kLlwUsaQauHCpCMJHIF+aFHKONQmD0itcSKsbrlpyqYGv/Zo+qxqat0ngk9kbvBcX0q
         YbFQFZomkgOmbvAGV43uHfkqf8f0tf8NBHeU0nYZWQStaD8uebBr0pG+Fjk2eaI+S+zE
         EGyCOugnn/YMQfZP+dPQaUQQWi8IMsl5ePqMSacXiPMynXRzMWU/S74lHZtnVODkl+72
         RP8w==
X-Gm-Message-State: ANhLgQ1C6C55MGEKLssLBkISNT5mnwOwJful0SxMroJ3F71EtiOgY83D
        25NPxyZ6ez1yf+YWvJ85P2YAf8Sa9JG5Itba
X-Google-Smtp-Source: ADFU+vv1mUpuq5PW/oJ6gSyaoeZD4m+C1EOIoJQygnrtzOhMLarXysTNKxk6+S5zvGfSBgotQugAPT6j//2vkVh3
X-Received: by 2002:a1f:640c:: with SMTP id y12mr4359974vkb.73.1584655916275;
 Thu, 19 Mar 2020 15:11:56 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:36 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <de0d3d30ff90776a2a509cc34c7c1c7521bda125.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 2/7] kcov: fix potential use-after-free in kcov_remote_start
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Andrey Konovalov <andreyknvl@gmail.com>

If vmalloc() fails in kcov_remote_start() we'll access remote->kcov
without holding kcov_remote_lock, so remote might potentially be freed
at that point. Cache kcov pointer in a local variable.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index f6bd119c9419..cc5900ac2467 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -748,6 +748,7 @@ static const struct file_operations kcov_fops = {
 void kcov_remote_start(u64 handle)
 {
 	struct kcov_remote *remote;
+	struct kcov *kcov;
 	void *area;
 	struct task_struct *t;
 	unsigned int size;
@@ -774,16 +775,17 @@ void kcov_remote_start(u64 handle)
 		spin_unlock(&kcov_remote_lock);
 		return;
 	}
+	kcov = remote->kcov;
 	/* Put in kcov_remote_stop(). */
-	kcov_get(remote->kcov);
-	t->kcov = remote->kcov;
+	kcov_get(kcov);
+	t->kcov = kcov;
 	/*
 	 * Read kcov fields before unlock to prevent races with
 	 * KCOV_DISABLE / kcov_remote_reset().
 	 */
-	size = remote->kcov->remote_size;
-	mode = remote->kcov->mode;
-	sequence = remote->kcov->sequence;
+	size = kcov->remote_size;
+	mode = kcov->mode;
+	sequence = kcov->sequence;
 	area = kcov_remote_area_get(size);
 	spin_unlock(&kcov_remote_lock);
 
@@ -791,7 +793,7 @@ void kcov_remote_start(u64 handle)
 		area = vmalloc(size * sizeof(unsigned long));
 		if (!area) {
 			t->kcov = NULL;
-			kcov_put(remote->kcov);
+			kcov_put(kcov);
 			return;
 		}
 	}
-- 
2.25.1.696.g5e7596f4ac-goog

