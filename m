Return-Path: <linux-usb+bounces-32141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32808D0E1EB
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 08:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2B98301227C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 07:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AF323A99E;
	Sun, 11 Jan 2026 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+iDExTQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844750276
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768116726; cv=none; b=Ajeucxhp5t1q0U/sDJG2hfjGPo/0n/M9voxSJbBNbmN1MgfWv5ewXI2UUMxzXDY1SZmd7YUxxd8UQQQ2uzBoXvDsiobIL+hPubVsmx83TkD2VxKgxqz1G+PgZoUNoeKWo888SziwtGbOKQD6/+0ImpD0BDz3r5gwWXoYFog8ZnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768116726; c=relaxed/simple;
	bh=T2bkPXqBb/Kwv6TBF0iD0Z14RsLI08EdjhfmI7rCNaU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U65G+qDTcptBRsSeV+KeyLexQKzWUVI+AuKRTiOxGVvRO5Bxj65v4kllIfvDM65Ixvj3nNRXYE/zx9jdrGN5yOJJgkEgJbvwMLduBlBDy7OYCmS5apsUtbUJs49UEvYaDRki1EOKMh/HzWjKSRsShLby0+umojvYVNUDYxYV1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+iDExTQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso2889248e87.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 23:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768116723; x=1768721523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CVeCP2082OK4YZ6hogo/j7gZN7lEr278oH6UYlayVbg=;
        b=Y+iDExTQPO3FD2KM29HOuDjU6jyYu2vW8ayeqS8Lzwrb0votSCmCO+BdqM2gw9pcWu
         6pyRDgTXRuCVkeSIOmfYiqukaHHqo27Nuc3erViLEAQ12SfMYfqeMfnR2H1L1k2PlBpf
         ZQ00FiA6tE3fpAjnMxQJWvLy7ctFVuPdmNbN80ZVmTbXIYaSssqPNtw3jSw+sVdo3qVD
         7pk45irRRCWpD/Xj/5MXGwwLJdUTbjTgUYdKiqzvbk5RLkOBklp+krnxi+Iv8xgfHuqj
         DTaSd2gjzB0YFyuMuYTzsF7LRRPtiHUJPXr+4p1aWYMpKIHgXdKXxoYXGxLcR9jQgTQT
         ztDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768116723; x=1768721523;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVeCP2082OK4YZ6hogo/j7gZN7lEr278oH6UYlayVbg=;
        b=sh/nQK6a/7t3a383F2mmYdP9E2eEdH6yd6ks0iK1AhF8vg2rk0ErSPz6AILuhAMOiM
         CHQ1lruhMRZrHFU+p32e8dvITc6DK9Hd28kVsMIFt7h/qFbfPps+JG86RLCSE3WvEM2U
         7Bbcd/2UHxUaKQ7l5ha1JO0hAaIGPvpVKFXle5tsY3s1UsEFbtLIN6nHgIPWHa8nKIAY
         Yqr3IHTGGPwTIpOURQE/KHj37ukWMXCQIyRgTlSchtxuxssgdqtDRPoMgnimhCCk5Iol
         iq77yltSmhg85gyrF140gEutZILqADAhGV6hEnTEGvhHwwTKDzXBZky3MYfck2ITueKR
         YV+g==
X-Forwarded-Encrypted: i=1; AJvYcCWJc+X88LzPU9D6ivsjBxr9/p8CHlApHQSv9pGbQTiWCOjbhqxaqqNiqi7Ix3aLhzs17LlegZQjPn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTAxXN5cxHzFHwX+az8D1eN75RzZvmSVexGdt3co6kTmboZ++G
	8+cuxExq+5o3CnfGJ+ATs0qDT/wS38l2fKYzZXmvstoBEDw+XcKNTAAwsIO7dRwpxMyZ709BJkf
	qM5vMxaCwfk3CSVx0kh7xxzWnhjkluIs=
X-Gm-Gg: AY/fxX7ai4hnH1sjlqSd83kQk/M4yPpc1e+7cWf8B4TC7ih3ubxkKslxF/GCxiaIsbe
	HpXeiX0OQl5RO9RodacLGt1WysLomZP6Di9E16lZHHctkKDn0TyVglwQXe+8/Xisktz7SBGvq22
	ebqiFMQDGZ1R3TlSmlN7J2RlWzjn+5QlD70mIq/0ADHa/QTTIMrWg+/CBLiuODFXZ9yot78a8qM
	uOz5q0Ssof/enxzsKwOVgwv52yBMzkNlr2MHPFpCUJo+Pl0WJzM8gvDb5hOAXqiwnXhbKPBr2ai
	dr5q3qE=
X-Google-Smtp-Source: AGHT+IFV63ReJH/Iz78uaBFybPNI3WIUVpBhVfEH9m7As4B72PXoIpOy/Nr3TdG26BYXHaQtjLRdG0FblcH2Hf+zr2k=
X-Received: by 2002:a05:6512:2117:b0:59b:7319:1178 with SMTP id
 2adb3069b0e04-59b7319121bmr2776428e87.18.1768116722449; Sat, 10 Jan 2026
 23:32:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: karthikeyan K S <karthiproffesional@gmail.com>
Date: Sun, 11 Jan 2026 13:01:51 +0530
X-Gm-Features: AZwV_Qj6r8Hc-C530b3I8wtYwy6E5q0Qr0DJpha5F6mhsHQfAwWG7ENej6lr9QM
Message-ID: <CAP_JKPvQj518Y6J0em=fwM0SeLhba8YCoTyHzWoDjq7zph33vw@mail.gmail.com>
Subject: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for desc_hsisoc_cache
To: hminas@synopsys.com, gregkh@linuxfoundation.org
Cc: gregory.herrero@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 39cd652d071184e3bab97ba92f6da30152289905 Mon Sep 17 00:00:00 2001
From: karthikeyan <karthiproffesional@gmail.com>
Date: Sun, 11 Jan 2026 08:36:25 +0200
Subject: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for
 desc_hsisoc_cache

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
Signed-off-by: karthikeyan <karthiproffesional@gmail.com>
---
 drivers/usb/dwc2/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 30eb8506617c..556d6ab36930 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5273,7 +5273,7 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)

                hsotg->desc_hsisoc_cache = kmem_cache_create("dwc2-hsisoc-desc",
                                sizeof(struct dwc2_dma_desc) *
-                               MAX_DMA_DESC_NUM_HS_ISOC, 512, 0, NULL);
+                               MAX_DMA_DESC_NUM_HS_ISOC, 512,
SLAB_CACHE_DMA, NULL);
                if (!hsotg->desc_hsisoc_cache) {
                        dev_err(hsotg->dev,
                                "unable to create dwc2 hs isoc desc cache\n");
--
2.34.1

