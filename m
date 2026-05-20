Return-Path: <linux-usb+bounces-37797-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHghNaPHDWr93AUAu9opvQ
	(envelope-from <linux-usb+bounces-37797-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 16:39:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C758FCC9
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 16:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B57A2326CB67
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00043EC2CD;
	Wed, 20 May 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSkLvI7b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C95231B114
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286739; cv=none; b=SyE3vI+ndnYUEj0blUdv9r0MlfT2O0QSMlap+gGsS3aCWhe5tB8SxJrtDIN+8rQ9ZgWn+JMxQse9FvmFYcqz45pLNjcKK7eoZYLRxgXBZAVgW2aT5mHv4UsEyY2VfRRToV1Oi2ngneG2vg9ME1VOyN/G38LRoD6kEcsVfMI2TNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286739; c=relaxed/simple;
	bh=SVbGfRf42/YpRtOvkubvp4anUHrMvLtMBHhgTtWQnfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBAXP7itAIbdSvTE1s33BABI9tTtIoXWJLs20LR1fBtfoPysDMb3+mCNxoT3Z/9BffyjPXQG0dfPxbwfQL1jYmrlQabnMEKrWhaawslM4Cx6pn+NZSxHlGYli9L5Z7HZ4lBV/FcDLVK5ZGjlJd7uviOr31mKiP79i7gUzwdSBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSkLvI7b; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f0ad52830cso6247848eec.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286731; x=1779891531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vyw5z+cwPwEeTdxGP1e0+U+3uquisZZyqDCM4ankidw=;
        b=DSkLvI7b6i2vq92PSx5mKBVTl8Bw01nseMkFEzZBH0bQG3nBoP/mJ+FmhlUJGQcuGc
         LsjTwrT7XJfof/GCQQ5inuAJ5/XkEvS0aqmr5mf7Cyzy6NV/8BpR5cb5/xvHlIedMG6G
         GkzRPFh93zmlpW/w5bML8E9OPpgU17+HBN0a4otD9x8LMIe/WBJgRLhyCTt65p+YYTsb
         uCQ2bz6bEepWi6iUcdakskDhjCj0OVFtZhOfODcp9I1QObK7GvXN0Vl+czerxIPQoE6w
         xJPqUSX7Su2kFY2/O/Fdqqh32uISEAe9J+fnoJkoxKg7ZvlwemkZJuQ13JmR8d/vjoqC
         7GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286731; x=1779891531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vyw5z+cwPwEeTdxGP1e0+U+3uquisZZyqDCM4ankidw=;
        b=V8Z8Bfvyhav2TKhlUleLCXJoPPm1RTEfKNG/gQWD48A1n7TXrLrLopkGD3x8QxBGWF
         cCVboT/1/qalqGhISRq5GIrHU40r0+Z93/rthdvSUy2OpIlgGCClbQT0SYzi6AGWmzHl
         eWY1efBDBltVzQ5JsxE2hYNQyeHL+96Ja6b6sk1FdWRmezw/TMMb+iZGy9h3dNbc4Ajm
         E19MYnyv+Fb+LFbYmRwO3Mc2ZxILWLA9ZpWM8i8fPgpjxjAvex7jWNYQVdW9wFTjlaY/
         GZ9zZ11y459EFORnSpMYf4BEt+OxuXkaCuU6T4kzZkdVzouX00w2lap48L39BkRCrl4j
         r8RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QyDfeUp6Tp++qZvMKVDX/fFBIol9ALMWOrEhYkY87B+bTd9zIZ9x58Bo2UXW8osLrovMbztkAtkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykZgHKLoXL6gixlOXV/W2h0oBxaYl1gUeb2Eg1HH/l9utnsk+B
	ML9+LacU/tjPJa91fCpzmwlI9X0Sb1pqkklyCgbSsjnc+YpCZ2lql7Nn
X-Gm-Gg: Acq92OEW9ehN3yk81yhi/skxc/rdq5RNfYZHoE27MhnP6jT3Farn1hffcHmCO9QE5vr
	Zkuzqw+jv/ytScQlZKpN+yM9OuCkFYv4PWhhd7eN4HtGtICmoQyRHYGXWrAxyJc7pm8iBzc5D6b
	6gdms5OHWRt4mswxz2omY/S3ELNJ95KJjU0vNEvLAd1P6qlxSeDa4nKNk0PH9YKpyTP3qootsRB
	mljjwu6hgrO1H/735OUxeQ263va52frtlFaG95mrQYLqaA3TVOMqRAZ0kADmxv16Ac1V06Kw3ns
	9LXGdywE6bnp0H/mp7DoAD1si+irloTWW1/FJH6UDrWyCBzbb5kOJphY52EdGeAL5bG7PjPdlLJ
	V9UnTsMnPDSbv1ysYvk4HpXMRny2k2g+O+8kqglm3bMT4NinmzLRHQ2/fs/DQklza/b+eS2H5lt
	iWqBlhALEiZJQQ4tCRxKyTYFJh2z3+qIAN3FB8
X-Received: by 2002:a05:7300:a94b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-303986552f6mr11202553eec.20.1779286731120;
        Wed, 20 May 2026 07:18:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm21432427eec.15.2026.05.20.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 07:18:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <06236462-6c4f-413d-8324-537fb8f743d9@roeck-us.net>
References: <20260519000732.2334711-1-hurryman2212@gmail.com>
 <20260519000732.2334711-2-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519000732.2334711-2-hurryman2212@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37797-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,lwn.net,amd.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: 885C758FCC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:07:31AM +0900, Jihong Min wrote:
> AMD Promontory 21 (PROM21) xHCI PCI functions use the common xhci-pci
> core for USB operation, but also expose controller-specific sensor data.
> Add a small PROM21 PCI glue driver for AMD 1022:43fc and 1022:43fd
> controllers.
> 
> The glue delegates USB host operation to the common xhci-pci core and
> publishes a "hwmon" auxiliary device with parent-provided MMIO data.
> Auxiliary device creation failure is logged but does not fail the xHCI
> probe.
> 
> Make the PROM21 glue a hidden Kconfig tristate driven by the user-visible
> SENSORS_PROM21_XHCI option. If sensor support is disabled, generic
> xhci-pci binds PROM21 controllers normally. If sensor support is enabled,
> the glue follows USB_XHCI_PCI.
> 
> This keeps the auxiliary device available for a modular sensor driver while
> avoiding a built-in xhci-pci core handing PROM21 controllers to a glue
> driver that is only available as a module during initramfs.
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

The two patches should be applied together. For now I will assume that
they will both be applied through a usb tree since this patch touches
common usb code.

Thanks,
Guenter

