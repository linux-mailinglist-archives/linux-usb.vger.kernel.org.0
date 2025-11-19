Return-Path: <linux-usb+bounces-30731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D7C6FFDF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 17:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F7853C18EC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E6A2EB859;
	Wed, 19 Nov 2025 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="irA5eiIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45AD23D291
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568351; cv=none; b=AAXSMPUVCsoh6PT3FmGSNDYh93eUdSKjH6zJld3peem9tVfLhUF8eTVQQAtEsAKdrFTgOtnVf3YtII94/DeSFp9gciXf+qyu4u62CBC8E9o9Hl14rxMJn9HeWXm6+pZDPBvAMiUkDNWImY9L8qsiuCX/5ssvZF5FkNOqIru3vDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568351; c=relaxed/simple;
	bh=wenwhN98ZXpNaz6rZCAL5i5QRQaS4vWxfU6e5mIcYMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIQwOpbSXleiORLTj02fSATaTj1pSphf5kjq62yESH5uu3gcXAJHdRet6iWWu3MTX8vR1aynz1COZxgiRDAxGOyFDeDOx6TkimiFAha7i2zjQgJaWnuVQ9UpPShlJ3ZQ1hohSl2s7seebf+2HVYhhtkegWyjXsvG5wHot7cSfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=irA5eiIX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so1071352e87.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1763568348; x=1764173148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMO8lUnOLXTM0N/Z+SV1Orex6S9edEOv9ppJaLbbsNM=;
        b=irA5eiIXxd8RIu9jdvCQI/fG6NMMmQknL6V4pbu3lhSM8k1/gOrxnYRG1iraSgb034
         mtyqsNoaUzekOohg3/L+27Hzv9UDRTc1xPJczsDw2NxgUD31TgvE/1gv6/0SNxEg0wo8
         jx1OO76/lfGOUPlBs+RveG6VeK8pTjDnig70/03gioV+jFfTm+nDH7I2Lq3i/h+tdZ3z
         1E8Ec2aFtk5UcRQfSa+a1Rf07lVmNHxgySaAsOFtQRjYlh2ib+LDyrFvUNP1kfQzZwKH
         gsI7ESHX0wOMED+13s2pxxWJ2wuBpGRurHDZqVX8HJEHy/vkXPA+JywflYnB9qthTtps
         1iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568348; x=1764173148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMO8lUnOLXTM0N/Z+SV1Orex6S9edEOv9ppJaLbbsNM=;
        b=qTOlS0nNoZgSTeusKCKbFr2WILyfFjBGox9TlLUfMX9zaywt+EMCrXPQxOjq3l0lSC
         EpJC/2fSYJmezixr0hehOmFNPF2I8owpbAlb5cHHIqviE/QKMAdpDRKEXAmgv23Qw8re
         T0oRl5wX1ZQ7RHx2grEiZ74BI84jG218L6X2HOxvRr3yuoNXqyOgEQ78rtmbJ9SNFyzU
         k3jNf9VhSI8WljLwZtIbh+kyHNYl/v1i8Hg26a+ggiJg8agckhmIKJD6KYZmR5ZYR7G2
         lZEyuwyBScHCiLiY2LDFZCuLwi34/KExLoh23K0xMWjIJI7YP3qj6Lv3oMTeg0BFk0S/
         bG1A==
X-Gm-Message-State: AOJu0Yy+US0/AYBghmY0wjZdzNWjiDOgkmY/uS/cXRg1OMZAIOfCUCfc
	VIoNviFFr6G46sMN3YuS7f4Rm6spZQpdn3S/Lfm4Ye7y79DSDF3+VsO4gcR5PseSXg==
X-Gm-Gg: ASbGncvB2n8FuBVv7qmLmHVyJR5Mul+fX+VInT0JqhKaY36DporpgLVTavXGvmE8g2b
	QD66kDzcf5pFU4CKBk9MpUokHOHgH0TcbixJOSo5QWZPEosW5QEdeNaU5TLWlbCRMhoeu3vSOhv
	2gVvyL32Fv7mbvUviMgilGg1QTr1Rz95DxDOdeYg8GJyxyZm4vP6LHHbSqZsXpQATHsMj4M1iss
	v2sVmxppG4W0maOt4gX7/I0OMDLrR9Vk0ZtkL6BoC+L0gWD8waVXY0p7TkxRcA7YKoppD5FHgQ1
	pyNhNjzwp7zOHKxHW5NcFrCKog+ncS/voR4SGQ5XlAqf67ppd+zhBH1yAvpaFSf5l5RsGfFsO3S
	0DmBNtyB5fTaZ8G4fNnC43jJRCLxM7Mie8aNE0RjEofGL9DPClOuKM5Q4unQGUgtq1GFI5u5b+U
	p1IzRUiTM71rfHuBzrkhgeh9J7WHz8WNapweOENDoJ1KIn41niGStMriefKg1Gx8B1Nv1H1ZcKg
	k594Pn97TdNZuq/UQ==
X-Google-Smtp-Source: AGHT+IGO8bvTQwuSXGK6B7Q7mBqlT8wVti+JeBrsLen44khDLYbnl0mikYadatXpqL/AAFnyLyYKeQ==
X-Received: by 2002:a05:6512:3b0a:b0:594:35d7:731f with SMTP id 2adb3069b0e04-5964b37f939mr1042746e87.7.1763568347992;
        Wed, 19 Nov 2025 08:05:47 -0800 (PST)
Received: from ?IPV6:2001:4643:2b9c:0:ed48:e2f2:7382:e121? ([2001:4643:2b9c:0:ed48:e2f2:7382:e121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040038esm4854096e87.52.2025.11.19.08.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:05:47 -0800 (PST)
Message-ID: <6c6575dc-4522-4b10-ba74-ed6858ff95a3@remarkable.no>
Date: Wed, 19 Nov 2025 17:05:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: udc: Link otg and gadget
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Peter Chen <peter.chen@kernel.org>
References: <20251119152641.49872-1-johan.korsnes@remarkable.no>
 <2025111923-equate-crabbing-39c3@gregkh>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <2025111923-equate-crabbing-39c3@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2025 16:32, Greg Kroah-Hartman wrote:
> On Wed, Nov 19, 2025 at 04:26:41PM +0100, Johan Korsnes wrote:
>> Link OTG with gadget, same as other UDC drivers.
> 
> I do not understand this changelog, sorry.  Can you please expand on it?
> 
> thanks,
> 
> greg k-h

I'll submit a v2 with a proper description. It might also be that this
link between otg and gadget is not appropriate for the ChipIdea driver.

I've (ab)used this link to obtain the gadget state via the usb_phy in
a different driver. Since some of the other UDC drivers set up the link
I just assumed it had been forgotten for the CI one. I'll double check!

Kind regards,
Johan

