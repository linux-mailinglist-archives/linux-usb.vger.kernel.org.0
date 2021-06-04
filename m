Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BF339C2AE
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 23:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFDVnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 17:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbhFDVnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 17:43:01 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00772C06178B
        for <linux-usb@vger.kernel.org>; Fri,  4 Jun 2021 14:41:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q16so5328818pls.6
        for <linux-usb@vger.kernel.org>; Fri, 04 Jun 2021 14:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPAA6a3ptCbMGxksbOnwM1hguM0avulCeZvp79MemPI=;
        b=IYQXFddNB4NcFVCcPZGj8ynAIUTyGXaGPz5yLJOB9RDcW+cGio9yjn0pPVmLCXVthP
         mBbDwS2lPbhDvNUeW6y0FmLLLQVMzfr/PKNMVBQZYLvGiWa3rLUk4V0BMZOkn5sNB6w7
         Qvb3CPaJarzzeaFY5SJT9gkMgy/ZCKoLwHmVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPAA6a3ptCbMGxksbOnwM1hguM0avulCeZvp79MemPI=;
        b=lERfVSD6pov7ZSqKcLXTUZDiirI6bjBx6XNS2Rl0y07GLgztSExViqg+igWChfgGfH
         9BMCTlzDbvIIvHyEWFM34lxINbaZgZorI4pEG9UaYOKihglGHLH4Oa5A/sQTbqB4jUiF
         jttCAcBTvtHUPnVs2joCWfB/GR6ltYZ9/0IyTIAulMQ95kg7HuNtMOjPbZXSiHPJkTuN
         tDvdR2liaZvkzoDBUz9OJ5Udkd1833FTR64KvGT0zNZc+V+39m2UuRVWSl88hXp7JT95
         SqmZvJVFesipu3pGWpaz0rOuvlXQWAt7QW0t0dAllMd9CDueKsceA6m9Y5cDMlC3APhB
         +pJA==
X-Gm-Message-State: AOAM5311dwSIzeZRULs4KXXB4klHrEoeWIhpiEQsV0unSb9zQUXdE95n
        7/10kqnnd4Ze7Dvc7pe68btTVw==
X-Google-Smtp-Source: ABdhPJxtHthiCPncgppf6buUjF7wTpIjeb/iVM+7rAuR0J25Y7tYpF4IqZR7UO+zjCkB+J8W0ZCS5w==
X-Received: by 2002:a17:90b:430f:: with SMTP id ih15mr4417320pjb.196.1622842874503;
        Fri, 04 Jun 2021 14:41:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1cfa:4a0b:c513:8c09])
        by smtp.gmail.com with UTF8SMTPSA id t1sm2364985pfe.61.2021.06.04.14.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:41:14 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v11 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Fri,  4 Jun 2021 14:40:59 -0700
Message-Id: <20210604144027.v11.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210604214101.3363525-1-mka@chromium.org>
References: <20210604214101.3363525-1-mka@chromium.org>
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
2.32.0.rc1.229.g3e70b5a671-goog

