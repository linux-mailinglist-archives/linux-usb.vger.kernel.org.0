Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C143CEF9E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 01:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350964AbhGSWSx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 18:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359373AbhGSVnw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 17:43:52 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E282BC0613B4
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso746060pjj.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g1VUsyo7cljMbwFDieYIV5JeeNR2RlcZC3D27A3qHS0=;
        b=kRPPvmFXE5Mgwv6tfnWkE5muTpKYOVG1GPrtHQPkNg2Uq0mHyjN4wTBe/SvY0sQ5mr
         KOdfbofNj2wonIXBN43Pd7ACr4mRptJj5t/etiPE7pqSGb7BS5oMCCWb6K1/kFb8FaaR
         MHpVWaFE87Fz4kpxPfwaO09iOE9M8MaFvBue4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1VUsyo7cljMbwFDieYIV5JeeNR2RlcZC3D27A3qHS0=;
        b=Ecm6nNjeSsxPNe2azvf8GtC0JxMJw6jEt0V+5PZ5DyinfypN8jIErfxDRKfkXQNeQo
         sSB/IXn9EZ1ha6N/T8OqMEiA2+dhKJNy9n/Zx4918eGVwECojs9A4NoIvojMa8cEUm4e
         WcqNT+534hepO4BN34h8LRvTTZLm0/9Zesmf3iel3iAERLmwAkkeVvJo+WjcHmD9NMlS
         toEXgRCWRjH8fTtBTFx2PXj3fkuS0sRCMaZTstq79jB+TztPBKmJVrqvhUGwt8obiGj+
         7/uOlLFJHlCJ+G1dwtBzZEKH0CqBVuGTvzQx2JjJH6m2atX/PfNbMtv49vHrazIDmMUB
         j1Eg==
X-Gm-Message-State: AOAM532UJSQtrKW6C2TNdP0sJUGw0Zk7Lmyj+5DUdMlO8NuYXvR6MRVJ
        98BPV0zTCUTqqFywigPBiH2yPQ==
X-Google-Smtp-Source: ABdhPJxNEIIx43kLmIxC13TtCzAy+cwH4DSRv1ugrH0M+JFDIXzpmvYBZJWXHwJo/0jMChy783KZ4g==
X-Received: by 2002:a17:90a:8c9:: with SMTP id 9mr31381363pjn.58.1626733297505;
        Mon, 19 Jul 2021 15:21:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4d0:bf5f:b8cd:2d67])
        by smtp.gmail.com with UTF8SMTPSA id nl2sm17351924pjb.10.2021.07.19.15.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 15:21:37 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 2/6] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Mon, 19 Jul 2021 15:21:24 -0700
Message-Id: <20210719152055.v14.2.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
In-Reply-To: <20210719222128.4122837-1-mka@chromium.org>
References: <20210719222128.4122837-1-mka@chromium.org>
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
2.32.0.402.g57bb445576-goog

