Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B65932F415
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 20:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhCETjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 14:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhCETjG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 14:39:06 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7D2C061762
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 11:39:06 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id fu20so2472023pjb.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Mar 2021 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JB6kdr5tZpshWCy8V9QYmlDg00VbremNU/eNtnae9YQ=;
        b=klVphLhascJXjUnHD8FEDvvYZa+HqIWAzGHfuwOX0XJPnOdtMPCk7cRWEW+CQMtQSP
         JK77Fs6uUJLPFWJy4wjbLYEfc+qfzUpNP/VcZlV5AzGgfCWHVy2pObQ6JLG9/q88eF0Q
         mJvqUNRASQntYXH2Dpzlw2B8dfQyEaexrB3Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JB6kdr5tZpshWCy8V9QYmlDg00VbremNU/eNtnae9YQ=;
        b=MURt7t/BEaX7hHWHWG1B83ZJ1Mud1tmISK0fld5JXt+FpxPjvXVpH0BYxh2tVSOY2s
         qwvFUuiFbpWDSbXe9XkQc7CUz/hG4O05Ihz3Y2HYJjx4hXDtY7LAm9+iZ/sbCR0SRvk4
         SaOYGbDxLKVXFFBbWGYoVb0V/t8JGBQd75Q1xP200wIKMaaY6mp8yMJ6LyxzOXR/9fFJ
         B2rRL/unMxI+K4WyjUXE8rkzLuTY3m2J/5xCX394vpo3xgDdsAEGiq2Zb4MaVT4EG7gt
         Ps0YZDKQykykG6t4HiGgsfK57voBKJwunHmh+B64H7wjSv/HWCPYDjEVE/iuLIZMihxX
         sDRQ==
X-Gm-Message-State: AOAM531T9WQhe4EGQvVUMgxyfyDv9RWo7hs1bu+zEbm0c4IxP7pF5Iyx
        PFGIjv4p9iMs7vlQDVK91N5q+Q==
X-Google-Smtp-Source: ABdhPJxna8HSJsU74R2/mecjb+RJE4MHeJcu0zzhDLZkEkzRExlGOIoPRv2UzRiNz7lyWLi302bEBQ==
X-Received: by 2002:a17:90b:92:: with SMTP id bb18mr11533435pjb.40.1614973146376;
        Fri, 05 Mar 2021 11:39:06 -0800 (PST)
Received: from localhost ([2620:15c:202:1:2878:25d1:94cb:a547])
        by smtp.gmail.com with UTF8SMTPSA id y15sm3960837pgi.31.2021.03.05.11.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:39:06 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Peter Chen <peter.chen@nxp.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v6 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Fri,  5 Mar 2021 11:38:51 -0800
Message-Id: <20210305113832.v6.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210305193853.2040456-1-mka@chromium.org>
References: <20210305193853.2040456-1-mka@chromium.org>
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
2.30.1.766.gb4fecdf3b7-goog

