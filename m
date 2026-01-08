Return-Path: <linux-usb+bounces-32052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF66D02067
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 11:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A30AD30EFB1B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 09:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461BB409FA7;
	Thu,  8 Jan 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fLDMWLYI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F92409FBA
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863495; cv=none; b=hfN515OXms+u+oLJyfQbB0fbZoxPqDBlOfCqyuNNc6dsbKyagngexv/FPAw4MIfsCessBpWUiDSBEU421T8q4OB0FYRouSpa5SXIK08oITFwau9WIs+pYjPChvOBVanzbgPHuXd2cKnuXwyJPOo8nxNCkDYrmrTEU/x1pcsOkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863495; c=relaxed/simple;
	bh=B931oHIimqmsO10uO8Y+IrukZdrFt4h8LI0GgPLSxV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyflgjl/p47WyISFRGxLwDz/cc7OHqpya5GDoUG6w0XBZIzon7nLPKecHX95BYh9DWGivKLOpjZM5MC6oe9ZSK5yv56K0TiFtiO3weG4cOPLHs0L5jOS6Tsko3RAkVSM2MJFE3fIJiIiKtjdjxzp0jCCBH0jNr0pBw2DH7xiuQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fLDMWLYI; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2a081c163b0so22250165ad.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863484; x=1768468284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afDNHqE+O/jMQ8GoDcichOsLE/NDeo2/4CdPT3q2YIY=;
        b=VppIKDpLKeZVGwOIAcmJcdo4LGdmZJW/1JnJbsnXqRYcbrJatjaAQimOgauM7Qeqag
         lk31lYA5iqfg0PnuNrSlfKIPS9lPAOlr0jSdu49xQY7fx9VPwsR70rITQh0STuMRmpGx
         p4rt+M6Ta2+8RU4Ep9+UyDvbdzmc/eSh9NVqorPAUgtHp7sr8sjtcgrkt6ADolF69e3Q
         Yg9srSbwrGMMz1OXxZqXn3Jfj+37SF38T10PGrI8BHKB84I2f1/k21E6uHIQ47kcv2px
         Pc3bsCzje4c37HMiuQd+vtTns3YMjiX25KS3ToHcb4JZdmrROB+KE/0Xkb3Wo66fXM1Q
         Ej4g==
X-Forwarded-Encrypted: i=1; AJvYcCWCEZiSuAiL6Ck6URsS2/vQhLeQsyeb9cyR8Viisi71QeR0vvPwV+8Vl9UXwKVzY6spCvmmT7WHW6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6NKuqYllts5L4pnRkVKV5me9Q5Ay79H2Vg5vJGK9ONkyapr9
	PbkSchO4WEKnLovgfSZcNvK7dGwGc3Ve1K8Pm+/0RkgerBg0g9zE2kT+MJHTde7XOuhIYcWyEYZ
	CKcnkW93BFU6ZcZ6HpYDHY1NrXMAQbdROENV6GWbDiYwhe053wbY0RSE4llmOuQRuzmm0c9NfCP
	sGjIdaKhiEiygRm/3+hDaXgidncvyJb9ClPfbE5CS03uDxoFT4gOup38GB1OjCrQqrpFwkmmXw6
	womUJALGhf9aq0csUmoBA==
X-Gm-Gg: AY/fxX6Upd6fTKli+4rD0swy8PUPLEkZ8oxMnFWbyV6swDPu1kSEqxLLjzLJN4txHPr
	jXSuOyM7IuVeDncYVko/zQH0pMKKEhDtOPF2zT4F+WAhbrYwLLIL+8Q1pYbGGFydz3vSKRQRnQz
	bubcxq2Hk6SdIykawrzDtK0D+yyAuvMBZ8a512q2XAwcid3Up/wrxCumD3LOwzoa75ZElKMOrjW
	A0bo+JQLEnhEATEk78+AqoHmaZDxq4mihxDiOAQ6LUp3zyk5Mf/SoCZvn0Vj8rYn9nAVvMqUsW6
	79Z4c7GKVVEOu0n5YCHMXRcvLKBCFWBK6hD4wCAJ6xy6fIIxYlHZGmren6byM66r2FojODuWNYM
	fHKajz1xYpszb2y5jdEimBAWfLZCxvwQh0a4vsIRMMmuwEDi5rEQ/v2Fa3gK4j6Z/UjfCGzpPOC
	hJpesjXiCR0EqxdQ8K0hNO9/Rxc7u0eRfGKymy+VCb1+LPqA==
X-Google-Smtp-Source: AGHT+IHVtyrB0EF2ulijCKkHRGugyWeE2N1IPp2Glua1SHkGCPZJ3iMS3ccAm8bu+5bMvyQXULwFyK+kgVuy
X-Received: by 2002:a17:903:1585:b0:2a3:1d78:7505 with SMTP id d9443c01a7336-2a3ee4b72c2mr47838415ad.56.1767863484198;
        Thu, 08 Jan 2026 01:11:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a3e3cc4b54sm8397655ad.49.2026.01.08.01.11.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:11:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b0751d8de7so3427142eec.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767863483; x=1768468283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afDNHqE+O/jMQ8GoDcichOsLE/NDeo2/4CdPT3q2YIY=;
        b=fLDMWLYI51tengXQI/QbjJil1AUrnf1AW6lzkOfVgFVmkLumZfcby6vX/tsiemB28i
         jxs7SjcsdOJKT4fE5Ips4dJZ1kAW+kcFa80y2x0wCRP0NEuohaZ5KJHLN/F4dld+h/lf
         RGLGGlOCtVusNk3vbuSBHCeol55DY/pa9N3iE=
X-Forwarded-Encrypted: i=1; AJvYcCWeKuPCCrAqObNTTRKrNfGNcHX83XI0G7BJ4lWcKY4UTy9QmzoLdsoX2aYIkVmNpyy1aOVUjO+BYU0=@vger.kernel.org
X-Received: by 2002:a05:693c:4151:10b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b17d2b0af0mr3151546eec.23.1767863482644;
        Thu, 08 Jan 2026 01:11:22 -0800 (PST)
X-Received: by 2002:a05:693c:4151:10b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b17d2b0af0mr3151533eec.23.1767863482047;
        Thu, 08 Jan 2026 01:11:22 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm10623374eec.15.2026.01.08.01.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:11:21 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH 1/2 v6.6] usb: xhci: move link chain bit quirk checks into one helper function.
Date: Thu,  8 Jan 2026 00:50:20 -0800
Message-Id: <20260108085021.671854-2-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260108085021.671854-1-shivani.agarwal@broadcom.com>
References: <20260108085021.671854-1-shivani.agarwal@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Niklas Neronin <niklas.neronin@linux.intel.com>

commit 7476a2215c07703db5e95efaa3fc5b9f957b9417 upstream.

Older 0.95 xHCI hosts and some other specific newer hosts require the
chain bit to be set for Link TRBs even if the link TRB is not in the
middle of a transfer descriptor (TD).

move the checks for all those cases  into one xhci_link_chain_quirk()
function to clean up and avoid code duplication.

No functional changes.

[skip renaming chain_links flag, reword commit message -Mathias]

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20240626124835.1023046-10-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Shivani: Modified to apply on 6.6.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/usb/host/xhci-mem.c  | 10 ++--------
 drivers/usb/host/xhci-ring.c |  8 ++------
 drivers/usb/host/xhci.h      |  7 +++++--
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 621f12c11cbc..264f8bbe8f9e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -136,10 +136,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (!ring || !first || !last)
 		return;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (ring->type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
 	next = ring->enq_seg->next;
 	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
@@ -330,10 +327,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	unsigned int num = 0;
 	bool chain_links;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, type);
 
 	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, num, flags);
 	if (!prev)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6443e11eaac0..cdb819e323b3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -245,9 +245,7 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		 * AMD 0.96 host, carry over the chain bit of the previous TRB
 		 * (which may mean the chain bit is cleared).
 		 */
-		if (!(ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)) &&
-		    !xhci_link_trb_quirk(xhci)) {
+		if (!xhci_link_chain_quirk(xhci, ring->type)) {
 			next->link.control &= cpu_to_le32(~TRB_CHAIN);
 			next->link.control |= cpu_to_le32(chain);
 		}
@@ -3381,9 +3379,7 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		/* If we're not dealing with 0.95 hardware or isoc rings
 		 * on AMD 0.96 host, clear the chain bit.
 		 */
-		if (!xhci_link_trb_quirk(xhci) &&
-		    !(ep_ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)))
+		if (!xhci_link_chain_quirk(xhci, ep_ring->type))
 			ep_ring->enqueue->link.control &=
 				cpu_to_le32(~TRB_CHAIN);
 		else
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 808f2ee43b94..cbd8ef1c8db6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1784,9 +1784,12 @@ static inline void xhci_write_64(struct xhci_hcd *xhci,
 	lo_hi_writeq(val, regs);
 }
 
-static inline int xhci_link_trb_quirk(struct xhci_hcd *xhci)
+
+/* Link TRB chain should always be set on 0.95 hosts, and AMD 0.96 ISOC rings */
+static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_type type)
 {
-	return xhci->quirks & XHCI_LINK_TRB_QUIRK;
+	return (xhci->quirks & XHCI_LINK_TRB_QUIRK) ||
+	       (type == TYPE_ISOC && (xhci->quirks & XHCI_AMD_0x96_HOST));
 }
 
 /* xHCI debugging */
-- 
2.43.7


