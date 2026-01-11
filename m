Return-Path: <linux-usb+bounces-32145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C901D0EB66
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 12:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 471FD300B698
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C209A339859;
	Sun, 11 Jan 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki6IUfzP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39935337B9A
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768131399; cv=none; b=qHikQK4fOsXqHz6eZESCgfo6f2gGWdZuSGYRrucSN20XlsCr7PK76eVT19EDjaXN4oPPhHuguZ8XfStmwMh2gIAE1lFXZYkEZVHkRX6E/BAZOew0ZxILydEcY+Xi8j6dT6y6WUK2bkaaV79BqIlR1iwrhkSFQV/NBmrJfzRGo8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768131399; c=relaxed/simple;
	bh=cdUkha45HvubvsDe/MMrma3YmYsjc5vm0HM/kJcMExs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHpmYK1dObNlJTQgEMbyyI2q4+8T7CGb7AR35ghHKYlDGHttgnehmufZFYFkllszIzPy00ntHcr0MbGCPWJRKNPIcywLeexmEKIxsNA/kema+8AvRs1scz3QTmDLC94NEKLzwGOy5dQMJojhYfGT6tZ+bDXAlujZlVVxV1w5iTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki6IUfzP; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so3225445a91.2
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 03:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768131397; x=1768736197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tknxu3slDZN5mb+dL4hkf/8W0gHKkl32Gav94TO42E0=;
        b=Ki6IUfzP8Npl5fJ920n0uWuDbIyoEjt8oZEJf1edUxz97v5NFKZnvs6nMmJdSINR0E
         tcAXe9AMi1gurWCcwKNQiG4ypbQaCXHs/UNF3xP/lwvk7iS8OdQI2KOkkYs1fuyQC9E5
         qxisjiQe/jAnMAwCaDq1SsZ1IyImexO/vAiACH/RRTUy6hkD5EaixtJ7zMwc6n3uCYWr
         96KyG3d//0tSMd5OSH0uAx6R0Za8BuCh84NMHmULALhGjSJOjdpICuZFtpXc7sHQ4w4G
         9iMaxbYI9DTi9QKz40jjf0SpZZpPPClIOIZbd9p/cHDypMP4OfFfJOI6RrgEa/H0fZ2x
         KJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768131397; x=1768736197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tknxu3slDZN5mb+dL4hkf/8W0gHKkl32Gav94TO42E0=;
        b=BMjOoR87E9+O9PuXgrzHSiLXImsBJbrpyfk72YR0XYSB80ENjBP6YZQmxZbbhMi8pb
         gCo1b5Ro4pYQBcYKmIaMCWAP4JTbtHwljWncittjk/BMSz/k0Xuh3nJGg4ucOVTCsPG+
         DBNGJayvp3OTSV1LJu/GitOVfdUBk1n4odm04qwsfQ0JFsiaWZFytNRA6vyU/8NeOKXF
         57UYbyT4kfB4uMDNIG9oup262E9BI3GlyUC5brQnbcjGVu3VefxfOnYE1Oqr8MlH1q6M
         miGsRpNkh+KDUc35ZAMW2rPGEPR/2q2hDMkvaaq6H2VZ36rQXTnWNASA4Q8XafijCLg+
         s93A==
X-Forwarded-Encrypted: i=1; AJvYcCXeObE8Tjm6nGssqlK4wuxvHIYcp7rqy7O8b6+T1z3hEfasMo7no90zlzbU626XfYehsFdvnMhYcmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOK5Kn07k+8gwV2N0ob0SiFG0BWI4Xb9ZmSV++icQh9X4Td+Wd
	ON183X6wC2Tv+YS+DnPCi4l2KnAxQUGk5rxdhDx9WH9pD7B5mIyjNNxF9TAoFw==
X-Gm-Gg: AY/fxX4Pv7Cq8lsQRQpa0b1nJ1t7kfMbr9knOFZF7WsVJ9aqTbx+gg/5Jk6kPft2zIC
	NTEFEYK51FpwlrSjmwKt+pNbULJJ7qCwMha2sCLR57XwWoXaIf9+jcb+ithUtjZ1dUzVU+Ik4FX
	BMCGyFIAbVZCLYrV4uEZFbz99hUEp9kLTUux8pt1iu21yl4nieI6btwCtDk0mCKKwEOU09iV/AZ
	jaKKpw0T4uRlMVTpJTFPAsNcZG36GUV/75YEAY3naJ/Hu2qO3K+Ezdp8JIHwKjtwlJrTOEwnrJB
	su5ng5fgKey7xP4ZOyfMttX3DmZ66mEc3YMFvQeN04n972vQO7SJd/Cx2v/WW1X8S98P15myxLP
	8YCYryhGWRxmYSFINgo0/eF1cZTZW2AWfgKt2s8Mv4N0CL+jgKMKAsCwJqSe0D0plufqN0Z03zn
	jaQ8kBlRNKdZbIGQByW0BgWJxI29XCZLpLji2ZuSXvesE2BzpLA2XR9/8lov7Fs+lDeKPJBg==
X-Google-Smtp-Source: AGHT+IFhnn9vprwOm7Qw6iOmupZj55jHouPIIowg3J+jNu3jXtqdi7e4VZp3MP4qJTcHCKZ3X/zZxg==
X-Received: by 2002:a17:90b:574d:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34f68cf020fmr12667833a91.36.1768131397499;
        Sun, 11 Jan 2026 03:36:37 -0800 (PST)
Received: from C-PF5BVJTJ.vpn.alcatel-lucent.com ([167.103.6.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b7a5a69sm6130086a91.1.2026.01.11.03.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:36:37 -0800 (PST)
From: Karthikeyan K S <karthiproffesional@gmail.com>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: gregory.herrero@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan K S <karthiproffesional@gmail.com>
Subject: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for desc_hsisoc_cache
Date: Sun, 11 Jan 2026 11:36:25 +0000
Message-ID: <20260111113625.4810-1-karthiproffesional@gmail.com>
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


