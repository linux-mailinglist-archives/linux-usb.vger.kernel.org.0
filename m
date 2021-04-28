Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1935136DF19
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 20:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbhD1Sm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 14:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243707AbhD1Sm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 14:42:27 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2F9C0613ED
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 11:41:42 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id s22so24270810pgk.6
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jXcdpJPfYcU4xrGlsY8q2fXpcA/KJpSpEReW1dn7fAo=;
        b=Lusz0mUPcetH+qgOsw+Wb3zs/WNp1pnW2n6cQLc2fL4KF+wYoxrcrF0H2nKGXuLWCp
         9DHAuoux+rOal7YTwuOzVEg3rxnWy/3M3KrKk/O5vhpASJpcIWX7LWSBk7/3QWyuKgZ7
         ZC8b7JIFYwWUeuOnRF48MeyrGMuo5wB8zhfhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jXcdpJPfYcU4xrGlsY8q2fXpcA/KJpSpEReW1dn7fAo=;
        b=tVg2ayldj8Ng9H7FYJc+KKCDYhe2jGe5qtxeOKW4ECcHMyPqwJIkZfKfRk8pIyoNF7
         Xykl7bSy/ysEFoyfaNUAkraZ4fWLjJdViS0IMxq4+N37KDG3dCxbRnSapC4+vyqTAQSD
         qMv3mrqXjnjbdIvTCXpRuuSpJvxOE0WpsZo+71BBn9helXqsOyqZX4S1sc3JfnMXxXTX
         TxfJk/T1pMdVKcg/6rpDauF+p/cI39Ocfg7JxwUCuvFMFHnNasQSfKUeyZMk2sIioH/b
         T6x1JY/fV96X/02AsSf5mSRA1juBfmPV8WH4IarXHED8sSYlm8EykV55zfc0U1x18/P0
         g9lQ==
X-Gm-Message-State: AOAM532sVcf5ClKwX/iM256b5ZB1rEom1WdMlvmynAtlvmZXho8t5PKt
        I+dMfgxitE00NRxuSHHCVaUzOA==
X-Google-Smtp-Source: ABdhPJwQnMbgWZSstN4/vMbp1ZxMOUreSuFsZ69SVrp/KilGWuK5GDECvS5zjIyD09ViwXPbLNcyRw==
X-Received: by 2002:a62:3201:0:b029:211:3dcc:c9ca with SMTP id y1-20020a6232010000b02902113dccc9camr29237178pfy.46.1619635302393;
        Wed, 28 Apr 2021 11:41:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c1a:a0a7:2b43:81b0])
        by smtp.gmail.com with UTF8SMTPSA id q8sm393971pgn.22.2021.04.28.11.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 11:41:42 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v8 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Wed, 28 Apr 2021 11:41:30 -0700
Message-Id: <20210428114109.v8.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428184132.2184997-1-mka@chromium.org>
References: <20210428184132.2184997-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Code for platform_device_create() and of_platform_device_destroy() is
only generated if CONFIG_OF_ADDRESS=y. Add stubs to avoid unresolved
symbols when CONFIG_OF_ADDRESS is not set.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

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
2.31.1.498.g6c1eba8ee3d-goog

