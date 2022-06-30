Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1856156233A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 21:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236823AbiF3Tfi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 15:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236739AbiF3Tfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 15:35:38 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA304132B
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:36 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p14so365565pfh.6
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nMR3w2slRmIoMgD9RUa7XssGwQFlVgMDP5zlNPfT9rg=;
        b=htnbQRhXh0XK4DxF3roI1PzQJuqFiWeh7p5k55PXd6dQHF2ilOGnTc6LvTrtFRChqO
         Pc91ZYD+8jq6ia1q3d/zK3VQzbgtvNH2eGOV8fHjTbCzmaqM81LIuBKt0kngeM6vWAJL
         fpk5T3QlnqVzxhTDymGofiJWLyt+E9a2DH05o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMR3w2slRmIoMgD9RUa7XssGwQFlVgMDP5zlNPfT9rg=;
        b=Qpm5ioTjIgB2g6jRDEIikfP1yZlTvbrPYzIZZu8/BpaowBJfec90WmkkNeGR/qx7K9
         p6HJsgB30M9eYWjGgT8S5XsDVmXMtwBataX+52/UUxR5VCUB7MJ9Tux7XiyssyUBYBCR
         pEFxoPEVgJWi5kfceEQRkIq6yO72bUrmtofOtK82S5TryirGxJR9KPsL9vhBFsL2LH6u
         rH7xIMVvzZoKe9lMQgjzlzFwYoc3Tl+oaqIn3Z1lSPAetpujL7/YsW0wunUMUKK6lDTi
         prfFLPtFykDXXd+tQOjuyMOVEy0jNH79dKswO5ThH5AXxnqiMgEEJwzyM5icjmrmk3Ou
         UaWA==
X-Gm-Message-State: AJIora/xP4E8yI88HNprOfs5iJxwnaU8QUJDew0eHGe97ZVxEWhV5B8s
        SkyIMkHrNnmW7OBbctKT/cToaA==
X-Google-Smtp-Source: AGRyM1tOxkExkVLxKKqPo2pR0OwHCeR3W+4BknYMewioXwUMJxXur9nVHSyqcbLRH4HlXvTk69vHrQ==
X-Received: by 2002:aa7:8e9e:0:b0:525:1d15:8fb8 with SMTP id a30-20020aa78e9e000000b005251d158fb8mr15976510pfr.35.1656617736165;
        Thu, 30 Jun 2022 12:35:36 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:9fbf:277c:23e1:eabb])
        by smtp.gmail.com with UTF8SMTPSA id x1-20020a17090300c100b0016a33177d3csm13772541plc.160.2022.06.30.12.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:35:35 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v24 1/4] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Thu, 30 Jun 2022 12:35:27 -0700
Message-Id: <20220630123445.v24.1.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220630193530.2608178-1-mka@chromium.org>
References: <20220630193530.2608178-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

Changes in v24:
- none

Changes in v23:
- none

Changes in v22:
- none

Changes in v21:
- none

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
2.37.0.rc0.161.g10f37bed90-goog

