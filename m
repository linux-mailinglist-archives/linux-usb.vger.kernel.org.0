Return-Path: <linux-usb+bounces-20868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E749A3D99B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 13:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C425E3BD6A3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CF91F4E27;
	Thu, 20 Feb 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fxfc/VdS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF01F4735
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053700; cv=none; b=ghb3bctUw3DE7bSXeb9ROlsyQfBSOcBqsmETMCJSHuWtiBcVlHk47L8vQiPBXYYRfu1AJs9QjvUCu7F8GE4WGnDJMX7bo9wYECXXLiHgpmZbCiA38jWTQNWF5pXze8HE6aGUMQojAmrQkkscMAyH2h0hB1c6clM+B8tIblv8R5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053700; c=relaxed/simple;
	bh=sQfD3qJRPBUk9qYUoJGzYwMx/vETsoeQF3z0aT9hPf0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPrUzVAxIDpO1w68Rtknc75QISC53kSD9C9kpHWrp41vnYGErCwTaB4cA/EGecPw0D8P01MEF6oTFKRgiKD9PQCCrdO6zU5x/JqEEJuMxobMQV7cQTcMR1c9JybvOU2be9posB58a/pq8vv7234zJ2sLB9ZenkaCfrOqqebUa0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fxfc/VdS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso1153323a12.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 04:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740053696; x=1740658496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU2MGl8Wgi67yLUkTW+4DuHQscP4FpbEA3lun0MSARs=;
        b=Fxfc/VdScvgL1EQnSSU94PIrB7OG6RSliOxh+Rmtly19TNy8ysX3AA2lSFMsaIUZoz
         8bEofnM1UMIjTRQdsH/4wR4vckeJ/p+arP7P8Hszl8VgDeNx0qu8i2/LsK7ZumnShDtM
         V23toJpJYWqdUkuOFdkXz9E2CQJoxdlhsMgDZpC6TnFCCielQ1DPLHkkcxWDhRzORp8M
         Wyu4TQCW6lomBKemJLYRcCrmStBUkBFR+KJKMkHPdvpp/MOx2/zNU404IDr/wLeDxJoY
         pHnLSNWBp+7vD8PQAMHy9Pj4GhsgN3s7+N5h5RYpclZykTQNnHr9lm9K6T5r4QnjjGo9
         J4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053696; x=1740658496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU2MGl8Wgi67yLUkTW+4DuHQscP4FpbEA3lun0MSARs=;
        b=b2xeZNaaYYgnKIi5nIEDtY7l/anQhtaZzT6Vb35yWHVDPn2qc/M3n0PcYRDByGHWDi
         aALGyVeQt8uzeHQcLjMYWSrCfI1WH++wK1rq07FmslIkza1X2UtsLrwtRTH05oqoyhaq
         sjPuQVV6/0KjQcpks856JvqN0GX021c9XG6BP9eE2Z2wvMQqNbfZuRWx+NYXQ2oYZlz+
         IxOvok23mrFATG/LvaZKGYNiTIzA8JIyzpXhQ7Qemm4SLnVZyapvnfRIV5seO9uGfnF0
         I3z6P01UmP/9793C13gbJ3fNXlKJTKUois9VdCEBdfAeO2WsOPdvSKB4SjWa9D8fmUTS
         0UqQ==
X-Gm-Message-State: AOJu0YzBAcJlDJZ//veq62CThxsAMoEsi1+eyMSAc5Z/Rto1jpN9WNVL
	zSoU2cq8InV2bA7pN2GS4Pd9w0KxqnD5gj+z6FW0Hw4cQnpJZhoVJMHKBQ==
X-Gm-Gg: ASbGnctu0dx1IBnUY56BD/xVOBeiW/Iwfk2MH2hJwJ3/bPW+HA6NSjKGmDKypqMoOg6
	G7MshmYmtf81O/0Pz9Qc5KS5nGMy7uZW48j0MeatvvrC6xd0t4lZZePHP+oM02SI0zDBTiGubZV
	Neka95BihAXWSIyrlyqT5uxzebQS5pUrKaQX2dXY6LZE/TE+MbW8k70M8YufLuEZZKiyrmQIbAh
	Q21YN7pDT8RJGLww3VZr+PdnlOATtbs8fVOPjbI8WGcCwwG2GHqqDqy6WnHshyP6lm8prpRgMDL
	iElX0MUd9usH+IunsVmLc9ORBLLyeq2/
X-Google-Smtp-Source: AGHT+IEqVT7uY200U3rZeZiWX2lx5FdZdf2Y9N4LM234t1OeIETaHMwof41No0bkXUqgvPFoU1tpqw==
X-Received: by 2002:a05:6402:1d4e:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5e035ff96e6mr56522961a12.7.1740053696329;
        Thu, 20 Feb 2025 04:14:56 -0800 (PST)
Received: from foxbook (adtt173.neoplus.adsl.tpnet.pl. [79.185.231.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709e7sm11812122a12.64.2025.02.20.04.14.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 20 Feb 2025 04:14:55 -0800 (PST)
Date: Thu, 20 Feb 2025 13:14:51 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: niklas.neronin@linux.intel.com, mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 5/4 RFC] An alternative dma_in_range() implementation
Message-ID: <20250220131451.6f356f31@foxbook>
In-Reply-To: <20250219095637.5bd6e9e4@foxbook>
References: <20250206103428.1034784-4-niklas.neronin@linux.intel.com>
	<20250219095637.5bd6e9e4@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Here's my attempt at it, the patch goes on top of the whole series. It
compiles and passes basic testing (some URBs completed, some unlinked,
no errors or other malfunction apparent).

The idea is to translate dma to trb* ASAP and work with that, because
all data structures use trb* so the code gets shorter and less verbose.
This approach is also easy to adapt to changes in handle_tx_event(),
for example it could trivially return trb* instead of seg* or take trb*
(with or without accompanying seg*) and return bool or even seg*.

I tried to make the common case (start_seg == end_seg) fast, both for
hit and miss. 5 comparisons if the range wraps around, 4 if it doesn't.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 600842425f6d..b18e7fd7d01e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -300,42 +300,36 @@ static struct xhci_segment *dma_in_range(struct xhci_segment *start_seg, union x
 					 dma_addr_t dma)
 {
 	struct xhci_segment *seg = start_seg;
+	union xhci_trb *trb;
 
-	if (start_seg == end_seg) {
-		if (start_trb <= end_trb) {
-			if (xhci_trb_virt_to_dma(start_seg, start_trb) <= dma &&
-			    dma <= xhci_trb_virt_to_dma(end_seg, end_trb))
-				return seg;
-			return NULL;
+	/* check if dma is a TRB in start_seg */
+	if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
+		trb = seg->trbs + (dma - seg->dma) / sizeof(*trb);
+
+		if (trb >= start_trb)
+			/* check if the range covers it and we are done */
+			return (end_seg != seg || trb <= end_trb) ? seg : NULL;
+
+		/* check if the range circles back to the beginning of start_seg */
+		return (end_seg == seg && end_trb < start_trb && trb <= end_trb) ? seg : NULL;
+	}
+
+	/* stop if the range doesn't pass through any other segment */
+	if (end_seg == seg && (end_trb >= start_trb || seg->next == seg))
+		return NULL;
+
+	/* search remaining segments knowing that start_trb isn't there */
+	do {
+		seg = seg->next;
+
+		if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
+			trb = seg->trbs + (dma - seg->dma) / sizeof(*trb);
+
+			return (seg != end_seg || trb <= end_trb) ? seg : NULL;
 		}
+	} while (seg != end_seg && seg != start_seg);
 
-		/* Edge case, the TD wrapped around to the start segment. */
-		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma &&
-		    dma < xhci_trb_virt_to_dma(start_seg, start_trb))
-			return NULL;
-		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
-			return seg;
-		seg = seg->next;
-	}
-
-	/* Loop through segment which don't contain the DMA address. */
-	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
-		if (seg == end_seg)
-			return NULL;
-
-		seg = seg->next;
-		if (seg == start_seg)
-			return NULL;
-	}
-
-	if (seg == start_seg) {
-		if (dma < xhci_trb_virt_to_dma(start_seg, start_trb))
-			return NULL;
-	} else if (seg == end_seg) {
-		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma)
-			return NULL;
-	}
-	return seg;
+	return NULL;
 }
 
 static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)

