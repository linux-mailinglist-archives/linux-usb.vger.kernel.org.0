Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6402208CD
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbgGOJcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbgGOJcT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:19 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08632C08C5C1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so4674641wmi.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDADXb7FAzSw8X5lKDm1Tv4eULkfL4pe/oWt/8u/tjI=;
        b=LdQed/Ih0lqZSe0CCBXFgRaZlWuEjjDKJxIpKs/nPHffEQP1EdCkcHyMLyH37Yz6LS
         hw3npNiL3hzjRYUd1n4AFDMrT0loBlTdv1mSuVODZjFfdKA5HWic/IoHbOHOa4zkFowx
         OXx9B97n+b4Kxs2zb/p5G3JVDB52/VcKxYcfzDBFm9RCqeUtgBLq4ThSGCTp8HmC33Rp
         7iPo+vyJiyamddgrr3wrjR3t40fA+jCSFuS/YmUgy7j8Iw+0aw8ElXPK457oReUWs2jO
         /kew5bxhd7rV2rtWYpK2FoaxwlADY6SqfwuWS/+eX/L8KjU/C3IKG2NuQqIg+YdDhOXJ
         ar2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDADXb7FAzSw8X5lKDm1Tv4eULkfL4pe/oWt/8u/tjI=;
        b=AyEhslsOghZaBDsLvCViMltGm9Jq+ufFKDKFUynddUN9c+9PyasWtbeg5bZfV3h4/g
         FwXS44lA5dF8yvtz8Y7nsj6bCihGS/K1lAUI6eSiB5XQ5HDllqh4chV/ODK6yE+rqg6p
         ZrJq8z4BMxshJgLYEPBIlKP9PNGTNov0HvMb0xTrUxHujyjLv0wsfNcM87Neuty7lERb
         r/2ATRRrT/GT1s2Sm28h0X1hfL4iIQVu7lx33gty6i9Fd9bfKQ9PcSopFi8AAHu2pe1p
         glSPfEgRciGVREBRKDlUdd8P6m6QhrnfsWFWkHhXOxghq/kAqkKIukazz64HmUasY/nX
         IAQg==
X-Gm-Message-State: AOAM532j8VTa+AVZFhh2SuoWfKR0tgHwfe+HBtiSPKe4EtrS7mL9hkjs
        7CAEalq/FxF65qSHW+q9g2buJw==
X-Google-Smtp-Source: ABdhPJxO/xBg6hX1tW1/OdfO23Yl4NCWnZHIuTxnlzd6rvRZWjW7iMR0nFemLByMXCsySd2r1950Wg==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr8206612wmj.54.1594805537724;
        Wed, 15 Jul 2020 02:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/8] usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h include file
Date:   Wed, 15 Jul 2020 10:32:05 +0100
Message-Id: <20200715093209.3165641-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the header file containing a function's prototype isn't included by
the sourcefile containing the associated function, the build system
complains of missing prototypes.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/mtu3/mtu3_trace.c:13:6: warning: no previous prototype for ‘mtu3_dbg_trace’ [-Wmissing-prototypes]
 13 | void mtu3_dbg_trace(struct device *dev, const char *fmt, ...)
 | ^~~~~~~~~~~~~~

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog

v2: No change - robot warning did not appear to be valid

 drivers/usb/mtu3/mtu3_trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/mtu3/mtu3_trace.c b/drivers/usb/mtu3/mtu3_trace.c
index 155eae126e5e2..d17ddb87cdcf2 100644
--- a/drivers/usb/mtu3/mtu3_trace.c
+++ b/drivers/usb/mtu3/mtu3_trace.c
@@ -8,6 +8,7 @@
  */
 
 #define CREATE_TRACE_POINTS
+#include "mtu3_debug.h"
 #include "mtu3_trace.h"
 
 void mtu3_dbg_trace(struct device *dev, const char *fmt, ...)
-- 
2.25.1

