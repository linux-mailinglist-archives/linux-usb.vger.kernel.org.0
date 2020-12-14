Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5022D9719
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 12:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgLNLJE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 06:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgLNLH5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Dec 2020 06:07:57 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564A6C0617A7
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:36 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id u18so29112832lfd.9
        for <linux-usb@vger.kernel.org>; Mon, 14 Dec 2020 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91Fi62YRIS4Qn6KO/9qSSfAEFCCwvmrnELKnrs1gSak=;
        b=RXm958TAHnbV81cWTdfZkaz4J2LXVnX/G/QULCB45ONmQNZXongcyH33ltdJe7f41l
         Q1kIQu7mBQoDBJWkAoWR18X3cQ2DLwsIGjGzLAhI9yrzq18I0mRP3L8Z5BIz3BJI25L5
         pWt1ERh+q6OzxwH4JypYTbRwv9PKb0BDrKpVF42mfCO6L5vQBzf0JSn/tok7vNwfLj0S
         OW3kBImVFwHPLODQLrK2fI5vQp7uxLBv6HTGx2t/hCIuKh/d60C522wl0c4Wcg4FdtIa
         uYcBBrLA13hRFAVmfGzBkejieX+SHjB8nlIvIFKvb11fyEWURrplk7nPeOyehSIMcHnV
         nHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91Fi62YRIS4Qn6KO/9qSSfAEFCCwvmrnELKnrs1gSak=;
        b=KPL7o7hEnFqZTV+OQb+5p3pLd9DscLlQIO44eDSJImWwe7KPrE37uCjshNQ8WWcIOJ
         rM8wCg03umbGyo2uPphnXKj2yqB0B4C9XmHlzA3UvDBJNNIyCipj0U65Xb2OI2W4/rpO
         V+3Tw/kQg1jHt82Wb+lFeghqm8xnV+dT5LMtRAempG0rXBsYPUA14cmyAGA6IZ7t0j37
         ERhLuW0xwjmzAR6/6rjV39PMGeSr9p10F7zQK22XCbmOme5KqbdWddqj10AmZKJ61OlJ
         FiwXnu5e7BNiQm7c4nnYe5hOxV+25G+UvQ3VwpHYVAY9ZhYO0VJicLiOeo4n4oHbOuGm
         dmWw==
X-Gm-Message-State: AOAM533QMe2iEEXEjLmitWpPtdzTLsenSdUgEKsEPnadOMHxIpqVWyvO
        6gtg3ItPF5s8euJSE+wQ4nlxZb825sANdHs7
X-Google-Smtp-Source: ABdhPJzSzQh01E26X3BXk3jup3Yn066amJXzbnjsaisJb1HdHAeGSPBNzo+Fgl5Y/4Q67+7wpABz6A==
X-Received: by 2002:a2e:9151:: with SMTP id q17mr10479296ljg.475.1607943994446;
        Mon, 14 Dec 2020 03:06:34 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f26sm1199576ljg.137.2020.12.14.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:06:33 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 2/2] usb: dwc3: drd: Improve dwc3_get_extcon() style
Date:   Mon, 14 Dec 2020 13:07:41 +0200
Message-Id: <20201214110741.8512-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214110741.8512-1-semen.protsenko@linaro.org>
References: <20201214110741.8512-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The previous change ("usb: dwc3: drd: Avoid error when extcon is
missing") changed the code flow in dwc3_get_extcon() function, leading
to unnecessary if-branch. This patch does housekeeping by reworking the
code for obtaining an extcon device from the "port" node.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v4:
  - Moved the comment from patch 2/2 to 1/2
  - Fixed typos in commit message
Changes in v3:
  - Split patch into two patches: logic diff and style diff

 drivers/usb/dwc3/drd.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index da428cf2eb5b..e2b68bb770d1 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -441,8 +441,8 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
-	struct device_node *np_phy, *np_conn;
-	struct extcon_dev *edev;
+	struct device_node *np_phy;
+	struct extcon_dev *edev = NULL;
 	const char *name;
 
 	if (device_property_read_bool(dev, "extcon"))
@@ -470,17 +470,14 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	 * or OTG mode.
 	 */
 	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
-	if (of_graph_is_present(np_phy))
-		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
-	else
-		np_conn = NULL;
-
-	if (np_conn)
-		edev = extcon_find_edev_by_node(np_conn);
-	else
-		edev = NULL;
+	if (of_graph_is_present(np_phy)) {
+		struct device_node *np_conn;
 
-	of_node_put(np_conn);
+		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+		if (np_conn)
+			edev = extcon_find_edev_by_node(np_conn);
+		of_node_put(np_conn);
+	}
 	of_node_put(np_phy);
 
 	return edev;
-- 
2.29.2

