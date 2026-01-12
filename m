Return-Path: <linux-usb+bounces-32190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04221D13503
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF396306521F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 14:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB35524A069;
	Mon, 12 Jan 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mKEUVPHR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A92BD035
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229269; cv=none; b=QXpw0YN8rW7vNs95mn+9tN3K9GEhvt1nOGm9hiDUmLp6O54lqOF7PzVkldKtapziE2TkIvzUylsHeWTSlXtJraBzDzgF1Qowi24X5bC5UWyZfkL0ZIoY7Dew0MUCpBcjUZ/yxFrItOvsgWL44bmJHj0LT2P8Vs43iD7PPb5iu0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229269; c=relaxed/simple;
	bh=Q7uNIoVs6EvhTLNsF+A8tnPvlJqfykDARYEptFQK0rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goovKRuU4SzuzZz7Q8KTsgL48ZTdGdK5Fq0ZeDdJz0DFiHe7az+xkeTjGn19VYG0ziKxvlomb1rMdSyDcx91WeAqHiriJG0+m/Rh1wSBxvgJ3Zw1P7uzEOs5+31GVorDAwyngQ6d5QGC0zLTJC4JMLOw7aUe7s0En/2nnF20SBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mKEUVPHR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b31a665ba5so794583885a.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768229266; x=1768834066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=66Wy9X7ugeW5bewzeljPlJ6DqPEghHzvFsNM3r+AfsU=;
        b=mKEUVPHRt16xBTNGK2ZwJqMIwuok/3omAuXfn6jpwelRs9DntTUtH5V14+PEC1E50C
         ztZ5xafbhSJyHYkLmYez1e/+Xz7RZyf35pkO8LbzwRnisON6S2lySgs+ri5nVERxeRjT
         Mdt5SHbBHtqt3fbKKUy2ONrE+050PC81/X53xNI/nCj7LjO70EBm9tYoGwX0EptALuTM
         IkuTdUa3pOCb+vOKOLMJeqLIZ7+L9KZtQBS94wRuJB2cKhmkU0SFaZ3WrPOTT/CAt+kz
         6K9hGQ2GZsemj2EPLDDmP8k5rmA+TreQFsDk+WaCiF50PMQ+mV5B6UaMnUTiKI3VZLg4
         +/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229266; x=1768834066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66Wy9X7ugeW5bewzeljPlJ6DqPEghHzvFsNM3r+AfsU=;
        b=KCsglJaFEyYq2c3aZQS2XhevwTv26lo2lLFgbmaNcTzmSqSM+acgRdHSU+TZM/Y/W/
         QZ606YeM89xMI2GYqxb/UdVKe3EKhgNmMtsHe+qz+yDvPACCvgZbiuv2TM/80NbtSkdm
         AYe0CZhdYGZNDNlm7baUNFFYA/y+oDeHmch97MDXhYrSDAFg8idtGoyONox1XArWpTWh
         C71bOxDA3+1hHBv6DyzAMJTazcntRJFF5SGSfyfLJd0yh3tRFwWQsxYL7I/hYC2NH/VA
         0TXckPPVbRSsX4ZWr74L3isRUHUa7RdW69DLARlpQ9JuP9eZb71MtVtwVwjU5kNz+2Yn
         kjtg==
X-Forwarded-Encrypted: i=1; AJvYcCWK/Z7nhVggLBghlbIqcgmU2Vze5quk8TUxGhQhVzoDG29llFVDVh6mARwDkBQYA8sVnekwMPOaCE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLQZRxdyplhT+oPQy6gRBuxbU8wtc9L6VkQ2FL9GIb2RBv4jt
	Ot1WJUEw/osWH9VwpVLrx8jmJzGpe0zxOegKglYpOcYSTO5T4m9qaNuVYuJKJGpHbmS9gNlEO0K
	qslM=
X-Gm-Gg: AY/fxX7PO8aXn927+SlkKc8HZNmj9eGjZWBv2YRd/MY0C6kMMCPPajS7WiV2Q75W8KM
	vE3AUupicvlsNF1MUC0xw2rxsp75VXgtow5Z5asUnkxLD2/D7nnyPz2JkcNZTlxdjQEGHZFU+Vw
	F5Hf//hCC/kL+ZxDyBJOOd3RtwNhQdUyOxP8OWimgzfupnu/jWKE7cMiD7CTpa7+zNYDN1Y6WmN
	zbCTJJzZnsjDYYjwqPXS/T/M0gxwyGR+WpJ3047LG7iY2mMFeo9/tafbCpYpEw3VgYhVRKd6c07
	LbIlXVp9xD5DZm30IOwQCoSlx1SKlyDJfSMnPCCOBhD14yk/HM1kDwEPSUmgY+iWd9GOmGb1pwW
	nF5K0XweR2YI8iWTkdXOFoot06VkD8sqQw+dGSePZ24AaIGLzeuKq2K3s7hiZGIsfjDkUbli8Kg
	eTbtN9EQsnLb/0Y8UmYh4br9PXG1xObA==
X-Google-Smtp-Source: AGHT+IHNPfK5E/6kxAdWbW5EOVjXjBOCl0/onefYJWefU+oa4TlgqTn3RHl/5dDKkgIMPHHkE2sRPQ==
X-Received: by 2002:a05:620a:46ab:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c389406276mr2499235885a.74.1768229265555;
        Mon, 12 Jan 2026 06:47:45 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a63acsm1516812785a.6.2026.01.12.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:47:45 -0800 (PST)
Date: Mon, 12 Jan 2026 09:47:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Shengwen Xiao <atzlinux@sina.com>
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_platform
Message-ID: <f43a2ce7-7ffa-4b53-8610-52455ac9d16a@rowland.harvard.edu>
References: <20260112084802.1995923-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112084802.1995923-1-chenhuacai@loongson.cn>

On Mon, Jan 12, 2026 at 04:48:02PM +0800, Huacai Chen wrote:
> Commit 9beeee6584b9aa4f ("USB: EHCI: log a warning if ehci-hcd is not
> loaded first") said that ehci-hcd should be loaded before ohci-hcd and
> uhci-hcd. However, commit 05c92da0c52494ca ("usb: ohci/uhci - add soft
> dependencies on ehci_pci") only makes ohci-pci/uhci-pci depend on ehci-
> pci, which is not enough and we may still see the warnings in boot log.
> 
> To eliminate the warnings we should make ohci-hcd/uhci-hcd depend on
> ehci-hcd. But Alan said that the warning introduced by 9beeee6584b9aa4f
> is bogus, we only need the soft dependencies in the PCI level rather
> than the HCD level.
> 
> However, there is really another neccessary soft dependencies between
> ohci-platform/uhci-platform and ehci-platform, which is added by this
> patch. The boot logs are below.
> 
> 1. ohci-platform loaded before ehci-platform:
> 
>  ohci-platform 1f058000.usb: Generic Platform OHCI controller
>  ohci-platform 1f058000.usb: new USB bus registered, assigned bus number 1
>  ohci-platform 1f058000.usb: irq 28, io mem 0x1f058000
>  hub 1-0:1.0: USB hub found
>  hub 1-0:1.0: 4 ports detected
>  Warning! ehci_hcd should always be loaded before uhci_hcd and ohci_hcd, not after
>  usb 1-4: new low-speed USB device number 2 using ohci-platform
>  ehci-platform 1f050000.usb: EHCI Host Controller
>  ehci-platform 1f050000.usb: new USB bus registered, assigned bus number 2
>  ehci-platform 1f050000.usb: irq 29, io mem 0x1f050000
>  ehci-platform 1f050000.usb: USB 2.0 started, EHCI 1.00
>  usb 1-4: device descriptor read/all, error -62
>  hub 2-0:1.0: USB hub found
>  hub 2-0:1.0: 4 ports detected
>  usb 1-4: new low-speed USB device number 3 using ohci-platform
>  input: YSPRINGTECH USB OPTICAL MOUSE as /devices/platform/bus@10000000/1f058000.usb/usb1/1-4/1-4:1.0/0003:10C4:8105.0001/input/input0
>  hid-generic 0003:10C4:8105.0001: input,hidraw0: USB HID v1.11 Mouse [YSPRINGTECH USB OPTICAL MOUSE] on usb-1f058000.usb-4/input0
> 
> 2. ehci-platform loaded before ohci-platform:
> 
>  ehci-platform 1f050000.usb: EHCI Host Controller
>  ehci-platform 1f050000.usb: new USB bus registered, assigned bus number 1
>  ehci-platform 1f050000.usb: irq 28, io mem 0x1f050000
>  ehci-platform 1f050000.usb: USB 2.0 started, EHCI 1.00
>  hub 1-0:1.0: USB hub found
>  hub 1-0:1.0: 4 ports detected
>  ohci-platform 1f058000.usb: Generic Platform OHCI controller
>  ohci-platform 1f058000.usb: new USB bus registered, assigned bus number 2
>  ohci-platform 1f058000.usb: irq 29, io mem 0x1f058000
>  hub 2-0:1.0: USB hub found
>  hub 2-0:1.0: 4 ports detected
>  usb 2-4: new low-speed USB device number 2 using ohci-platform
>  input: YSPRINGTECH USB OPTICAL MOUSE as /devices/platform/bus@10000000/1f058000.usb/usb2/2-4/2-4:1.0/0003:10C4:8105.0001/input/input0
>  hid-generic 0003:10C4:8105.0001: input,hidraw0: USB HID v1.11 Mouse [YSPRINGTECH USB OPTICAL MOUSE] on usb-1f058000.usb-4/input0
> 
> In the later case, there is no re-connection for USB-1.0/1.1 devices,
> which is expected.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Shengwen Xiao <atzlinux@sina.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-platform.c | 1 +
>  drivers/usb/host/uhci-platform.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
> index 2e4bb5cc2165..c801527d5bd2 100644
> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -392,3 +392,4 @@ MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_AUTHOR("Hauke Mehrtens");
>  MODULE_AUTHOR("Alan Stern");
>  MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: ehci_platform");
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 5e02f2ceafb6..f4419d4526c4 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -211,3 +211,4 @@ static struct platform_driver uhci_platform_driver = {
>  		.of_match_table = platform_uhci_ids,
>  	},
>  };
> +MODULE_SOFTDEP("pre: ehci_platform");
> -- 
> 2.47.3
> 

