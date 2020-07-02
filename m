Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E139B2126A2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgGBOqy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730007AbgGBOqw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:52 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CADC08C5DE
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:51 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so28805305wrv.9
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2ZbcYjJZjZ17aCzzB/muazXcgiT4k+gU+MxkZwfWa8=;
        b=Mq1Q5i/AEO457zmTrv+POuxnGzOAe+6/nY9A5cmZtvfowIplFqpV1Eke6o1PXZdyi6
         VJNNLYPpwyhWZlYftQRTK49825KmLFsYZ5p8sohqPXDFA1DByoIbH7eMh2WdHrbZHk4a
         tUrM5lieL0qZWrljuF0MFtiyYIIgD0lEYfkh90NWOfpwpubQITmjvwsPJTyovuFg6ZLi
         geCvUfUGEhMmASDmyzzSvlUfJO//nZLj45kN6iVv6QAtcOo9cBt3Kp5viFUQj8cXEb+Z
         mw00++JZLQ1CQr9sHz5dLhc3zIELZJdfkdmgGOGRamyf0zqOn5oU+GPnyIQfEx9uddeM
         JIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2ZbcYjJZjZ17aCzzB/muazXcgiT4k+gU+MxkZwfWa8=;
        b=GuqwP1jSMHjImrFjojvZyxSAlnZpkeOrCbRk+16NGCrPyNAXxPaFLwVlvoFwo8FiAb
         78FYVOTKw83zs91t7S9mj2sbDuNzrarSjcXSDtz8HVMjZjEZL6ziEmKwzVXD0cqojGrh
         yjsgiLo5KTeiJtoLjwQqL25yhdOEgHuu09XTKfbUZyT9otivOQ0o+v7Ht2HoRPeOgred
         zUq77sVu6DDSaSl8Y3+vQeUFMTGVVb9xetu63eB5xItBgHXJrq4Jah38u4qby1zjN38B
         QnujcwNERo8g8LG5oLCLgKIngIarvf8FGXYtY4oQq+QRHw4IeHu7RrM8cPGJ+NngV8cX
         SJMQ==
X-Gm-Message-State: AOAM530MKLkl3PVvkEO0YvJEi+XjzPq8ROdBaGXQQZFU0GlmA8MbNOrU
        Piwgj26rNE/8ctxTA9Zfv/eT9Q==
X-Google-Smtp-Source: ABdhPJzL8QUTzwy3oMlhA58n2PXE6vG/UgMbPHNq/o/+zK/18O97nXXvR9OcedR0UNxfobMNkjoqDw==
X-Received: by 2002:adf:f445:: with SMTP id f5mr32588597wrp.339.1593701210450;
        Thu, 02 Jul 2020 07:46:50 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <thinhn@synopsys.com>,
        John Youn <johnyoun@synopsys.com>
Subject: [PATCH 15/30] usb: dwc3: dwc3-haps: Function headers are not suitable for kerneldoc
Date:   Thu,  2 Jul 2020 15:46:10 +0100
Message-Id: <20200702144625.2533530-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warnings:

 drivers/usb/dwc3/dwc3-haps.c:19: warning: Incorrect use of kernel-doc format:  * struct dwc3_haps - Driver private structure
 drivers/usb/dwc3/dwc3-haps.c:23: warning: cannot understand function prototype: 'struct dwc3_haps '

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: John Youn <johnyoun@synopsys.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-haps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-haps.c b/drivers/usb/dwc3/dwc3-haps.c
index 3cecbf1694526..55b4a901168e8 100644
--- a/drivers/usb/dwc3/dwc3-haps.c
+++ b/drivers/usb/dwc3/dwc3-haps.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-haps.c - Synopsys HAPS PCI Specific glue layer
  *
  * Copyright (C) 2018 Synopsys, Inc.
-- 
2.25.1

