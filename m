Return-Path: <linux-usb+bounces-19075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77926A042A9
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 15:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE70C1881F07
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF75F1F0E25;
	Tue,  7 Jan 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIj8IvgT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFC1E9B00;
	Tue,  7 Jan 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260517; cv=none; b=et2XTzlAF7OHrZnpyiSDtGdu3WSOuzj12szLGbSbbDppNZIWnCboPGM6wSjjT9iS+AT+fm4eFvHMCafK1ZBj5f1JJhcUpn+rH4+XyGCZ9qHpw1OkZ1JZlCxILo+IPAqxPv6oiwq4Qijfz6IzwW66DmUEk8k3FjyOxwA0dF98v+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260517; c=relaxed/simple;
	bh=dSMnbKj3IQK21zIOXSnry0WxBKfF0CMQmQkmmNOaI/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SOAJl7zDr05XRD44Kjk2wHjdD1dKp5mwNHiijtC9esf9ekNLHg1vSRdt603OFw/UwEiStmAILTDPSyZ6oOPJEtwZlKxwws69AfjoHVZT9SGYk1iZx3VLTIwZ0vloMxx/6JNAs+r9O5JIJRriSqEXb3lKyvg9vQWywezH1jpjzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIj8IvgT; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so29461173a12.2;
        Tue, 07 Jan 2025 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736260514; x=1736865314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf/M7+eGzGRIoOADh8G+Ng72NoYSTxX1IpGIejx6WEg=;
        b=TIj8IvgTNzg5BWPU+6UWj0k4MmmG/L3nncHatVoHUlRjaZOTsriizxEIgDKNJmrwVB
         qryJx8qX3d6OMt8w5w8+aY0HAvndQYYiS9zLPmtOO7+2ebsojRJ1LthMg18TPZrRMwyU
         7pJl/1xCvEnnNoRQ6hM9wzagXjyjTz1o6a7Ur5lpZkNI5VkJDylJ45PmCbIxjY7roSyK
         ncuuDlmRJYHEX8z5uxcakdCDOfOUb/8F3EAt5o+Fh8KTXNh4qtlpzupK0B+X1EOAkdLV
         Ate2tcQC0rUl8ahOKLM7JcDfDqiSTQtFILUL7US0l51JeRAckW2ApDTd7gZxbi0VEbc/
         Kq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260514; x=1736865314;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nf/M7+eGzGRIoOADh8G+Ng72NoYSTxX1IpGIejx6WEg=;
        b=qK/qabOZx4DZKWBTJgilMBo9WDYmpGugGS1QbFDHVI0UI+S+oXptQNFxi4itNTg5fN
         RyukOArSW4Gxtx6v05bz97pi1nlToEnCwSTEtGOIyqT5tDgJ+QIp6vT5JZ1xTNT/8LuR
         Qk34g56O6H0uaI/Z8I2M4/2TITAwjuP7JVtL9Yg3cHkFSl4B/gnSbTBJrsAYGp4rFxDh
         +7cdKtxFbpGW9qz+CBKnRvl6AXD5r02d2teW3JosIOBHpwZFFCuzpDFNaxJ9cOm3fez1
         5GyiwLQSJlHhPmIweVdPEFXN+31lhrI2vZiI7EQKEB0U/CH/Z40EIaAf+/1zerlmQPiU
         J8+g==
X-Forwarded-Encrypted: i=1; AJvYcCVC1mj05eDavLvXdvJFhwO/cq9A9fbdbE9DKyVbFxuTkHE/bBdZSrQHcBhSzIPVopPmzYeKmq2bjalz@vger.kernel.org, AJvYcCXJjKu16tZ14NxfAgtnw73tyNOxV32MK1TwJKuryu2EjzxjUrGl15XEQBqtmpzAxH8ARramMNYzJ3IDM34=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeWZY60C93C8Zz3i6gXLMfAtuLxzNjqJ/i7dCSgwqqcdTIk5OH
	7vJOVvn/ZIYSEpLY7+mjJcK/fJcQHxxXrX5lGwBPjLsZvHKmiuAG
X-Gm-Gg: ASbGncu1u8U4ug3rkoB1qw+nDC1Ekx9N35ua4o4Bxop/ad5s9xWDLLxbZuQgqKR+j45
	99LQqtaf1NydO/qJwI84g6J3Rdp3bJW0TKzSPYfIOL6LrfxvzsDqm0YftfJOuxD7qtUlS19GuWE
	Eddwel/ZIVABo/knLNo04rnh8aQDGT/dF6rPoxOylpyIlVILDqwWow3bKabMi3kC0esWetGWSsp
	HbM2Eh3o29rXWqXYeLsIPGHEK/PsQVfL0FA0xJPVGRR16MtcsaeMlu1UtZTS9JQy8mtJb8=
X-Google-Smtp-Source: AGHT+IEdJmNJcRxGutzFUa/NXQMg2BXp/vpVFWEaTxX4oWx1Q4O4r0pfG7zfNc6/2/sW7mO2oV8hAg==
X-Received: by 2002:a05:6402:321a:b0:5d2:7270:6124 with SMTP id 4fb4d7f45d1cf-5d81de2311dmr56648671a12.23.1736260513729;
        Tue, 07 Jan 2025 06:35:13 -0800 (PST)
Received: from foxbook (adth42.neoplus.adsl.tpnet.pl. [79.185.219.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d807616bc1sm25057422a12.29.2025.01.07.06.35.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jan 2025 06:35:13 -0800 (PST)
Date: Tue, 7 Jan 2025 15:35:09 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Subject: [PATCH] usb: xhci: Enable the TRB overfetch quirk on VIA VL805
Message-ID: <20250107153509.727b981e@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Raspberry Pi is a major user of those chips and they discovered a bug -
when the end of a transfer ring segment is reached, up to four TRBs can
be prefetched from the next page even if the segment ends with link TRB
and on page boundary (the chip claims to support standard 4KB pages).

It also appears that if the prefetched TRBs belong to a different ring
whose doorbell is later rung, they may be used without refreshing from
system RAM and the endpoint will stay idle if their cycle bit is stale.

Other users complain about IOMMU faults on x86 systems, unsurprisingly.

Deal with it by using existing quirk which allocates a dummy page after
each transfer ring segment. This was seen to resolve both problems. RPi
came up with a more efficient solution, shortening each segment by four
TRBs, but it complicated the driver and they ditched it for this quirk.

Also rename the quirk and add VL805 device ID macro.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Link: https://github.com/raspberrypi/linux/issues/4685
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215906
CC: stable@vger.kernel.org
---
 drivers/usb/host/xhci-mem.c |  3 ++-
 drivers/usb/host/xhci-pci.c | 10 +++++++---
 drivers/usb/host/xhci.h     |  2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..fdf0c1008225 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2437,7 +2437,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * and our use of dma addresses in the trb_address_map radix tree needs
 	 * TRB_SEGMENT_SIZE alignment, so we pick the greater alignment need.
 	 */
-	if (xhci->quirks & XHCI_ZHAOXIN_TRB_FETCH)
+	if (xhci->quirks & XHCI_TRB_OVERFETCH)
+		/* Buggy HC prefetches beyond segment bounds - allocate dummy space at the end */
 		xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
 				TRB_SEGMENT_SIZE * 2, TRB_SEGMENT_SIZE * 2, xhci->page_size * 2);
 	else
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2d1e205c14c6..5a5f0b2dba4d 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -38,6 +38,8 @@
 #define PCI_DEVICE_ID_ETRON_EJ168		0x7023
 #define PCI_DEVICE_ID_ETRON_EJ188		0x7052
 
+#define PCI_DEVICE_ID_VIA_VL805			0x3483
+
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_XHCI		0x8c31
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI		0x9c31
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_LP_XHCI	0x9cb1
@@ -418,8 +420,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 			pdev->device == 0x3432)
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
 
-	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == 0x3483)
+	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == PCI_DEVICE_ID_VIA_VL805) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+		xhci->quirks |= XHCI_TRB_OVERFETCH;
+	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042_XHCI) {
@@ -467,11 +471,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 
 		if (pdev->device == 0x9202) {
 			xhci->quirks |= XHCI_RESET_ON_RESUME;
-			xhci->quirks |= XHCI_ZHAOXIN_TRB_FETCH;
+			xhci->quirks |= XHCI_TRB_OVERFETCH;
 		}
 
 		if (pdev->device == 0x9203)
-			xhci->quirks |= XHCI_ZHAOXIN_TRB_FETCH;
+			xhci->quirks |= XHCI_TRB_OVERFETCH;
 	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_CDNS &&
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 4914f0a10cff..dba1db259cd3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1628,7 +1628,7 @@ struct xhci_hcd {
 #define XHCI_EP_CTX_BROKEN_DCS	BIT_ULL(42)
 #define XHCI_SUSPEND_RESUME_CLKS	BIT_ULL(43)
 #define XHCI_RESET_TO_DEFAULT	BIT_ULL(44)
-#define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45)
+#define XHCI_TRB_OVERFETCH	BIT_ULL(45)
 #define XHCI_ZHAOXIN_HOST	BIT_ULL(46)
 #define XHCI_WRITE_64_HI_LO	BIT_ULL(47)
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
-- 
2.47.1

