Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423E03EBCC2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 21:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbhHMTxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 15:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbhHMTxH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 15:53:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C606C0617AD
        for <linux-usb@vger.kernel.org>; Fri, 13 Aug 2021 12:52:40 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id bo18so16971871pjb.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Aug 2021 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FY1d5tWKi4Ygc4kp4ZVf2IkgYfRuuywzmBsdgr6ykdc=;
        b=bSZvsfP45hkszKR1hgKlpnS1Y3johqmyhjVsmXSup3JI3vR7cTjxYoZve/HXDgWKSI
         idlSavdyVqpQEUYiqcaxu63ePIecBZ5OWo9nXVDr83bPvUj3lpaBSJVySIQ351U85Z6E
         4iwz9Vyr+OzjlALc1sUoR9yLZM1KOdJ903nbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FY1d5tWKi4Ygc4kp4ZVf2IkgYfRuuywzmBsdgr6ykdc=;
        b=lExdYCCLYZQkwNVVbHU0AXE69w80bA+XWZ9JlMTL7180F8AzqNRfZCDdvfD7eS99dK
         ikl4jPKRWjx3VNViLXUT9LmAPCH0L7+iYsVnLmzHDw7O/mAezZaGpER2U0cbNJBoMNVB
         G/Rfv2vcAZ3hQTezsdIX4WltxPARCcUfRJd2TdGYOa+7zhtxbIzx4IBgtnIwECnvWOej
         rKnfk6puKki/V0xEbQ6EzZS++u5BbYZwInoTNARNflCm4s0NhpMrZ7K0k5VPT6BFKlS3
         gPlXWaY3Ze0LuiKVO7LHGanBpnWRrcVEGvAsvcUKOr82rRiVBFgIc55r1TNz/e9uVmGq
         o2Rw==
X-Gm-Message-State: AOAM530ANno58XVUNw2C17GU5XcBbO96Sq6x1c/nD4rRWDrZ5P2VonvF
        HlwkIxXciYcdnsKfHBsyxKCi6YpZ7UPmqg==
X-Google-Smtp-Source: ABdhPJzRkRK8QdhhfWb/m6J84dvLux/6EEaDkr75hUWD13eIhLJzrr59s/+UYojVELedYrrAgAysnQ==
X-Received: by 2002:a17:90b:4b12:: with SMTP id lx18mr4198512pjb.121.1628884359764;
        Fri, 13 Aug 2021 12:52:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:450d:9788:a70e:42d6])
        by smtp.gmail.com with UTF8SMTPSA id 6sm2615015pjk.1.2021.08.13.12.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:52:39 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v16 2/7] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Fri, 13 Aug 2021 12:52:23 -0700
Message-Id: <20210813125146.v16.2.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
References: <20210813195228.2003500-1-mka@chromium.org>
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
---

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
2.33.0.rc1.237.g0d66db33f3-goog

