Return-Path: <linux-usb+bounces-37156-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBBgK50o/mm9nQAAu9opvQ
	(envelope-from <linux-usb+bounces-37156-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:17:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B24FA77B
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 362023055C23
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 18:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B295E37DEB6;
	Fri,  8 May 2026 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfM8b4LV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD477377578
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264164; cv=none; b=pvc7SS62V/1slQHyxPbHDiPuK9K2yxtnjwRJey6z3ZrPqHr5ScwC9X+QOGlj3KvFI/XF6REvui2xQk5ygwKVElAFPvck3rdYfyZjHPKS554+9oB4QVI2eQBJ1A3aMs1hJrHW4TOaC9z3ja/79LxVo2MaBimUUFpkMi0KTd5rZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264164; c=relaxed/simple;
	bh=LZCGgKEGEvKGeWkO7nM1Ue0hldFHRuium3dlrfRKmow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGYcSdt+poy+hCZ9dku6hBU5IGLf9V//Hl8enZPR96ByNYwYwJIOEEGPLVltjxCU8qWlXxXVXGJx4zWbpQzlqmqdd+qpwansDl3g1X5Gk+e4ViRymRpVN4QJH6DxFQkh+lnlTyr9jKlqjwaZ7JvY4iGWyP9ts+jPGNw+XXI59P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfM8b4LV; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5996110eec.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778264162; x=1778868962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IM2/rTMkyCbqZ8kLdve8nrdCK1JQ4NVvOGN00DRH8wI=;
        b=NfM8b4LV2t49DTTjvxGqrkKthY/sXbxZdnIdkye8qwpJiuBMn6vtWpmNJiiHxFdqvZ
         IrUD0ndyFk3ycgAtUrSi2Gx0LsAhWz7cpVW5MhKsLBLHNvZ8Xt6MSaC9F1wLuWsHanGX
         hkTAEeTKQyZLOKH2QE20KcXPohgH/OZFZlzOyviKC92CyxMkAnEp8d6qYUYQVOvHm6/G
         Nc90cZ5pCE2JaUJTCgE7345hyg5xemVB2K7ijH0L2wFCpRz+SdtDK1Rmda/koFywAYul
         /XLzJyQ6ErUidrEKiKN0ryIw4VbYjrbdn0gw93Ai9MeR8D24EXrvnk6eOP14Wm2DVVb4
         1+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778264162; x=1778868962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM2/rTMkyCbqZ8kLdve8nrdCK1JQ4NVvOGN00DRH8wI=;
        b=XuR1iDbR0bF7XuOEc+kVdHn5sQXgJpfKYp71j/P+m+JO/6aiqoZRtNyYFB28il8mkH
         vJGgI3VeLY4cv/5KIuYQHs3uC/fUYJUw1AJ/+qS7loTj0+t88Zrur1rLQXwUNSxdNEj+
         DlLlYOJORCIpblNb6iOiqZPIMpU2/AXszON59gSPApuv0SYeW99aWrf/E5q4uXjFSdjq
         2KQYuxAP3X+GI5THqEwlxhLgk5gC4dxSUWbroKY+VR1RWFg2s/zUuWcTkd/eXknJczDR
         9WQKCFQhsRPOPinkS8qFz1A+0IlMPWQKoMrn7oSAXn+Bn4e1619ZOFmb8GuN02fMgifK
         smZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kgRDZ4dia58QSribIaJ365L4xl5wocuRaG6LsFtvwPiPv5+P10/+Ubcu9ehttzSED/g0/yB/nTs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUb2Mr7F/yYC0LHMkMEiuIE8FUkfRO3TU6TDG87YChuVHjp8eO
	K3iapHjiEo5SRiCDyW1eC5FqZoNs8QyWgr0RwZOZNBuGCqEP84TRxaCy
X-Gm-Gg: Acq92OHCJY+x2AJs+0kXmFEYCgZFoBJ533tX4IMNv5L/18AS1/wkx5nF4/iG7X4B0RP
	aa16dq8m62F272BR3PhJocXU5cdqmxyC3rjj04cGV73dNWF5gX66UdOIDP5aocnU9bfSUIBeK0/
	OWEgISsChGDBjHUgA+Y7Hg2XJQJg2tmr4Aie/VtK3o7KJcTsYVd2BQgurqBrsTsDDlgrm/Ytf7f
	R83V3lvFvMJwf9YMEsDF/bpgg6dp032FfjwWfTmvp/nIc1hWzD+WOs/druWFsYaINTH2UnR/J36
	s9KuuG0rBbm7tCiSglMro4fFoMbR2wU/eJwZ/Wdka8ykkPWecaI7c6otyp6r65S/NwAE3PJj+L0
	iarOuarbBlae5a4SaELM0sNiLpcwllnxqBnwyosFYzLhZ+rQ4dDauqyAjISMIfiMLiGhZBYy4+Z
	06c6UjM3CQNhq+2cdbjG1KXgVol7C25aWKkq6dGl5h8ztSF904pKYlkIl+oIuaH+voWXODDW+u
X-Received: by 2002:a05:7301:9f10:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2f54948f6ebmr6791259eec.14.1778264161953;
        Fri, 08 May 2026 11:16:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm3280193eec.25.2026.05.08.11.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 11:16:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <053b019e-9c6a-4eb3-aa69-0c07cd6e7f12@roeck-us.net>
Date: Fri, 8 May 2026 11:15:59 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Jihong Min <hurryman2212@icloud.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jihong Min <hurryman2212@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508143910.14673-1-hurryman2212@gmail.com>
 <20260508143910.14673-2-hurryman2212@gmail.com>
 <ad41d70b-e9c0-446e-8bd0-4528de75b592@amd.com>
 <0d518d40-e239-4d93-8e71-0d2e140f00ca@icloud.com>
 <966c9e07-10e6-4abe-9cb5-77b974f31302@amd.com>
 <b8372128-c922-4b62-91c5-46f848180bc5@icloud.com>
 <2657e1b7-126d-4c4b-8027-012a6d3ffee3@icloud.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2657e1b7-126d-4c4b-8027-012a6d3ffee3@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 526B24FA77B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37156-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[icloud.com,amd.com,gmail.com,linuxfoundation.org,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Action: no action

On 5/8/26 11:11, Jihong Min wrote:
>>> Something else I was thinking about while reviewing this series.
>>>
>>> Promontory 21 is only on AMD platforms and AMD platforms are only x86. I think the Kconfig should be conditional on AMD CPU support being enabled and X86 architecture so that we don't bloat other architectures with dead code that will never run.
> One related Kconfig question: would it be acceptable to make
> USB_XHCI_PCI_PROM21 default y with the X86 && CPU_SUP_AMD dependency?
> 
> This would only default-enable the PROM21 xHCI PCI glue. The hwmon driver
> would still be controlled separately by SENSORS_PROM21_XHCI and would remain
> opt-in, so the undocumented temperature register polling would not be enabled
> by default.
> 
> The concern is that, without default y, distribution configs may miss the
> PROM21 PCI glue and then SENSORS_PROM21_XHCI can not bind even if the hwmon
> driver itself is enabled or available as a module.
> 
> Would you prefer this, or should USB_XHCI_PCI_PROM21 remain explicitly enabled
> by distributions?
> 

How about "default USB_XHCI_PCI" ?

Guenter


