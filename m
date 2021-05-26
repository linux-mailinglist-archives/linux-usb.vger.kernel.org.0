Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F8039184C
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbhEZNCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhEZNCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9177FC06175F
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:49 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d11so1028217wrw.8
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TkkM0jDN7On5m0is/63l4FwWkD1XQ6PSlPPlgMZBOWY=;
        b=XZwmb2jY0GrP8+o7CoC5/5jswstErQrpabfm/cYlUioK4aypXH3/AW4kiZ/88qfHdm
         50iSumAgfSHJ1+99krf3QkOWgtOQq4lJWRPohL/yFP4ZG8i8o7o5SIQlWjZPdjSJgSnf
         tts7d/dnJLcww1R94QDa6MLP4VBHE8hQvWe9LI50rnmuFP3rPRvGtZVeU+2e3Xxojo+t
         8WcwN3qF8l6rrl4bgV24uZPDNTf/9MBPnuZEO/tWPG8AzkFK3Tl8c2UMX8tQotnX1KKr
         wUpG/4RvMnIaZ6xMuI9RbO1+7F2QpBZ54ARFEUQVasl1Dx6jQ5wPxC+BCCcZyu3eRHgT
         ZuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkkM0jDN7On5m0is/63l4FwWkD1XQ6PSlPPlgMZBOWY=;
        b=kCyJh6bk9+ZIoH10Nu3Q9IVm9hwJ4KfkZYF6fusOUtYw6x5OD7xKAQqs5rHqqKnMVs
         RUnzKgMhQd8rQZl6en40WkJKTa3J55CZnkZVKlg6XVfMjv6oFV+evp1yROHDhyDg9LGI
         6q/2g2NRpfrv2zgsM0X1PsT/iuT1cRsakTDfnspTk/xanEfZc7KY7kPvp3gu7RlBxjbz
         BjgYiom0FcvEbXBXSp2D52ajHKQ0U/BOYetAb/j9ffClOVZ9z2yQBQHf4ssJtzFne18b
         gDRRaDvyMEn9MQ2EBcsJ5Rcs0Ig4fHTvzj55SM5zcYmPJFyBkVCdw7eAOMkqOmOaqfLh
         40hw==
X-Gm-Message-State: AOAM533TJKGx2ScTg6aCcwOSLbg3DsiDy/iIcFwIHkQ0x9UdjpShnDEW
        b5E6s+s2Zneu0CHrXa8k867jWA==
X-Google-Smtp-Source: ABdhPJzzwJI6Kuf7CICgHAvH50QQxCl1j6KlpuzOCkBlRKVHA6rTtlP56vhDK1Y98J3SUH2FMuELJA==
X-Received: by 2002:adf:e411:: with SMTP id g17mr32216745wrm.402.1622034048238;
        Wed, 26 May 2021 06:00:48 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:47 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthijs Kooijman <matthijs@stdin.nl>,
        linux-usb@vger.kernel.org
Subject: [PATCH 02/24] usb: dwc2: platform: Provide function name for 'dwc2_check_core_version()'
Date:   Wed, 26 May 2021 14:00:15 +0100
Message-Id: <20210526130037.856068-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc2/platform.c:411: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Matthijs Kooijman <matthijs@stdin.nl>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 520a0beef77ca..c8f18f3ba9e35 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -408,7 +408,7 @@ static bool dwc2_check_core_endianness(struct dwc2_hsotg *hsotg)
 }
 
 /**
- * Check core version
+ * dwc2_check_core_version() - Check core version
  *
  * @hsotg: Programming view of the DWC_otg controller
  *
-- 
2.31.1

