Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0309E2126B4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgGBOrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730075AbgGBOrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:47:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43518C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:47:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o2so28288136wmh.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cen7jwZ+l5/fZQV9+f4eKCsdCtb++xjGqhYwjDReG4s=;
        b=wAQqKXwNUvkayHtIMBV6LS0l4vt72aFTjRZSPiSvZJ5C/hqTBy3STN6t0PpK9LZ9Sl
         Lb2UEfzaiMVbpQgMEOWrkp/dkAtB7fHH/UdXXaH4Bf/pD65LBDmzIoAElaEn6uRbkhsr
         Sq6KZ9fmigZNrcfwKtfJpaz/LqAUX/icEFbG3MXXNaTW9OxviX1QsPqnDatS1kMepeKS
         ppuFUZVk6RIA9kGXBgwQV83qvsCFqp560ZzvnuFh2RPn028KWAA/WSY3RrZ3P7YNx2HP
         rVxY/LyhKyYUKA1wHnrnUWETqAHP/uHelYufgGMcwMsaC+Gn9/8D884fgDtbffl5wEIf
         Db4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cen7jwZ+l5/fZQV9+f4eKCsdCtb++xjGqhYwjDReG4s=;
        b=TKpRkFSl8iyiX9sBu2zqp1GcZR8M7JIKHMb8Qc56lIfSkPG5jCouS0VH3ZpOLp4mtS
         HH32XyTzaXZ8BBpg/aNtRApyEHGh7nqUrr9Q1jVpTc4G5aBISh9AriT+SqHAPGC88GZZ
         2AjMXavUFod2vlWeJFWSevCDDMnGjttJLVg9oJIDO+/sVAeQv1+aKGOSJXTLuQDV5mA0
         6TBzEN6LfD2NkPQ7zUK7dY8tz7ZRUyyOjhJfPrQg9dtOJHzpwVm6vBnEY9Bl9AAd7RDN
         9+DUPbDoLYnLXXPqPxECN2kr0WftYnD31LSUMl5A7u5cECP3VLvuv9f71onPlkKkoRym
         rXTA==
X-Gm-Message-State: AOAM5317qjD9qCPpkTDrIbVVGNZi7LraBrdSI3lmXIae8YDuiwhFcvJj
        UNi/QjSjJvvnKu8JZbvXYI5ASQ==
X-Google-Smtp-Source: ABdhPJyKXHl2Fi+reKwJfYF/na/idnzE4RoZeL56RxRf05pfTe+1N4F2X4OdO6C8BsdOK8Y+xUFvgg==
X-Received: by 2002:a1c:4b09:: with SMTP id y9mr18364006wma.46.1593701221058;
        Thu, 02 Jul 2020 07:47:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:47:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 24/30] usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h include file
Date:   Thu,  2 Jul 2020 15:46:19 +0100
Message-Id: <20200702144625.2533530-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the header file containing a function's prototype isn't included by
the sourcefile containing the associated function, the build system
complains of missing prototypes.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/mtu3/mtu3_trace.c:13:6: warning: no previous prototype for ‘mtu3_dbg_trace’ [-Wmissing-prototypes]
 13 | void mtu3_dbg_trace(struct device *dev, const char *fmt, ...)
 | ^~~~~~~~~~~~~~

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/mtu3/mtu3_trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_trace.c b/drivers/usb/mtu3/mtu3_trace.c
index 155eae126e5e2..d17ddb87cdcf2 100644
--- a/drivers/usb/mtu3/mtu3_trace.c
+++ b/drivers/usb/mtu3/mtu3_trace.c
@@ -8,6 +8,7 @@
  */
 
 #define CREATE_TRACE_POINTS
+#include "mtu3_debug.h"
 #include "mtu3_trace.h"
 
 void mtu3_dbg_trace(struct device *dev, const char *fmt, ...)
-- 
2.25.1

