Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542283720B8
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 21:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhECTpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 15:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhECTpo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 15:45:44 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B6BC061761
        for <linux-usb@vger.kernel.org>; Mon,  3 May 2021 12:44:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id t4so2659004plc.6
        for <linux-usb@vger.kernel.org>; Mon, 03 May 2021 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3EMkC7YNWa2j3rUvVsTSTxRT7DqrOV1DRnSwyZWSadk=;
        b=eYpzrR2iUa+jshX9IW7/JTBbHsMRNR4BAprGDBvfbMRjpD1XuIHHNgS8LIsUhJVsd1
         P893JT7r9caIL8APi332oLQbDRNAO+Yompw39rkUlPe6N3WaQ1WAyEz9wz923k1AoOqY
         TeBKW/1DS9uPeapwZJho76NhTIWAW2Ll1Bj5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3EMkC7YNWa2j3rUvVsTSTxRT7DqrOV1DRnSwyZWSadk=;
        b=l7j6iyfwbk/MSLP/nLOrgZdtV7xeoxPm7RiaPqAseDkCnoAF1LR/hqf7avgC16Dkwi
         k1joCKis79HP30BOexb4Ce4PIUnOek0FQVCwFUPhkppNmNLhpEUwMhgcCzNQvkFIQ/uF
         iCgHKBikoTMjtD/hFLWe4yAM5mgj0uWsO3Cw3OTzVmGVSIsMIWUmZQZAYyAL4G4nz/Pw
         lzN3EzOfBiyO8/3LnjG7FLK8ufSUXOh4Py6rHJs0B8xhksym9wtjJEZX7xpdKKQCMjbN
         fsR442HWeGSVMf0rEZBwCgw2KejASHf/oIOWnJotRp00exVYPyfo1WcqQwlP0z+kDzfc
         iy4A==
X-Gm-Message-State: AOAM5310kKwc83DcA4VdmVmvWHkGbJ1SPQXwspowiUKwDb3JZcpGnoAH
        vHG2UQ24laOyO8KTrhmJUEyg5A==
X-Google-Smtp-Source: ABdhPJylbytVgtq6kPYph6j6md5IbCMqtGEri+/LuL+9WqLq5iReCDeDs5MMfOgAERfizflzM0I9DQ==
X-Received: by 2002:a17:902:c412:b029:ee:d42e:f73c with SMTP id k18-20020a170902c412b02900eed42ef73cmr7896609plk.74.1620071090085;
        Mon, 03 May 2021 12:44:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8584:3fd:2adf:a655])
        by smtp.gmail.com with UTF8SMTPSA id s184sm400127pgc.29.2021.05.03.12.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 12:44:49 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 3/5] of/platform: Add stubs for of_platform_device_create/destroy()
Date:   Mon,  3 May 2021 12:44:37 -0700
Message-Id: <20210503124408.v9.3.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503194439.3289065-1-mka@chromium.org>
References: <20210503194439.3289065-1-mka@chromium.org>
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
2.31.1.527.g47e6f16901-goog

