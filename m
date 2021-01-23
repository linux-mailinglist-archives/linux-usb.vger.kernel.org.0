Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB0C3017FA
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jan 2021 20:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAWTPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jan 2021 14:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhAWTPC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jan 2021 14:15:02 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF625C0613D6
        for <linux-usb@vger.kernel.org>; Sat, 23 Jan 2021 11:14:21 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id k64so4056763wmb.6
        for <linux-usb@vger.kernel.org>; Sat, 23 Jan 2021 11:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=1tT/2NhnZdOVcutJmLjp1iNFuHgMkDUigSCR8CwAFhA=;
        b=F+ERoxSNmzG/xNWymNaC8pCMtkrqVAAT+FQVgCLSuAhOZxbMDZkDTe7h+YjEKrNQ6J
         CUrslJ6s/cRtl5d3foFfJUbjn+SjiEWtFaIa6rOvcaRlNhw6x0zSvVHxUrJ0W1xlcoyu
         5KDqqvzgr9H1N86qdDnqGFipFSavTtAiYBJxLNIg1J/1THfDRMlHsiagrjQm2VDRsS9w
         aSfuPmuCrWgrnv6FP6jUTqVkwIitoMy60AOyHwt+oKKhCZjCfmUZeS+iCSVGxgkG62G5
         s/lIypSurQGRTZ32k803QxDt37U5Ga3P6ASUIh+YBWOuTtIZHzvskQL2D0U7P1SkdtL6
         /rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=1tT/2NhnZdOVcutJmLjp1iNFuHgMkDUigSCR8CwAFhA=;
        b=LRD2bwNu28RGuI7LMaM+Unnk9B5jiT/BeHWnJMF4c9VU0zQ6iyw9teSqC8iC3dBrHf
         GXkezRnQ5lICMCcPRX8U42M2oS+8yKQtXeh5XZOgNE11Hc9Tmbkjz0pd1omUUwH+cfB7
         SYjszvq5DpefTAgk9tAVrUHr3pJ5V386XR8pGCvxV+ks6Tsx2i1HE2oBpX3egTnsiNB+
         WH3J0Z0ZGM1tpLvdlJruTtL25dTTWXwoOqIrr/MxGv4+G7XN1qCbk6+R0OyLI2UT3omN
         P4qlIKtpY6uqLKjZsEc/I8AUm37n9onjQjENXL1EyF9u8+GdeEVm5OVht3TfOJw5ZSlZ
         Xixg==
X-Gm-Message-State: AOAM531IOQzCP69ieYfImLqUFSzz9nw7LqCKmGrTlQHmRIZu8X7axNCz
        WqCy4FZ1VerRJFFT6xgy6yhDK/XmMbORs+9G
X-Google-Smtp-Source: ABdhPJxlAJcX8gXNyFFzd5OUUwolPvvf2WpG36gtkJzEVyspfS/eG8aQpVbAE6A9UFbflYixO9jfydMY/EdswOWB
Sender: "andreyknvl via sendgmr" <andreyknvl@andreyknvl3.muc.corp.google.com>
X-Received: from andreyknvl3.muc.corp.google.com ([2a00:79e0:15:13:7220:84ff:fe09:7e9d])
 (user=andreyknvl job=sendgmr) by 2002:adf:a11d:: with SMTP id
 o29mr10192094wro.45.1611429260195; Sat, 23 Jan 2021 11:14:20 -0800 (PST)
Date:   Sat, 23 Jan 2021 20:14:16 +0100
Message-Id: <c8937266c4a5da073ac81cd471b18d869c984dfe.1611429174.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 1/2] usb: raw-gadget: add copyright
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add copyright to drivers/usb/gadget/legacy/raw_gadget.c.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 062dfac30399..c5a2c734234a 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -3,7 +3,8 @@
  * USB Raw Gadget driver.
  * See Documentation/usb/raw-gadget.rst for more details.
  *
- * Andrey Konovalov <andreyknvl@gmail.com>
+ * Copyright (c) 2020 Google, Inc.
+ * Author: Andrey Konovalov <andreyknvl@gmail.com>
  */
 
 #include <linux/compiler.h>
-- 
2.30.0.280.ga3ce27912f-goog

