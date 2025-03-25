Return-Path: <linux-usb+bounces-22124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05011A7029D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 14:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3F317784F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 13:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D86257AFB;
	Tue, 25 Mar 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ui1HN22k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE3257AEC
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910011; cv=none; b=SQ7MHzfcpJ/YXs6cyjqh++GY/Iwyv4JD+lLrp2tyQAGNEphbiXuSzAkreRGdXkXBPTT1I1+NCB7l68eog3FWSfizjwMyLu4EXk48iNvMgJ0HPRuzCRe9EI/JEF8zQ+rEj2jpLZ5cKo8eISFhav/3STo+FpSk8AC2C3WCXsCU4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910011; c=relaxed/simple;
	bh=gfN7cMZt0m00PoH2OI1tjaBb8cDZ7CVfoz0QzMwPGX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbKw131QZbtoygETPY5DwcJuF4BSUSgTAQrdqHSNYTbtHjifrJEaa1csg5Lrqq85vkEFNVKTpDdPVc+naSFzwAafCxMPBSFhq2efd3XMCSFcVblN+dLcl/ZX/rR4bZpi0wiWkOQhV/MEmo8lfJxdMcCWz5KYmv2xWCcZk3/ZAGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ui1HN22k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912622c9c0so577981f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742910007; x=1743514807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7feDy+sWNSv66+UsfBQ6A5DM/YLrYmP4DUJwBvM+h4=;
        b=Ui1HN22kJpuZD90teILb9gy2OYpbPArAIOw3efszye3l5MJtDJxoKLkJYeC0B2zsve
         9py+xSB26tzwrU47gjgU0JPa+rh0ULmgN4oTTNRiQKpnsxW93WF+C2igIAGghnLbMeKN
         5bCEAaIuEpqFHCQR0aCzZOzljD/jKtEuWzyV8iZFg/U779yVkF2CoIiorZS4NGzbPPNW
         1lNy7BdrVp2xbZVAwUBmttQ0bJ/F/RIZRcDL4TRaD6LC14svkPTK3Ldl+VClSKEuO+/c
         TfMAaGeGJ/DrSdBayOmRkkBt2l8h//ytmq5XOOjlVMdRm7I+StIBN6fuyPDNEKe9vosB
         5LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910007; x=1743514807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7feDy+sWNSv66+UsfBQ6A5DM/YLrYmP4DUJwBvM+h4=;
        b=PLT3HbUtyc0sy6233a1On6xk17/JAsNYPcPLL5g01wICjua+Z8+RZsUE9QaC2T8CEv
         UWvYyXbuGkmVTNDKcybkSclNyOJjYy/54slvvhn6wQXT3Wd0wUNcarjlE2QhDhFP7gYN
         dSpISIbkI3MGoRAHgPZFWZytoRQGzRLITFvi5CZsgymdLipnTGNPUU16GAfa0IaYhEA+
         9GkzF0ivY+ssBcT9VR4KX3pONofEylPDSs3NpfEhJ7hgAJPEkhJjsb5YoRKncr5h1bDc
         zMY/YvsLLvaFFheOTgM1pSxwpW+BNTkskaC8ovWV5pbxRoPbt448avbsDM8cH7YUd3Qq
         hCvg==
X-Forwarded-Encrypted: i=1; AJvYcCXYv+9DZRRzxZ3MeowuGrZ5NrWTg6PqP8J7YtiFOezkSCn6U43FxoJD6/qDEEIiTKO9tUy1Se7cneA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9Ok2rgPr0cwYuII8tIFK9icsmWxRy/1kYgQBBjQfmQRJAJ+r
	FREPh/izDFF2qelesA6Ri4Dw1kgs8bHycsHzBTULvnfmDD0Almezj2msa8uv6rY=
X-Gm-Gg: ASbGncs31rfApypQcqXM3EGb/5j7YUaz4CA/VL1FmsZr6qOE50V4axVEdlGzoysGdCe
	0UpCVnQh9wqQAryaw138cjou0sG+e7liBgv+Lfey7RKpQjDVuhBevuKKjg66f2tj9goJxYD8Aay
	lOZiznRkV+5wHk1/wBRxgoB1TWO+6SYmEQVRs0Z36u46qhJ71ZmgP31fkpnsXvx+qquoCnQp66o
	+UUn8NCZtOxglFv9HBz++OdOQlqKXdFy7LA83oShlm5VAq5b5NnsmPC49gHoTlld8mUXFt0KhP3
	3KuaF/vVcFN7tKHSTHq/ekK2hLKwLhz0TBhY
X-Google-Smtp-Source: AGHT+IED2TuBVJz/QsKt7tFUBFUnL7V28VtfeqSnvq7Lx3KDoQ/LLrNVxkuZwXYlKSIof6+LVtQOcQ==
X-Received: by 2002:a5d:5f8c:0:b0:38d:d69e:1316 with SMTP id ffacd0b85a97d-3997f8f4a93mr5708785f8f.1.1742910007335;
        Tue, 25 Mar 2025 06:40:07 -0700 (PDT)
Received: from localhost ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f15fsm56604616d6.34.2025.03.25.06.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:40:06 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2] usb: core: warn if a GFP zone flag is passed to hcd_buffer_alloc()
Date: Tue, 25 Mar 2025 14:40:00 +0100
Message-ID: <20250325134000.575794-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320154733.392410-1-ptesarik@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a misleading comment and issue a warning if a zone modifier is
specified when allocating a hcd buffer.

There is no valid use case for a GFP zone modifier in hcd_buffer_alloc():
- PIO mode can use any kernel-addressable memory
- dma_alloc_coherent() ignores memory zone bits

This function is called by usb_alloc_coherent() and indirectly by
usb_submit_urb(). Despite the comment, no in-tree users currently pass
GFP_DMA.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 drivers/usb/core/buffer.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index 87230869e1fa..10844cd42e66 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -108,10 +108,6 @@ void hcd_buffer_destroy(struct usb_hcd *hcd)
 }
 
 
-/* sometimes alloc/free could use kmalloc with GFP_DMA, for
- * better sharing and to leverage mm/slab.c intelligence.
- */
-
 void *hcd_buffer_alloc(
 	struct usb_bus		*bus,
 	size_t			size,
@@ -128,6 +124,12 @@ void *hcd_buffer_alloc(
 	if (hcd->localmem_pool)
 		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
 
+	/*
+	 * Zone modifiers are ignored by DMA API, and PIO should always use
+	 * GFP_KERNEL.
+	 */
+	WARN_ON_ONCE(mem_flags & GFP_ZONEMASK);
+
 	/* some USB hosts just use PIO */
 	if (!hcd_uses_dma(hcd)) {
 		*dma = ~(dma_addr_t) 0;
-- 
2.48.1


