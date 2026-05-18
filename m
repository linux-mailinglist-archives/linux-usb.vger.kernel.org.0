Return-Path: <linux-usb+bounces-37636-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFsrB5iGC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37636-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:37:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C66AB573F68
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F98E30364A6
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 21:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B298539A052;
	Mon, 18 May 2026 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9w1Fmt5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F77399015
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140240; cv=none; b=DdU3v5CfmcZ8NQ3r+f9kupDwoFgPvKmEnlyIbl5G5Unmij/8m98LhvhnzhgvKffpFXFoahn89VZEAUfkqADHRxwScfFQ/+9BWDL49BpdRfWqNj7bd+Qv6OIJOJf+Tl+X3LICWHrFmS/VYiw3lDr/cdfqN6Wdp0cEeLttF3YPpZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140240; c=relaxed/simple;
	bh=i43GTxdyMK+VdcaWSoLpBbK8zz90hQn9yi4OJpouGdo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+kPanhO/ZWKbX7JySNpqo/KalVdqlrKDS9wzKDEF58BVvF4DYVsiy2VhWuIqjyd2HRQ/fGf2ooZQo8NVE3uw2KxJKg2ao8CpB5JvX8DCJj3q2LU7m0QOwdbgeb6YffzAsvQDnFs5C/bt6x/N1Dvl8Eo9zQV/KEgt2drRJB2KUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9w1Fmt5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1557861f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779140237; x=1779745037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBg9aPiRES77DI0TewWq2NXl4MY6GQ2hEKLNnK9/Z5g=;
        b=P9w1Fmt5l8L3QQ9qR3mbGw8wUtGTw0raoIOd+cap/Bp+FqKCLQPn2RMSRnmv9oKlqy
         dx5NAZzydEyMmoU4GQ8o0hwrXZ+rRz2hhVfr0xBAUNDNyIwhMS0xLKw3x3VzsXF/dxNG
         Ejz0hSI475pAFdproGW3ONtMUq91F6Qq7ccDs05JvP6bU1v6WdtNtgBlYu34k596amrj
         1xueNXvAlhTd9WT0bxGxfJKcm3XQwO6n1kSqMFAgQzko3h8B2dMQmihRhinqumzLkG7A
         /yj7W+0pK4afsc14djjxNS3peijYZ0wmryV5qvcpblB4uV9jWwQgRUzcBt4WQkrjoWKk
         4smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140237; x=1779745037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBg9aPiRES77DI0TewWq2NXl4MY6GQ2hEKLNnK9/Z5g=;
        b=FGDeuL+/eEbbNjT5DtlqPdTUOtyH68YJkRIuGCN6hoyEqrhg4o6/duL0mrbM0eDtCg
         Vtx3S/lPxIpWGJgEHLblgQ1pd9rHOd+NtcTeDEn9MpOc2FBtq6fH0aEHbkfw7DiOmwMH
         Ooi3lDtFVC4GZJx8OeH4Ta60/bhl0H292ytdhAzI/y3Rjkc/ClIUz3s33bMb1y1qz+Ma
         EtmNZInNLUlmBdtNK8/1f40yGaXjPBr1jKGkWCe9dfRHcuBP7HC8MCAzEkqvrqZXp+7a
         u+/XweCFvS5luG1kuSWZINI73OuzqC2JccOuUR2tyT3Qq36mQBDMy5hcqSSOy9BJ1waA
         zRTg==
X-Forwarded-Encrypted: i=1; AFNElJ+IQTn0H+U5BkjlDNPS+zhi4rI6oq9TC+UdcwwSrSsiVVzFVj57n8Qq2cwh/zVdiB27GB5grOstR5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhijSqx1do+w+y6Kpn2HZzzMoo79oWeUF6Mr/zEQW6bx3//8H
	v//bRP44qL13Q6BOdnMxS7ZkeNrmbYulTTdRPLjagsHItc7n+0ugrAnf
X-Gm-Gg: Acq92OF8DWqvVJBEZCrlh5/jAinptYTfIODp1hNvqlddf2J5NFjbF+WotPbYDpJDbta
	NKh6rQCCFdDz4DHAPtP7D94OXPTrqOsCrq+y4UCRyq/O7867TRm6gO4B09PAmAy75eEtcLHoDZV
	ghw6PMUhCcoZK6UtOE3+xScCOKuEkjA42wHt1kxegjg3ox3bkzFFciZF1Qg5+jw6xVl57s1fEtq
	t3zp75QscXrVLlfI+Vs62lewpqGl38JxIYRKykDhsUOIqU08ZRIkGDGD51bmsIhOZFaTsxKxRAC
	vGnkhUH0RwhvpnzTXh4HPzxS4xlL44edQ/5bBLDsYykx7XmUzeDUStq1uh79ZqYiMxjWtmUigmQ
	xilL5nYozemCm4DaC2TO/4KE9f9Mg9mrqTj+cwDYxVTnnSAwtbWNgO5qg7x2yK172flWwSWdq0b
	XCVdOk0BFLDzSZtMdrQzaXX9xeBNe6vT50
X-Received: by 2002:a05:6000:4014:b0:441:1fa5:4577 with SMTP id ffacd0b85a97d-45e5c5f20f3mr25992706f8f.26.1779140237042;
        Mon, 18 May 2026 14:37:17 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm38301497f8f.20.2026.05.18.14.37.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 May 2026 14:37:16 -0700 (PDT)
Date: Mon, 18 May 2026 23:37:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Yaroslav Isakov <yaroslav.isakov@gmail.com>
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <20260518233711.4c99cc72.michal.pecio@gmail.com>
In-Reply-To: <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
	<20260517130407.795157-2-hurryman2212@gmail.com>
	<20260517232147.34931718.michal.pecio@gmail.com>
	<144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37636-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,roeck-us.net,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C66AB573F68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 05:30:47 +0900, Jihong Min wrote:
> On 5/18/26 06:21, Michal Pecio wrote:
>  > Instead of the X86 heuristic, would it be possible to build glue
>  > code if and only if SENSORS_PROM21_XHCI is enabled?
>  >
>  > This seems to work:
>  >
>  >   config SENSORS_PROM21_XHCI
>  >          tristate "AMD Promontory 21 xHCI temperature sensor"
>  > -       depends on USB_XHCI_PCI_PROM21
>  > +       depends on USB_XHCI_PCI
>  >
>  >   config USB_XHCI_PCI_PROM21
>  >          tristate
>  > -       depends on X86
>  >          depends on USB_XHCI_PCI
>  > -       default USB_XHCI_PCI
>  > +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
>  >          select AUXILIARY_BUS
>  >
>  > I don't know if it's the best way, perhaps it would be preferable
>  > for the hwmon driver to select the glue, but then I'm not sure how
>  > to force glue to become 'y' when xhci-pci is 'y'.  
> 
> I think I should keep the current hidden glue option for now.
> 
> The PROM21 PCI glue is part of the PCI binding path for the xHCI
> controller when enabled, while SENSORS_PROM21_XHCI is only the
> optional user-visible hwmon driver. Tying the glue to the hwmon
> option would make the sensor option affect which driver binds the USB
> controller.

That's true.
Making this possible is the whole purpose of "if IS_ENABLED" here:

>  static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
>  			pci_match_id(pci_ids_renesas, dev))
>  		return -ENODEV;
>  
> +	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_PROM21) &&
> +	    pci_match_id(pci_ids_prom21, dev))
> +		return -ENODEV;
> +
>  	return xhci_pci_common_probe(dev, id);
>  }

Currently, you have a weird situation where xhci-pci-prom21 always
binds on x86 and xhci-pci on other platforms (with the unofficial PCIe
card you mentioned), plus the sensor cannot work on other platforms.

> As Guenter pointed out, that would be too strong; the USB controller
> should not depend on whether the optional hwmon driver is enabled.

One could further argue that neither should it care whether some hwmon
driver exists at all, or which kernel releases it exists in :)

Regards,
Michal

