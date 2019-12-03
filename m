Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE1C10FB96
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 11:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLCKP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 05:15:58 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41642 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbfLCKP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 05:15:57 -0500
Received: by mail-pl1-f196.google.com with SMTP id bd4so1514255plb.8
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YrHITFCHdeD4+yA1cax6B7EYeghey89WnNbNyeOQhYw=;
        b=f2J3JfSjMMQW4lP+yVzQFbEn4Aiben8OJjuINWOcR5DXVhob+s2ix0xLzjwfNxGkyR
         jCx6fz/TB9QQ4IoJ56yCtbbtAOTmG4FEYzyh0B5MDRwDDDDrGrUJrzDjVCCddfzNVECR
         GcVsk8Mc5sv8YOkbWdtvY80b8aAQ7At6I5U3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YrHITFCHdeD4+yA1cax6B7EYeghey89WnNbNyeOQhYw=;
        b=NVIutNub9bWoki14as5yDvWzr3Enw8QzMyfy6C0OlKiw6ZrPv+UCydAErkyipfULQ5
         ZyuGOo6Chp6W5EnGSwQsi7+jHg++jGY+yjmVI9zYG44kwJH2TacVl7V1LIczAWFqchrC
         Skhu/FTXZRK6n2VgZchuEBONDGjkeAMllQYQS9TYsPDZmTmJ4y6wxra0VaSbtOhjky6A
         V+KBPtM7CO+LbIMuAyRG3Jzp11S3q8cPV6tdcMOyrcfCH7gKT3RyO8wfBtjzChFr9K9d
         LWgHjai3uMbO/l42agwKRi7JicPZSaYAbBH5mUrieJ0XMQkq82jk35iday8+4nUcPDQk
         mx9Q==
X-Gm-Message-State: APjAAAXjCxY+GJtsAvB4cUIcXpfRXk3vV4mUbG/GYNfVhAodTikS7Xw5
        LrsnBppAyaSwR9XfPCA7MjEocmYH0tVGsg==
X-Google-Smtp-Source: APXvYqwy1Cn4JTSApVIsHMb6V6BA1uS11JBgw/FaCROu8sNlG7sAcc2JMQI0h0RMKGl+scq8u+oxXw==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3mr4100209plo.205.1575368156923;
        Tue, 03 Dec 2019 02:15:56 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id 129sm3070545pfw.71.2019.12.03.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 02:15:56 -0800 (PST)
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
Subject: [PATCH v4 2/2] usb: overridable hub bInterval by device node
Date:   Tue,  3 Dec 2019 18:15:52 +0800
Message-Id: <20191203101552.199339-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/config.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5f40117e68e7..95ec5af42a1c 100644
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
@@ -257,6 +258,14 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
 	memcpy(&endpoint->desc, d, n);
 	INIT_LIST_HEAD(&endpoint->urb_list);
 
+	/* device node property overrides bInterval */
+	if (usb_of_has_combined_node(to_usb_device(ddev))) {
+		u32 interval = 0;
+		if (!of_property_read_u32(ddev->of_node, "hub,interval",
+				    &interval))
+			d->bInterval = min_t(u8, interval, 255);
+	}
+
 	/*
 	 * Fix up bInterval values outside the legal range.
 	 * Use 10 or 8 ms if no proper value can be guessed.
-- 
2.24.0.393.g34dc348eaf-goog

