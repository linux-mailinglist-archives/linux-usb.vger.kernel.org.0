Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FBD2D810A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 22:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395505AbgLKVTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 16:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405690AbgLKVSy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 16:18:54 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E409C061794
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 13:18:13 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id y19so15187445lfa.13
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 13:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4jyCtqfsT6bFiaWz4C37nQaMqaYNh8RgdovwPFEFag=;
        b=L3C22yj6e7mZ1ae57EoqyLDdn2C7A5WvAmk6sNlRZpg6sSQUZHSCL8MDBYRH6RamIL
         9keusa18auHJbx1LOkaR/b2OUBPql7KMG/JZoaRdLcwZtOzSnvAZc1mAMaF736/50DcK
         C/3iRmO1bgVi5fvLa8QvITGzz+u7Mw1bIcTyx35XZgivj2DtZM7t2NLOi9brMjl/Prk8
         3vzl2qVg2x1voOpXo157jfVsnC0BhUZEV4T5sRqJCu1T49fx1r5WImUlTjShqpYJuL+V
         in9ZR9GOy/E0fQfIf5E1y446bJ6PffMqN9Ln65O0/zkDYghex69Ee5CzJeiQQ29cdax4
         6lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4jyCtqfsT6bFiaWz4C37nQaMqaYNh8RgdovwPFEFag=;
        b=olmI/k+PvxNVMOj+LxW3HfcY5cZZskaROcAoEluPRtBW2C/XHN8C/GiQa6Hi3qlL8O
         9wvsu9bgqteQgL4IuB/kh8XoKIO2rSKLA4hjG9SJjdGBA2ZhV0K1om1ppiO4wBAFOpms
         xeYV8bKfcCpbzHnF5E3UOUIpP02x58LWN8pu0gA5eLxPu6bsBXyHUXDwMi/yRENOq92W
         SCa61LBHdXDKKQXZmqFTGkTWo3i0aOrxZb5FuXDS8WdKmt2aRicxumit7pNewCED/+ja
         0QXqz+6S+fPrS466KR6mAXGNwqpXqRfCbSkKRTh/CGfu3GC1LDf4VsYqVEzwOphOI/bi
         WzuA==
X-Gm-Message-State: AOAM531BSgSbypVHOk4A8lUVg+is40XzNRPM/KQ91XHJuFDE5pal3E3O
        rPTonOw3zDj0SliUYpzSpWmw8iSyPlYeJpMbrV4=
X-Google-Smtp-Source: ABdhPJyRxtky3At4bdPpe8TSi8A5QyQyiqt6v8+Uu//6gJ5iv2ZUBFFXIOtHkhC7C8FtiMgLMeG/Mg==
X-Received: by 2002:a19:8c13:: with SMTP id o19mr5397732lfd.573.1607721491314;
        Fri, 11 Dec 2020 13:18:11 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z26sm808501lja.125.2020.12.11.13.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:18:10 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/2] usb: dwc3: drd: Avoid error when extcon is missing
Date:   Fri, 11 Dec 2020 23:19:15 +0200
Message-Id: <20201211211916.6259-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211211916.6259-1-semen.protsenko@linaro.org>
References: <20201211211916.6259-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If "port" node is missing in PHY controller node, dwc3_get_extcon()
isn't able to find extcon device. This is perfectly fine in case when
"usb-role-switch" or OTG is used, but next misleading error message is
printed in that case, from of_graph_get_remote_node():

    OF: graph: no port node found in /phy@1234abcd

Avoid printing that message by checking if port node exists in PHY node
before calling of_graph_get_remote_node().

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v3:
  - Split patch into two patches: logic diff and style diff

 drivers/usb/dwc3/drd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 3e1c1aacf002..312a4d060e80 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -463,7 +463,10 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	}
 
 	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
-	np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+	if (of_graph_is_present(np_phy))
+		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
+	else
+		np_conn = NULL;
 
 	if (np_conn)
 		edev = extcon_find_edev_by_node(np_conn);
-- 
2.29.2

