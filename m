Return-Path: <linux-usb+bounces-32147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E4D0EDFA
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 13:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8E5D300B822
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 12:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D525337B9A;
	Sun, 11 Jan 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="df+QQL2j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98F31814C
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134893; cv=none; b=YWZD/asrzz0pjAjHBRF39QZ6tzgyCJmsgNxwrDboOOc8JqGgqTY8rxjgbUzkMiJL1Eap/6m1waJNdzfz1SzypzW1Mv9cAbLNpPkYv+PjexMqkyIiRE9hhAZzzmoHUpYApuYvUfsXlVjhm8zxc3N09bMAXs2sIF7uAezfRTCeZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134893; c=relaxed/simple;
	bh=uTtXZvrZwmKdVa3qaEIhedrfh/N3MCCbTvuMLgQc258=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9q412TZarCBf+GDpGvBsvbQ15cSF4Fl00pcj4CPOMMJDBAp7XRfh0kSytIgahLrHsQo6o8tFjC4G0nwa3n4xd0YYzxi67XpM50Ez8h3pqiTs7RvnecC92DeJS72f2ehmVt+pPPldL6DEJoDNY/Zl96qVk7cx6I7n16yGyD53AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=df+QQL2j; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ba599137cf8so1665694a12.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 04:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768134892; x=1768739692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6E74DSec59yu+ZnArwwPAAGN3RHG1/BS0in/WsrVyE=;
        b=df+QQL2j7nEDC/IuIFzfPKnmhlXU+xR0HWat4Jl69KXj0MTKxDQzW7mU9gPTaSdFvN
         MKweHDx+FX9q/OIvBwFRSlrADCoZ598siMCLfpg1WyqyYEFeD4yFeh41Xiho98ybiEJ5
         qbQA4A7/gqyiTyGJMFdWX3PU6Wbt034AaCnjf1xNwISwhjniNN6ydH7Q6MfvLKBp7zbJ
         iuvJBRdyJ2tAQb3EEXGDV2pRvfC8MZS/JduUz/QH/9S89Ce1MAuKud4305XSb++eVsGg
         su8cH7vDEZp98PZUlhU6Om+MvLMi48GCs/zHOrOhZ9UhPcrUoa3IKhGVxvMHJws9AXE9
         vChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768134892; x=1768739692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6E74DSec59yu+ZnArwwPAAGN3RHG1/BS0in/WsrVyE=;
        b=o0mUTUl7XcbE+I3U5VoImdJcxogQmpUZ7E/SMisxY7uvzVbPShy+e5QLu8QOy+yeQO
         V75kX74KcIN3trpQrkTs2ezaCR8vFujEyQvbIp42Ri+bvMBGs/SIWklUpPlsZC8Qi/Cd
         DLrXah6hLYfsnulstP16FHCaN9jjcvRLBmHmrsVRGR10YnqN8IHnbwbj558EUCpo0hDq
         2sozoLOWc5+LhNyIee/AicqFDyT+WbtgRt7ORtIRyC/t3/bpagNin6STpcMSP80MdfL/
         YK5/ZLPzYDpC/UZ1zVV6RcLjf3H6M/GwEHOEBWZBx0ef2CALIS1Aus4nhGpnfvPvnArJ
         T7wA==
X-Forwarded-Encrypted: i=1; AJvYcCW7IfbBb0r4+vs1KJtwgkPRyE72BGJCgoiNcrPmsCVsi1gHpoV5G/bvpkY1vAp+sRRl1PEdaqPN5pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynngvKKJHy4FhK8dyhPNPYGAn/dsFrnh5veaIc7EZ2+DsbN9kj
	QrtRuWNP9zt/QlOd6ZEQDz4RjoWqmYysC7M8590bSYuoRIzDllCADL+D
X-Gm-Gg: AY/fxX4JznfMudYCGFoO9FVbzkRvqo/U1e9nTWQgnqPkkKsVKD7K7Qqrr9+FcfaX71m
	BkdJmGxTgxzHoorsJJtMv7v44FxZXXXnQrT8G4JMbobRSFjlPb47b+fFqCZiBY7wjFgheJmg0nD
	HiJFE1v/zAmkF//wwKzpqxie1edCJAi7ol7lxhWvZgFt7suGcEI7zRn0R1nuLm69+Ne85N0Bcfr
	fbn8Y9EwxVpSupwJkjQcdGbuRc3jsJvs0We4Kpw57EIeo26YliomQrkHgP6E4dE8+5Fc/5eQI4B
	GcGKeLgeMOLHWSoKOMv1f+SWIWger/GOQGd9dcnBMy7TjEUKVwuYoAYVZcV9cAbv9OhZjE1tqKd
	NTFpPRApQYeUMwr+XGWtDMd5JFx3iJRWjW1+cvLHskiY6rSblTgLp6n1GirOB/4dbyHG0jPVFwy
	7dOE932Rp2/slR3AtAEla/RJ45Nt1c/XQkKC6adWHLFlHz
X-Google-Smtp-Source: AGHT+IFzlkIgyhNkgGw/SUJ8HJehdl5WcfhYzM5eBYPMO8aJ4Cz3oCCEuySX87MYb6s5zDv83c131w==
X-Received: by 2002:a05:6a21:3397:b0:347:4aa1:ddec with SMTP id adf61e73a8af0-3898eaadcf8mr14442351637.25.1768134891850;
        Sun, 11 Jan 2026 04:34:51 -0800 (PST)
Received: from C-PF5BVJTJ.vpn.alcatel-lucent.com ([167.103.6.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc95d5f10sm14707097a12.26.2026.01.11.04.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:34:51 -0800 (PST)
From: Karthikeyan K S <karthiproffesional@gmail.com>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: gregory.herrero@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan K S <karthiproffesional@gmail.com>
Subject: [PATCH v2] usb: dwc2: add missing SLAB_CACHE_DMA flag for desc_hsisoc_cache
Date: Sun, 11 Jan 2026 12:32:18 +0000
Message-ID: <20260111123218.15972-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The desc_hsisoc_cache kmem_cache is used to allocate DMA descriptors
for High-Speed isochronous transfers. These descriptors are passed to
the hardware via dma_map_single() in dwc2_desc_list_alloc().

The desc_gen_cache, which serves the same purpose for other transfer
types, correctly specifies SLAB_CACHE_DMA. However, desc_hsisoc_cache
was created without this flag, despite both caches being used
identically for DMA descriptor allocation.

Add the missing SLAB_CACHE_DMA flag to desc_hsisoc_cache for
consistency and correctness on platforms with DMA zone restrictions.
This also protects against future allocations from this cache that
might omit GFP_DMA.

Fixes: 3b5fcc9ac2f4 ("usb: dwc2: host: use kmem cache to allocate descriptors")

Signed-off-by: Karthikeyan K S <karthiproffesional@gmail.com>
---
v2: Resend with proper formatting (previous was corrupted by email client)
---
 drivers/usb/dwc2/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 30eb85066..556d6ab36 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5273,7 +5273,7 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
 
 		hsotg->desc_hsisoc_cache = kmem_cache_create("dwc2-hsisoc-desc",
 				sizeof(struct dwc2_dma_desc) *
-				MAX_DMA_DESC_NUM_HS_ISOC, 512, 0, NULL);
+				MAX_DMA_DESC_NUM_HS_ISOC, 512, SLAB_CACHE_DMA, NULL);
 		if (!hsotg->desc_hsisoc_cache) {
 			dev_err(hsotg->dev,
 				"unable to create dwc2 hs isoc desc cache\n");
-- 
2.43.0


