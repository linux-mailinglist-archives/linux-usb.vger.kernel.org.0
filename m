Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062D344E426
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 10:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhKLJxI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 04:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbhKLJxD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 04:53:03 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB73C061766
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 01:50:13 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id o4so8021425pfp.13
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=njAq5GrzYdks3ZjJ9H84cWrv6/PvH/rcqrJCep4JdYI=;
        b=JG7rSUh6eCHtzaJGmBli5/7rJn6qoDl5CQgtpcmQYRf82L6rC4qyMCsgwQnq/EqMQd
         roHHbopFOxR0bzb1TMK6UFSZk43teeuFferUi9N17TmgJSGC2iGg3O7HWRvzvDQST5FP
         DsYDkYt4pInjJELapl5VKdti5qJGCgJc2yGqXS7E1gsNYFQTtYffA6w1mYhcmKerrce7
         AkBOYSqRVrPA9hLtKYaTpj5D+53Pa/tgdCDTvFtOuxg1b6BYFeTjdT/UJ3lSycGkjFwR
         tafQg+fYzIBt9tc9NLi06pZ9LM7L8Skw87RwNkgIeMQRlHTJ1/y4cPn8/mq0z5h0ow9+
         iXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=njAq5GrzYdks3ZjJ9H84cWrv6/PvH/rcqrJCep4JdYI=;
        b=dsuXFu+AhM97WjGntC50DgjJa6pkxB0KC0KmYLmj5t4iNzgY/RosyUIBNE28nMfTts
         EvkpGRdkiH3D3D+3nVeGHXXvaqK8X6cxHf8jxAM+ze5XeC93rK9QTSma28ZVITD6a7xa
         kKSY7IibOf2IL9TYStZ6VnPwY+tRU68Enov6ccdW0m5IbzY63t5+EkGCjbUEo7VmDS7o
         RaLL/SWe0P3BCT6MLfPRCOuGBjXqiqxRwqMyi+a/YFCHN2DTSs7MhlrvalPwZn2ISg9x
         yiq+JYMk/eyLzKQZl6ZiIvzB2cCDi15AOx6NgdbMKhjtd3vGJE0cLSLs1D/q2x1Rff4F
         O7nQ==
X-Gm-Message-State: AOAM531nK6y9oRv4YUdqL0Jk5kRyVNjNUsf46oyQe3OM/XZo+uJsyKE7
        JVQ3FVledAIvv6wkynf/M9kWyaksZw8=
X-Google-Smtp-Source: ABdhPJyQxed3NmrSMai3v41PUpMN4ICW4SWw63JPh/VbCrVKuR/WTVxMZ8goaND3/5FuAf1ZQWF8+A==
X-Received: by 2002:a05:6a00:2351:b0:47b:d092:d2e4 with SMTP id j17-20020a056a00235100b0047bd092d2e4mr12399225pfj.76.1636710612892;
        Fri, 12 Nov 2021 01:50:12 -0800 (PST)
Received: from ELIJAHBAI-MB0.tencent.com ([103.7.29.31])
        by smtp.gmail.com with ESMTPSA id a11sm5700429pfh.108.2021.11.12.01.50.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 01:50:12 -0800 (PST)
From:   Haimin Zhang <tcs.kernel@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Haimin Zhang <tcs.kernel@gmail.com>,
        TCS Robot <tcs_robot@tencent.com>
Subject: [PATCH v3] USB: ehci_brcm_hub_control: improve port index sanitizing
Date:   Fri, 12 Nov 2021 17:49:21 +0800
Message-Id: <20211112094921.90496-1-tcs.kernel@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
can cause array index to be out of bounds since the size of array
port_status is 0xf. Using macro function HCS_N_PORTS() can return
a valid index less than 15. Macro function HCS_N_PORTS() is used
to obtain a valid port index by logical AND 0xf.

Reported-by: TCS Robot <tcs_robot@tencent.com>
Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
---
 drivers/usb/host/ehci-brcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index d3626bfa966b..d2bf7768349c 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -62,8 +62,11 @@ static int ehci_brcm_hub_control(
 	u32 __iomem	*status_reg;
 	unsigned long flags;
 	int retval, irq_disabled = 0;
+	u32 temp;
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	temp = (wIndex & 0xff) - 1;
+	temp = HCS_N_PORTS(temp);
+	status_reg = &ehci->regs->port_status[temp];
 
 	/*
 	 * RESUME is cleared when GetPortStatus() is called 20ms after start
-- 
2.30.1 (Apple Git-130)

