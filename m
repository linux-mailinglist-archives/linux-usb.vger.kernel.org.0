Return-Path: <linux-usb+bounces-22174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1AA71822
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 15:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97F617A41B2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 14:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605241F1303;
	Wed, 26 Mar 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LsfbF1jE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D581E505
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742998314; cv=none; b=GPSRvqiSSum5mAz/Qw+Q2fhBTmt0EDr4CX5y2ihyTnZVomTTolTXSD4RExBwMcTGD65LExwvnq96nfS6KC7K4/dKHIAnTKcMkuuOFNPXve02H6Pr4W2NhcMFhjxOjxfCfNoKofwSiuOqDD0jikT5cA+zkd2SGS1ab8DWzaxEpPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742998314; c=relaxed/simple;
	bh=yXtz2926jy2R/WRj7oe5ZqUVxpPtrQBW9y6HOZP7ZoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQyfhCOKM9XEIh7xXofWE7VnjtmbrdY/bxThJvvHXfMmap9RJcHAJm960//zk/oCmgJqReoQplih6xGG4uuG/QVpi8PIUMa2G43xKQ+0+35I96mNmTp+WDllu+T77WejSV4IVAoIYJSddMeV/x5IlRQPmCe1QJil4efghxhWWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LsfbF1jE; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4766631a6a4so68253621cf.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742998312; x=1743603112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yJeop5/9lZPmW3LTcIpQF3Z1hxE5T9Z8IMFMo+YuI4=;
        b=LsfbF1jEVeiuL+tlTAsWiZ2nb32IyF2R1p43AY2uU9f8NuSl5XUDNxVD1taAjR2QuO
         Wpx88Cn/Tyq9HOUBJoRcNCfKnOR7ANUeMLNFZ0OT9gOU78392NnJpl22uhpvZETToP6V
         qNr5fPk/kLZXHSBfAoLw9a5PHPtTVAClqxxJTumuvncLbbFdpDzOZIH4Btizi/dtbmEd
         6WXnODS4kNm60O3YKUwU49Dhfbez+F5YhCGQt9KA3Kn70bWClMAMz5LL3gJ4HwRkVmVZ
         jrV6wJjpFzmSgI6wHwmpSJpkWzNb/ivW1IhxQf5n6fudf11Lb4shg/cbk4gy4/PBnR/X
         5t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742998312; x=1743603112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yJeop5/9lZPmW3LTcIpQF3Z1hxE5T9Z8IMFMo+YuI4=;
        b=mCHd09RhevMKol1KbdSTJCUfOitON8AA0DyKIOyr1lQS6mDA42m6qedi0vgf6NxKuj
         U7IBnK4fBp/4lt4mUerowD1bfWcEDlTwV0V7ErVUoQgMF9dvIzWVbUix4YzaPwDm58FL
         a57j6/Whyfqgylpt+wr4yz77ngtdGiPh+KOn6JluhmjGDb8RTJ1arYNTpqeM+Z2egfh7
         jd+Zk/D/0D4ppywRaWOS9mU5Bwx5d6aO4Zwz8fjFAQjSHQU52mjzxbvx0vHdMQBdbOHF
         NZux1hvF6EkCee0zogGYfXUUUAMm0fOvCxXhwKRG+83aBmUyarY0+quIKd072E1TB8Nz
         a0zA==
X-Forwarded-Encrypted: i=1; AJvYcCWj6mf+xPVwaB+x7wJT3oia/PgIRmsWmYH/oslNgcr2metsB7r/0ZniRMQ5gUXGLG0+dz0EASWLKhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XzX7F0nN3djkbv5FNqGZY/nWL6TzD9GfVxApftshBz50rhOe
	APR0ZpauYt+qKN1dLJcarip6ltQ/h7Nes0onhhypK6GZo9Xq1Yi710NKpzmPQhtFuY1iH7JzWXo
	=
X-Gm-Gg: ASbGncvlzWxCK/dVWo+uA5BJITwAYdDWs14wAfPgee2YQzsiNcxNwXiySAfACjTll21
	HD+PU3g23/zZwxhVmmVAgR3o3TjUVh+9wHqYOYNMS/YRb/UFqxsmo6TycEHXxHAcpjru4pI32R3
	LBSG9EL5F8/9scPYUW4Cw4rUGX2xmaBwdbVctyDc2aJ0i2qA6L6i33QZcRlp8M+8HTF7zOBnfBp
	R8EF2F0fw81H6GzvEVJMg7sW2Nw8Do1oVC3dEDFV5VTTvfc6WrK4PamrNDowYHm91gsjA/1vLOh
	nQqmopB1HGeeGewbshw/NUgP33l1vVBrNN6POysOlMd9aU4LOsKjE15VX1FiuQ0=
X-Google-Smtp-Source: AGHT+IFZCtFXRFi1B9VodvEj5Mj7HA1YzrBpLpz2+TIPt+Odd8LHmFlysvBHDrxXPsEe1PHedgDd0A==
X-Received: by 2002:a05:622a:248e:b0:476:b56d:eb46 with SMTP id d75a77b69052e-4771dd77d25mr324475231cf.15.1742998311539;
        Wed, 26 Mar 2025 07:11:51 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d15a193sm72082021cf.14.2025.03.26.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:11:51 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:11:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: Re: [PATCH] USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)
Message-ID: <ab64291d-2684-4558-8362-9195cce1de07@rowland.harvard.edu>
References: <20250326102355.2320755-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326102355.2320755-1-chenhuacai@loongson.cn>

On Wed, Mar 26, 2025 at 06:23:55PM +0800, Huacai Chen wrote:
> The OHCI controller (rev 0x02) under LS7A PCI host has a hardware flaw.
> MMIO register with offset 0x60/0x64 is treated as legacy PS2-compatible
> keyboard/mouse interface, which confuse the OHCI controller. Since OHCI
> only use a 4KB BAR resource indeed, the LS7A OHCI controller's 32KB BAR
> is wrapped around (the second 4KB BAR space is the same as the first 4KB
> internally). So we can add an 4KB offset (0x1000) to the OHCI registers
> (from the PCI BAR resource) as a quirk.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/usb/host/ohci-pci.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
> index 900ea0d368e0..38e535aa09fe 100644
> --- a/drivers/usb/host/ohci-pci.c
> +++ b/drivers/usb/host/ohci-pci.c
> @@ -165,6 +165,15 @@ static int ohci_quirk_amd700(struct usb_hcd *hcd)
>  	return 0;
>  }
>  
> +static int ohci_quirk_loongson(struct usb_hcd *hcd)
> +{
> +	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> +
> +	hcd->regs += (pdev->revision == 0x2) ? 0x1000 : 0x0;

Please add a comment explaining why the quirk is needed and how it fixes 
the problem.

Alan Stern

> +
> +	return 0;
> +}
> +
>  static int ohci_quirk_qemu(struct usb_hcd *hcd)
>  {
>  	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
> @@ -224,6 +233,10 @@ static const struct pci_device_id ohci_pci_quirks[] = {
>  		PCI_DEVICE(PCI_VENDOR_ID_ATI, 0x4399),
>  		.driver_data = (unsigned long)ohci_quirk_amd700,
>  	},
> +	{
> +		PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x7a24),
> +		.driver_data = (unsigned long)ohci_quirk_loongson,
> +	},
>  	{
>  		.vendor		= PCI_VENDOR_ID_APPLE,
>  		.device		= 0x003f,
> -- 
> 2.47.1
> 

