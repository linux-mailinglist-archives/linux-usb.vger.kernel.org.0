Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09DE5105F32
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 05:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfKVEZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 23:25:13 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40979 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfKVEZM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 23:25:12 -0500
Received: by mail-pj1-f65.google.com with SMTP id gc1so2480484pjb.8
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 20:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8TaUjGR1ZK3h0U41Xrlyjvus/YvOSCFkyRPWGIeHKfc=;
        b=aD1jwx6z+f92KHKX9yFRTVyInNQGgPastRMpBKSMyxmF2ijG8yfcbYaFjNY/T0Od60
         PjZVloFTMviB3NolgoCvOibRwFT2q48VSBw4RoS5Y3uv4HEPgAoa19m6hUClXA/2AXIP
         oN/mzFwnwtEV57HtZ4f66U+f4j9e/ng+/5fC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8TaUjGR1ZK3h0U41Xrlyjvus/YvOSCFkyRPWGIeHKfc=;
        b=s0pi8Uy3nMhsh/f5l4Ct4mEs2EqDjwcTXTK/HNhaCjZgQoUoYIRvOJqfaJfDemLE6m
         YmdkGvujA4nLAUcniOMRxvoPaFlkIqQxGYaSvZjo5i845ZIbZHXc+EwYApSjUWH46dyy
         iSiVqnTI/Ch6/PgtuugFj3SlgmQgZXoNGTizKVkO44hy263uedm+sgflm7UOzv6uJ2v3
         dLHG0lDmsQjF98dtYalrJPLq3Aah8nzUj0ts20lhIzOSC9Xd9zKlYKUyCG/Mpo1cHH2+
         1AZbhOdr6XhtZp2drKc9x/3Q6LwmzydyqUc6gPAAW14uKKw4wh+MX7bbZ6ZWL12LFJq6
         VIrw==
X-Gm-Message-State: APjAAAXg7VZ3BOPsYAwbJ4RHEawCNyjJog2vS6tpE5PNmye3QO3Ldrw5
        55N37yUGYyG7Bw/VK5tWdkZty3/u0EgXLA==
X-Google-Smtp-Source: APXvYqw0xEIHeWcFvt2KpNgve53FlnVWf404GB3ugZXsdS5M/ZbW3Sav8UMHXT9d/R+RDe02HDJFzg==
X-Received: by 2002:a17:902:7287:: with SMTP id d7mr12522360pll.333.1574396710980;
        Thu, 21 Nov 2019 20:25:10 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id d11sm5680854pfq.72.2019.11.21.20.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 20:25:10 -0800 (PST)
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
Subject: [PATCH v3 2/2] usb: overridable hub bInterval by device node
Date:   Fri, 22 Nov 2019 12:25:07 +0800
Message-Id: <20191122042507.205716-1-ikjn@chromium.org>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5f40117e68e7..1939f2ff87ef 100644
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
+		of_property_read_u8(ddev->of_node, "hub,interval",
+				    &d->bInterval);
+
 	/*
 	 * Fix up bInterval values outside the legal range.
 	 * Use 10 or 8 ms if no proper value can be guessed.
-- 
2.24.0.432.g9d3f5f5b63-goog

