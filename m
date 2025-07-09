Return-Path: <linux-usb+bounces-25649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CBAFF41D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 23:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD2461C46A69
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 21:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23904241CBA;
	Wed,  9 Jul 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fh9u1H76"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0380218ADD
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 21:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752097801; cv=none; b=Y2HeBDSj4Sexk8SUUFOFM1d4UVz9uHmCbmaZkN74OFzciO3knB+FRLFNfd0EkLlJQGGPNixrfS4aDaqp5MO8VlreAd9pAjamKxB4QObd7eTnQqjMZLrZvYPkB4sBF7X8WeNttHN5/A9VTMzzDO7mNXZ28HCt4yWFiEAYCmHQIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752097801; c=relaxed/simple;
	bh=wVMcGeoHZCrgdbZAVnW8A/mzNrFrstTuG+OkWrGp95M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz7b8lbPuXypNNzlAmmyvQ9igHaipWrTtmXmEEvux1EXG345o58Pk/sQw+NhpavglfCmkgrs5lQB3cYE/awM8XTfTI4nO4aX6QLn81ei9fJ+PWXVyJ63zB2aHkrARrR/detblBAv92mt0mTXdroHyKqC7t8j+Xy3YRT4scpvzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fh9u1H76; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3e05bb6efe0so3048495ab.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752097799; x=1752702599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ye8jI5SUkhZp8m54N82QdbXH8LCS3sEC88wIB3fk7/g=;
        b=Fh9u1H76yD82p/CXzPlYyZpTycEYLRpNVhOql18KEuYhBMVXqdx6uChiVk0gxQITgr
         3eL3G7EYXMYCCIH7XPFtwl6tkAJTnL2cem3ipqUBC1M0JTs/z/zFe39p1eHJSMzb2zT2
         JV6XVVd9pzqqSWHcz8X/rNg04gEgCyzzzOjwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097799; x=1752702599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye8jI5SUkhZp8m54N82QdbXH8LCS3sEC88wIB3fk7/g=;
        b=opevtLOF7LxNLMd/c19AC8j53Hd6RC5RxRzyCfZdrsg9EqwAWdWAvmWYQ4Aiuy/ICk
         jw0FI63gitR7KEq+0qzkWgbAOfmRzZ8drlWPNEIguI+zfjxNVnFZknmxVNbSKLQZlqE5
         6Zy3ZEPPSvoxbtnkg/wEaTKwVI+/yjElj7r1caR8r5P4FEnoacvTeGAoa0V0sK/2jBCr
         t8bFNY0HiV8IATCzggQspmFEkygNSToJXYdz8z2cNhmHsusQxLtNAc7TMN1jyqEV+qHm
         21oRFi+1rohamlhpOJ7DjsfxyTGgSwhVMCWkop/5cPP4Fk6uFUZvTz7lov7HOgA8lQz9
         TKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBzLbDN3saibb9x5mv8hBqnu2KZAuwXDRLjkwkrzQ4VSXo7JISU1B2sjEL+cLgbHlfSNpg6wTPfEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mhE2ozXCwxkmi1woK2ajxNmRy1+rijXL1E88qc21oG8vXPCI
	d2D1k6FffyS0GhcwffVFHninr/icXouJZID1W4NV3u+SHZlNcIk4o/TFk6tvBmVK6Z8=
X-Gm-Gg: ASbGnctOZf0FCXDCOY6fDLSJ3+YbgAFiql52+vrD1VqKn1TcdOiZpXoM5GFOxR/wMXW
	KRCbO/Ao3nEGmDQTsgrgzEKwIrCnDyH8SoKjTScSPYjseCKQxN0IPDUIbmvqALDXMZ+k3c2gerP
	BdTlQOddSRJlQcpC7gi+all/57IXJv52xOHqNshsFYPzd5HNxIDYPW4+tCMdBvytGdNaqjtR2m9
	NG5pjScuus7ArWsfVOqgvFLe20M18iLH617Y6i2Fp3dggEUtet1PmTjIjsRu2+2JwlBEiBmcaZ/
	syRyRy64fj2Hx2JrIstt8eKuZSHDuisddNFvl8kUim/FVoKZlNmRe77lBz/z3ERO5Mn+zwPP1T7
	2Vt1Ni5+8
X-Google-Smtp-Source: AGHT+IExJzb5UgImbWGO7bs1m5IIzp+2hhTa0ZuTxi/tM2BOJ8CfRGtupr71xlYM3ZWzq9hj2G1RnQ==
X-Received: by 2002:a05:6e02:12ed:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e166ff978cmr45820795ab.1.1752097798666;
        Wed, 09 Jul 2025 14:49:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e2461344besm631625ab.20.2025.07.09.14.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 14:49:58 -0700 (PDT)
Message-ID: <ce96291b-c0b2-41cf-a71c-c13bd8d0f139@linuxfoundation.org>
Date: Wed, 9 Jul 2025 15:49:57 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Zongmin Zhou <min_halo@163.com>, shuah@kernel.org,
 valentina.manea.m@gmail.com, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, zhouzongmin@kylinos.cn,
 Shuah Khan <skhan@linuxfoundation.org>
References: <2025062004-navy-emboss-4743@gregkh>
 <2e0bbc5a-e74a-4fb5-884c-686dbaf99caf@linuxfoundation.org>
 <48ab511e-2847-4daa-98de-a234b8584b78@163.com>
 <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
 <a29703bd-08b7-489b-8fb0-15838a1245ab@163.com>
 <1a13cf53-ffed-4521-917e-9c2856a5e348@linuxfoundation.org>
 <4fc877f0-b55b-4fa3-8df4-2de4ba1ac51b@163.com>
 <2a901b8a-9052-41d9-a70d-76508ebd819b@linuxfoundation.org>
 <4759911b-8c35-4ca9-bc34-09dd41b14582@163.com>
 <2025070949-activist-mammal-b806@gregkh>
 <dd3659dd-7e45-479d-ab65-9f5c1bab26a0@rowland.harvard.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <dd3659dd-7e45-479d-ab65-9f5c1bab26a0@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/25 08:20, Alan Stern wrote:
> On Wed, Jul 09, 2025 at 12:06:57PM +0200, Greg KH wrote:
>> On Wed, Jul 09, 2025 at 05:07:24PM +0800, Zongmin Zhou wrote:
>>>>> In fact, I've experimented with adding PM hooks to the faux bus,
>>>>> and found that faux bus devices then behave identically to platform
>>>>> bus devices during suspend/resume.
>>>>> See the attachment.
>>>>>
>>>>
>>>> Thanks for checking this scenario. No surprises here.
>>> Another part of my purpose in doing this is that the vhci-hcd driver seems
>>> should still retain suspend/resume hooks. Therefore, the faux bus should
>>> add corresponding hooks to allow the driver to call its own pm functions.
>>> Though currently don't know how to fix this problem yet.
>>
>> I have no problem with adding the pm functions to the faux bus, BUT it
>> needs to make sense as to why they would be needed at all as this is not
>> a "real" device or bus that should need to do anything when
>> suspend/resume happens.
> 
> The unique problem faced by vhci-hcd is that the devices it controls
> reside on external computer systems that have a lot of their own state,
> much more than ordinay USB devices have.  Consequently vhci-hcd may need
> to do more work for a PM transition than a normal driver would.
> 
> As an analogy, suppose you're running a program that has an open TCP
> connection to an external server.  If you suspend your computer, it
> won't be able to send the TCP keepalive packets that the server expects,
> and the server will eventually close the connection.  Then when your
> computer resumes, your program may misbehave when it finds its
> connection has spontaneously been closed for no apparent reason.
> 

Right. We have a few too many moving pieces here:

usbipd (user-space)
vhci_hcd and the usb devices it creates

usbip_host, stub driver that proxies between the device
on the server and vhci_client.

PM can be complex and it has to do lot more than it currently
does on both server and client end to support seamlessly.

The current suspend took the approach of refusing suspend
which doesn't work since usb devices underneath hang in
usb_dev_resume(). Looks like this usb device is treated like
a real device bu usb core. Is there a way to have usb core
PM (suspend and resume) handle them as virtual? Would it
help to use "supports_autosuspend" to disable suspend and
resume?

This would solve the hang during usb_dev_resume() problem.

Maybe vhci_hcd isn't a good candidate for faux bus? It appears
we might have a need for a shutdown, suspend at the very least
to be able to support reboot/suspend/resume cases?

The current code doesn't handle suspend/resume correctly when
devices are imported.

thanks,
-- Shuah




