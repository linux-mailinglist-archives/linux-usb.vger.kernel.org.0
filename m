Return-Path: <linux-usb+bounces-9722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2B8B0E13
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 17:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47BD51F21B97
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 15:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11B315FA68;
	Wed, 24 Apr 2024 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0zSLRs9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11315F408
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972221; cv=none; b=Fhm/0InjvvsZQy4TdaKFJ8ZovoffpePHCPmalIQ1jvqouiJswnJXS32srhDIuWUmFvjkxaQo+rMdejpilPm72a2JoEdz4JUvLUAlldj9KMV3VPRmZ3VZfJjAsm6BrkqmYhPdynxurZMFAxc1A323KiophahnvKCtpdZbZRk20J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972221; c=relaxed/simple;
	bh=SBLInrS32w0zdwJZR1K4k8flqwi4dNagW9G1G904grc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibgWyAc0l4tipCkMVqBgOOX8RF4Pgd77b4SMDBa/QSYr3o+WQNm8v7rdVdYWIOcSouaaKlfMx7mwh2gospClD7BnHbrQp0SZpMm5vRtnnQirjQg/0ht7gdfduxHNHmhdBFyvbORxuxLKt3ph+RqjoW/EcIvObkHsg9ONlHFbeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0zSLRs9; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2343ae31a9bso16834fac.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713972219; x=1714577019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/2cC6DzRzgBjH4Px9PozCQEgy3u7XZ3utspb0XVYfN0=;
        b=M0zSLRs9kCZL+vkDnzx6q+n3Q/EsrnEWpP0ce6PJ+LskWxfsRZBGUkQAD9xepNwuBD
         UP1Fgq5QCFVwC2RU7D3rRcP6IeWek6A3x8ur4g28EJLPYKhmy3YxiP8WUM3IPRGPjkCR
         zScHuMHo1lAnenkBlTkj2LQQtxR1VUULooxZusslk9ASWdptqGn5PX+sorWDSF/heBr9
         Wsyi9piwa2ZXiWrzv231jsAM/kF8sMyO+InJmiloaoNuC8vfd0awQlQ3GADJ3gNn8Lmu
         vXFsar4aQQ1c6Fui4QTNGRzrA7/5Wlu57L5kjHmG/mCL9xOLFWeiXQ+Jyaqz+ZaEsigF
         Rwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713972219; x=1714577019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2cC6DzRzgBjH4Px9PozCQEgy3u7XZ3utspb0XVYfN0=;
        b=L9AO3SsMjareet0rj8Hcu+/deq/vOYx1HGGnzeaDdSx5y8gnJQsbg5OmbUVMGObDyf
         QBIE2LMuGRnZLvj91DbpwdVKHFOtGAgM6yLZCKzs+CLRAX4epU81acYouJQSvAtzg+mA
         FHwVySm+SHXxYiRe9Dk9BRGRY/AiqTvhppyHIqiub50w0YyuOEN6ClcRb+WViWVA+dFS
         vYGHXByL6nWSSF3NhQsZHIhoIQYe6FyIfFhG15VXxCdG6gPg1n4P9Tl+lbE+Hnyalxg2
         vvUgqLUccOVZo8g9WQoG+xQn88/My8a9cnkUmMYxQZFHI2Qc6ehECFl3dEWFaqmY0Rga
         xrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7FLnx8+3DqyizlC7LqVoFn43AGAlNxKZC96HZbeyE6wvBc/HdlgNdP4iV/oU2JLejSp8penFuaDFrhDVSYLHgZw+qeA5fCPt+
X-Gm-Message-State: AOJu0Yw1ZQc8IpIv7wFdiDnyyGK2O9m7rEDLKEq3kVaf7DOzQdCklxiP
	IImNYCw/InT5vob65nysfK65Q/XrrwTxDGy0OthltSLf7Zm8tho4x0P2ow==
X-Google-Smtp-Source: AGHT+IFVPV1iR2LhAVfCMQQInXysIkKQV9dpnfivNpOKqBpaOh70aoFAwNjNId8gXMdYbqulzBJOjg==
X-Received: by 2002:a05:6870:3052:b0:22e:cdf5:40b6 with SMTP id u18-20020a056870305200b0022ecdf540b6mr2886834oau.14.1713972218990;
        Wed, 24 Apr 2024 08:23:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gx9-20020a056a001e0900b006eb3c2bde43sm11519540pfb.205.2024.04.24.08.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 08:23:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b815670f-fea4-4ab5-bf67-671c8395bfa6@roeck-us.net>
Date: Wed, 24 Apr 2024 08:23:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems (timeouts) when testing usb-ohci with qemu
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 qemu-devel@nongnu.org
References: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
 <edfmff7qm46edap6nz2ppvfhcw4jp6ahjltrv76jsiq5rhz5hw@v2lcbclpdsjt>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <edfmff7qm46edap6nz2ppvfhcw4jp6ahjltrv76jsiq5rhz5hw@v2lcbclpdsjt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 04:16, Gerd Hoffmann wrote:
>> qemu hack:
>>
>>   hw/usb/hcd-ohci.c | 11 +++++++++++
>>   hw/usb/hcd-ohci.h |  1 +
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
>> index fc8fc91a1d..99e52ad13a 100644
>> --- a/hw/usb/hcd-ohci.c
>> +++ b/hw/usb/hcd-ohci.c
>> @@ -267,6 +267,10 @@ static inline void ohci_intr_update(OHCIState *ohci)
>>           (ohci->intr_status & ohci->intr))
>>           level = 1;
>>   
>> +    if (level && ohci->level)
>> +        qemu_set_irq(ohci->irq, 0);
>> +
>> +    ohci->level = level;
>>       qemu_set_irq(ohci->irq, level);
>>   }
>>   
>> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
>> index e1827227ac..6f82e72bd9 100644
>> --- a/hw/usb/hcd-ohci.h
>> +++ b/hw/usb/hcd-ohci.h
>> @@ -52,6 +52,7 @@ struct OHCIState {
>>       uint32_t ctl, status;
>>       uint32_t intr_status;
>>       uint32_t intr;
>> +    int level;
>>   
>>       /* memory pointer partition */
>>       uint32_t hcca;
> 
> Phew.  Disclaimer: Havn't looked at the ohci emulation code for years.
> 
> It should not be needed to store the interrupt level that way.  It is
> possible to calculate what the interrupt level should be, based on the
> interrupt status register and the interrupt mask register, and the code
> above seems to do exactly that (the "ohci->intr_status & ohci->intr"
> bit).
> 

You are correct. For the purpose of this kludge a simpler
+	qemu_set_irq(ohci->irq, 0);
	qemu_set_irq(ohci->irq, level);

would have been sufficient. My original code added tracing,
where this generated a lot of noise. I didn't completely simplify
the kludge. Sorry for that and for any confusion it may have caused.

> ohci_intr_update() must be called if one of these two registers changes,
> i.e. if the guest changes the mask, if the guest acks an IRQ by clearing
> an status bit, if the device raises an IRQ by setting an status bit.
> Might be the ohci emulation has a bug here.
> 
> Another possible trouble spot is that the timing behavior is different
> on virtual vs. physical hardware.  Specifically with the emulated
> hardware some actions appear to complete instantly (when the vmexit to
> handle the mmio register write returns it's finished already), which
> will never complete that quickly on physical hardware.  So drivers can
> have race conditions which only trigger on virtual hardware.  The error
> pattern you are describing sounds like this could be the case here.
> 

I think the underlying problem is that both the qemu emulation and
the Linux kernel driver expect that the interrupt is level triggered.
It looks like some entity in between handles the interrupts as edge
triggered. This makes the kludge necessary: All it does is to generate
an artificial interrupt edge.

This can be worked around in the Linux interrupt handler by checking
if another interrupt arrived while the original interrupt was handled.
This will ensure that all interrupts are handled and cleared when the
handler exits, and that a later arriving interrupt will generate the
necessary edge and thus another interrupt. That doesn't fix the
edge<->level triggered interrupt confusion (if that is indeed the root
cause of the problem), but it does address its consequences.

If anyone has an idea how to find out where the interrupt confusion
happens, please let me know, and I'll be happy to do some more testing.
I am quite curious myself, and it would make sense to solve the problem
at its root.

Thanks,
Guenter


