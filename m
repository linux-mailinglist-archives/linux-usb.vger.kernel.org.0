Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5092126D7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgGBOsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbgGBOqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:55 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFCCC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:55 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so27094515wmi.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q4kYzyJe5IJIPm+2pVeTWhp4LWY4nTSN2jwPRXyKK/c=;
        b=jf+GDNuw24S8MDfhaAVNwZXkrg1WDtofP+3iJe5sA0+vgI0gkrFHVhSYk/6HllOiVO
         Ogiu/OEUPY4wl21b+73cOVa9pgC+B1jruUS0HZbLT0d695vLi59oMMCrP9ZC8yy4KPD8
         J+mi1tiET8cgM8mB12akEX7WtmQZL2JgfPidAkvTPgFsvOE4+DGK94VcU01avDwQAKSD
         NjGjUX60Oc0iXDGfu6dWs+W3xS7gnMDe0r7uErqsQZ7wkNRBP+HjjdcSgkiqR6HZSPBR
         3CqWyn34qo2Ds5IquhTp1av8xwAhVkJH0PCQMV4+vSshOPHnlIZPZxYbIvU7/L9KEXGB
         Dh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q4kYzyJe5IJIPm+2pVeTWhp4LWY4nTSN2jwPRXyKK/c=;
        b=msMI7x5Y5+AiyVm4uW/P64MCWUGVrZr+emcAG1wMYlbYDLeTy7jctOOBbLeKRY/7F4
         iZCNgI33cG1AQVaM377Eo67P41b+6Rbe3FlhAkc3EmdzdFATIdOVNxcqeoLyCRf6wnUd
         E/su+tBkNzcrWoYa2KBBMUS/Kmqc54IJyOQxC5JoYN9ia3B07LvsgnTQDfIBoE7Iz3mJ
         zvDsm3KtZWbN9FP28aQP/v5lemdJyjoBYwESwv8LXSOgnWktYAtUVGea+7uXrpMfRaft
         f5JOc7ML8vMIDnjsHcAXRiEp4a9LnKWCJgNXfUbCAJ3dLfvAOshMlOC0osKw4etZh1Q4
         whLg==
X-Gm-Message-State: AOAM530RRa4vCysatd44Gzj6MfR6Td3mLyj17ROp9/p9Sr78JctNyWok
        SeOZXvUniwotFWP39ImMxgXV4w==
X-Google-Smtp-Source: ABdhPJzKWcwz3CXZ7XAFguZ3yiChvSKr4c3GX8lltWc46Aa1c+pUtV0QNX3B9BnRdrqRx/NiRlbyMw==
X-Received: by 2002:a1c:2ec7:: with SMTP id u190mr31447520wmu.48.1593701214352;
        Thu, 02 Jul 2020 07:46:54 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:53 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, iivanov@mm-sol.com,
        Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: [PATCH 18/30] usb: dwc3: dwc3-of-simple: Function headers are not good candidates for kerneldoc
Date:   Thu,  2 Jul 2020 15:46:13 +0100
Message-Id: <20200702144625.2533530-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following kernel build warning(s):

 drivers/usb/dwc3/dwc3-of-simple.c:25: warning: cannot understand function prototype: 'struct dwc3_of_simple '

Cc: Felipe Balbi <balbi@kernel.org>
Cc: iivanov@mm-sol.com
Cc: Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 8852fbfdead4e..34c828c221977 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-of-simple.c - OF glue layer for simple integrations
  *
  * Copyright (c) 2015 Texas Instruments Incorporated - http://www.ti.com
-- 
2.25.1

