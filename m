Return-Path: <linux-usb+bounces-29198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A372BD1C43
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B923A5BE4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580AE2E8897;
	Mon, 13 Oct 2025 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXVey43V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E6296BA8
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340178; cv=none; b=uVEJcVjmb6yBTCf76toquHDb3gbNsdcKNTOqWQn+yH/gFMfpqC9kGEA9pz6oWnr9Yx5ikYjUtj2KPfSb5SiCmiCqinnq6tITPNqTe7og70hpSJTpj+NEFwjyAfx977PyQuF3kyYLE/j/90AgH+H1bsz7RCQ7RlXAZWV151qyLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340178; c=relaxed/simple;
	bh=RL1qx7lnDW2k+goEWt8CO7eKfJt37lqpyYCrWGhYjBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9FJea/bReE1Tr63ipnWZ3gAPaDBn+vdx58tR9C/Pu72J/TpT8usRoC1nx/O/f+hSsxvS5ZOy0xnov0uj+MBWn/+itQCW5Fu64gfEGuuX7jPYNkMa80jgFsBJwLAk3lVpa0m+12B7N3INqR/uQJKaZ7U5f4eecFHiH8vBs6FpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXVey43V; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so6903063a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760340175; x=1760944975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gAXAJVhyEp1HKMGFh/TvbuN8pteWkQ54oK6Wcz/IpI=;
        b=PXVey43VWi8EdGmJOXBoyYRQdqGF4maAGZw4IX5gIfwupN10FnLutXSPfr0wxy/fsh
         Ec0631l1FihRRq81SeD8N8MiRumblpBSEMkLa+jGsQjMTnnP/8slN8V3wbQ8L+tlk/Bw
         riLOZQGYBSSYGl1Kvm31zuGAzAhdqIm6LEMi+Dialvx25Y+sci8xTd3/ibtVCkn6ojhw
         xo5q02muvSRHmU0eNR5c2K+DMLgF5NKI/2EMAfWoPlFcS/Drhtk9aRe+gmwqNwjMq3i0
         BqA0rq4itHZeZ8EMGvBuj63p6mSMYo8OiHxkYPjC8KaxgQBu3Ln1nzRQRVDogP+vpNtc
         +/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760340175; x=1760944975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gAXAJVhyEp1HKMGFh/TvbuN8pteWkQ54oK6Wcz/IpI=;
        b=tESnlD4J2Yjf1WOCi+P5OhyT0cPvDXuCIbnfP6/eESHZqgSltnLAFkXQ0q8qi7g6+r
         UGBjTYqCapGO/sAYQRkXfZ2gW7WIilWq4gYRV4cdLi7oto280xMk71jBU6LBweX9y89g
         6Ubm9rjhxBuKEFL0kKdeBvJJYb/uBlwXoiETopCHxmyHhL6PQH3mD1E4L8h76I0n01Xv
         copEXC/QQKWE2Zp0woFCb89c+JsqLAFNY3ebnjEJimeu6I9QEO7pY3f5+F/uZyPN0+K1
         wv/qqi9jqXRdFMV9Lgkq++ZpitKp1ugmXFBfTUAPaWAsres5exMXFcsoarmyeHDvbs54
         dLMA==
X-Forwarded-Encrypted: i=1; AJvYcCUaguYYY9t4O8bPggsgklWcOxG2j5dFIdytBrnFwCvHJvkd38H/ggnQ/CKf7DeMT70A1t/d3OO29Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41l24CQ4/l8hmcGvz5ZcLrActXszGj2V711YvNygnbtRUundX
	gs/nqUkz1kRACL0kUBi8lpD1ffL+H/YbrKr1IFv6MGxM6Bw5bNSgyE2pqNo1tw==
X-Gm-Gg: ASbGncsSV777co08FSYaLeQ6o93ox3U03NxygXLf2ymZsjio6hmZMTAFYLGSLRuwnr3
	yerz4tkIIW9OYPmedze7b3CxoVF6s4EId2TEVvh6/+bIH852EanegDZTYusvhndhEGWsMCVtnHJ
	9KaBprstAFTCzllKWoRMupI3aCawhmUk1+t6p1HXQj/noe1WXGFNfOPgJYwW4N5l9ogyVqkUdjK
	GMjZiz3FDaehqUDAa4O/e9VkZst0I6Roz5dbZHYZf1VH8Sths604VfOYleQk3u0/iFcpVUzSDnJ
	bdqAePEc0kFncC6N/YqXyPZzlQiniNLu0vnVlRIIvdhjQ0lgqdjHxf2b5X2Tyn+uJ/7UeUy45D4
	kSYaUnZAC2ShRDKESODOVc+V2dmmDrUpT6V470yruh+3plUcDMBTIzg==
X-Google-Smtp-Source: AGHT+IFdNf+EnoFJ3+b6Mq1YD80Ap6/ZdahX+x7QzDtoMhFwkCwxcZCMAPQMd2MY84qPqh+jH/FUAA==
X-Received: by 2002:a05:6402:13d1:b0:634:ab80:d84b with SMTP id 4fb4d7f45d1cf-639d5c5a3f8mr18291541a12.32.1760340175044;
        Mon, 13 Oct 2025 00:22:55 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7ebsm8195076a12.1.2025.10.13.00.22.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 00:22:54 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:22:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Subject: [PATCH usb-next] usb: xhci-pci: Cleanup xhci_pci_setup() for shared
 HCD
Message-ID: <20251013092250.699bf60f.michal.pecio@gmail.com>
In-Reply-To: <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
	<20251009152703.72e780b4.michal.pecio@gmail.com>
	<b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This function will be called again when/if the shared HCD is added.
Little to do in this case and there is no need to set some de-facto
read-only properties of the xhci again, even if it was harmless.

Don't bother passing the unused xhci_pci_quirks in this case either.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This is an alternative to the cleanup discussed last week, which
doesn't require a v2 bugfix. But I also have a v2 bugfix ready if
you think the original option was better.

Both variants were tested with and without "fake USB2-only" patch.

The idea here is that there will hopefully never be anything PCI
specific to do with the shared HCD, so make it patently clear.

It is actually more likely that xhci_gen_setup() might try to use
allow_single_roothub or imod_interval, in which case this version
avoids creating another surprise like the one last week.

 drivers/usb/host/xhci-pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index cb7f5dd34333..e09f5fb52cf3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -568,7 +568,7 @@ static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device *hdev) { }
 #endif /* CONFIG_ACPI */
 
-/* called during probe() after chip reset completes */
+/* called during probe() after chip reset completes and again on the shared HCD */
 static int xhci_pci_setup(struct usb_hcd *hcd)
 {
 	struct xhci_hcd		*xhci;
@@ -576,6 +576,10 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	int			retval;
 	u8			sbrn;
 
+	/* nothing PCI-specific for the shared HCD, just core setup, no quirks */
+	if (!usb_hcd_is_primary_hcd(hcd))
+		return xhci_gen_setup(hcd, NULL);
+
 	xhci = hcd_to_xhci(hcd);
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
@@ -586,9 +590,6 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	if (retval)
 		return retval;
 
-	if (!usb_hcd_is_primary_hcd(hcd))
-		return 0;
-
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
-- 
2.48.1

