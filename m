Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C14F3B206C
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jun 2021 20:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFWSn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Jun 2021 14:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhFWSnz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Jun 2021 14:43:55 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6116C06175F
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:36 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id a2so2513500pgi.6
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rn+jkfBaHm09mGok+nONlCf30mFoynV+UZRNUFIhdDU=;
        b=EWbeAUecEk+oAWVdmnDXSx6cxVTC7chbrqCDPHXIqIhqFaWpmeNgdS2LWt+EowzFgU
         Cd9HLSv0TK9hCOEt6vc8cqr02Ae5off+o+jwUt2Q+4J2Sf7nkXiOlWuyhLJHw+Ne2W9J
         3sPjZjZxrYjC+SB2wUIVG1hUKRtWr/iG74jzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rn+jkfBaHm09mGok+nONlCf30mFoynV+UZRNUFIhdDU=;
        b=LXLx1eoTTpQH+nZZwfL8bd11w8hp3tdya9AdUD40sreR/ewv4OVuBfQ0QKs/xzw2Lc
         NFIjqF20RGr31dWIxrbqCRIBztFaDxuVZb7H581KMRiASCsF9huOhxQaqjw0ic7asiJ+
         DJAPGgKBkfEFyvbqNOwrncQ7PGD8gFrsYx6CYaBJm6CfPZ8GuQhANrZc9JOQroUIzy4q
         UTL7+dVB53SqGAkmcQAQ1dKqBNShs4fDULk2j2fbG2ZrcNmUgxPmCGsusVkp3FINbKyD
         8MaYccNxYwU901CapickkRyQP0ITgfhEaRmmxjhSgnS6A62+/TO1YbC0DkbZMCHwjGoY
         KT3A==
X-Gm-Message-State: AOAM533QoLfBzKeTmzc70gzR8muDfIXDut1D2N9IZTSxVv78zu4rad++
        QVijy692dWNe+vFHcq66/nwcIQ==
X-Google-Smtp-Source: ABdhPJxluqoKhGoaQ5Nzb/twHA1HowJf4YE6OPec4fU9XXSsaEQSW23fWGK3GkBG7MCd/T6c5phf8Q==
X-Received: by 2002:a63:e343:: with SMTP id o3mr798626pgj.416.1624473696437;
        Wed, 23 Jun 2021 11:41:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d440:232:5e25:41f4])
        by smtp.gmail.com with UTF8SMTPSA id m2sm528262pgv.40.2021.06.23.11.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 11:41:36 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 3/7] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Wed, 23 Jun 2021 11:41:19 -0700
Message-Id: <20210623114025.v13.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210623184124.3504047-1-mka@chromium.org>
References: <20210623184124.3504047-1-mka@chromium.org>
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
2.32.0.288.g62a8d224e6-goog

