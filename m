Return-Path: <linux-usb+bounces-7800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86127877D4D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 10:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB6428100E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 09:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF32718C01;
	Mon, 11 Mar 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oRBU6NcT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057D2232A
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150601; cv=none; b=UisznP3NaHy5hiQr2aX4+RKNL0zLnh+9nChV05fZcxR7bk0NP2FxdMhSat6mBBIyNhIz0pskEaWA7GfsJvGFmOyMP4JPqJkS9ny4c+262i7TF1N+PFW4E80TKyjSJx5Ydk1RDMNUu8G+t2VwKghFR9iM/o36iwPP8cksn6OHLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150601; c=relaxed/simple;
	bh=ErXM/xCqChIXuI/reXCOq5YLubZuZxj1O0AlcJ3LwU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FGIyGaFlN17A+OV8T+qGdDmVgNDLhLImA6MRSWTyUaHIoXWn4+L9RKiVckPowhcMrn6tw6e6lEjms6KU5vcmiLrOcsjy5xxGjx4S+i3EQMzSgxb+HJR3C7uxuJDw4y5aaxBLpl8g8P3/ZHaesPCtK2dAafDbilOcDDE7AaR0u6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oRBU6NcT; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dce775fa8adso7169679276.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710150599; x=1710755399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAGyZk4wDoLUijxbM5TEZd0Agy/9efRjEZc3xhOwTeE=;
        b=oRBU6NcTgVDlwR4+E5qFBTacDxzclrguf1ipSpVBd74OAD9IxGufSnZdSXwVDfr5qH
         8KQCoL8ypfZKlcCSyTkLJcVWdlW/WKWqLY88pONFeFWAQvfe5cfeUoCNB20theq81QO6
         FFQTEBdrgRgthP3lN+2wBv2J5dCUwhQYOgfx7yNODpXa4q8bn8zLn+uBZE8q8ozTTfoM
         UKTvoqYwQTLiYXjH2H3xrbzyOuSL0BKybOgDKCp7Orc24ZAE4jc4DQBgita9YrEkewMY
         dtN5Upk6WTSeyxpvKDKkvSBJREWaVhSC0pUKU3iwV+WB1xrqVRYIXe8t102PBkC9OcPT
         iEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710150599; x=1710755399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAGyZk4wDoLUijxbM5TEZd0Agy/9efRjEZc3xhOwTeE=;
        b=r/9W4xiWSWxbDCsMM8EQoJqF20/7U0zdydebXVzEkLRZsMrCP/VGsCHt9B3KwoTYba
         vNh3reSDq8yXtedwrJCPCoamxl9AoGosP1/03wU/VnfjdAr1cQ0siubgslvrz3cXYt85
         TipY/dHtV62u3p5mXA7V/7TW392wMS6tECor3eS/W/C8mor/0B8MRzzlwZq0+gOTZQcU
         wLSydUdciYb7JQ7bePX8YZbGCph4HM+vvMpKqQ3gQnlF96BhGfeLr/jEyvpf+7tXZV5M
         1wsuCEjgzbbp7R41O8w9DNkrnoM6s7LkMPv5dg6+oAKKni8i53qxwkqfYoKHXeM7pKum
         wydQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLhcRpWQQ80nu5M6Vg9fOsfH+FF5HT4iI5qMvUAbD0483IW7kOeoCu9G08OzkJl6qQ3IpE6CqIujDkLMWT4IDVZYoN+/4IUjKs
X-Gm-Message-State: AOJu0YxLve+N1QDNxstpZGvtO89ZdCJ5WlyWjxHb+cbIG//oALx2icJ6
	79hINA/KtUKgaET5GIXV2OuIG7zXZGNK91B7bK7MFrrm2AF6mn3gQogzSagMwMnpN1aqjP2W/Yl
	kA7PTzFU04g15XQ==
X-Google-Smtp-Source: AGHT+IE6jcflp9fRCKJ0gJHRuFbcchVasL4L61tzVdhEWWl/adPMpMiCXsQ0hTXzFp5hlU/ryT6buk71g33IePo=
X-Received: from howardyen2.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:16f7])
 (user=howardyen job=sendgmr) by 2002:a05:6902:10c2:b0:dc6:e1ed:bd1a with SMTP
 id w2-20020a05690210c200b00dc6e1edbd1amr1726976ybu.2.1710150598548; Mon, 11
 Mar 2024 02:49:58 -0700 (PDT)
Date: Mon, 11 Mar 2024 09:49:46 +0000
In-Reply-To: <20240311094947.3738200-1-howardyen@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240311094947.3738200-1-howardyen@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240311094947.3738200-2-howardyen@google.com>
Subject: [PATCH v5 1/2] dma-coherent: add support for multi coherent rmems per dev
From: Howard Yen <howardyen@google.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, mathias.nyman@intel.com, 
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	andriy.shevchenko@linux.intel.com, petr.tesarik.ext@huawei.com, 
	broonie@kernel.org, james@equiv.tech, james.clark@arm.com, 
	masahiroy@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	iommu@lists.linux.dev, Howard Yen <howardyen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for multiple coherent rmems per device. This patch replaces
original dma_mem with dma_mems list in device structure to store multiple
rmems.

These multiple rmems can be assigned to the device one by one by
of_reserved_mem_device_init_by_idx() with the memory-region
declaration in device tree as below and store the rmem to the dma_mems
list.

	device1@0 {
		...
		memory-region = <&reserved_mem0>, <&reserved_mem1>;
		...
	};

When driver tries to allocate memory from the rmems, looks for the first
available rmem and allocates the memory from this rmem.

Then if driver removed, of_reserved_mem_device_release() needs to be
invoked to release all the rmems assigned to the device.

Signed-off-by: Howard Yen <howardyen@google.com>
---
 drivers/base/core.c    |  3 ++
 include/linux/device.h |  5 +--
 kernel/dma/coherent.c  | 92 +++++++++++++++++++++++++++---------------
 3 files changed, 64 insertions(+), 36 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 14d46af40f9a..d9af38d7b870 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3108,6 +3108,9 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
+#endif
+#ifdef CONFIG_DMA_DECLARE_COHERENT
+	INIT_LIST_HEAD(&dev->dma_mems);
 #endif
 	swiotlb_dev_init(dev);
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index 97c4b046c09d..5fa15e5adbdc 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -648,7 +648,7 @@ struct device_physical_location {
  * @dma_parms:	A low level driver may set these to teach IOMMU code about
  * 		segment limitations.
  * @dma_pools:	Dma pools (if dma'ble device).
- * @dma_mem:	Internal for coherent mem override.
+ * @dma_mems:	Internal for coherent mems.
  * @cma_area:	Contiguous memory area for dma allocations
  * @dma_io_tlb_mem: Software IO TLB allocator.  Not for driver use.
  * @dma_io_tlb_pools:	List of transient swiotlb memory pools.
@@ -749,8 +749,7 @@ struct device {
 	struct list_head	dma_pools;	/* dma pools (if dma'ble) */
 
 #ifdef CONFIG_DMA_DECLARE_COHERENT
-	struct dma_coherent_mem	*dma_mem; /* internal for coherent mem
-					     override */
+	struct list_head	dma_mems; /* Internal for coherent mems */
 #endif
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index ff5683a57f77..f6748a3a5eb1 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -11,22 +11,16 @@
 #include <linux/dma-map-ops.h>
 
 struct dma_coherent_mem {
-	void		*virt_base;
-	dma_addr_t	device_base;
-	unsigned long	pfn_base;
-	int		size;
-	unsigned long	*bitmap;
-	spinlock_t	spinlock;
-	bool		use_dev_dma_pfn_offset;
+	struct list_head	node;
+	void			*virt_base;
+	dma_addr_t		device_base;
+	unsigned long		pfn_base;
+	int			size;
+	spinlock_t		spinlock;
+	unsigned long		*bitmap;
+	bool			use_dev_dma_pfn_offset;
 };
 
-static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *dev)
-{
-	if (dev && dev->dma_mem)
-		return dev->dma_mem;
-	return NULL;
-}
-
 static inline dma_addr_t dma_get_device_base(struct device *dev,
 					     struct dma_coherent_mem * mem)
 {
@@ -61,6 +55,7 @@ static struct dma_coherent_mem *dma_init_coherent_memory(phys_addr_t phys_addr,
 	dma_mem->pfn_base = PFN_DOWN(phys_addr);
 	dma_mem->size = pages;
 	dma_mem->use_dev_dma_pfn_offset = use_dma_pfn_offset;
+	INIT_LIST_HEAD(&dma_mem->node);
 	spin_lock_init(&dma_mem->spinlock);
 
 	return dma_mem;
@@ -90,10 +85,8 @@ static int dma_assign_coherent_memory(struct device *dev,
 	if (!dev)
 		return -ENODEV;
 
-	if (dev->dma_mem)
-		return -EBUSY;
+	list_add_tail(&mem->node, &dev->dma_mems);
 
-	dev->dma_mem = mem;
 	return 0;
 }
 
@@ -118,23 +111,28 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 				dma_addr_t device_addr, size_t size)
 {
 	struct dma_coherent_mem *mem;
-	int ret;
+	int retval;
 
 	mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);
 
-	ret = dma_assign_coherent_memory(dev, mem);
-	if (ret)
+	retval = dma_assign_coherent_memory(dev, mem);
+	if (retval)
 		_dma_release_coherent_memory(mem);
-	return ret;
+	return retval;
 }
 
 void dma_release_coherent_memory(struct device *dev)
 {
-	if (dev) {
-		_dma_release_coherent_memory(dev->dma_mem);
-		dev->dma_mem = NULL;
+	struct dma_coherent_mem *mem_tmp, *q;
+
+	if (!dev)
+		return;
+
+	list_for_each_entry_safe(mem_tmp, q, &dev->dma_mems, node) {
+		list_del_init(&mem_tmp->node);
+		_dma_release_coherent_memory(mem_tmp);
 	}
 }
 
@@ -187,12 +185,17 @@ static void *__dma_alloc_from_coherent(struct device *dev,
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
 		dma_addr_t *dma_handle, void **ret)
 {
-	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+	struct dma_coherent_mem *mem_tmp;
 
-	if (!mem)
+	if (list_empty(&dev->dma_mems))
 		return 0;
 
-	*ret = __dma_alloc_from_coherent(dev, mem, size, dma_handle);
+	list_for_each_entry(mem_tmp, &dev->dma_mems, node) {
+		*ret = __dma_alloc_from_coherent(dev, mem_tmp, size, dma_handle);
+		if (*ret)
+			break;
+	}
+
 	return 1;
 }
 
@@ -226,9 +229,16 @@ static int __dma_release_from_coherent(struct dma_coherent_mem *mem,
  */
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr)
 {
-	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+	struct dma_coherent_mem *mem_tmp;
+	int retval = 0;
 
-	return __dma_release_from_coherent(mem, order, vaddr);
+	list_for_each_entry(mem_tmp, &dev->dma_mems, node) {
+		retval = __dma_release_from_coherent(mem_tmp, order, vaddr);
+		if (retval == 1)
+			break;
+	}
+
+	return retval;
 }
 
 static int __dma_mmap_from_coherent(struct dma_coherent_mem *mem,
@@ -271,9 +281,16 @@ static int __dma_mmap_from_coherent(struct dma_coherent_mem *mem,
 int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 			   void *vaddr, size_t size, int *ret)
 {
-	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
+	struct dma_coherent_mem *mem_tmp;
+	int retval = 0;
 
-	return __dma_mmap_from_coherent(mem, vma, vaddr, size, ret);
+	list_for_each_entry(mem_tmp, &dev->dma_mems, node) {
+		retval = __dma_mmap_from_coherent(mem_tmp, vma, vaddr, size, ret);
+		if (retval == 1)
+			break;
+	}
+
+	return retval;
 }
 
 #ifdef CONFIG_DMA_GLOBAL_POOL
@@ -351,8 +368,17 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 static void rmem_dma_device_release(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-	if (dev)
-		dev->dma_mem = NULL;
+	struct dma_coherent_mem *mem_tmp, *q;
+
+	if (!dev)
+		return;
+
+	list_for_each_entry_safe(mem_tmp, q, &dev->dma_mems, node) {
+		if (mem_tmp == rmem->priv) {
+			list_del_init(&mem_tmp->node);
+			break;
+		}
+	}
 }
 
 static const struct reserved_mem_ops rmem_dma_ops = {
-- 
2.44.0.278.ge034bb2e1d-goog


