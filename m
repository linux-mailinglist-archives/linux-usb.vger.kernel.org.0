Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBB74708C0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 19:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245367AbhLJSeH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 13:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241621AbhLJSeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 13:34:06 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794E2C061746
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 10:30:31 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y7so6863720plp.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4yq47wXTtWgpHeTyh06evXz5kpa/V99SgueyeIFRT0=;
        b=jlldg5zWhB2XIxuD7D/xJ/QCV7ULCKoQn2MJgZJ+xI+SPGOCmBWYI64D/D9idG3sQi
         zZGXTWX4UF8v6FgcIWSFeuWQTEcvvMaIEgeKMASMy0tqxmi4C5iBz42FWOLzVtGjitrG
         C/+sTPNlnrNniRmmvslxkI5DDzF/EW2GK2o7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4yq47wXTtWgpHeTyh06evXz5kpa/V99SgueyeIFRT0=;
        b=1Mkr9O0gTl7W4ioomhx/szScSZNhQzBN5QfjHrBYBCFgeoNGKJwlCmIUKkcB24k6u7
         Ctjtw9qCtAyY7oW038+GQu9vAtNe9F01ztKVl0lkZqF1iqaPKK/VEkq1cyE1xsjkVcQq
         bXmfEkzGzhpqSmcJC7o763qsfg5c1tq5YIN/BkcgoRfh/qzObK0XnvMjhqkF7uW09DsY
         TLF4Mo3HBpe93YVF+Jfaf2ChibT1EYoar1GFb9coLX0tGMXu7hNnGTOQPNGfgoDsaLOv
         m0LPOIzYJqWoAUIk3hdpuOJrKfRwW3BulpjRFSvzMKo8RodcaAjhnNOt2J7lf/G4SIgb
         bVKw==
X-Gm-Message-State: AOAM533Xa7Ge8zsWpcQaHMZkv3wuN5NJQPvqUmmFeHUMqoBF5MujikfA
        9jdUei1DqoOgfFMo8vtrkBF8Ew==
X-Google-Smtp-Source: ABdhPJwkIVagJi0pqk6T56zxUg//3XW1sMFI9XkonkQEd7mtJZD+SRizz/kkfx0tdt8omP51boXT1w==
X-Received: by 2002:a17:902:f68b:b0:142:c60:475 with SMTP id l11-20020a170902f68b00b001420c600475mr76953684plg.8.1639161031011;
        Fri, 10 Dec 2021 10:30:31 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d386:8bb1:aaa7:a294])
        by smtp.gmail.com with UTF8SMTPSA id q18sm3762552pfn.83.2021.12.10.10.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 10:30:30 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-kernel@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v18 1/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Fri, 10 Dec 2021 10:30:17 -0800
Message-Id: <20211210102923.v18.1.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211210183021.3500376-1-mka@chromium.org>
References: <20211210183021.3500376-1-mka@chromium.org>
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
2.34.1.173.g76aa8bc2d0-goog

