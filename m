Return-Path: <linux-usb+bounces-21979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41FA6AA44
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 16:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF7913AD807
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C072B1EA7D5;
	Thu, 20 Mar 2025 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TJK9MWdO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47D1E25F2
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742485661; cv=none; b=mtFAkNvPQ22nZf8a4YjeGhEIWftEmdMe5GBrNUUbVV8u0XW9j9QI8Kuf9AAUlMYM4eDhbYsTh1ki3ClXT4ciXOhOwCa542E4LaNnKHzZk0lF9JZXg7Boipihiwd7RzM5AjmyZ62n27xUP0YpQRmwS8eoQbDt4bbAjwYTCVr1XUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742485661; c=relaxed/simple;
	bh=UR5vH+/4UOARCvF8t+iVMzoob+o1lWFKLeDHQRpWg7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdMLvsuU1V6CiStKuComb5u5Ir4ys170tlzl4X8tt/lHQ9XVcopyn+kpsR72Qt978JSP9o9Dpn1LpjMlub0Tb/eCsN9pZM2Rx/ZiNH9gyCu/54+kYJTT8aIQxWZ9W5eehGN4p79SKMd9c+lKAmnF/PX0SSbLO4JClYDNq9yx08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TJK9MWdO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so868025e9.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742485658; x=1743090458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjcpW34JDg1RGks2bE1+iEOtEigo9U4LvukjefoKP4g=;
        b=TJK9MWdOG+4NvbEa02zq8D6IkzNY8x1aVaycS3mXg2iMz0Xqupbhq6M+1p2kXGYZLh
         RZoMyxytYf0IIkHfzaxJK55qIwFs0pJ/0gGAiA8m42pp3ZdBu/Ge8yI8HGWBolNsam6b
         1w1CjlQaqR3500VdX0hdEZcngArbTZ0CQ4LwexvZNbbF/6Xz4vHNodZgu369yZBlFMUJ
         Sh15fy0CqDtoLy8lJBYhqnVQH/COXDiRk5mU/QGxDJV50eVaVMCQSq5QL09UXM4nkiFs
         evTSn0zOPo4CydsS7/5coWyop3gxcdr0Yuxu2C441B3fJrRBx4uaUbN9adJXDuKy4crL
         hf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485658; x=1743090458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjcpW34JDg1RGks2bE1+iEOtEigo9U4LvukjefoKP4g=;
        b=V7OLHumEGegDn7AuxNUpGqKa2Nptuz+z0FaUFwENbrXr3wbIfCcAoiRKrmG7xgFlXp
         2L4W+LVL88JTAs4VjBslhTqJ63UF5qtLTv4PMFzsXiCRzZ0QrnegPzCUGZqn4jiWuSE3
         ELTOuXPq1m2p0xsg9mwtuGVjXA7NCP1Ke3sUU5FTNWAOsTqdLBMTgemL7Cz2N6w9ZIxS
         q6UmVjs9cjo22p95bbEe5JSfEd2fTxYbA0NglEmAGU3yihHy+fynIm9dSYcGla8f7oit
         HOqe07im3bmCv4vbE7HKk+oC6R9jfwOpsS9Hl6Jfu8PXT0IaIwmJ5jbh7VBK2+TR/Ur5
         RE1w==
X-Gm-Message-State: AOJu0YwR74qm2STafUqNfVvS2FoScfHifRQmwVlzczUHySSTPIJskPZh
	7v5pFSZB+DV15ifYrugJkQzFC9cNCOmnm2KAJVQb91i78x/9DBBrSgJODYb1t58=
X-Gm-Gg: ASbGncuY6qyT2Cg2eBZfsa6D2Yw01sxU53y1dqXPzDclHL5w5WtYP03b23qmbD7XWNG
	2owR+7hyUoH9b1s5D9/wFOrKlAo+Xz3uspeLIk5Ja7t9ZP5ZrUsNAy0aVLf83tfMO+9KFC0Y0zR
	XKxBw08+hhYiNlQmScY7v2ZvvEdQv0WMLFWQh6B8pYOu+xWe7XNWYoGALexJHdXy95xxhoIFh7c
	kS8CHqDSdj8BCLC5kkCXH81EdHKitPH2tpAmdk0vIo0v4DCFX2+4nKzkVYXzDrRcuwEIrGQG/di
	cU9VDVfgdOKNOIz0EggwFoQH8Zu8JVJB1ahc3lTFDfEB+CKefWxMXqg/coitcIsWa7cMx/CVmNG
	y13Kb6lEwHKoVsVoHSjDkuLwtGIOD2/stn5E=
X-Google-Smtp-Source: AGHT+IHrrb7AScFRtBfaNFLlZM+jiXsLwg/fzvdWwyFOnAz/lH4fGoCWUFYo0xq4xZSHu2tdTs/0MQ==
X-Received: by 2002:a05:600c:1383:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43d44d6c6bamr24271375e9.4.1742485657551;
        Thu, 20 Mar 2025 08:47:37 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43ed6sm52076145e9.13.2025.03.20.08.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:47:37 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] usb: core: do not allocate buffers from a DMA zone unnecessarily
Date: Thu, 20 Mar 2025 16:47:33 +0100
Message-ID: <20250320154733.392410-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no reason to keep GFP zone modifiers in hcd_buffer_alloc():
- PIO mode can use any kernel-addressable memory
- dma_alloc_coherent() ignores memory zone bits

The only place where GFP zone bits are used is when dma_pool_alloc() needs
to allocate a new struct dma_page, but that is an omission rather than
intention.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 drivers/usb/core/buffer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index 87230869e1fa..2be4c2a5b214 100644
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
@@ -128,6 +124,9 @@ void *hcd_buffer_alloc(
 	if (hcd->localmem_pool)
 		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
 
+	/* DMA API ignores zone modifiers, and PIO should go with default */
+	mem_flags &= ~GFP_ZONEMASK;
+
 	/* some USB hosts just use PIO */
 	if (!hcd_uses_dma(hcd)) {
 		*dma = ~(dma_addr_t) 0;
-- 
2.48.1


