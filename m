Return-Path: <linux-usb+bounces-15332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17A983929
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 23:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6B8282258
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 21:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118C484D29;
	Mon, 23 Sep 2024 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkD97GND"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E218584A52
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127568; cv=none; b=ClWFNRQcOTGRqfZG6o8vCl8wwxVfB0beLcxrRKpfwtxpPRPTOClyng7QzrE898BQivZCzaObmSQKFnhVjpyprGrFN16fqjuEwRCyPiyss8IRtgU2VJEsdHd/lwnRgzc+R0otP3Q5E+pytQkZRh6P5sb3zjFL01vYN1DHK2qUkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127568; c=relaxed/simple;
	bh=6XmUQ3cJyqt2R/6p7uLjw39TQ/gdGFhvCF1o3UQ5m+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DRaeZGVC29tcQ+qsNM5f3wLTMA/DWO+XxF9X35HTiL8AvgiprOH4HnLaRaU3qxDq8+ean39CyZAJWbjP4cJXQgSq+rEBN8bKWoBoSzBe0FDtUb8J9j2XHMgcrrq0J9cG/WKoWaaiYyven+Rn0NXoHKW/Pgx6PoSn4chwvzz2yrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkD97GND; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so41078375e9.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727127565; x=1727732365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krA/VuN2cYrLhv9U4hoJfGRz1u+CRYl4Vv/0++F+WjI=;
        b=GkD97GNDBRd1RioJ5TC/or357ad1oBlZSHo4CtN+8VuuXAyFKbYDitO35TNRAfuSxK
         oash2nDUoYyAAsyia4IRUKuTKPgDDORu8Pq1b42QkYDF8WQkrd/E72NL8Mkiy4ZU4Gpm
         4cW8E55gLMpPPw8jsErUM+vlRvL0ZFswOkHYobzsHZc+tEg8B/5DTsdVltDrJLSgT0xU
         jnhGhwgnO/pYpMGj9UYcPaeQt3YcU94SsUKjHFqbe9WTCa4TZPp2vMa17aLr+YI24FFQ
         VQBNgZgDeI9nruBsX6HQ0HcrrowhvSQlbhgRNlVWDv9RRL7F894/0v9o2MWBU+A92rNm
         XcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727127565; x=1727732365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krA/VuN2cYrLhv9U4hoJfGRz1u+CRYl4Vv/0++F+WjI=;
        b=CKPp6oULNJqqVvh0NyIJfbg8MWnCRmtKGjlTfbVq4vI9Vm4SkT+ewBOrkiRhqeGkMl
         r8sMLm85+Emv1oSfITbzf5H8ePNjibs9Ozjm4CouqEeqvRKpExVbkfdDXtZOC//185Op
         eI5yWlp9MvRGVmR5GmD1nEZO2YZXq2DggZsSiimPmtdW9ezSF2rrBPSX3kn38cioJMVo
         EMXVF0bHX83eIpwUnTm9tbCTZ44Grw9cAWEVaNzEbocWZYjlNHZHVT8gPz5X5hQDanZl
         Rj3QTzVJlkIc14N4ceCe9fCrdUpB0n3uglP99XAubwK7hlXxgZVe7X1rWTW9EznwmMep
         85mA==
X-Forwarded-Encrypted: i=1; AJvYcCXtvN+bPuTYjGsjoIEQ1qUIEBGf0Ozvk/KOKEfJ9QKcVZQ7/tQKwZ5Jz4O8xhH6cOUU7gEyrkbAj4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU2KOmcpMqGbMFXhjtNeZbcBSduR/setR/S7OqhSZt15sDCR5C
	1R9msJryiN06pxhDRS3X06KAklviUFEFIZu8sTSkr8M2Qw3IbK9h
X-Google-Smtp-Source: AGHT+IEXztwIWPC5b9/73L8VIjf0qwyiWN7Ej1ieNIbR2wjHjiA2UkvLC0aOis6QVTkPo7Yc9qYKKA==
X-Received: by 2002:a05:600c:1546:b0:42c:de9b:a1b5 with SMTP id 5b1f17b1804b1-42e7adac9f4mr86537935e9.32.1727127564783;
        Mon, 23 Sep 2024 14:39:24 -0700 (PDT)
Received: from [192.168.1.190] (71.red-81-33-253.dynamicip.rima-tde.net. [81.33.253.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75450aa0sm136613455e9.22.2024.09.23.14.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 14:39:24 -0700 (PDT)
Message-ID: <b6e4bd54-198c-4d96-9ceb-86d0e2b4fbea@gmail.com>
Date: Mon, 23 Sep 2024 23:39:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: Fix problem with xhci resume from suspend
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Greg KH
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>
References: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
 <2544903d-26c4-ca4f-b67b-5ef68e7c2e21@omp.ru>
Content-Language: es-ES
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
In-Reply-To: <2544903d-26c4-ca4f-b67b-5ef68e7c2e21@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


El 19/09/2024 a las 21:18, Sergey Shtylyov escribió:
> On 9/19/24 21:42, Jose Alberto Reguero wrote:
>
>> I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD, and other
>> from ASMEDIA. The one from ASMEDIA have problems when resume from suspend, and
>> keep broken until unplug the  power cord. I use this kernel parameter:
>> xhci-hcd.quirks=128 and then it works ok. I make a path to reset only the
>> ASMEDIA xhci.
>>
>>
>> Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
>>
>> ---
>>   drivers/usb/host/xhci-pci.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index dc1e345ab67e..8f075ab63f65 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
> [...]
>> @@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>>   		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>>   		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
>>   
>> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>> +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
>     Hum, please either add 1 more tab here or start the continuation line
> under pdev jn the broken up line. The *if* expression should not blend with
> code in the branch.

I do in the next version.

Thanks for reviewing.

>> +		xhci->quirks |= XHCI_RESET_ON_RESUME;
>> +
>>   	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
>>   		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
> MBR, Sergey
Jose Alberto Reguero

