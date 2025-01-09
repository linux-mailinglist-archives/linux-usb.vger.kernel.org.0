Return-Path: <linux-usb+bounces-19168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FD6A07BC0
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 16:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A17F16B92A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 15:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA7A21D595;
	Thu,  9 Jan 2025 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDAM/xyK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB4218ADA;
	Thu,  9 Jan 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436061; cv=none; b=Q1JSJ3BkIaiuhDqTZRonAfHZ9o3w2KSuEgy0OxDadX+97vnJAPIJ+YTYlUUTNaTPXOT8pQ/Gefd3NqCn39LZ6gPEH5LpBPb6+e+Ew47ZTgTZty5ae2wElJFr96pOkSFkOQRUvoQppQMux5itbYm3hfX0vWh6bw7VvFg5990JFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436061; c=relaxed/simple;
	bh=NOtZyGCLeNE/Zgs95mmAoaaEd6u8LxZrHSpQimkw30Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2FUWFL/n15D9inbUNGlN3xg+Ajfu7QoYBIKYxNFGZX+i9MaDqihlw95gNBWGc95DPs7/zSWWkJIC8zI4MahOTIfi+FNHgT/nycDoIlcYuyX1EgRjiz8vMJcnF1xQgZgS+B96A2Y1lOUPfYc3WH+AT7vQWhSGutcDM9NkhQ8gLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDAM/xyK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4363ae65100so11966125e9.0;
        Thu, 09 Jan 2025 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436058; x=1737040858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exTdB6THt0qb0+Zib3wip/J1v0gX7t6NiMKROI4GdwU=;
        b=dDAM/xyKofD+/96zX37BU4RSYKWCfwqmllY1b5kVJpn7NejC7/vNp9EPFpFXGP+rFB
         RGuMufkJBSo4ZO27fu2Zp8vppmZVhf1StgwV3bTAnl6ATy3rjriY3eMJNJ3cKXurodxl
         fH8HE7Jvc0l3kcL7W4gcPpYUxOVC+vpwdik1yLjDbnJf1vvJea69rv9vyJNGjLwkLU/r
         L4Reiw9L0UAwUWCvULBO6Pzcbw27JIff+SRupWiMJ40NvjbjoW67xXPnQftGJnzBb8rK
         9MmjxKhorn/5q1/1QvwLvgSLUjVFRg8DUMSKJXmxf4NxNjNykCx/VEhyGoXLlq4h834d
         kwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436058; x=1737040858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exTdB6THt0qb0+Zib3wip/J1v0gX7t6NiMKROI4GdwU=;
        b=dfcOEriyEk38W10S3dWfe3rqGkPbYRRGm21WsTSHSdOT/cXXluMlPdUxdNjcwbOwec
         dgzSTsFUFxdLrBufumA8GlqJkEa+1xCHD4BFfumOhCU2uFrbro1MwBl/S/3s6z+2RfBB
         llnDqU3vsXetOCXXd3lq5c6Nkx5o7KTc/qFZ5k9ZgJLVCFapBW6qMoEFjhuFlPcOOJ3X
         TNZYfPrymQfqherrbvCj/D3iz8G5IrtGQ6k9SedsxWv9ApK9hWGPzSwdet1wOOtaHr6z
         F4fTVXGRKuf79F7/Zt+H9O3dVOAUNracnYU/QwKGEC6DaY209E/6rrNfb6tFXtKTe+re
         T0PA==
X-Forwarded-Encrypted: i=1; AJvYcCUKM/0deiwckOrPycQLklfKKYlFbpUwYf5S1y1FWTIkTb32uBg+hYJiHjj6xmOtJUsV8kNoLIvO4uNE@vger.kernel.org, AJvYcCVvTMO+5kC0JIlSP5OWuDB4QY31ukjG3eZK/OYkIB8DNZyrddVBPILAi13dn9QH/ZQ1LTiyIcHWUvqu3aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzc1dk4fR56i1I9vFM4VyWjS/sCI7zIuSW/3/yDiPDy4dc1mhs
	u2zdiAy5YIvl2jUuByZUba1RQ4Succg/NZkjbmOtVLQlu4gq+mVeotjJxQ==
X-Gm-Gg: ASbGncsr0BP6z45SePmveuq5ZRkYwRcPjN2+mKYU4rGs2I+1k4PU1Teo1yweAc0gio1
	yEFX1NIOiL9xvi6u/5/E+YW0CRkKRhfcy1DIcKAMHYFexqjZ1OfGlYy3VnSA1V0wyCy3ewnk2WJ
	tm48Je1NtPCEOAO37bUJP77qbXYu0/99HWaII6rttKFLPF29f4p58aZCC1HCqOpo3y6UVdvJTvJ
	WS2SgSErQps63cKmSwvYKW4lEaJTerEX++KCNOW45Y9vc/s1FCZu1W+
X-Google-Smtp-Source: AGHT+IGVtF5OB2FrTFOAf2dgKuYZpm4SblUZ4Y9JRiHfrY6DtVzVJDDxyLSFvVtEBlD/IUlZuJUiiQ==
X-Received: by 2002:a05:600c:6b6f:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-436e86ee529mr43113535e9.30.1736436058223;
        Thu, 09 Jan 2025 07:20:58 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89df1sm57766015e9.27.2025.01.09.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:20:57 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Thu,  9 Jan 2025 16:20:55 +0100
Message-ID: <20250109152055.52931-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-1-c7d4c4856336@gmail.com
---
 drivers/usb/dwc3/dwc3-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e16c3237180e..ef7c43008946 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -309,7 +309,6 @@ static void st_dwc3_remove(struct platform_device *pdev)
 	reset_control_assert(dwc3_data->rstc_rst);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
@@ -343,9 +342,8 @@ static int st_dwc3_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
 
 static const struct of_device_id st_dwc3_match[] = {
 	{ .compatible = "st,stih407-dwc3" },
@@ -360,7 +358,7 @@ static struct platform_driver st_dwc3_driver = {
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
-		.pm = &st_dwc3_dev_pm_ops,
+		.pm = pm_sleep_ptr(&st_dwc3_dev_pm_ops),
 	},
 };
 
-- 
2.47.1


