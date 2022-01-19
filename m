Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7610E4941F9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 21:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357375AbiASUoB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 15:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244899AbiASUn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 15:43:56 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257EFC061574
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 12:43:56 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id br22-20020a17090b0f1600b001b50eaa9e8bso1587588pjb.5
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 12:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aBnCws/J3yBxLfvHdmXmyJWct69R9h+zMBJizT7ymik=;
        b=LI8MsXwP6awx7ie331rc+M//CIaQKd7Sbys1Vv8djTWUsR5zeh2GmMWegZiYOVGO7E
         2k8wlMfUD0MDm2XKnDqPuVtyeKTnX3a28GUDZKSbLLWkjYfpXCHtyCKa1Y1R7Gp54+x/
         rMGFADBaNG5iW00VpVp2MXt/uY0v0cxys+49w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aBnCws/J3yBxLfvHdmXmyJWct69R9h+zMBJizT7ymik=;
        b=awWhBo0r8W1JDvQ3vRyWj/V7DVJ17dx32gVJ1AuvvyL5+WdZV2PBubNrEbFrrobA6e
         lfTsqMlfJsndxzONjROFS+FkdTnRcgoTK5sanayOSVWROnYC8u74rO6LfX1NlVJLvnYC
         KGkoNolwe/KIgHshYUcDiLlCHIRuwrV6IBCMLCQrdmhTxVIBIm3kmcsP458xJUsfMdZL
         r95aJXrCjEPsmuygK2JVYj/TrKXcphabDAeM/3+cOQcVQIxW+NpqI5ZPgzl4bRGrpKhc
         6etmyDHG2y+7jHHm/oFdIfctJayiB29032amKn6BsQ7iL/UaftXiuwU6EYCo3LnaVXkD
         dZxA==
X-Gm-Message-State: AOAM5332AfoJsIGpldEtVZU4WzB8wgkjwChX0XRKGpUwgBDASi98b+LM
        xVvlxJtqyRYdQCwzq1BGUfFgig==
X-Google-Smtp-Source: ABdhPJx+zRc6bwKkaYZ7xovg+TNn+XW/iI9YRIYuNg0xSIA9m43wEYyw/ph226fLEyRw+WF2mQVG6g==
X-Received: by 2002:a17:903:52:b0:14a:4951:390a with SMTP id l18-20020a170903005200b0014a4951390amr34871511pla.54.1642625035702;
        Wed, 19 Jan 2022 12:43:55 -0800 (PST)
Received: from localhost ([2620:15c:202:201:618e:efc:c014:d89c])
        by smtp.gmail.com with UTF8SMTPSA id x18sm478531pgj.41.2022.01.19.12.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 12:43:55 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v20 1/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Wed, 19 Jan 2022 12:43:41 -0800
Message-Id: <20220119124327.v20.1.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220119204345.3769662-1-mka@chromium.org>
References: <20220119204345.3769662-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Code for platform_device_create() and of_platform_device_destroy() is
only generated if CONFIG_OF_ADDRESS=y. Add stubs to avoid unresolved
symbols when CONFIG_OF_ADDRESS is not set.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v20:
- added 'Reviewed-by' tags from Stephen and Doug

Changes in v19:
- still no changes ...

Changes in v18:
- still no changes ...

Changes in v17:
- none

Changes in v16:
- none

Changes in v15:
- none

Changes in v14:
- none

Changes in v13:
- none

Changes in v12:
- none

Changes in v11:
- none

Changes in v10:
- none

Changes in v9:
- added Rob's 'Acked-by' tag

Changes in v8:
- fixed C&P error in commit message

Changes in v7:
- none

Changes in v6:
- patch added to the series

 include/linux/of_platform.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 84a966623e78..d15b6cd5e1c3 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -61,16 +61,18 @@ static inline struct platform_device *of_find_device_by_node(struct device_node
 }
 #endif
 
+extern int of_platform_bus_probe(struct device_node *root,
+				 const struct of_device_id *matches,
+				 struct device *parent);
+
+#ifdef CONFIG_OF_ADDRESS
 /* Platform devices and busses creation */
 extern struct platform_device *of_platform_device_create(struct device_node *np,
 						   const char *bus_id,
 						   struct device *parent);
 
 extern int of_platform_device_destroy(struct device *dev, void *data);
-extern int of_platform_bus_probe(struct device_node *root,
-				 const struct of_device_id *matches,
-				 struct device *parent);
-#ifdef CONFIG_OF_ADDRESS
+
 extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
 				const struct of_dev_auxdata *lookup,
@@ -84,6 +86,18 @@ extern int devm_of_platform_populate(struct device *dev);
 
 extern void devm_of_platform_depopulate(struct device *dev);
 #else
+/* Platform devices and busses creation */
+static inline struct platform_device *of_platform_device_create(struct device_node *np,
+								const char *bus_id,
+								struct device *parent)
+{
+	return NULL;
+}
+static inline int of_platform_device_destroy(struct device *dev, void *data)
+{
+	return -ENODEV;
+}
+
 static inline int of_platform_populate(struct device_node *root,
 					const struct of_device_id *matches,
 					const struct of_dev_auxdata *lookup,
-- 
2.34.1.703.g22d0c6ccf7-goog

