Return-Path: <linux-usb+bounces-4128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46058119D2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EB91C21216
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B993A8CF;
	Wed, 13 Dec 2023 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5POMpwF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D62FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86EBC433C7;
	Wed, 13 Dec 2023 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485789;
	bh=eLWrh4gbs4DcaBLf4i76cdivQmYRUAp1gaa0fV8JwXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5POMpwF4g/+L+e0t+RJluUkXzT6P0t/scdPvMetcvqrR2qcjlHQ0gsufUTYctXgB
	 lSPqc+ax0QAqNO/Fvs4PQXgcAVESVwrZ/wMDpBOOEkXKqmspF3B6Fd+XHKxXxS2ldo
	 V7qTP8J32YULRzP7Vz4AK6a9hZMIaibvgmJy4yWOKX6g+urv6C5SjGsITw7idg+K4W
	 4ncw+Dgk73yvlwMWwwpV1BihVy3ETMwRrYcMviR200Y4FK21ZelHA1weJ+z0XhKZLL
	 9p4d9avBRSQPWvLY5E969cIvXP0HWb7cXsoqQszDAU8Y49209iqqnxyxDwqW23/kmW
	 oMUBpGyObWFVA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH 06/12] usb: cdns2: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:35 +0000
Message-ID: <20231213164246.1021885-7-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/udc/cdns2/cdns2-debug.h | 138 ++++++++++-----------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-debug.h b/drivers/usb/gadget/udc/cdns2/cdns2-debug.h
index be9ae0d28a409..f5f330004190e 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-debug.h
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-debug.h
@@ -16,34 +16,34 @@ static inline const char *cdns2_decode_usb_irq(char *str, size_t size,
 {
 	int ret;
 
-	ret = snprintf(str, size, "usbirq: 0x%02x - ", usb_irq);
+	ret = scnprintf(str, size, "usbirq: 0x%02x - ", usb_irq);
 
 	if (usb_irq & USBIRQ_SOF)
-		ret += snprintf(str + ret, size - ret, "SOF ");
+		ret += scnprintf(str + ret, size - ret, "SOF ");
 	if (usb_irq & USBIRQ_SUTOK)
-		ret += snprintf(str + ret, size - ret, "SUTOK ");
+		ret += scnprintf(str + ret, size - ret, "SUTOK ");
 	if (usb_irq & USBIRQ_SUDAV)
-		ret += snprintf(str + ret, size - ret, "SETUP ");
+		ret += scnprintf(str + ret, size - ret, "SETUP ");
 	if (usb_irq & USBIRQ_SUSPEND)
-		ret += snprintf(str + ret, size - ret, "Suspend ");
+		ret += scnprintf(str + ret, size - ret, "Suspend ");
 	if (usb_irq & USBIRQ_URESET)
-		ret += snprintf(str + ret, size - ret, "Reset ");
+		ret += scnprintf(str + ret, size - ret, "Reset ");
 	if (usb_irq & USBIRQ_HSPEED)
-		ret += snprintf(str + ret, size - ret, "HS ");
+		ret += scnprintf(str + ret, size - ret, "HS ");
 	if (usb_irq & USBIRQ_LPM)
-		ret += snprintf(str + ret, size - ret, "LPM ");
+		ret += scnprintf(str + ret, size - ret, "LPM ");
 
-	ret += snprintf(str + ret, size - ret, ", EXT: 0x%02x - ", ext_irq);
+	ret += scnprintf(str + ret, size - ret, ", EXT: 0x%02x - ", ext_irq);
 
 	if (ext_irq & EXTIRQ_WAKEUP)
-		ret += snprintf(str + ret, size - ret, "Wakeup ");
+		ret += scnprintf(str + ret, size - ret, "Wakeup ");
 	if (ext_irq & EXTIRQ_VBUSFAULT_FALL)
-		ret += snprintf(str + ret, size - ret, "VBUS_FALL ");
+		ret += scnprintf(str + ret, size - ret, "VBUS_FALL ");
 	if (ext_irq & EXTIRQ_VBUSFAULT_RISE)
-		ret += snprintf(str + ret, size - ret, "VBUS_RISE ");
+		ret += scnprintf(str + ret, size - ret, "VBUS_RISE ");
 
-	if (ret >= size)
-		pr_info("CDNS2: buffer overflowed.\n");
+	if (ret == size - 1)
+		pr_info("CDNS2: buffer may be truncated.\n");
 
 	return str;
 }
@@ -54,28 +54,28 @@ static inline const char *cdns2_decode_dma_irq(char *str, size_t size,
 {
 	int ret;
 
-	ret = snprintf(str, size, "ISTS: %08x, %s: %08x ",
-		       ep_ists, ep_name, ep_sts);
+	ret = scnprintf(str, size, "ISTS: %08x, %s: %08x ",
+			ep_ists, ep_name, ep_sts);
 
 	if (ep_sts & DMA_EP_STS_IOC)
-		ret += snprintf(str + ret, size - ret, "IOC ");
+		ret += scnprintf(str + ret, size - ret, "IOC ");
 	if (ep_sts & DMA_EP_STS_ISP)
-		ret += snprintf(str + ret, size - ret, "ISP ");
+		ret += scnprintf(str + ret, size - ret, "ISP ");
 	if (ep_sts & DMA_EP_STS_DESCMIS)
-		ret += snprintf(str + ret, size - ret, "DESCMIS ");
+		ret += scnprintf(str + ret, size - ret, "DESCMIS ");
 	if (ep_sts & DMA_EP_STS_TRBERR)
-		ret += snprintf(str + ret, size - ret, "TRBERR ");
+		ret += scnprintf(str + ret, size - ret, "TRBERR ");
 	if (ep_sts & DMA_EP_STS_OUTSMM)
-		ret += snprintf(str + ret, size - ret, "OUTSMM ");
+		ret += scnprintf(str + ret, size - ret, "OUTSMM ");
 	if (ep_sts & DMA_EP_STS_ISOERR)
-		ret += snprintf(str + ret, size - ret, "ISOERR ");
+		ret += scnprintf(str + ret, size - ret, "ISOERR ");
 	if (ep_sts & DMA_EP_STS_DBUSY)
-		ret += snprintf(str + ret, size - ret, "DBUSY ");
+		ret += scnprintf(str + ret, size - ret, "DBUSY ");
 	if (DMA_EP_STS_CCS(ep_sts))
-		ret += snprintf(str + ret, size - ret, "CCS ");
+		ret += scnprintf(str + ret, size - ret, "CCS ");
 
-	if (ret >= size)
-		pr_info("CDNS2: buffer overflowed.\n");
+	if (ret == size - 1)
+		pr_info("CDNS2: buffer may be truncated.\n");
 
 	return str;
 }
@@ -105,43 +105,43 @@ static inline const char *cdns2_raw_ring(struct cdns2_endpoint *pep,
 	int ret;
 	int i;
 
-	ret = snprintf(str, size, "\n\t\tTR for %s:", pep->name);
+	ret = scnprintf(str, size, "\n\t\tTR for %s:", pep->name);
 
 	trb = &trbs[ring->dequeue];
 	dma = cdns2_trb_virt_to_dma(pep, trb);
-	ret += snprintf(str + ret, size - ret,
-			"\n\t\tRing deq index: %d, trb: V=%p, P=0x%pad\n",
-			ring->dequeue, trb, &dma);
+	ret += scnprintf(str + ret, size - ret,
+			 "\n\t\tRing deq index: %d, trb: V=%p, P=0x%pad\n",
+			 ring->dequeue, trb, &dma);
 
 	trb = &trbs[ring->enqueue];
 	dma = cdns2_trb_virt_to_dma(pep, trb);
-	ret += snprintf(str + ret, size - ret,
-			"\t\tRing enq index: %d, trb: V=%p, P=0x%pad\n",
-			ring->enqueue, trb, &dma);
+	ret += scnprintf(str + ret, size - ret,
+			 "\t\tRing enq index: %d, trb: V=%p, P=0x%pad\n",
+			 ring->enqueue, trb, &dma);
 
-	ret += snprintf(str + ret, size - ret,
-			"\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
-			ring->free_trbs, ring->ccs, ring->pcs);
+	ret += scnprintf(str + ret, size - ret,
+			 "\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
+			 ring->free_trbs, ring->ccs, ring->pcs);
 
 	if (TRBS_PER_SEGMENT > 40) {
-		ret += snprintf(str + ret, size - ret,
-				"\t\tTransfer ring %d too big\n", TRBS_PER_SEGMENT);
+		ret += scnprintf(str + ret, size - ret,
+				 "\t\tTransfer ring %d too big\n", TRBS_PER_SEGMENT);
 		return str;
 	}
 
 	dma = ring->dma;
 	for (i = 0; i < TRBS_PER_SEGMENT; ++i) {
 		trb = &trbs[i];
-		ret += snprintf(str + ret, size - ret,
-				"\t\t@%pad %08x %08x %08x\n", &dma,
-				le32_to_cpu(trb->buffer),
-				le32_to_cpu(trb->length),
-				le32_to_cpu(trb->control));
+		ret += scnprintf(str + ret, size - ret,
+				 "\t\t@%pad %08x %08x %08x\n", &dma,
+				 le32_to_cpu(trb->buffer),
+				 le32_to_cpu(trb->length),
+				 le32_to_cpu(trb->control));
 		dma += sizeof(*trb);
 	}
 
-	if (ret >= size)
-		pr_info("CDNS2: buffer overflowed.\n");
+	if (ret == size - 1)
+		pr_info("CDNS2: buffer may be truncated.\n");
 
 	return str;
 }
@@ -166,36 +166,36 @@ static inline const char *cdns2_decode_trb(char *str, size_t size, u32 flags,
 
 	switch (type) {
 	case TRB_LINK:
-		ret = snprintf(str, size,
-			       "LINK %08x type '%s' flags %c:%c:%c%c:%c",
-			       buffer, cdns2_trb_type_string(type),
-			       flags & TRB_CYCLE ? 'C' : 'c',
-			       flags & TRB_TOGGLE ? 'T' : 't',
-			       flags & TRB_CHAIN ? 'C' : 'c',
-			       flags & TRB_CHAIN ? 'H' : 'h',
-			       flags & TRB_IOC ? 'I' : 'i');
+		ret = scnprintf(str, size,
+				"LINK %08x type '%s' flags %c:%c:%c%c:%c",
+				buffer, cdns2_trb_type_string(type),
+				flags & TRB_CYCLE ? 'C' : 'c',
+				flags & TRB_TOGGLE ? 'T' : 't',
+				flags & TRB_CHAIN ? 'C' : 'c',
+				flags & TRB_CHAIN ? 'H' : 'h',
+				flags & TRB_IOC ? 'I' : 'i');
 		break;
 	case TRB_NORMAL:
-		ret = snprintf(str, size,
-			       "type: '%s', Buffer: %08x, length: %ld, burst len: %ld, "
-			       "flags %c:%c:%c%c:%c",
-			       cdns2_trb_type_string(type),
-			       buffer, TRB_LEN(length),
-			       TRB_FIELD_TO_BURST(length),
-			       flags & TRB_CYCLE ? 'C' : 'c',
-			       flags & TRB_ISP ? 'I' : 'i',
-			       flags & TRB_CHAIN ? 'C' : 'c',
-			       flags & TRB_CHAIN ? 'H' : 'h',
-			       flags & TRB_IOC ? 'I' : 'i');
+		ret = scnprintf(str, size,
+				"type: '%s', Buffer: %08x, length: %ld, burst len: %ld, "
+				"flags %c:%c:%c%c:%c",
+				cdns2_trb_type_string(type),
+				buffer, TRB_LEN(length),
+				TRB_FIELD_TO_BURST(length),
+				flags & TRB_CYCLE ? 'C' : 'c',
+				flags & TRB_ISP ? 'I' : 'i',
+				flags & TRB_CHAIN ? 'C' : 'c',
+				flags & TRB_CHAIN ? 'H' : 'h',
+				flags & TRB_IOC ? 'I' : 'i');
 		break;
 	default:
-		ret = snprintf(str, size, "type '%s' -> raw %08x %08x %08x",
-			       cdns2_trb_type_string(type),
-			       buffer, length, flags);
+		ret = scnprintf(str, size, "type '%s' -> raw %08x %08x %08x",
+				cdns2_trb_type_string(type),
+				buffer, length, flags);
 	}
 
-	if (ret >= size)
-		pr_info("CDNS2: buffer overflowed.\n");
+	if (ret == size - 1)
+		pr_info("CDNS2: buffer may be truncated.\n");
 
 	return str;
 }
-- 
2.43.0.472.g3155946c3a-goog


