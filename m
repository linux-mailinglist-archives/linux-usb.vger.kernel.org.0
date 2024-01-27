Return-Path: <linux-usb+bounces-5554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DE83EA96
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jan 2024 04:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100AB1F25972
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jan 2024 03:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C312D51B;
	Sat, 27 Jan 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAZKydas"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA865C
	for <linux-usb@vger.kernel.org>; Sat, 27 Jan 2024 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706325994; cv=none; b=jXneM+KokrciDeF/daEIg7ZyNhc7Y8oqsLrZlB643cHaLusC3+QWjiGcYCAuAb7T18Dl53Js/yftpsFjruTn2avIXmDuvftqCZdObcQkaxyvQ65gllLWYco0WG9741dSyncozHxV6Df5jeKnFM0tz7/nhkOzwIVMxlYHV7lUrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706325994; c=relaxed/simple;
	bh=JhyJkCaKqozW3RdwDJTy5txeZgoGjXCKzCyMWEvYlOA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZSg25K7bhgzZBu/lcmaZ5nEtra5QIuTvzTaaUkLoQOEKVSOJlRuk697qx9C26X1Q3MZAhevKQIN/U/hECppd8Yx5DMu1ggh25XXo+mgOMz7Q63hDeojt2kcnP2jCJ9lmXf0W7u9Remxm6Ea0gq207tDnvhQLVbC2UEkkt3BVAM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAZKydas; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ce942efda5so795423a12.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 19:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706325993; x=1706930793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tNvWAWbRBVUAeuS2RJEd+iQQjeuj9Q5hfSb/sRL1j0=;
        b=AAZKydasJ/yMEi5qvv2LS8BA9v08WPooFoFI7B9bITgYGfa/BFNcvEaxAoJ6UjIkmq
         N1CCcV0NPN2vR6QXYiWkKzU/BtZNt/+RlK/W0CYMuX6x1S8FQhTIg/ESUmF/HNjkivfa
         tfH73u5mLEt2YM3AIiMD/Q2ylrNrB3vdTyoq36LWONAEePFb8DHctAazEl2yQXJzu45Z
         dZfjCX7ZLRH+lf+SgOhdB169EgUtHQ+Jflql6jknpGpbo9RpqZsJCKgyCVcnLutTB088
         Di+R/+HNqcXqObw+qk8RHnGk89R2zHKHM2hr7bfzHOEnMXsTmfuFvw0eg8c+qbN++WAB
         OmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706325993; x=1706930793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tNvWAWbRBVUAeuS2RJEd+iQQjeuj9Q5hfSb/sRL1j0=;
        b=KMt+kozZjIOi52dxFT1/hgPw9YxZleygHQRFUb4Cpif9G5RN13iDDOK/kM1QOO2nzo
         AvLYcb+/9RTYOUef3LbgM31pUeJ8oU6IAhWxnQ7vJr1qg5nvPN1QT/WdsQhnOlBZXc2/
         Jvmi7UWiGg9cWBfWACqicHgWWsTgKwdUEeXndCV3rSmsf+WNkplfjUUirqKXr3K8UP2l
         3ie8tmw+yn+d9QGmkzUVI1/wM2ipyg0O2vX50ZEw2eZtv/bl4HYznV4+PG3EDSK9eLva
         CX4SogE3iI9iy/qidRwdNSQvrCqOdeqr8Hy8zZoyKTLoGkxRwv7A+Oe1J21MD453wopp
         /O2Q==
X-Gm-Message-State: AOJu0Yzh3TqSojGwBWoE9eX8SBAg/yOsQqA1GZFC8gtAe4xTWH0C5WQU
	1df4BXQZ5NKEWjGX/ANkzBdNIIdJedTIA8/zYZSNETi2tppcmj6neMgmis6sm1I=
X-Google-Smtp-Source: AGHT+IHtBt2jnF07hLm/5P2Zi8rq2PQMxXnzPPV84QOSjFXBtpny4RaNqXo2vXwMxYDkHIIs4NUlOQ==
X-Received: by 2002:a05:6a20:8f27:b0:199:c09d:3717 with SMTP id b39-20020a056a208f2700b00199c09d3717mr953359pzk.125.1706325992663;
        Fri, 26 Jan 2024 19:26:32 -0800 (PST)
Received: from debian.realtek. ([115.135.24.14])
        by smtp.gmail.com with ESMTPSA id hq4-20020a056a00680400b006ddc71607a7sm1818195pfb.191.2024.01.26.19.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 19:26:32 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: andreas.noever@gmail.com
Cc: michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix setting the CNS bit in ROUTER_CS_5
Date: Sat, 27 Jan 2024 11:26:28 +0800
Message-Id: <20240127032628.29606-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bit 23, CM TBT3 Not Supported (CNS), in ROUTER_CS_5 indicates
whether a USB4 Connection Manager is TBT3-Compatible and should be:
    0b for TBT3-Compatible
    1b for Not TBT3-Compatible

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/tb_regs.h | 2 +-
 drivers/thunderbolt/usb4.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 87e4795275fe..6f798f6a2b84 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -203,7 +203,7 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_5_WOP				BIT(1)
 #define ROUTER_CS_5_WOU				BIT(2)
 #define ROUTER_CS_5_WOD				BIT(3)
-#define ROUTER_CS_5_C3S				BIT(23)
+#define ROUTER_CS_5_CNS				BIT(23)
 #define ROUTER_CS_5_PTO				BIT(24)
 #define ROUTER_CS_5_UTO				BIT(25)
 #define ROUTER_CS_5_HCO				BIT(26)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index f8f0d24ff6e4..1515eff8cc3e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -290,7 +290,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 	}
 
 	/* TBT3 supported by the CM */
-	val |= ROUTER_CS_5_C3S;
+	val &= ~ROUTER_CS_5_CNS;
 
 	return tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
 }
-- 
2.39.2


