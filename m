Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC94546AE7A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 00:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377330AbhLFXcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 18:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351387AbhLFXci (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 18:32:38 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1F6C061746
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 15:29:09 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 71so11956093pgb.4
        for <linux-usb@vger.kernel.org>; Mon, 06 Dec 2021 15:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvi8cmAIXMcvHwCH7uWIth8WYsNDZ96qQSNMwpB/aDQ=;
        b=SeQTYAU52qsx4e8jMUDFhp7renvZ2TN7fPrwjaPlu883AR1dLNakgJFX3aXOOL/tNK
         o504lzqlSCcPX3b5OpcnQ72hJ4qSIiKt56PQV9n+JCzRHMlT2t7uG8263AcqcVJRdEDZ
         jqzrMwlkGIB9Brzbtx80gIhBJGHO4fQUhNLxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dvi8cmAIXMcvHwCH7uWIth8WYsNDZ96qQSNMwpB/aDQ=;
        b=TMc892tkAkYevSi1ro8ulh5xvgLQHHa/zcJR1/c5+bo9ANeD7uLWv6gTHvZ0ddjxyT
         ZqX4swnQt3NRGkezYhuUzEQ60zE6hr0tcKtF/B/4xKPTCt/CTRycYZshe7lJTIu6pHpM
         oGjxXAE5XkFkszbT88YZivtmDQLwgq5gdR2ShMxz4Uz6UtO1zd9MVJUCpUDGKwFJb5Rt
         hxP17KfkTcS9QYaMNbvQZ6wvzvRzfacAATDT21P/3UVs6p9vA8JVFj1Yj8Pw64d9ONa0
         g5iwEA3jZOHXhgvN0sCrG/D5EfQijlwYC65g0BSqN06RWwOElIvrqkRSU9eifxJzhT9p
         e3jw==
X-Gm-Message-State: AOAM5338eJXNwXajXuiQDdI0izWli3QPN2QPYHHBlYdd3RWA9DooC3SF
        gMTl8xeJcA3lLnA2hw+B1kKXVg==
X-Google-Smtp-Source: ABdhPJyF+953h97SiLXDtaLy+cI4hJhOgU3dSlwh1dj8n3ySd71Ta2YHeM8BvtWOEDX9i7Ag+6FK5A==
X-Received: by 2002:a05:6a00:8cc:b0:4a8:262:49e1 with SMTP id s12-20020a056a0008cc00b004a8026249e1mr39411204pfu.28.1638833349024;
        Mon, 06 Dec 2021 15:29:09 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a783:e7e8:acf6:96a5])
        by smtp.gmail.com with ESMTPSA id t2sm13896218pfd.36.2021.12.06.15.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:29:08 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>, swboyd@chromium.org,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB defers or unbinds
Date:   Mon,  6 Dec 2021 15:28:47 -0800
Message-Id: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
enabled, you'll see a Use-After-Free reported at bootup.

The root of the problem is that dwc3_qcom_of_register_core() is adding
a devm-allocated "tx-fifo-resize" property to its device tree node
using of_add_property().

The issue is that of_add_property() makes a _permanent_ addition to
the device tree that lasts until reboot. That means allocating memory
for the property using "devm" managed memory is a terrible idea since
that memory will be freed upon probe deferral or device
unbinding. Let's change to just allocate memory once and never free
it. This sorta looks like a leak but isn't truly one, since only one
property will be allocated per device tree node per boot.

NOTE: one would think that perhaps it would be better to use
of_remove_property() and then be able to free the property on device
remove. That sounds good until you read the comments for
of_remove_property(), which says that properties are never really
removed and they're just moved to the side.

Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/usb/dwc3/dwc3-qcom.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01028c5..34b054033116 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -658,18 +658,28 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
-	if (!prop) {
-		ret = -ENOMEM;
-		dev_err(dev, "unable to allocate memory for property\n");
-		goto node_put;
-	}
+	/*
+	 * Permanently add the "tx-fifo-resize" to the device tree. Even if
+	 * our device is unregistered this property will still be part
+	 * of the device tree until reboot. Because this is a "permanent"
+	 * change, we allocate memory _without_ devm. For some context, see
+	 * the fact that of_remove_property() doesn't actually remove things.
+	 */
+	if (!of_find_property(dwc3_np, "tx-fifo-resize", NULL)) {
+		prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+		if (!prop) {
+			ret = -ENOMEM;
+			dev_err(dev, "unable to allocate memory for property\n");
+			goto node_put;
+		}
 
-	prop->name = "tx-fifo-resize";
-	ret = of_add_property(dwc3_np, prop);
-	if (ret) {
-		dev_err(dev, "unable to add property\n");
-		goto node_put;
+		prop->name = "tx-fifo-resize";
+		ret = of_add_property(dwc3_np, prop);
+		if (ret) {
+			dev_err(dev, "unable to add property\n");
+			kfree(prop);
+			goto node_put;
+		}
 	}
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
-- 
2.34.1.400.ga245620fadb-goog

