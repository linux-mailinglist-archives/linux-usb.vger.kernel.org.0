Return-Path: <linux-usb+bounces-37593-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPKNEEnwCmpv+AQAu9opvQ
	(envelope-from <linux-usb+bounces-37593-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:56:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B289356B0DF
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0707300E3D7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FC43EFD26;
	Mon, 18 May 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJ+peLbN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734D15665C
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101759; cv=none; b=gwz645krb2RXpCm4HFz3OdHxlNnL896TaeOoHriAaV6/SDuxwBiJeys4ws6bkdjcNuq13/Hx3NN3OUJBvKIPl/seEhOI7Tpf3+uNcxo5afK3EnXckIJFDbgI8zl3wxubFe7A4RrZEihpJ+KEFAmTceWR9no8raUjeWJdbZ+KEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101759; c=relaxed/simple;
	bh=hHrnrova4QOYv2M6dIOzxmlKptiDDDOXgFRyBRFswWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fks1MIRWv/3IpH1IrcprUNU3WovcZMNb4vsV4auDgL+YFBjmw106tPsIcNVdBBBQQ47FyzGT1qNqDqqDKsFg7/mhQAg6V5vetznDsZVJimtCabRz9hE/QkjxPFVZLAMCBtOQU+oF7oP6FERSskt6pplZUUsmqikWzmNDAyunUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJ+peLbN; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso1745757eec.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101755; x=1779706555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv8cUffeX0YGsV9duS8FS6XTQ7kK/O4/YLY9appo4lw=;
        b=RJ+peLbNbir3jr4971jUhuRTqRK6nzP9YseDMYD9dztemweAnGsdaqrP17cDKashmp
         o1dTpZGyShDmnba8711ZeX7QRJ7RR1YbBwI/4rH9jNM0H/Yhe/9v1oLuaF4K1coMPPdt
         1MjfkQ5qeZePNsQa2LbCuv/xZyhu0exD3HEpLYNCN9X48lnCP3QmJWnKJ/LEC44GoB64
         m0kaSz7Q0ijMCW+dB8E3/IpcAOR6VvdWIwaF6jRyHKNMdujZJ82MG7lkadZV7Tun20yh
         st0DZnwAXi4TjCrUnFaLwYzUi7HlUMP0rzZpXTGo8O/OAwaYTivMu1vFmaisdF2wbMcF
         2UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101755; x=1779706555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fv8cUffeX0YGsV9duS8FS6XTQ7kK/O4/YLY9appo4lw=;
        b=QCvtnEd5yPVSHmU2Rb1griMr0YEesw83biAw98YhCrpLzMxafa4rby/+R2d6Dsikxo
         XWoLn0+mkoh1yuPQrJ8bRrqqV92Ik5tBpZv2WtkZAZgnpssbDSaohK3LEMJRjyUk8G4z
         GyadRNKTJ35hO0nDLClzz8f7hU6oIN7X3YdoR9I0h+j+9a8wjDESm28pJaWaF1YFRa4C
         VunCg8h060TYBBcmf6+yKXUDJC/lvCzSokZhJmQ0y1h217xg/N1AcCN1NPzC50ZQ4Hyz
         QVUrNUI1bdD7VtLb+mRbjsZejLz+Q7Gbc73OUWOoXR5+n8LZ/mss63DqycVOR6El6tfZ
         w2bw==
X-Forwarded-Encrypted: i=1; AFNElJ8y38OMLh+lT8WEc66CJ+i7vW1Ju17ChCa4MiM2Qt5eD9D+ocybx03pMBRSprrnRMe6Ymbyumd/Rpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1663pjuhRfRsf/4jT2JB2xRtjtuGu4kFz7su1Czw/5uA94Y+4
	aZFRDROCkzrvynnrYtUDqgjsp0GObAaIJoP/M17gGO06lU5qrJSYTujb
X-Gm-Gg: Acq92OGtwpvzAYt15kZmcUoWi6OnOPlz/nOhNZ09LM2uEEpUmNjsqJ7ObEb2hAtxsv3
	HNSw7+CaAsUp/F7YCrx7TXfyzMALFgLpZhxtxg2c4ADvIyBVrzIrjsRUsEArzX2GFyLCLZGzlxb
	+4pwxyel9kEmM5t3QonsOnmVFuag1MoGe6bsuTGk7IiTbkr2dmZUxiD9MNnRGj5FazpvYU1gUx7
	xauDAvMuVHGF3ke50IYbSgrwUlMmeQPv77AdqMwCdyl4P7z+pKzU36hdRe8I5y9jSbp5GHxbjb/
	GUGV/jk5HRXj3+NF+iLlsGjBjuFwY+PZtEQgsod0GIFRu6GOgcsGkj9dx1IgFHNhEQX6QsE17u3
	56HN42yeCxx7T0FZiNQBZpDcmC9Yis3e80CEFFbArlu69OvDoJyuS5FEQL5RfV6K3rYM9keU75v
	q93yE3D5wpgd0lwdAtYOcqWXsLNIWH7d746JFUdtJ85k4pVOS3dMCISaS+nwndTaGycKZdSdCn6
	E8PgkuLITM=
X-Received: by 2002:a05:7300:dc8e:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-3039818af8fmr6391352eec.13.1779101754580;
        Mon, 18 May 2026 03:55:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm15416905eec.9.2026.05.18.03.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:55:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f05e075d-a87e-49b5-95f8-5858d21acf64@roeck-us.net>
Date: Mon, 18 May 2026 03:55:52 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Michal Pecio <michal.pecio@gmail.com>, Jihong Min <hurryman2212@gmail.com>
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260517232147.34931718.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B289356B0DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37593-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/17/26 14:21, Michal Pecio wrote:
> On Sun, 17 May 2026 22:04:06 +0900, Jihong Min wrote:
>> AMD Promontory 21 (PROM21) xHCI controllers use generic xHCI
>> operation, but the PCI function also exposes optional
>> controller-specific sensor functionality. Add a small PROM21 PCI glue
>> driver for AMD 1022:43fc and 1022:43fd controllers.
>>
>> The driver delegates USB host operation to the common xhci-pci core,
>> collects the parent-provided MMIO resource data, and creates a "hwmon"
>> auxiliary device for optional child drivers. Failure to create the
>> auxiliary device is logged but does not fail the xHCI probe, since the
>> auxiliary device is only needed for sensor support.
>>
>> Make the PROM21 PCI glue a hidden Kconfig tristate that follows
>> USB_XHCI_PCI. This keeps the glue built in with a built-in xhci-pci core
>> and builds it as a module with a modular xhci-pci core. A built-in
>> xhci-pci core must not hand PROM21 controllers to a PROM21 glue driver
>> that is only available as a module, otherwise USB behind those controllers
>> can be unavailable during initramfs and PROM21 temperature sensor support
>> may not appear until the controller is rebound after the module loads.
>>
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
>> ---
>>   drivers/usb/host/Kconfig                      |   7 +
>>   drivers/usb/host/Makefile                     |   1 +
>>   drivers/usb/host/xhci-pci-prom21.c            | 136 ++++++++++++++++++
>>   drivers/usb/host/xhci-pci.c                   |  11 ++
>>   drivers/usb/host/xhci-pci.h                   |   3 +
>>   include/linux/platform_data/usb-xhci-prom21.h |  22 +++
>>   6 files changed, 180 insertions(+)
>>   create mode 100644 drivers/usb/host/xhci-pci-prom21.c
>>   create mode 100644 include/linux/platform_data/usb-xhci-prom21.h
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 0a277a07cf70..89bf262235e1 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -42,6 +42,13 @@ config USB_XHCI_PCI
>>   	depends on USB_PCI
>>   	default y
>>   
>> +config USB_XHCI_PCI_PROM21
>> +	tristate
>> +	depends on X86
>> +	depends on USB_XHCI_PCI
>> +	default USB_XHCI_PCI
>> +	select AUXILIARY_BUS
>> +
> 
> Instead of the X86 heuristic, would it be possible to build glue
> code if and only if SENSORS_PROM21_XHCI is enabled?
> 
> This seems to work:
> 
>   config SENSORS_PROM21_XHCI
>          tristate "AMD Promontory 21 xHCI temperature sensor"
> -       depends on USB_XHCI_PCI_PROM21
> +       depends on USB_XHCI_PCI
> 
>   config USB_XHCI_PCI_PROM21
>          tristate
> -       depends on X86
>          depends on USB_XHCI_PCI
> -       default USB_XHCI_PCI
> +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
>          select AUXILIARY_BUS
> 
> I don't know if it's the best way, perhaps it would be preferable for
> the hwmon driver to select the glue, but then I'm not sure how to force
> glue to become 'y' when xhci-pci is 'y'.
> 

Unless I am missing something, that would disable the entire controller
if the hwmon device is not enabled. That seems a bit draconian to me.

Guenter


