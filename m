Return-Path: <linux-usb+bounces-31969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008FCFB33E
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 23:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98D41303C221
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 22:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ABE274B42;
	Tue,  6 Jan 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZEu2vLbN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D813FEE
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737253; cv=none; b=eDL9rL4HsnRbgdw72NMfMJG9QL97G22xsXEZfhd0UOpDtUT69Ve9YOa+P2Ccg6eMHm56rbI6ih0mRhOJu0AjfmxMJcGfEtzbbh3UP7q2ozyGRmm+K+KiQD4KPrwDx/jANBtc0nlC0yzuUED4KzG08DovbeZ77hZgK7cKoKQ1H78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737253; c=relaxed/simple;
	bh=k9yFdjCy/jVHkwe1y6ekqSsx3cBF/d/4zhfVEpxvJ+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFzVQkwiOqBzsAKtLf3dnX/LL4s06dCfwZUr4wqY2uF6Ovs9L6t021mz5V5qlbQ8WjY8CrZQq64TxrjkUk6SIMV7oYjpkchKoTokaS1F9fHtPVchlg7MtiqY9X8/LOqCQlSJukUWNbzYXfE0vjx8sk4NAhLrA5AabkfzB1UmcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZEu2vLbN; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-455749af2e1so98136b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767737251; x=1768342051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctgVESUh38PtfqrHQrNI2U46ufIoTkhya3EAN3eYJco=;
        b=ZEu2vLbNR8PYfrjZj2R+jLURptTYY0GrRpjqufR+FbEehK/97DXctAo7P2wWD+sGZC
         WeyxGW09QHXxy4iUuRtTgeqXHueMFPOgMqb39vkGdOf9ApOMkC0Grn6p1ERIDvIFN1DJ
         TcTlygGK+qkj8cyrAfVu0BN2dqBGhWFn4wkcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767737251; x=1768342051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctgVESUh38PtfqrHQrNI2U46ufIoTkhya3EAN3eYJco=;
        b=IAmbQ4+7c37cjZns1uuXHGVvMzCiwSLocAESuWb4r6LNEhg3mauUbybDDabk41RBjy
         gxU4I3B0pJk9K0cGlVwTstDZbY4U+4tUKvKj+ILMk9Dtn2jZrktRUYy2kuGG4Qi++7Eu
         p6YvTNK4qr3hUoPCKwUaO5H7ltr2VGq5/SRZ8IUdAD7m1Iljm/d4Ed1Rzv79wafFBK5H
         Bch9+I8KHrnanOS9lVNVoTi2w2PpJ8XJIamaSdC+/k2xZFTcfYCbGQVJHfVV/tF+K91D
         3gu15t4f2gXjIxFRnJ0LHSHsZZK8iUdt0U7mI1KYBYNBhXnNJKCllgyVwjtv/42wTLeL
         SmWQ==
X-Gm-Message-State: AOJu0YzXFz8NwfO3KeRz5T/8Z4NAkGwGFZbTlXF9Z7MB8sQoT8WXVXiU
	aElSTwchMJkzk1t2HxiU9P80ib0MgFDi2EMbK2oqZoBBb/oNxh54kskT5o1vgIm1ftM=
X-Gm-Gg: AY/fxX5TeZbDUKGk0opW8v8E6FrwTvvi5sp4wEXGXfgRBxnBOOXxDr9sJz6qmBRxJcR
	fs/Oiow3PcIzEvUpN/R3q+2Oc17Kmzh6e7VloMckOZL07fSMKsDpNRD8U63ancvRwSFXxsxIzps
	rsbs3HzR7SrdyFpZtzDISAmX7mh85pkfewYdSm73FS5bEF40o8GhjPGYIeL6JVUUgXt4YtjHLqs
	pikmsk3NRGSqO8y/sGnAtSXHdZsWjNONt6ScYsXtNLzOg2Gm3GF43TGT+Ut252mV1LgMfttZRe+
	uPblcEk0hgG/5PnCNnh5lDoDY1HvrP70vimPZ6f/a6OPCch81BXh8u6Xv2HHOC24kQ4CA7cfreV
	NlJuvOKEHEkEBWt3yBKmbeQ3sMnKrjpCPAvcwHViQa9ect+2wXUPhaprvrIuOkOBhh1RAgSnzs0
	EqQBQzecbBSZx4vq6Iv/oTci4=
X-Google-Smtp-Source: AGHT+IHPl/QcPW9EZ/LG7vOpGrRA47pBElzn74mM6bGkUzq4dvnnx36jGhdDsNtuZJ+iplIyl4UyIw==
X-Received: by 2002:a05:6808:c165:b0:450:826e:5df1 with SMTP id 5614622812f47-45a6b82101bmr290609b6e.19.1767737250772;
        Tue, 06 Jan 2026 14:07:30 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2894e0sm1538194b6e.13.2026.01.06.14.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 14:07:30 -0800 (PST)
Message-ID: <7220f3ee-141a-4fb3-b515-c2961ebd77ea@linuxfoundation.org>
Date: Tue, 6 Jan 2026 15:07:29 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usbip: Kernel oops when trying to bind devices from Windows
 client
To: Marco Schuschnig <m.schuster91@googlemail.com>,
 valentina.manea.m@gmail.com, shuah@kernel.org
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 16:13, Marco Schuschnig wrote:
> Hello all,
> 
> I am trying to get usbip working with a Raspberry Pi Zero 2 W
> (Raspberry Pi OS / Debian Trixie, kernel 6.2.47) as host and a Windows
> 10 machine as client (using usbip-win2 0.9.7.3). The device to be
> shared is a "145f:0276 Trust GXT 165 Gaming Mouse".

Are you using vhci_hcd equivalent on Windows and usbip_host on
Linux? This won't work because usbip_host and vhci_hcd have to
be both Linux systems.

> 
> Upon attaching from the Windows machine, the Raspberry Pi
> kernel-oopses pretty much immediately. Sometimes, the Pi locks up hard
> until it is either power-cycled or the watchdog kicks in, sometimes it
> keeps running. In the latter case, when attempting to detach on the
> Windows machine, another kernel oops follows like in the attached
> stacktrace (sec. 158).
> 
> The issue is fully reproducible, the attached stacktrace was produced
> with usbip_debug_flag=0xFFFFFFFF.
> 
> An issue with the hardware can be ruled out, as when using a Raspberry
> Pi 5 as client (same kernel version) the usbip connection works
> flawlessly. 

Yes this is a supported configuration.

Incidentally, when using the Raspberry Pi 5 as host
> together with the Windows 10 machine as client, usbip works just fine.

I am surprised this works. What's the kernel version Raspberry Pi 5?
> I have tested with the same results an USB keyboard and an Android
> smartphone to rule out a misbehaving USB device.
> 
> It might be possible that the culprit is something Windows does to USB
> devices or a bug in the usbip-win2 package, but even if Windows sends
> corrupt USB packets, these should IMHO not lead to a kernel-oops.

The reason is Windows usbip client and Linux host aren't compatible.
We don't test this case and support this case.

thanks,
-- Shuah

