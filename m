Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4ECB37F45F
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 10:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhEMIss (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 04:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbhEMIso (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 04:48:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333D7C061763
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a4so26166964wrr.2
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vgxld/f3SUwpcMSWNYdxMjxyAHMeE/P2VEowI+v3Huw=;
        b=PTb1zlco1SeiGL9syojiYeA5mxMqkyG/mPz+g5UKeA7WAXxfXf5KrYwTHIZvPd1Srl
         fVihb2GqeXAT0VH6M2JuzLtDcTnCceCcgGBuBFUrPyJTOOwza5IbRQrJzrEgWPzEeD5s
         Hhg90srR4fRiDMInVffEztpa9Wl2pZuEc3EYJeVqzwM7l6Rej4t78UDYkUK2RT0NDFk4
         SeDd8QbriPI+MWV8iWJrZyB3oKB6ZcTZNu1Akvdh3gMaFKQbpVpGcLF4m76WkTXFVXbv
         pV9Mwfe7A6mMVXa0hPGRYanPPVd2GdR76EAq4NakvVWQFlmGNU4Lwzx9weUsD7JwB+ya
         mIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vgxld/f3SUwpcMSWNYdxMjxyAHMeE/P2VEowI+v3Huw=;
        b=l0GKUCxxzPs7MAzhkxIiZl8GDPlsdoaxZp1H1Ro7I80ugbQuUpzVLg8/nma+sXtDFo
         gx20hf1/fJAELJRZAHG0XY/s21bxtbR1CtppreNUTRqC0Pz0H1QVT3bz9guBs9kVMK8T
         1x4phBXE/FxYgcPjuQVTyxwwIIXytyjushlhIF3Y5+sriM3Bpc19E/wuROuIreFhj/NX
         5q82GkchHDhr54r0Qs/luXON68W609ikMI3tcKUPLvo/8OW2+wtV9XPrNdidV0rP+Gq/
         F/5m/lJXrrm6QS6ew7LHe+x8f0p8EesxawOvddX8GE6SHNeJjJJInUCaiQCCHVvxHL/e
         sBZw==
X-Gm-Message-State: AOAM530rmRDIB4VpPlTP7iCjhqQj4VIeTne2FWIt89u+5VtWOmwbMobj
        8MavBegCjnaPl4unO/zUxu2C7yhgReAJ+w==
X-Google-Smtp-Source: ABdhPJxmIePqo7rEdZEoJFoQsT93vSJwCQLKiDzlhYXgdiEukX6eXgldWvB8lKGQT/SM3N2/y8eXhA==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr50554175wrp.341.1620895650909;
        Thu, 13 May 2021 01:47:30 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h15sm1730282wmq.4.2021.05.13.01.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 01:47:30 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4 3/9] usb: isp1760: use relaxed primitives
Date:   Thu, 13 May 2021 09:47:11 +0100
Message-Id: <20210513084717.2487366-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513084717.2487366-1-rui.silva@linaro.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
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

