Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AD3391851
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhEZNCd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234814AbhEZNCZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:25 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE55C06175F
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:53 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so459258wmg.3
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jB1Di/AfofpCu9RhowXJK+PZPPiB12GqSTdmHK1d9Gs=;
        b=XueaPXDzGT/uaui/1XGPYO40JEvM+f5xhaJSj0qWULREhRiPfOsWIJTIqeJu/+79LE
         /JvmnSQQ4nkjsvzcvpVFKjk6e/x/pp4f2tv6PDdK/8Q3gDx7Y0z9S02MqrMSC7qR4Zuu
         bfjvNHfdYI5g7Fi4s9Dq5JP6gL+I/cQaSWp+kKqlf7vuGcLcJ7GraAcPSfuNxSxKjAP+
         DJWPvvkZgdJyt8GmEZDBvQ8oNB8yR9NEv/e8MeC0ikxtnzEbVy4bd0mYWFTCxxJg9T4K
         aDDS8pvPrsJfP4ZEvrBRTqDge8IP95Cm2z2KLK3DUArmyFq5X+EcEr5DqmDn0Lj3hIPf
         YzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jB1Di/AfofpCu9RhowXJK+PZPPiB12GqSTdmHK1d9Gs=;
        b=FVRM8kRYVqry0gSFu0ZVkd11Xn+VAP2xklzdczWZu911S5brlH/8nz3In0xv9/jcfG
         0I5f+DXIfLlEwurH1VL4mq65kGfB6GWCIsuCVZididRh78Hgql17FCbLDq+5Nj4VF3Wj
         B6V/xL2qd+R5AUbNJGz11WkbpW/RUvoT8FwSHCGhpu3Gc0IVkeJ04ARRJLdKdswRAs2A
         xq115Dxhrli9Uy2r0tqroNZTiUEWi3AZ5tcg80XWDuOlF0f+OOjNDCDTgWDSmd5eze92
         pog9Y6ctNAZ9Wdt8jH4E8ldjDP/h3kZcR0usG7PVn/+/6G4vN+PMZuQ1JTbDKn+DMwq/
         hlsw==
X-Gm-Message-State: AOAM531PTelEu49EkXR38aJhWDdri1mD4rVcKUMMdD0/ITuYHuDsdWXD
        /jGt2et65E/gRnVp2arphGJ2Pgd+GDe32w==
X-Google-Smtp-Source: ABdhPJxSOO9StGRuudmQN9i7ChF2W6rcnS4woOgbTYoScVCLCvoBk+w9nBv1Dqd1JhymAQ/M/CDreg==
X-Received: by 2002:a05:600c:3542:: with SMTP id i2mr26506996wmq.124.1622034051442;
        Wed, 26 May 2021 06:00:51 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:50 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 05/24] usb: dwc2: params: Fix naming of 'dwc2_get_hwparams()' in the docs
Date:   Wed, 26 May 2021 14:00:18 +0100
Message-Id: <20210526130037.856068-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc2/params.c:787: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 7a6089fa81e1d..67c5eb1402325 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -784,8 +784,8 @@ static void dwc2_get_dev_hwparams(struct dwc2_hsotg *hsotg)
 }
 
 /**
- * During device initialization, read various hardware configuration
- * registers and interpret the contents.
+ * dwc2_get_hwparams() - During device initialization, read various hardware
+ *                       configuration registers and interpret the contents.
  *
  * @hsotg: Programming view of the DWC_otg controller
  *
-- 
2.31.1

