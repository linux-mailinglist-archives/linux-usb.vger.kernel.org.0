Return-Path: <linux-usb+bounces-29227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1CBD3913
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 16:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A56ED34CF6C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4C9308F24;
	Mon, 13 Oct 2025 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGYssGnk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477643081D4
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365999; cv=none; b=A3UA1RCk5uhMxKYryeuRcTYKiBRNsIYEd/xMnUqPy1A7YQ8Hge2If4Q6X3JXvNXmBVjvoYXmjdWXdQC2aodbOyJEueSngyltn9hvqFopWK34JxwyT9QS2s3PNYQ+TPA6sVj8jtKBtZEqedOPb/f3MZLa9oGHaDegz5GovwmrEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365999; c=relaxed/simple;
	bh=DN79WYBou/aFOKRe/UXdflhuaoAkSBQYZro99kJ5PeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s49AmH3PEgoKZpL+zI24o+rdhugp5EM+nS3D/p2NoVMMnTfNt0v4E3itjzTjbUYS9dyL3m59HjkWV0ltizXUj4awlGv3twRddbJIM/hCayRSLf1nXkTq1dn5xb6miDZZiQr4SUvCw3Ab3q4zq3nVcss1w2iSEtTsAgSFNbm/hpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGYssGnk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4704688e87.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760365995; x=1760970795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:mime-version:date:message-id:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WjIp/FypvaE7LvoF1/QmBBthHn1FMtU9BicLFMZx+28=;
        b=BGYssGnkqQsL/AosNYfmvqa+xqwCjvNqTpdS7PmGVF8Zg3Tc8brn3MLBJWeYqb8tD3
         Y6XNxsffp3pgwjZvKxITuvIt2H+HcBLqsz5rBV0A9k4zP72hzwZdxpGVTLQd6+Fz9Ktq
         hDCnZuBdtGjPRj4mkfGpVbohx/CTJskkUcc3P4Po80XNqfnOGfaM95PW4Dl0MtRktN0L
         bO2qmyljRXYFy4O6ufPxipar8FsRYoZ8Hkk5CAd4dV+8KlYNsfm+IB1a/AlDU57WKc9Q
         UTAEAZL69M1YL//hfSVRnOCpQtCYaWPZejPAhqEYCBLYiP3xdGOfsoQg0iTDi94Q5NQt
         MZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760365995; x=1760970795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjIp/FypvaE7LvoF1/QmBBthHn1FMtU9BicLFMZx+28=;
        b=VCTNib3T8OuGLYRnOvZWYGQSLCLtFi5QW5e59Chk7A6fIa6EO+fqUyW+K04DpcHc9V
         mTuZh/v0UkLWu7ozPPKzG7KxEmgnwTNL/LJ2yeBHG0eYBFjNQcvN7AcMqzqlGc87cR6H
         Uw43HwJiQNOkZhEzHoU08jXvSimmrK56ZbgxRdGgnRkyetXetVdCf1Bzs8sPw+r0EQj3
         jCS0emxIuhym256mBp8sVuAKSj2lyDmALRdUH9rxtd00owrYDTwsARJy/6F+6ehgSY7T
         OHZl7zhnE9QB+Vj1l+HmwUcefisgEB148u0/RyZKWZHlyFehUP83wZ7YMLAndVeVYGA5
         t/ag==
X-Forwarded-Encrypted: i=1; AJvYcCVq/xd5NJWDEitAUgYQdgH1yhgU3hYLt3/Rs3gbR8eZUumNeOur09JxYTKFG7krbWf5LMeT1W2jdrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YworEspt6LliD/COudj5I14GfnLbZisU4qvpMubZGHT/4f5zhCO
	Y1ldGSj0ElNDv0CVjbqsmhVKFTOFqIASBc2BHQOvEyx3UFzqBMX1ajt4
X-Gm-Gg: ASbGncun+LAZ8e4aWXenJeRH2ivxG1ygiCMjfgUCpy5XqWzMRDzBDjtU2FXOOXQZnAQ
	VDJ7wWMFijmfgMrpL4POxuIOptJ22/sG3dN9n74ICW+HXhjkWnl7rmpZYn2TwGwj1382JNeHYlp
	Y3DjZJ6wYiXlOPk4vAIN6+S9js5onPvH9RmsasC7+rLMgFlN1PT74s7J4CmJ4E7/5ba83PKY081
	DHRuphEGHy6hKKgfYSjI9ZJY2m35TlHTLhSY1TGTRziTQz47m6GVt0TYm9YnanOxpydrfZ4MXvk
	+3b9XI/aApssFZwM2PGUcnmUSCrnaOyApK/U/UK6mogn9NQh1AENNUTyKZtMhpH728sqEyu6Ab1
	0H2B1mOR1rHnufWAhPdiol5qqdXrDHYrPHY2FIT5ynVo8B+su7RWCm0ZpQ/rO04fCpFEJk8ww
X-Google-Smtp-Source: AGHT+IETGVWv5F2vZqXLkiUoaLYDFh9EepYIdMe3hrQmQuladhTFEfm5ekhsR18rwtiOOz8540CZgA==
X-Received: by 2002:a05:6512:3ca9:b0:57e:4245:114e with SMTP id 2adb3069b0e04-5906dc18396mr6128861e87.24.1760365994997;
        Mon, 13 Oct 2025 07:33:14 -0700 (PDT)
Received: from 127.0.0.1 ([94.41.86.134])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f1asm4188681e87.21.2025.10.13.07.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:33:14 -0700 (PDT)
Sender: <irecca.kun@gmail.com>
Message-ID: <b5cfef66-9324-40e9-bd35-3b456d627999@gmail.com>
Date: Mon, 13 Oct 2025 14:33:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 RFT] usb: xhci-pci: Fix USB2-only root hub registration
Content-Language: en-US
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Michal Kubecek <mkubecek@suse.cz>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
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
 <20251013100424.42d5b9d2.michal.pecio@gmail.com>
From: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>
In-Reply-To: <20251013100424.42d5b9d2.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 08:04, Michal Pecio wrote:
> A recent change to hide USB3 root hubs of USB2-only controllers broke
> registration of USB2 root hubs - allow_single_roothub is set too late,
> and by this time xhci_run() has already deferred root hub registration
> until after the shared HCD is added, which will never happen.
> 
> This makes such controllers unusable, but testers didn't notice since
> they were only bothered by warnings about empty USB3 root hubs. The bug
> causes problems to other people who actually use such HCs and I was
> able to confirm it on an ordinary HC by patching to ignore USB3 ports.
> 
> Setting allow_single_roothub during early setup fixes things.
> 
> Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
> Reported-by: Michal Kubecek <mkubecek@suse.cz>
> Closes: https://lore.kernel.org/linux-usb/lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl/
> Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3 ports")
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> New in v2:
> - don't set allow_single_roothub twice, it's harmless but lame
> - credit and Cc another reporter
> 
>   drivers/usb/host/xhci-pci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 13454bef14d3..d292adc65e5a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -588,6 +588,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
>   	if (!usb_hcd_is_primary_hcd(hcd))
>   		return 0;
>   
> +	xhci->allow_single_roothub = 1;
> +
>   	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
>   		xhci_pme_acpi_rtd3_enable(pdev);
>   
> @@ -643,7 +645,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	xhci = hcd_to_xhci(hcd);
>   	xhci->reset = reset;
>   
> -	xhci->allow_single_roothub = 1;
>   	if (!xhci_has_one_roothub(xhci)) {
>   		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
>   							 pci_name(dev), hcd);

Hello. I just want to confirm that the patch works for me too.

Hadrware setup:

0d:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]

6.18-rc1:

[    2.170519] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    2.170520] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 7
[    2.171768] xhci_hcd 0000:0d:00.0: USB3 root hub has no ports
[    2.171783] xhci_hcd 0000:0d:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000010
(usb port is not populated and does not work)

6.18-rc1 with the patch applied:

[    2.162897] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    2.162904] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 7
[    2.164156] xhci_hcd 0000:0d:00.0: USB3 root hub has no ports
[    2.164171] xhci_hcd 0000:0d:00.0: hcc params 0x0110ffc5 hci version 0x120 quirks 0x0000000200000010
[    2.164356] usb usb7: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    2.164357] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.164358] usb usb7: Product: xHCI Host Controller
[    2.164358] usb usb7: Manufacturer: Linux 6.18.0-rc1 xhci-hcd
[    2.164359] usb usb7: SerialNumber: 0000:0d:00.0
[    2.164390] hub 7-0:1.0: USB hub found
[    2.164397] hub 7-0:1.0: 1 port detected
(usb port is populated and does work)


