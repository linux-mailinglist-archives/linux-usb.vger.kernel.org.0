Return-Path: <linux-usb+bounces-37650-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKfmDQ6gC2qkKAUAu9opvQ
	(envelope-from <linux-usb+bounces-37650-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:26:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A560B574F74
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DE023042925
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF013264D8;
	Mon, 18 May 2026 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1ULs6lQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896A318EE1
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779146750; cv=none; b=LVF3nGAa3CJGyd4SSaLOE3zipLgQF+vzLSZMAKElrbmZ7SqXQgz9DpDkfLoR6BVTRH4GfhJ/4nZPk8q0m/nylRCCX2VMXxWUH6//PcB6wJ3/MZVFHOd0JgCMdb1cL5rvNQa4qpyQZ8DbfPKAHeKOagXvAFgEVYaV6dNYxasHAA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779146750; c=relaxed/simple;
	bh=4RfscQQn/pTBnlejDUtd+8rPk4nHLoB3UAp2Ugmw2zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YzIVMhkuwrbX9Qhspx0UtpTpdaSMYq2V5XoJdvorvsyf53Lu4mDkE6RKBAs7zzDPpALsluVzyolyoQM+HYee9SfC4+wupM5xrdHZ9cyDh133JpBqY/zCekquFpQWQT8v3IDbN5Vd2OvxLbWHfHZxPzvspEyFkUbQQRIoIMjTbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1ULs6lQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso1134071a12.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779146748; x=1779751548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JF0r/iHjJb1hUKYsIq348Phvz6d6d0rLxOqdeph9mEQ=;
        b=e1ULs6lQXPOQFYnTXiLw18rogl3G1br/Y/nmrsVdZmxaOWFtid/OHoE6fH2IByxLHo
         C7qhjC3iJkyzyxoUgArXUF7DQxz40IDcOqS9XVPQQxAwlI+pxVEFuHG+hfBK+6jq7rgS
         pQB3rCjniH8k25f3h8FhhPTl50mw4qZiH1ohAWfFw8eu+5GOqaJbMaMYtuxe9PThc/VY
         7/Q4Ry2Ad+rXGPU6YSbRPWPLC7u6HUfGqm5gTP5zuP6uwY7ThEWuqqYzPK7lP4mtebmy
         s/OGf6Ugl1A6TqyIKjSWi8SdAuo4DL/TehGVESufPQ9mq5aU1W2fJYC2ypieq+8GwXHS
         W9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779146748; x=1779751548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF0r/iHjJb1hUKYsIq348Phvz6d6d0rLxOqdeph9mEQ=;
        b=HRtPBO+r0aaD+B8tTv1bA2K4VaQK198Geuat2RHx6PcRf834w/tWZh35PPYR9YC/Nf
         kKDOVPTNFHZAjGgFqILsfO2uMhVT+LxaxyH0TYbLRmiZVYQr7DkQ2NBz12XxNjnTAVRo
         3Y0bpCiW1HkA0tnitmWkDkIMbdoORSfc9eYnzvL0PzIEWLsabWPHGfe+iRlhiYcDjQlA
         7/xlB194xYO4aHr6BHApVX85KySusd3jK44hy3BZRufUGpATLeYGQSmW18qVqnCEdYZN
         X8RusSFgH86B+XqAqTjttfVuQWolSMu92XS8lS3q/T9cGO/QDuen2xmnWHP+0dFxs07z
         54pw==
X-Forwarded-Encrypted: i=1; AFNElJ8K6IUBA3s+W5pEYb2qBH+wVeiFw9594H2ZS5qVKeSmwUOgeiWvhQ1jcgCLJYZP+QD+Us/vc5aP+rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOvAfU9Cfanqp39eH98fobM3brs5B0ttWVms3vTX+mQHiC+C5
	0OxjO1S8IK53Gx0GjkDRS15hnIwdJiRbz0o30ZdrjwtjruUDh0Yo2Pbn
X-Gm-Gg: Acq92OF2GmNjZNrvNAJikKd+kmMq3k3cRk5YH0blWvnpCyHRjH6OGYW9wku5Ln69zgB
	DvmeGbs39Wk9rNmc3lvaLrv1vUeDji0U+yQw8u1xeaV4lwx060ym7NYZ9rmmBKjx9qaD7WKb9xp
	IVaGBRiCHTV9LBSNmj8G6jkH3CHpOrzHMQ2fQhECyAydx8nLWrw/qNuJC5YMCUgxikAztk84OWj
	MERS7olRa+snWdTqff2TFW6xdDr3I40efBeIdbm48P05ihhMOqnRZ5OPKItrfoMR+a6HkD4ezFH
	VYuUOCxNVIsy2I2qkZu19SURchgfkq+1oA73h9U2tlT8+UJUY5QhGjJNBnuYbRDREZ+Hve1rGcI
	8X3XaYHN70MpYvEtruQghXxx+lfJXwbNLdnoaFUMJNb7zGFP2ctfWIAOhtQIPxuAymcowFdwhO6
	8ouXytXasRxgsENRx0LsfNNyWbTu0EmMJEStwjtCNDS7uLY6YW8Bw9GoN0gln/5IjQf8K/apOf+
	JOJLwVY6rs=
X-Received: by 2002:a05:6a20:5681:b0:3b2:6988:a6fc with SMTP id adf61e73a8af0-3b26988d381mr9737443637.18.1779146748232;
        Mon, 18 May 2026 16:25:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14615425a12.25.2026.05.18.16.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:25:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ceabda3d-47a2-474c-9792-5453acd5a84e@roeck-us.net>
Date: Mon, 18 May 2026 16:25:46 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Jihong Min <hurryman2212@gmail.com>, Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-2-hurryman2212@gmail.com>
 <20260517232147.34931718.michal.pecio@gmail.com>
 <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
 <20260518233711.4c99cc72.michal.pecio@gmail.com>
 <7ff352be-05d2-4c21-931e-18238172e4d7@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <7ff352be-05d2-4c21-931e-18238172e4d7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37650-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,roeck-us.net:mid]
X-Rspamd-Queue-Id: A560B574F74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 16:06, Jihong Min wrote:
> 
> 
> On 5/19/26 06:37, Michal Pecio wrote:
>> That's true.
>> Making this possible is the whole purpose of "if IS_ENABLED" here:
> 
> I re-checked the Kconfig cases, and I think you are right here.
> 
> The two cases I was trying to avoid are:
> 
>    1. the sensor driver is built as a module, or loads only after the
>       initramfs stage, but the PROM21 controller has already been bound by
>       the generic xhci-pci driver, so no auxiliary device exists for the
>       sensor driver to bind to;
> 
>    2. the built-in generic xhci-pci driver rejects the PROM21 controller, but
>       xhci-pci-prom21 is only available as a module and is not present during
>       initramfs, leaving USB behind that controller unavailable at that
> stage.
> 
> Looking at your proposed Kconfig shape again, it handles both cases.
> 
> If SENSORS_PROM21_XHCI=n, then no sensor support is requested and
> USB_XHCI_PCI_PROM21 can stay disabled. In that case generic xhci-pci binds
> the controller, which is fine because there is no sensor driver that
> needs an
> auxiliary device.
> 
> If SENSORS_PROM21_XHCI=m or y and USB_XHCI_PCI=y, then
> USB_XHCI_PCI_PROM21 follows USB_XHCI_PCI and becomes y. That means the
> PROM21
> glue is available during early boot, creates the auxiliary device, and the
> hwmon driver can still bind later if it is built as a module.
> 
> If USB_XHCI_PCI=m, then xhci-pci itself is modular. In that case needing the
> PROM21 glue module in initramfs is not a PROM21-specific built-in/module
> split
> problem; it is the normal requirement for a modular xHCI PCI setup.
> 
> So I agree that tying the hidden glue option to whether
> SENSORS_PROM21_XHCI is enabled is reasonable.
> 
>> Currently, you have a weird situation where xhci-pci-prom21 always
>> binds on x86 and xhci-pci on other platforms (with the unofficial PCIe
>> card you mentioned), plus the sensor cannot work on other platforms.
> 
> Agreed. I also agree that the X86 dependency is only a heuristic and is
> not a
> good restriction for a PCI ID based driver. PROM21 is mainly used on AMD x86
> desktop platforms today, but the unofficial PCIe card example shows that the
> device can exist outside the normal AMD x86 chipset topology.
> 
> I do not know whether other PROM21-related functionality is supported on
> non-x86 platforms, but this driver does not need to prevent the xHCI
> temperature sensor path from being built there.
> 
>> One could further argue that neither should it care whether some hwmon
>> driver exists at all, or which kernel releases it exists in :)
> 
> Right. I think the cleanest result is:
> 
>    - generic xhci-pci handles PROM21 when no sensor support is requested;
>    - xhci-pci-prom21 handles PROM21 only when the sensor path is enabled;
>    - the hwmon driver remains the user-visible option.
> 
> Unless Guenter or the USB maintainers object, I plan to change the next
> revision in that direction and test the Kconfig combinations locally.
> 

Ok with me if you are sure that it works. When you send a new revision,
you might want to also change the error path as suggested.

Thanks,
Guenter


