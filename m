Return-Path: <linux-usb+bounces-30520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E0C5D80E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 15:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06BF7352E9F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 14:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2C831D39A;
	Fri, 14 Nov 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgbNRrjQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A11A9FAC
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129177; cv=none; b=dJi8y7NCypk/l93awW5PLLxMgZfPCBC/Uq/LWEt20HJA8AeXSmZ9p3gqgETpHzKSBwqor2Nho3/NnIeIV/1yCnyIKeYwlt8MA1CyT/M5/UER5wAKZFeaFcgwAyEU2zWRPfPE4S9Ktdw/1JDAAh6BXbdmNgrHq/K2hH4jwUYKWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129177; c=relaxed/simple;
	bh=imxx4Vsxs6R5/Cyy9YLs326ybLs281mEENRJeTUntQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtXuYuaHG9AO0ZTOEB/lgcnTWkiRP+PHbLIzXxVAqhug9w+2hXgGJEmF+ILezfC3a8wSfjTJLnShJTrY9q9/x049v6ypfLAMwdQoiWob/bYIwiC47CpzvXkMMD/8vGrTvyHvqI1IQUE2HZVYkNsLvOC7b1Q7KHiUE5g34WUjUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgbNRrjQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7373fba6d1so58478966b.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763129174; x=1763733974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/+RvvnQ0UsahCU1NHSvKj8G9zI24JAJAoDIucAxufc=;
        b=DgbNRrjQ9M8vyTcQGWoRx1K/UyxBAobGffnumQJqvzYKtxEssSM1h2qK7quFO+jx5E
         Lssymn3iQRQxAW3BR5QGaMqXEy+YpaP0ycuAfpEk8363GHtL2mVV2EpfIGCFRgN650Rw
         m4mDcSG+daMU68ko58Y3es5uup2CPf0UYWzgdjvV2OuzVkwGkmZC5HyPe4Wnkc9B/onH
         +sWamX12Ik0C709vJNpRiQZ8oMsddJKcXs6KfbcUa8I7MSbwEjTbDvOwYpTvZOxAPseg
         jTyIRFKy1zWFNMAqiFWQYxqoWT4lwhDTobHgTU3hTdAQdSGU/4Vv0JATFXIW7xF7X4yj
         VAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129174; x=1763733974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/+RvvnQ0UsahCU1NHSvKj8G9zI24JAJAoDIucAxufc=;
        b=HfyXZaSrcpO6eAtRHvTduEma3Vn2b+0JR7kfzr40U17JZyQZoZoWmFv6ug4Hf4Vu2q
         SMB3twZUtLPtGiZTuJ2RqjWjldG9n/X+xEc4xs44wH8yal28lxC+wFBUss3kveiJAdCG
         tsQunKSPAmFGYDN2htCQjuReE4r5F+JcnbLd2HB58HbXOZU0OZKnjc2/snyRTM0GBbDh
         vvwZqcJ63JkMWNxHWhlpT3/UKrNOcHhQ1/KrSyHdgdesxeejjq5r/cOjjHLZaTPL5lZT
         vUagVyqA1faOaHbUGzqgqyY96ryjqGZy2jArHHAaBEtO1jDoQqivLIj4NFIA0l4+3V15
         rwng==
X-Forwarded-Encrypted: i=1; AJvYcCVqi0zuRuzLssaFrPwJLAzkxgnA4DAuHN6/zDr+mQoxklGGxu1REhJV9viOYFzs0T59ifKWsTZZ7w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFD39YjTFvKTdv7BKUilOGEt4dMAxcyyIz/gPLh1Pr6JVaVTg
	SlbagrVIEeeW/u1kcsBy3pCByC86B44RY+3CQg9erKvsOceynQ5BQD/L
X-Gm-Gg: ASbGnct7v3BdRnw1rhPuTqzRgrLhXZci9SFGXLZ3g+bG5TjjS79wTI6SOLIs6WlcK/J
	rO1qRSjew9OFr6jTlHgsRRecZrgtY2EjHNbFn35G+ohlOx4SQR4PGwPFwVuA61mO5nwXC3uozqk
	Lh83JteHQbTYsgvxzf/UgEWMJ6j9vcfWOMAKpOaP40gt9PWnR+9gUzBaB4rmx72noc50w4LEM9n
	5T3IPBi+KTVRtc9P9pVj1gjJRRO50n/J187+4onnU3jqY0g9qkxzAJMktRHJWZdCHuWudK0z3/v
	7czdKhT84u3HbSoBVMTj6GcsQFjuIPYTGdo/7Rc7zvbR0SwhhTJ4ysPcOW3UJqCP8fm7Z2BFNHk
	5DViumrQjcDCEgcZagALB6+MrXEk5hJ/Yu/DQ/9bGJ9uuRWJf6Koz62lXmQj1CYRwLZGuElwl6x
	xxFLipHW2y1g==
X-Google-Smtp-Source: AGHT+IGmg0adfwT5eGOU9p2QHNaDvIloTdyVVlZMFDqISBi2avFaCo49WUBZFqJ4LW5SJ+4Qe1GWaQ==
X-Received: by 2002:a17:907:3da5:b0:b73:21ab:7d52 with SMTP id a640c23a62f3a-b7367bd9e7cmr337291266b.60.1763129173310;
        Fri, 14 Nov 2025 06:06:13 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac50csm389739166b.61.2025.11.14.06.06.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Nov 2025 06:06:13 -0800 (PST)
Date: Fri, 14 Nov 2025 15:06:08 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci-pci: Clean up xhci_pci_setup()
Message-ID: <20251114150608.7829fd51.michal.pecio@gmail.com>
In-Reply-To: <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
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
	<20251013092250.699bf60f.michal.pecio@gmail.com>
	<21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This function will be called again when/if the shared HCD is added.
Little to do in this case, so handle it right at the beginning and
forget about it later. Don't bother passing xhci_pci_quirks for the
shared HCD, because quirks are detected in the first run.

Organize the rest so that xhci properties are assigned and visible
before any core initialization begins.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

I forgot about this patch, here it is rebased on the final fix
which went into mainline a few weeks ago.

 drivers/usb/host/xhci-pci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d292adc65e5a..6e704d684bcb 100644
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
@@ -576,20 +576,20 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	int			retval;
 	u8			sbrn;
 
+	/* nothing PCI-specific for the shared HCD, just core setup and no quirks */
+	if (!usb_hcd_is_primary_hcd(hcd))
+		return xhci_gen_setup(hcd, NULL);
+
 	xhci = hcd_to_xhci(hcd);
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
+	xhci->allow_single_roothub = 1;
 
 	retval = xhci_gen_setup(hcd, xhci_pci_quirks);
 	if (retval)
 		return retval;
 
-	if (!usb_hcd_is_primary_hcd(hcd))
-		return 0;
-
-	xhci->allow_single_roothub = 1;
-
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
-- 
2.48.1

