Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A73391853
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhEZNCk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbhEZNC3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:29 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE23C061343
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:56 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so460467wmk.1
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=STuRU/wuc0GUpuvMIUPILdBJPB0EkMi/MfUyTQ2qMVk=;
        b=miWQDZMe+7Q4YePFJAgOOrJb6nHoFfFg+iaqvugtF5BTrv2fZ9Tn3s0JE+X5SJsNjQ
         naYBKCPuEj+tqxappTCFq1JKLcbIhFEZV2wSbPk8n+23iZM5OqixbWjmhXBkh7Ph+qx2
         fkrXjGzUPRqzeVHapsb5XM7+1fEGuiLwQT4Fd/a44KzJLS+63zE6L5hrPY2wLOS3b/lh
         TF5CK18z2Z6HNJOrDENrncqjKsK3JF85in6xKMMdJsD1PAZc/nnQilVzGr3aHjRLsdaS
         vETo2DPbH+uDx2BYOkwJASUUdNiBJRplY5xf1+PlDDSrozSIEWPJOEf2NOp+4O4hZ7HV
         sLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=STuRU/wuc0GUpuvMIUPILdBJPB0EkMi/MfUyTQ2qMVk=;
        b=TCVGt6dphKflwsySfubSZlfI+CuzOHnvpttzMxS91JIgaZNT5x3xdjIjg6DsrHMc17
         mpAjglVSNFj7VmaqdkY+3oHiLlZCbeQzgs3YKYbySGL+vO83z66wDKnJ+SYi5jnTzQoB
         WwvVWCbwATxgnSKNj2piHSzCVyRV1J6UYCFBrTtiv1zVMidXBjnOkjTzn+H44AU6OoOv
         try++iiSn2g8zAOxwd+BNACIZc1w7kSw7fB24Y65+VadP37/rBjx4RBc1sA83+EkoshR
         VYHGTfJmPOJ8YKM/TPdOjqRHo+696xFG8J5HQxswSZxSMGK5HuRd7mhQmH1kWn4c3e6L
         +gRQ==
X-Gm-Message-State: AOAM5334m5teNIL2C67fZ98sO4vkEQ+msRNzAS377GCt7vnGzTPt+Af6
        xuuuVf0bloX4HOpFdT5zBO5Cpg==
X-Google-Smtp-Source: ABdhPJyD/0d1YxYV6SkKT4N+wRfvSN8hofhog+J5kCAgUXV6p2b8I6Dm5m1/nn+KjgGcQ7hMYUkizQ==
X-Received: by 2002:a7b:c943:: with SMTP id i3mr28099019wml.182.1622034054497;
        Wed, 26 May 2021 06:00:54 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 08/24] usb: cdns3: cdns3-ti: File headers are not good candidates for kernel-doc
Date:   Wed, 26 May 2021 14:00:21 +0100
Message-Id: <20210526130037.856068-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/cdns3/cdns3-ti.c:20: warning: expecting prototype for cdns3(). Prototype was for USBSS_PID() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/cdns3-ti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index eccb1c766bba5..07c3187703623 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * cdns3-ti.c - TI specific Glue layer for Cadence USB Controller
  *
  * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com
-- 
2.31.1

