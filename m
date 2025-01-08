Return-Path: <linux-usb+bounces-19116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC22A04FA3
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 02:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146FF3A1C1B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 01:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D2078F24;
	Wed,  8 Jan 2025 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="LOSzLm17"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522178F34
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299715; cv=none; b=cMTjKQymBDYf+ShlFq0lGeMNIYSn6+12RMSL61uHd5599IgXfd7zt5wtzHYa/e4Simn5LzLxA/dXhibSBHVsknDpdS3c3JWTbkCIBqq4/RZnk9q0t1ODD/KeOSIfgf7xZ81gxRr5FhY/7XXSDguVtL7IbT6qW1Ts+jV20GCLiok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299715; c=relaxed/simple;
	bh=MvasMmgtivgbnh0woFmSS29QqOJBVc3PXR+H9x7qJac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mvz6BSZsdkuDTTnL9sN5ASGORow7Vp2w2IAlpefu4l9Ayw2nUEupkWMxtESEbJzEXWzUpPPUShq/0fk+tecNkDqPJL0PhOCHhC34gPJ8+flCpnsI02cyurN2j0DhPUwjyoNe3BVZ+B3/VbwdcCVXuQ0uxPYnmxydpS4kPSx+Abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=LOSzLm17; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso234985945ad.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2025 17:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736299713; x=1736904513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ8HUJMaIcqR00c0rbIo2JJEqtoFfnSJnGvm2fMhKJw=;
        b=LOSzLm17aBt5vs/dbYGyAfLHzleK3S9hxbqLbYytYmruOc4tAg1FWHeRH3P0BQXxAH
         SQsHlipUERNzR4qCxCMvKHF0pr9ZnRfib2q8j0NjLbTWA+9LS5MyOCp5XX+P2g+lHkTE
         TDUXdnaVCs0PAH404RluNSSVMFJUkL6yfTvJBAiSpcOZZqZLVXFgvwVOenJYrZpe5xu6
         0kqh9SZDbSfZDU6FBMLrgW6mAspsLX5sYliAvKh1Rk9Uj80GFmxP1eYikeC6hbN/QKB6
         7NOB9tp4AhcbkeZ4wwfA+ur1PbRVFpMbA2TOU5Xh7w1Jzc7sIjLKK7g19QpC9VTBJXlK
         aRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299713; x=1736904513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ8HUJMaIcqR00c0rbIo2JJEqtoFfnSJnGvm2fMhKJw=;
        b=d+LxBmbIoYiLVcv9w1GzQL0EM/+83z7/qQ0UTBnrbh4QgaMdzeuOHeymzevLvg0fzk
         Dvt9nTX5A+meNLJ8BPURMZE0f2zjlVcHoXcld5yqLSuZbsLh9ODbFQ2s0N91GMdXlO0L
         PH0XMltfRCtjfjHv2AmuZNEEAuudZxd+la/AsViaY2k5ZJsdP8SVi/104RnKPp8kxmvQ
         Ggy73g+nhUAX5RWWn1ScM63y/+w4QMToE07YMJb7dzkQCGrwFTJ0hCnVbfG+grrz7GCN
         5O6/9o+ZUfD5wQDWPQJAUNtEYPYHK02lESJ5VCFbVzBjnCL6DRfWY0t7LjtbE0ajy86d
         5pCA==
X-Gm-Message-State: AOJu0YxeGERqts52UM0O0OkuklRwYxhz5EGB7QmI2caH0q5DxgfEo9ph
	14kjfEvZUT4pOSzvfYXdSemu5EkpQQZBCt5U+4oucLCsuxyrF2RcbvHwowjSKH1usLc7XmdYepf
	S
X-Gm-Gg: ASbGncsZm9u6vS0gr2mTMkGwQN7Pjs+Z6iUm5T4PKsRN+gebMorCJe92ycLqAoAb8zN
	mkeGLBYGWyj88x/7ikOcViwKdiEA1VvuHWpckIiww4eOW22esPi7qjwyE+3cj4Mbr8dULS/cYEZ
	nk/pN4WvhwuWQmfZ2yIzZTHuDfCNoT67/dWR4ceJPbPNx6WN4H9mLD5JNCSoIPUcWf1T3y8mmhK
	u1p2AIj4X5CXVnj9swi9qU4rfxH84tagE7r6/z2aMFCULFRDpNy7FQ4FJF++YAKwUUaJa9CDzFu
	XjTa
X-Google-Smtp-Source: AGHT+IGwXE0iQY3iVESTC7ltP4Or5kiQ4hjjlMKdQImZ16hOR/o1Vw0IU3P3eLjRTOu3V2cXpowKVA==
X-Received: by 2002:a05:6a20:c703:b0:1e1:cbbf:be0 with SMTP id adf61e73a8af0-1e88cfd3f67mr2644932637.22.1736299712856;
        Tue, 07 Jan 2025 17:28:32 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:83ee:4294:3e0f:6eda])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8157f9sm35314042b3a.24.2025.01.07.17.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:28:32 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] usb: dwc3-am62: Fix an OF node leak in phy_syscon_pll_refclk()
Date: Wed,  8 Jan 2025 10:28:26 +0900
Message-Id: <20250108012826.2764119-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_syscon_pll_refclk() leaks an OF node obtained by
of_parse_phandle_with_fixed_args(), thus add an of_node_put() call.

Fixes: e8784c0aec03 ("drivers: usb: dwc3: Add AM62 USB wrapper driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/usb/dwc3/dwc3-am62.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 5e3d1741701f..0a33ed958ebb 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -166,6 +166,7 @@ static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
 	if (ret)
 		return ret;
 
+	of_node_put(args.np);
 	am62->offset = args.args[0];
 
 	/* Core voltage. PHY_CORE_VOLTAGE bit Recommended to be 0 always */
-- 
2.34.1


