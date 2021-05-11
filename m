Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A66637B1CD
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 00:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhEKWxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 18:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhEKWxl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 18:53:41 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28837C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:33 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m37so16807332pgb.8
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8aKnVtIxlUG/2eUQmNl0qPhaQg9l3TplAhr5B7EOd6U=;
        b=LvzERiaiALvJFXjzftXoHUCyKmzQ4UBbwHeONAJXlRmCEFlO7I1pPQBoo51KsymSOC
         izVUQGDqJF43p1PMQqu3RTbUEknJP2LEoPusHVkm35IFDHE1EcXzm+DDGZ9PnIg4GVln
         ZePnFPrFMA0JsA1+JnW4vWXx0HQ5ISkwnuUXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8aKnVtIxlUG/2eUQmNl0qPhaQg9l3TplAhr5B7EOd6U=;
        b=FMToUWJuKlMealU4Ua9RXbbZDEfs0D2yAQsVL1pR1G15jKiGNO0vcjbhVULn2r42RT
         lEQJVZrpHHZIeiJwG7Psu1G39CPVMZt+0ZZmO1pKgqzjwwMxT/WrZ5zpw/gXxnQ/381t
         zqTQT0I4X9oSNacFUiUciP2NhovixalUVEH8a4hiHPqtGfVwgi801+Tkw29ACaytQ6rH
         cigsdjyHP/fRmbLggxtrgjhQ8drN/nfjQOIsG2WM6fZ2tG9eEkFcFp80/fdeiW0RZGl7
         8a4X5qoTIZ4GSQ0o0Plc641n7whDM9tJAZRQrwkvjSbgIp+M2knd+wUk7xeHqLV2uzMJ
         +n5Q==
X-Gm-Message-State: AOAM531YMbcsr9xV9UnH/t/nRCxBgKb4A2sdQoclqL0st1RYo0ujwPcg
        t1rGyvQJKPMFD5T7kquIT6iY1Q==
X-Google-Smtp-Source: ABdhPJzcc0HOveQxurQucFIXSEwc1uBL9OYa3E78PzbfuEgM9Oc9XcjLr/Ej3fQt4k23AWDj8Izisg==
X-Received: by 2002:a63:540b:: with SMTP id i11mr33172485pgb.44.1620773553616;
        Tue, 11 May 2021 15:52:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f1d7:673a:456e:c653])
        by smtp.gmail.com with UTF8SMTPSA id x22sm14230968pfa.24.2021.05.11.15.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 15:52:33 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Tue, 11 May 2021 15:52:21 -0700
Message-Id: <20210511155152.v10.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210511225223.550762-1-mka@chromium.org>
References: <20210511225223.550762-1-mka@chromium.org>
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
2.31.1.607.g51e8a6a459-goog

