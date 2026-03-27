Return-Path: <linux-usb+bounces-35534-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP/VMMomxmnQGwUAu9opvQ
	(envelope-from <linux-usb+bounces-35534-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:42:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7A33FF04
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 07:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67C723014299
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03683BFE5B;
	Fri, 27 Mar 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH0M5XGV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13D3BA25E
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774593678; cv=none; b=E26dEHmJX0/OgTcs1+/7ejyC5Tn+FQXLX99xzwFkTzVFgpjL4PYZVGLspJ2hv/oZXZ23kUKrib1GODn/v4BJVH0iEiOtPY6NScohy3HTVpTDDGkZpA/4BEjoNepSQYvbPMz1m8qI+lmNeTOVdhXT+MSThZnosiaRztlDFxx3t9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774593678; c=relaxed/simple;
	bh=4UrGci0dPrujH6qxGs2ymX7tGI2uhwgO969dLATDVy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2omiRz+aRUZebEHOioHorvlFCdu2WsGFeJ3bjn6CZF/iCliH9/GQlyYNIzkPJKn8hHNdyHC7MdlVX5apBarDE6zeUUaB87/VTSTB3KV9Iu3G4V+eh3qVLq+a7fCypQbVUhUPrG6fpcQr9pKrHAkcbcBRFaZlOi065rxPvq+Jko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH0M5XGV; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c17446ba8dso988013eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774593670; x=1775198470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nduYtSKfpopTmuw3oAsPQi4fyD7F6EEZi1ICkUx6Cyc=;
        b=UH0M5XGVmEnvCP5VstfwbKY38VqkuRadq92WE1olijKEypoUZRL6AwAVQUmx9PMG5C
         H9a8yp17os0pgEFxK/u7zR/vW+anN2W75Axi0cUxmeFgHsXPEMTv26JBGr8JbwIARgxB
         GscAzY+7E3tYpUGm9V4a/mEQLzJRdtEOZJI78oqfSW/Urv3QhZ7ddGJVxHLzHX9q5pTE
         qb653d73gxjuyyx0qiLtVRKPIZKhtas/o9m394RjNP9YsTL/IiwMmsNKJGka7YoYsnBf
         fyohwFzkgB6EiYPdF1T6LLFS54I+ERyFf7JqlcmHjd6vj/2JET4cmP+NM7lLJXqPDmBk
         we7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774593670; x=1775198470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nduYtSKfpopTmuw3oAsPQi4fyD7F6EEZi1ICkUx6Cyc=;
        b=jMUMpB3Is/RbsPbtNFbPXTDik+/aHaAJ6qJwb5QtXysC573ezhxqbqpAhqHfDyuHbk
         UdjiVbQEZkPVp4w4kgC1xgkTr+07DRgqqaf5kjW06r2vYwWBlhFKhND47TIur/QyF1mA
         lBPiMmAWqeskid3TR0rXOmuLNuY+FklYJiuMfrzlxgSN6RWNSMixWZEi8ohGwmkZGsdD
         cfx+MvX7JRvG8Gsx0C/ld07auoQJHq87HOg0wqwUmHezVF0Bpt3nf+ayjSSwVkMVJkJU
         43Ua4QGbSHLf3SRKNHaa26VtjOHcDev2xHh4yaVlrGJ8I9GgrfsHFn/CnYkEdZSHOMD5
         tpGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw9IYjOkHNa5hSrE6rLb5HvC031kDfxbR9jBabyseRTz/WgmaNWONdb5DADXwOYOM2zhaRrMoGaTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKXVE8krTkbY6e9XYc1nA98O3Gx7+d0qGUUIBjlRTphe7kpty
	hWg/NtVdmD3hlyACmAOlkQB8fJdqmKV7Vj5o1WHijiUmkW0ltZQMFpXO
X-Gm-Gg: ATEYQzziO/a0AArZnuhwZoB6mN/52NNYzN2vBSZIVjjqkgSRegGFUXkMOLAFjElNQ4m
	W9/Np/0Vugq5ZFVY+i+Hx9jRuWOcIblP1k+3yDZp7byrtCVJ5yJhMU945x1fRPwp/nCyFKMjkBq
	QEgCg7HNWkmP7KIdTDqAOQxbEmOQxPhqajMzjLv6Vtle56UjHiYp0Yc9uYSBf6uUPqhygSMQik6
	P3C2E0xlMd6anbPlQ172vW9f7Q1Tq0KG/v//+F8/QMuYjfw5n48xsaBu64arFGBfj0UkVuaSN2O
	cUEbKi2qGRH/9TyHA/R2fYHNuJk9tsa5pHSUWCL5qRBOkV3xzzKfQ1VDex1f1d2aM5oB7dYMnh9
	mGrIpyrvRcvOdvpsb8dvx/Mrx9+Gi+O+vE0boMuUGLgVDG1b48EPyi8K9qmfxNicGjEfGNqf0j9
	Cf7Pql2WqUtB/CjsI6NYNui0j4v1J90yMgsz5LRicgNR5XZJ+2CHaM/x3MRY08DZDENIPszAUt
X-Received: by 2002:a05:7022:48e:b0:128:bae0:89b7 with SMTP id a92af1059eb24-12ab2fa1e4bmr488963c88.3.1774593669739;
        Thu, 26 Mar 2026 23:41:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5beb2sm6654016c88.1.2026.03.26.23.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 23:41:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d5491d24-f7f6-48da-bfd4-dff07a15c228@roeck-us.net>
Date: Thu, 26 Mar 2026 23:41:06 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, vbabka@kernel.org,
 harry.yoo@oracle.com, akpm@linux-foundation.org
Cc: hao.li@linux.dev, cl@gentwo.org, rientjes@google.com,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 andy.shevchenko@gmail.com, hch@lst.de, Jeff.kirsher@gmail.com
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35534-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oracle.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,gmail.com,lst.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,roeck-us.net:mid,harvard.edu:email]
X-Rspamd-Queue-Id: C9A7A33FF04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 22:58, Mikhail Gavrilov wrote:
> When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
> tracks active mappings per cacheline and warns if two different DMA
> mappings share the same cacheline ("cacheline tracking EEXIST,
> overlapping mappings aren't supported").
> 
> On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
> allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
> hub driver) frequently land in the same 64-byte cacheline.  When both
> are DMA-mapped, this triggers a false positive warning.
> 
> This has been reported repeatedly since v5.14 (when the EEXIST check
> was added) across various USB host controllers and devices including
> xhci_hcd with USB hubs, USB audio devices, and USB ethernet adapters.
> 
> Raise ARCH_KMALLOC_MINALIGN to L1_CACHE_BYTES when CONFIG_DMA_API_DEBUG
> is enabled, ensuring each kmalloc allocation occupies its own cacheline
> and eliminating the false positive.
> 
> Verified with a kernel module reproducer that performs two kmalloc(8)
> allocations back-to-back and DMA-maps both:
> 
>    Before: allocations share a cacheline, EEXIST fires within ~50 pairs
>    After:  64 pairs allocated, all in separate cachelines, no warning
> 
> Fixes: 2b4bbc6231d7 ("dma-debug: report -EEXIST errors in add_dma_entry")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Jeff Kirsher <Jeff.kirsher@gmail.com>
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Thanks a lot for taking care of this!

FWIW:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Reproducer module that triggers the bug reliably:
>    https://bugzilla.kernel.org/attachment.cgi?id=309769
> 
>   include/linux/slab.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 15a60b501b95..f044956e17c1 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -536,6 +536,19 @@ static inline bool kmem_dump_obj(void *object) { return false; }
>   #endif
>   #endif
>   
> +/*
> + * Align memory allocations to cache lines if DMA API debugging is active
> + * to avoid false positive DMA overlapping error messages.
> + */
> +#ifdef CONFIG_DMA_API_DEBUG
> +#ifndef ARCH_KMALLOC_MINALIGN
> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
> +#elif ARCH_KMALLOC_MINALIGN < L1_CACHE_BYTES
> +#undef ARCH_KMALLOC_MINALIGN
> +#define ARCH_KMALLOC_MINALIGN  L1_CACHE_BYTES
> +#endif
> +#endif
> +
>   #ifndef ARCH_KMALLOC_MINALIGN
>   #define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
>   #elif ARCH_KMALLOC_MINALIGN > 8


