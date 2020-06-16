Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9C41FC01A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 22:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgFPUhm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 16:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgFPUhl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jun 2020 16:37:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563B2C06174E
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2020 13:37:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h95so2171286pje.4
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2020 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjDHEijxA5jX/NCAw6/eQbUNUcsi5uFiyeIKic4MZ28=;
        b=R5D8rBaJGQqskgZLnAm4lfOrO2TTpKw1JUeusk2w0ksw2Mqg9gf4SEXqUB8NhgxF4M
         +COlgnE114HAwhXWlfOwUJXhLfcRH/JthVfWq/QNvj6AfcoiQvh5AOIGAxfU2GxjFELh
         c01s4x1Xth7X5Rly3rrCHqRQjtRPqXNQCnnvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjDHEijxA5jX/NCAw6/eQbUNUcsi5uFiyeIKic4MZ28=;
        b=j5/+7p7QFtMZXWkAGns1RWFhL6lR5dzOHOeXBIGK3yCfEckirMIprm61odRWd63Umr
         cFlvuLjLD/jjUMT4eR/TjDBk9sC8MgmLbREaPWNnn6/pU7cFn90V0S4mo3EnorrkUTCi
         KgDR5XP6uHhPsMBJos44Ae+YXI8G9FRzQskxT8oJpSlTbHvcAmHaRXs71jcy85a8+HLo
         Myy40n8e8omOFurp14cSjqF4TXjpIvK4xvSII31u/qROLY5CMzP0ysqEthLjaNPlVqW4
         GQnk+WTHTmsoAoE0iuL7s4u5H/eK9qg0TpTjb8HKZKekOnOkzAg2eCOrvMIPu7CEOzqq
         GmpA==
X-Gm-Message-State: AOAM530s6Xf4wN8GX8WgVViYT/ZL4X2N0QHvCXSeBA6v4wfIPzG1W93b
        LosL0gvJ62b1EPL0/4ez4r3Tuw==
X-Google-Smtp-Source: ABdhPJxpFyy6tkXgIAY+58Fe1gDOxV5E6IqGluSe/o8T0/HOtLkWJiJJ1dP0HZ7PHtnA832kJeEd0Q==
X-Received: by 2002:a17:902:bd0b:: with SMTP id p11mr3552194pls.91.1592339860776;
        Tue, 16 Jun 2020 13:37:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z9sm3232116pjr.39.2020.06.16.13.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 13:37:40 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] usb: dwc3: qcom: Make sure core device is fully initialized before it is used
Date:   Tue, 16 Jun 2020 13:37:37 -0700
Message-Id: <20200616133734.1.I1902d0d48e4f3d4c5b5f1a2008108a4cd3c5ddb5@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc3_qcom_of_register_core() uses of_platform_populate() to add
the dwc3 core device. The driver core will try to probe the device,
however this might fail (e.g. due to deferred probing) and
of_platform_populate() would still return 0 if the device was
successully added to the platform bus. Verify that the core device
is actually bound to its driver before using it, defer probing of the
dwc3_qcom device if the core device isn't ready (yet).

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver").
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
depends on:
  https://lore.kernel.org/patchwork/patch/1251661/ ("driver core:Export
    the symbol device_is_bound")

 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..5a9036b050c6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -537,6 +537,16 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	/*
+	 * A successful return from of_platform_populate() only guarantees that
+	 * the core device was added to the platform bus, however it might not
+	 * be bound to its driver (e.g. due to deferred probing). This driver
+	 * requires the core device to be fully initialized, so defer probing
+	 * if it isn't ready (yet).
+	 */
+	if (!device_is_bound(&qcom->dwc3->dev))
+		return -EPROBE_DEFER;
+
 	return 0;
 }
 
-- 
2.27.0.290.gba653c62da-goog

