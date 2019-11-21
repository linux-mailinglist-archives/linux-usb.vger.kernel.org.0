Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1389D1049F2
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 06:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfKUFSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 00:18:25 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38804 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfKUFSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 00:18:25 -0500
Received: by mail-pg1-f196.google.com with SMTP id t3so537108pgl.5
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VuwOGBrzR2whkS1/3LbZzPNcBDZzFvmrpSRRU9WHj0=;
        b=M0RlwCSItamoH3wOg/4t5jejha00zSNwwzReV5FFUUBTq2l8OMa29KV9iiGZtrEgG1
         MmD42y2WBJdJzSBtw+T26rqAMdE0txaL7fs71Z8ysgyHKugmMl9roW/qJkPVthrnMk1T
         OAHVSxlOA2IXXrMKBcvq0FAv5jxOLt1dPCtnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VuwOGBrzR2whkS1/3LbZzPNcBDZzFvmrpSRRU9WHj0=;
        b=rVqcBgiJvlees0OaAIz6HxSmZJNQ1eSmwB4kF+zmhkNExnT90SkQfEZGdmjF01RGVb
         ESbx1Sn05Kgoqcn64zEqQNxaBuUrDsqC+b4eOSrbgldOuAI1zbnFCdeD7EJ36xX2+Kkp
         tPoGewkHspoG0ootzf3Sz3i1/xVByL47h4+iD/sLz6jUFYkYLTo6LIvloRRL8jLTyF65
         0s0Km6aJC3rGwBDHO1Zu517tHZ8jZ4M4a8YSsF8lqaUwSTpb8jeTbSm2nqc6/TaZS+4O
         qTAEwKivMy3VJGRSJEXXOKWfBMaAiN7075XYRmaGF0g2mtwkVHDVIeDAoMBv6jD+5Sy0
         aWyw==
X-Gm-Message-State: APjAAAUcandF2Zacffv6mAkRCGuTfKxnJrMuAebiGLMrvILWNItgECDi
        Ijkc74S+XGA6PwsFaVgawJ/XyRaKJ5HwRA==
X-Google-Smtp-Source: APXvYqxJQZ03rhIDy/VBUuNNbTWdjVsS64jTA43uDHNNX74A//zsxJMX41Gb8Yr5a1P/nZfU4Xm+xw==
X-Received: by 2002:aa7:9abb:: with SMTP id x27mr8216447pfi.150.1574313504163;
        Wed, 20 Nov 2019 21:18:24 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id g30sm1017347pgm.23.2019.11.20.21.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 21:18:23 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v2 2/2] usb: overridable hub bInterval by device node
Date:   Thu, 21 Nov 2019 13:18:19 +0800
Message-Id: <20191121051819.111593-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch enables hub device to override its own endpoint descriptor's
bInterval when the hub has a device node with "hub,interval" property.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/usb/core/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5f40117e68e7..d2d9c6d6e00a 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -6,6 +6,7 @@
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
 #include <linux/usb/quirks.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -257,6 +258,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
 	memcpy(&endpoint->desc, d, n);
 	INIT_LIST_HEAD(&endpoint->urb_list);
 
+	/* device node property overrides bInterval */
+	if (usb_of_has_combined_node(to_usb_device(ddev)))
+		of_property_read_u8(ddev->of_node, "hub, interval",
+				    &d->bInterval);
+
 	/*
 	 * Fix up bInterval values outside the legal range.
 	 * Use 10 or 8 ms if no proper value can be guessed.
-- 
2.24.0.432.g9d3f5f5b63-goog

