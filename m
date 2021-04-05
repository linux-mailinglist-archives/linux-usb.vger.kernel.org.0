Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDC354779
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 22:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbhDEUSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 16:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240730AbhDEUSe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 16:18:34 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DA7C061788
        for <linux-usb@vger.kernel.org>; Mon,  5 Apr 2021 13:18:26 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id t140so8795954pgb.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Apr 2021 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jVCJ0h/Oodi5krhaNgbRSg1bVB0ggAGmgl9KPrweYRY=;
        b=VebF3LDONKvgIEyHo9JHSQJzVCYhsgDgCAFBvVTD3kvr6SZJEeQ9jvzOYAAPnvpGch
         q16mU+mCYWifD0LCNYMEcy6sI0qr/rn6ROG6XZ5aO3F3WzG845mmWXjA2HDhVSkltctk
         EY7adXH+SmbY0XbXYuhilhaiY1KR2zLY0Oei0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jVCJ0h/Oodi5krhaNgbRSg1bVB0ggAGmgl9KPrweYRY=;
        b=Pv+0Lc+SswnIIDV8OUYh57xT8wzBt2RqeYrTqS9nk3Nib65NzIvzjQ3dgeNlJlLG2C
         NWikdISuoe8zNellACWurbsJSH2LB0HiXTGuk4qW9OgVA9rlnGDUSmWesaplzJGvZ6eH
         Pu+JSWQwgr6Bx4f1rn+Me1eS2T1Y9CYxQsuUvQSYoAxlvmOG+9zp6uhqdeDtyEr7/QB/
         bOZohchXw2jr4cj4CxWuelUTGkq3tZItL9luP32dYPZW/T60OLQWx3QSQxdcdOStADfR
         K5tpRA2+kIPPQz4iBkrgjfYn8bU+XvTDc/4k3QNINdrA/LOZZFb19Vb3W9KaeSGZvbrD
         NX6w==
X-Gm-Message-State: AOAM530uxS8/o6Qk7iUEbLo38gkojfCLlayhfpEFySaj8tm8r8xl8m2O
        ANlbMyXlYTVPnayjOL6SglhndA==
X-Google-Smtp-Source: ABdhPJzfHLnsjpDXtr2ZY/KN+TgPTBgD97zLSg4ORWVSK4yCXQSOJTBimehNjtIdiNms3qRpBLlAJQ==
X-Received: by 2002:a62:168b:0:b029:20d:69a5:189 with SMTP id 133-20020a62168b0000b029020d69a50189mr24898325pfw.57.1617653905887;
        Mon, 05 Apr 2021 13:18:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:455e:b8cf:5939:67da])
        by smtp.gmail.com with UTF8SMTPSA id c72sm16639069pfb.165.2021.04.05.13.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 13:18:25 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v6 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Mon,  5 Apr 2021 13:18:15 -0700
Message-Id: <20210405124900.v6.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210405201817.3977893-1-mka@chromium.org>
References: <20210405201817.3977893-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Code for platform_device_create() and of_platform_device_create() is
only generated if CONFIG_OF_ADDRESS=y. Add stubs to avoid unresolved
symbols when CONFIG_OF_ADDRESS is not set.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

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
2.31.0.208.g409f899ff0-goog

