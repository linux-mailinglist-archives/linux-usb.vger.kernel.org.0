Return-Path: <linux-usb+bounces-7721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80880876156
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 10:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34317284126
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7B53E06;
	Fri,  8 Mar 2024 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxJpnUEs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34724537E4
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891667; cv=none; b=AKm3cM7qf0m1GqoB7oyT9ZwbbfCa/fyHSPxAPnL0DA8HyOZYGWDBFXfzDogy7J2tc/KcgjuuZpIuXXnah4zJJ4+fe7KWEeIOioIWCyKGwAZqZTLM46bPzFicqOkqVhnqqJ4Ljlr4FgYRBQP1N3LuCM/DoGQumkcTXZnCkAq0w74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891667; c=relaxed/simple;
	bh=VwxF1Jd7hcZl80hbU87Fdd9TvKw6/1OHQY0K1N2PgAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EAOvKdaNr/SGIK7Ousr1fKickHofbrUwnCgo1FsWYCCVofnmHzKU4OaiJ8C9DpknsEzJPgcs6gokNG9T3V70khC4hfURoLij/L82k3KeDsfJ3bIoDnsNfZxN+RmHuVMhsdmftV+CT8lLxWyF/RC5cZKPiI+IQ/7qq5wbHbQFgtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxJpnUEs; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-609fb719f48so22177527b3.2
        for <linux-usb@vger.kernel.org>; Fri, 08 Mar 2024 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709891663; x=1710496463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfQM7lXKYKpHQ/1XcBoyNxnnvwniQ822sDP2vHbtLjo=;
        b=rxJpnUEsqBIXsPKCSkgq3O/S7cTz0tN124gaHmTixYcFb0f0Fjiy9tr2xNVq6al4n9
         VX5VGrQETABuDJ9CC8M6L3hacjUVvXO1P0IzohDlzKLiVVxq4NbU5oddZSicMyj0vDT0
         9yuYvBSLRN7XixGXHLaKGyjiX1IgVWq7Nq0D79Q4oPE+Rp4Lo8igW9q7sWTVcJ/PFipM
         V8Sx2GdOAGEHtSZxcBZRXi9+kSz9N/8kVwB9xdaq082Z92cJKeT/45OekxRx2FBHweZh
         KhKlJTaABQRgow4AvJS/8G1d3jhXjIAEjttnUNSUZqzGr9o2hT6dwNJNftOHLkLgDqFx
         7VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891663; x=1710496463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfQM7lXKYKpHQ/1XcBoyNxnnvwniQ822sDP2vHbtLjo=;
        b=RqBhzGqhpejJ6U+8UAo/RtZ3O+tI+EcUaONOqApVzOzO62IJTqLN1oNZXA9pBq4Yoq
         3mPHBlRlLA0BsBjMUq29K+4cGMaSp5tJdF4J1AH1gTlRsPW+hpNJ0c9K8p5KB8L9PxVk
         tYBlkIJnzOvOuT4H9jVUrA+8UJoKYskndf74ZTLP8cXF+DuJErPjEbpS9yv6rrF/sM1V
         2Lnugwgjqfho2YZK88emCLcx7b5uj0mBGntJAVVA0tR8+zM39nrecEXRoDQkQL2aWx8v
         1mjT6kgCG84uVqMYPtdlPeePkDsY7y3PqlvhNdgGXRoNe9G+9HFAMU4r8ii3T30Lab+C
         8a+g==
X-Forwarded-Encrypted: i=1; AJvYcCWRDX/OG9WOI4/DniiE0kzXHWNTYMYKVDG4JNZ1dDcNUg7WRq5u27NuR0FMvp8wWzbjYS83sJk1Lxv9eLP37UwbRVeP2d3+AUGx
X-Gm-Message-State: AOJu0Yz5Cfik+SlIjqKiYwY8XxHyELBS0Qr1BC05dHjqCQ3mj7hXjyUQ
	aT1s1SlUKIFfejkb6mXhlsTPlVLZasIHu62An6+Z/XttYZWqW4GwIZzPJ2soPjkV4FN8A9V31Ax
	M71x4UpcHnV6d1w==
X-Google-Smtp-Source: AGHT+IGy/vfOF4uitu5eKDP0Q8itgVdhNGCLulZDxNd+n4ASBotX0q68/pu6NHIpHXiKCn7RImfPSX2daPJ63KY=
X-Received: from howardyen2.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:16f7])
 (user=howardyen job=sendgmr) by 2002:a05:690c:c1c:b0:609:379d:d33d with SMTP
 id cl28-20020a05690c0c1c00b00609379dd33dmr4737189ywb.6.1709891663336; Fri, 08
 Mar 2024 01:54:23 -0800 (PST)
Date: Fri,  8 Mar 2024 09:53:19 +0000
In-Reply-To: <20240308095320.1961469-1-howardyen@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240308095320.1961469-1-howardyen@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240308095320.1961469-2-howardyen@google.com>
Subject: [PATCH v4 1/2] dma-coherent: add support for multi coherent rmems per dev
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
+
+	list_for_each_entry(mem_tmp, &dev->dma_mems, node) {
+		retval = __dma_release_from_coherent(mem_tmp, order, vaddr);
+		if (retval == 1)
+			break;
+	}
 
-	return __dma_release_from_coherent(mem, order, vaddr);
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


