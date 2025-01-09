Return-Path: <linux-usb+bounces-19178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26638A082E6
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 23:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5378E3A8A54
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 22:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445BA205E05;
	Thu,  9 Jan 2025 22:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ1+ymPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADD20469D
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 22:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462659; cv=none; b=S6EUgXxgwSxFf/k2oyt+PDsnkZr0wYy1CI5j7A/MrwdezR+OvvKcMcBtA4ui07mcHHzPKREOj0UQu9UEiyblx6ZZyeSAK/ju5SOqWGwkEnfr9doVdSSZx9GodMW2L6ekakQH3ppcAF+nDTqiDdlQB6gMDhShk/SoH/QDDKXInXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462659; c=relaxed/simple;
	bh=AIvYBo52dFoBas2P/YjdRD3fPRbh76olfULNcNjFsbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qceQRFb0wNyT+uvBoynfN1tynMhDqViREbUPez5nVd9bG0f8ssBcdodtLfo+eAEswPTfBjkthHhm2mgFGLI+59teWFAl0CMLywyAU6n3ilcfpXGf5Ob2AA7bVHaChPYeFmq3ByvkagzEKeLUOT2IFCbpdNj+Ssek13N0crC4Vvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ1+ymPT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso247838066b.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 14:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736462656; x=1737067456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2jaIn2DwzAc0itUUXiW+Znj2UpIm1Nt/JKI56s4SIE=;
        b=MJ1+ymPTkANbaHo9VpGicfdwVDLoMsCjNnB60Rtzs4E9dn0M1djE36M/HLNiR2Kk+8
         N0UL3tvw+IqJ7OUShm6rTSVlHPzUmQUv2EINAYNwfW22WvpGS42eikYAKawbepr4Shnm
         cfWhzu7YRrL2TwaqgxzytwZMsL16RXS8wZL5IYr1Uf5pcyNibjMntXTUHVB6rOxjeWk+
         m6UcQgrSv9izT2SCYMUGY3IqE5FWTlMqCw/fA1JNcYM/83ajttVYrKlIullvyl56ayZd
         ibSmo2pZuKjwC26RSIXYmuokf2KoOv9g5/rN22ZkvyG9l+wylSdbGVJLFWfs4Bxk36QR
         VHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736462656; x=1737067456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2jaIn2DwzAc0itUUXiW+Znj2UpIm1Nt/JKI56s4SIE=;
        b=rUMgYkraRhAJsv0HjnmPoY+9CgHQWCjnbzejvAi+IPHfukXXk66zlX0p4bMtGbLHKf
         BjNvtM0wym3vQ0vCZ69mIXn9ngBCqWK69M+0d5HJcZVuAFI7KJPHAawHe5yUcPowUfBc
         DRJghPj8ge+uOX75Lun01Jjl8IHfzt7oSYoM6M1cxvWAc/ZZnBIlB3HVX+RgY/XYHe2O
         FGfJx0ThOIAb81oYR1EBYSAEqsNWy5vG2lv95ZMvi2dgVa8RfKIQzrabB/xS2ZdI9LU9
         lMz3NFGa8LIUhwcQayYMlaAWaihdLpi1I2qO/xRO5egqiPpsp3gr3lvKh+WahYSDtYUw
         yfiQ==
X-Gm-Message-State: AOJu0YxvB1c3KDkFVBaGvgDMS53cDmxaS20lgQl76gu9ZoEeBH41O00o
	tj69vJmN6711oLRethXtTr5n3lhldgHbDRP8qks1q2RgkYquhSZ8
X-Gm-Gg: ASbGnct8Arvfh2tCUHAk2GfS2WCDU/WqMoB3tEy4lyuGSFeRg8ifXGg3Y4OGRTbCgTM
	BIHfEvqKKyEho1OBZKdBXI1QB5FLJRkrxvmShxVcxN5YhJq9clkjNArgodns5XqkymjYEJNXDrg
	j2+SuU7h6Jz+XOB3dTjzpbYl2r3s5uSHlnRMOQCsV7iAuuJNv8bdmeQ82b4nwGRCyLEGPFVuFEn
	f8TBQmPw/1KkVMXyxRU+wrexjwBIf2UFmULk2ae06VrqATLrumz05OK74Jax8z/
X-Google-Smtp-Source: AGHT+IFbZuBbuVNV0eu+PBj0jVwpmwNepyB4vnQ2kZZW/svrE8kHOT2L63qNdO7YqtcMpse25Pu3sw==
X-Received: by 2002:a17:907:d03:b0:aa6:730c:acb with SMTP id a640c23a62f3a-ab2ab16a3bamr757285966b.8.1736462656153;
        Thu, 09 Jan 2025 14:44:16 -0800 (PST)
Received: from [192.168.0.50] ([79.119.240.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9646bf9sm110605566b.175.2025.01.09.14.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 14:44:15 -0800 (PST)
Message-ID: <8270ca72-a08e-41dd-8daf-d4e00be3d279@gmail.com>
Date: Fri, 10 Jan 2025 00:44:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MT7601U with on-board storage reports incorrect capacity
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <060301fe-17e2-4061-bb01-f5660b5d10a3@gmail.com>
 <2be45061-034f-4cbb-8ed1-f028bbb35936@rowland.harvard.edu>
 <c1a60120-ed18-4793-a7ba-a119e048ab2b@gmail.com>
 <c0194169-0406-4450-908f-8537c464d122@rowland.harvard.edu>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <c0194169-0406-4450-908f-8537c464d122@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2025 21:38, Alan Stern wrote:
> On Thu, Jan 09, 2025 at 08:57:29PM +0200, Bitterblue Smith wrote:
>> On 09/01/2025 17:34, Alan Stern wrote:
>>> On Thu, Jan 09, 2025 at 04:02:58PM +0200, Bitterblue Smith wrote:
>>>> Hi,
>>>>
>>>> I have this wifi device with on-board storage for the Windows driver:
>>>>
>>>> New USB device found, idVendor=148f, idProduct=2878, bcdDevice= 0.01
>>>>
>>>> After switching to wifi mode, we can see it's a MT7601U:
>>>>
>>>> New USB device found, idVendor=148f, idProduct=7601, bcdDevice= 0.00
>>>>
>>>> The problem with this one is that it can't be mounted, nothing happens
>>>> for a long time. I'm testing with kernel 6.12.8-arch1-1 but it's been
>>>> like this for at least two years. 
>>>>
>>>> The problem seems to be that reading from the "end" of the device
>>>> takes 17 seconds. I assume the reason for that is the fake capacity:
> 
>>>> How can this be fixed?
> 
>>> Probably your best approach is to tell usb-storage to ignore the device 
>>> completely.  You can do this with a suitable module parameter for the 
>>> usb-storage driver.  For example, add:
>>>
>>> 	usb-storage.quirks=148f:7601:i
>>>
>>> on the kernel's boot command line (or put a similar entry in an 
>>> /etc/modprobe.d/*.conf file if usb-storage is a loadable kernel module 
>>> on your system).  Of course, then you wouldn't be able to mount the 
>>> device or access the Windows driver files on it, but I imagine you don't 
>>> care about them very much while you're running Linux.
> 
>> Haha, so it's hopeless. Thank you for the detailed explanation.
> 
> Not hopeless at	all.  The module parameter approach really should work,	
> at least to the	extent of getting rid of those annoying	17-second-long 
> waits.
> 
> Alan Stern

But it's fine. usb_modeswitch switches it right away.

