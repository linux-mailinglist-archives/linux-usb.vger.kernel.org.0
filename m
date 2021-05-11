Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD72B37A291
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhEKIwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhEKIwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 04:52:20 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB35C061763
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:14 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so783317wmb.3
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vgxld/f3SUwpcMSWNYdxMjxyAHMeE/P2VEowI+v3Huw=;
        b=zmroXfjVdLg5yxAenNrU9ZB4IOQfcSqbqjWw4y4oS2T88o3YiRSU5ReNrxi+ZoiLB2
         HZUXWcv0hzhDqqf0VuHpEQGZTpy3oIJxJKRrlRcrx4B4afgv70Yibz2K19SW01a2jiwC
         u5QecLxh6aONSSzPCKxm3GQJVxeinYbR6K92DCHewg8CZflGJLOuHp0dNGNL/Ct0Ml2W
         ZrPjTKtrAbL9Bi2LBL9v9enrpTEyHVJSA3dc85sCw4dpho8z8HwMKgiFjJmhp8reyMI6
         CGQZpxe3P3hjDHtxIc7xqhp8R3I2jUrl1coDfasKswbBMEf6sohQnGsdRZmvmRGzhBXP
         zmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vgxld/f3SUwpcMSWNYdxMjxyAHMeE/P2VEowI+v3Huw=;
        b=B9MBrjYk1Szyfy6KsA6+DnKpPH40IXfweh8b8go8vIlK47U9rN/TPFmfAr04MjwnNV
         mlOJNEjfAYjJkzU27y4hB3/NcUf27wfuxwSOjV4DeaL5snaaeIe1sL8rkG349PFCvff2
         XCLXCxt5FvPmqjGliZrIxS6KOJ6RJlU76KGDZIM2SwAdrlyB5GAo7+bMYuGtXHJH5Zv4
         rGDsBgpJ1KxfN/6U/JpnBS1OeDnwV5Rp0YVwN6d8wEn5/68jgCnRuMGW4Sw4Q+JZILye
         DMceNeVZXGVyQEcKIYcFZCXOG6XNZG9VAYDfADG6gbDz8GS76ib9nwYtILyipypDNtO9
         8ZEw==
X-Gm-Message-State: AOAM532UsaRcZwx7f511pxzKYUss0EQs3lPVAmAv9vfHqEK0FDnhjoIN
        Aq8Pzr2tKAFAQdpzDfrMHlSvDg==
X-Google-Smtp-Source: ABdhPJySUXN64zRXUZekhCm32MHe0ks44SIuC0eiNskwAKlxS6bYfyw4r2e2/7LysNdnQSuXiq/FqA==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr4049608wmc.91.1620723072748;
        Tue, 11 May 2021 01:51:12 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j7sm23042980wmi.21.2021.05.11.01.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 01:51:12 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 3/9] usb: isp1760: use relaxed primitives
Date:   Tue, 11 May 2021 09:50:55 +0100
Message-Id: <20210511085101.2081399-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511085101.2081399-1-rui.silva@linaro.org>
References: <20210511085101.2081399-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use io relaxed access memory primitives to satisfy strict type
checking (__force).

This will fix some existing sparse warnings:
sparse: warning: cast to restricted __le32

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 20d142140574..2cc0555e029d 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -246,7 +246,7 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
 
 	if (src_offset < PAYLOAD_OFFSET) {
 		while (bytes >= 4) {
-			*dst = le32_to_cpu(__raw_readl(src));
+			*dst = readl_relaxed(src);
 			bytes -= 4;
 			src++;
 			dst++;
@@ -267,7 +267,7 @@ static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
 	 * allocated.
 	 */
 	if (src_offset < PAYLOAD_OFFSET)
-		val = le32_to_cpu(__raw_readl(src));
+		val = readl_relaxed(src);
 	else
 		val = __raw_readl(src);
 
@@ -301,7 +301,7 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
 
 	if (dst_offset < PAYLOAD_OFFSET) {
 		while (bytes >= 4) {
-			__raw_writel(cpu_to_le32(*src), dst);
+			writel_relaxed(*src, dst);
 			bytes -= 4;
 			src++;
 			dst++;
@@ -322,7 +322,7 @@ static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
 	 */
 
 	if (dst_offset < PAYLOAD_OFFSET)
-		__raw_writel(cpu_to_le32(*src), dst);
+		writel_relaxed(*src, dst);
 	else
 		__raw_writel(*src, dst);
 }
-- 
2.31.1

