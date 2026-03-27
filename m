Return-Path: <linux-usb+bounces-35531-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +6xvJfUcxmnvGgUAu9opvQ
	(envelope-from <linux-usb+bounces-35531-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:00:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1C33F561
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3474A3066BE7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 05:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D483054EB;
	Fri, 27 Mar 2026 05:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN056wDE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C62D6E6F
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591137; cv=none; b=S6EyD+mM003+SdSmhnOLHD7/bconouO9GrBTizqTEw4TF54Yb8gziTcfgYGcIl/NqfVBiyxArk0fLzOEfUoV+cnxZyDuaTSFMpYaQhBVYQ7HFBkN8oTIRXHIQ2IGS6V0uCfWCJm27T6x9AJc9tEDY6alCRSIYnFgvQg5V0ghaJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591137; c=relaxed/simple;
	bh=bO8hvN+mMZp+ue+7KHvHFBCUiRV75jZw5gll4WkqLVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfEpD5Yw7k9MM1g2dvGlL6C+DHJAWibJ3GU2Fd0hR00MpOq4kvVnI4+b+Pubekr9w3MBa6yB84qT+6bloFk4TmHWmJPsKb/LjRHEozuH/1/ib23WpdihSOBVgRxejnBCj++29s+JaBtlSub4vr9+ovrUqNad3M0i11QHajV6dTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN056wDE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso261992a12.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 22:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774591135; x=1775195935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPvwNT2+pm09/nglousARL1BK0XMbSM7sYGP9rdShSQ=;
        b=rN056wDErR3tVmdzmaKKB0RJypDDBroAeg++C8SJSmWvDAGcHfGuufXeteQmnuAK4E
         cqwyUXVLetPAALu/UN7y7pwq4k5gXAmJ9rWhQtv4uZ8vcN+a//LHXSeTJwf0zoz1zCNb
         v+SBh59CVKPLWsQw6Eo5sIDF89gLSvpYAvijSSoCf46FgaICDFNu/YUcps6S4rNVdbds
         uP9Qpn1IhTQfCLHO4QmU5jOqU/oxDOKAhnO/vRCxQHDdEEnE8R0dmcRQ2dCv+/L7QCpF
         IeJf7MLXU3rHusVSSEJdUaObDSTGkq/Mym3jBRzRwItsbVVIoudg54HUjVZ6BXeMzYOZ
         v65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774591135; x=1775195935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPvwNT2+pm09/nglousARL1BK0XMbSM7sYGP9rdShSQ=;
        b=R6PH1koTNO2Z3XKYVixbbMHPNgIBzm1twUUpTU3oVC8qXNPVgfS00mOhADG8Ja2ll4
         7iD81AdybPPVhY4KhMc6NOJBkctVHto8E3QcJww05tuG2HI0Hqlv09BhLv0S7WRQ4nuN
         AfbTlXfjpA9//KIdHgNox/FsnRJ/Xu/BakX3AzFYHZqqAgrEoWLkAWDt4v7Zuc3d5Nkn
         qOAUy/BFjoNoX2/id9tbmfV265H+xdWqDh1oqlJZVQvZCoSGQWMu3NsgWHbqcnD1Vum0
         Rafo0TSCry9DZPXNySBIDeMBRmSmiY6NhDF/GdnGmcL8FCqFI5qPAgkmPEC7qakn5hog
         ijjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmpf9pSlKPy++bwk5atpV+wDWGjGl620JG7a8D9+twyIEnZhrkwnXtHtoiyyrPPxGXJCSX9SIsktw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFe245k6/J6JswVJ6mjm2DSIPftZtWzS+BV2M0z8qlMlOYfW5
	Q0kbPacpAoY59kXxe+VoHhk33r/AsWvl1DtOWvZC/QHkkKzPGCC9ekQS
X-Gm-Gg: ATEYQzxWCuRfgR2UKaAeK1xOYDUDPofYmMQDY9qQ5Gm7LXb02p39mnBREBcUunlb5az
	Aoki8j8Sdzl+7jqZgwwJJLMArECzFTC0NiMAJcSeL/1bUlORrbSUzKHZG/V9kUE80pPic3+N3Fq
	WcF/SEovJ4rf/9tQ+U7ucTfwtJWnMrcL++Agrqfc3NCQ7FgpfhOLfk8KrpcXN5OR8yy/fkGFHII
	gXVGrLdzwN0uFZ/JOzZZTjDiLDxKzhpalj/PLk0lmyGNj5I5gzO3mH/8YkkbKX7xrrGGeB75CZr
	v2FaQdtT1XeUS2zO5fOc9yEv9SGZvYxOzpY8GA6OX3awWK1WGd0epxhVfYXj9oFyNRRMOEEuT0F
	yEdGmkVcBe2uUT8uBDWXNZVQYVp6t9HStZ6mU07/j1YAgroSqUm5mZshf9oik5cY2iug/qUQMDI
	ehw5I0Xl6xbchSAb7YZPan6eV/ONQNiK/zUOctddVaSWI=
X-Received: by 2002:a17:907:944b:b0:b9b:3a4f:ee86 with SMTP id a640c23a62f3a-b9b507a4c11mr61540566b.26.1774591134473;
        Thu, 26 Mar 2026 22:58:54 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm208461466b.15.2026.03.26.22.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 22:58:53 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: vbabka@kernel.org,
	harry.yoo@oracle.com,
	akpm@linux-foundation.org
Cc: hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	linux@roeck-us.net,
	andy.shevchenko@gmail.com,
	hch@lst.de,
	Jeff.kirsher@gmail.com,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] mm/slab: align kmalloc to cacheline when DMA API debugging is active
Date: Fri, 27 Mar 2026 10:58:46 +0500
Message-ID: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35531-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,harvard.edu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74B1C33F561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
tracks active mappings per cacheline and warns if two different DMA
mappings share the same cacheline ("cacheline tracking EEXIST,
overlapping mappings aren't supported").

On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
hub driver) frequently land in the same 64-byte cacheline.  When both
are DMA-mapped, this triggers a false positive warning.

This has been reported repeatedly since v5.14 (when the EEXIST check
was added) across various USB host controllers and devices including
xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.

Raise ARCH_KMALLOC_MINALIGN to L1_CACHE_BYTES when CONFIG_DMA_API_DEBUG
is enabled, ensuring each kmalloc allocation occupies its own cacheline
and eliminating the false positive.

Verified with a kernel module reproducer that performs two kmalloc(8)
allocations back-to-back and DMA-maps both:

  Before: allocations share a cacheline, EEXIST fires within ~50 pairs
  After:  64 pairs allocated, all in separate cachelines, no warning

Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Jeff Kirsher <Jeff.kirsher@gmail.com>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

Reproducer module that triggers the bug reliably:
  https://bugzilla.kernel.org/attachment.cgi?id=309769

 include/linux/slab.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 15a60b501b95..f044956e17c1 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -536,6 +536,19 @@ static inline bool kmem_dump_obj(void *object) { return false; }
 #endif
 #endif
 
+/*
+ * Align memory allocations to cache lines if DMA API debugging is active
+ * to avoid false positive DMA overlapping error messages.
+ */
+#ifdef CONFIG_DMA_API_DEBUG
+#ifndef ARCH_KMALLOC_MINALIGN
+#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
+#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
+#undef ARCH_KMALLOC_MINALIGN
+#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
+#endif
+#endif
+
 #ifndef ARCH_KMALLOC_MINALIGN
 #define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
 #elif ARCH_KMALLOC_MINALIGN > 8
-- 
2.53.0


