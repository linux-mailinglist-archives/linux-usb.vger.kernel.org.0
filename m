Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF45F3F1F94
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhHSSK1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhHSSK0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:26 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5873EC061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so30326wmh.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmCDVcDPr5bxst7uNZbmQzVkDOfalyIwULzIMEWLkMY=;
        b=ThyHI7NGLfwsYBdsiEWavAFR269WKTFwFqw+dbgueZdpT0ho/GVW3YLIa0azxxZCt2
         WohB25kgegHe0H8VfBtf2B9Vh+27zelFFTLboiOdqXLUZCWdOLah+8dy04Sre3lcDXT6
         ZpU210DMxTCtZG8xIjWd30HC0c+vcIiJeQeppglCPfJZG5xHSUtoilMBUQOVuYY+LDP3
         n9KKs99OX2h6L61kvl78J/5Yi1ZC75SSKEuWaD3mzMM77I5trd8wvlzdWrUqjNP0Nu8N
         RcqhOF4USqWplqZ+f2jjohZeoubnxp5LDj2zMpETV/OQsBxPWj7umwhp+/Gw2Z0IV9uj
         bw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmCDVcDPr5bxst7uNZbmQzVkDOfalyIwULzIMEWLkMY=;
        b=pQ/C99QpuQNZPedbDClINsmSSx2b7Rocw1BfMOGdZJjLb2leWNbRvuKr6ZcuLHqn8d
         fq/KB2Mbgdlb7FCxXs3hx8u4DFZUPIOiNasIZsLa5jCYmJhHLkMsrJ/U2OYj3cozJL2H
         Syd7D/EI0/B2TS9YrGO0xxearkEn3r4jt74Du0fq/v3mWXbbXRIHhgnLt6S0/BcUgcfN
         cFq63Z6N1wpAbuyhF/OVroQ3G4zMrrzSetIncQnLXQCXVA9AJWVX7VOXp3nSdpXJ6Yay
         VaP7IAIHnvIqQjFoodd6rTyjSyVApVuLYCTqeMTnHnwxv9vyrTDFkUIPs4Zh8CTluvB2
         soqw==
X-Gm-Message-State: AOAM533A3n2Gbi4IoNDxcfkagFGWmERVpoiwxVGXgreX8vTO85RcriLy
        1XWcMwgZW8h3+E1RKuKE3Xo3PQ==
X-Google-Smtp-Source: ABdhPJxdJA9tboezQGAAsTyNJHsr/Gf2lR1hvZEeXjIhznl7KXl00joXD0Zg8C4c/XKRZv96DHyo+Q==
X-Received: by 2002:a1c:3909:: with SMTP id g9mr14794276wma.63.1629396589009;
        Thu, 19 Aug 2021 11:09:49 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:48 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/5] usb: isp1760: ignore return value for bus change pattern
Date:   Thu, 19 Aug 2021 19:09:25 +0100
Message-Id: <20210819180929.1327349-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210819180929.1327349-1-rui.silva@linaro.org>
References: <20210819180929.1327349-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We do not care about the return value of that read between the
scratch register write and read, we really just want to make sure that
the pattern in the bus get changed to make sure we are testing
correctly the scratch pattern.

Clang-analyzer complains about the never read scratch variable:
>> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch' is never read [clang-analyzer-deadcode.DeadStores]
    scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);

Just ignore the return value of that CHIP_ID_HIGH read, add more
information to the comment above why we are doing this. And as at it,
just do a small format change in the error message bellow.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 825be736be33..2a21fe5aa7a8 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -731,11 +731,15 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 
 	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
 
-	/* Change bus pattern */
-	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
+	/*
+	 * we do not care about the read value here we just want to
+	 * change bus pattern.
+	 */
+	isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
 	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
 	if (scratch != pattern) {
-		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
+		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n",
+			scratch);
 		return -ENODEV;
 	}
 
-- 
2.33.0

