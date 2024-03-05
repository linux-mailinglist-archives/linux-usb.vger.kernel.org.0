Return-Path: <linux-usb+bounces-7529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76287181C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 09:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1529D1F2249D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34F67F479;
	Tue,  5 Mar 2024 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="JVfEFdPS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A0BF9EB
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626827; cv=none; b=sfuDFhbMj6bPe7N7yV9EajYjsoYExTnqwLuy/bOp4Q+vIbUk2NZJVXdSOQmTqye6jdQmil0hyMg9QoNdXxJdS9iTuxL3Bn3+jT+9UckC4igmm/6n64JaBGGfa75z0GBi0usxLIsbJrjd3ZGN/ONXU1fvFO1HLWxr6Nky+rr1GEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626827; c=relaxed/simple;
	bh=e/15w+mHPSCvhdKQ8QwceDaXPrSNYKAi3RNQElsZfj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grbzuwlmq166DaDxlpTs4BBxxE8D5hcQAJQWuleISE9v1iMbLrN6VZkSK0Mo4IVWLMAjj03ijuAwgyG1JeS2dNUMsVpqO5zbW6/irLTsaBX0neBg09A77Z2kWssR76hMgAXxrEYYYiyQlRR4uR1lUNGphuTU+hCOqsbv4ecev+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=JVfEFdPS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56781070f38so1043134a12.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Mar 2024 00:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1709626824; x=1710231624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8CsUjF7JQbAcdgvYOQzZMP2VzXv092YSfeMTAYcnO4=;
        b=JVfEFdPSUBLSgoQVK9ZPNI1wnUdTv+Rw5A9o/kiatxuFYrSzs8Zf4XHoHKvuP4slWY
         TySY/cTLXCGaM38mYd7vJPY0oRnnWzIIbv0SpETwA+bporhnMSO3Xs2g9mM6nsloXKzK
         XW2fsZRS6/U5n9+xAQdHnFfLIMAkJ6j2LoAN8t16B1uKVcYeWt/xTLl6HKCUDjOPIAn7
         9bay7V9U9FIwCJm7eMMchHSzkx0IghNz2dQmUEruiyaQBQcwx7BxqEktNiefkuL/szep
         Gyx9/r/9xuoAXH0T/VvY1vNyKEivCain7NmwnYrhKyFbrYzfwaOBQl6Oop425MLNdq8o
         j+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626824; x=1710231624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8CsUjF7JQbAcdgvYOQzZMP2VzXv092YSfeMTAYcnO4=;
        b=vS2qNTd4K7mF9xAD7uu9n6jayb8GACCfZFHlcC7sMWslRMq9+3IUCGgE0TPx0slKNO
         vVXFlcuL9QJ74DN6dbgfYve+bFQKgJLuYAiJQKCCVtfb58HFXrHKnnerO7y/3t15DCgI
         aPaiKJQ2gglZdYDe0N2VibnWWEhrYIraMbnRnIkvrEFb1ge7G+QqCEsuoqrTkK4bYYo/
         SWvklVF0kc9/rnBdjOb0zdz+5i16yK1Ym8D+jLuZAw/3MqcHnzdmOhHnsrFGdOx4VbW1
         L5k9YqPRHtErJAM1jf1jKq2aaqAqiYxZnA3/dQnO0iE18CpC7kDF4XPyrPW1eelwccZd
         ZPgw==
X-Forwarded-Encrypted: i=1; AJvYcCUz9FzjlbfyumbbEK2OLhXNV5ka9trjiWb1K0pVoWFfmxrzh7Fe+/SEtdVvv0/bvQwQYq/8eJRAonB+SWH4EC3y56AXomFoKG1Q
X-Gm-Message-State: AOJu0YxvOFRGVqEXD3NvI68/gHNGjVZj0wmkzkSzOE/eQmBL+sLCrSd9
	CCyy4sCcys88FCSjR0VfS+ny4+XX6jbf88u5y8a4NPpRv43oeYmjgDlnqpf8WXPHOcVj3TfdNv1
	HR0M=
X-Google-Smtp-Source: AGHT+IGAzddLrKdouAn1vzKrQnL+AqI69thyT/BpaaQ0bLSgzQww8ZY27ap7ftu6i683+dOO7bzCKQ==
X-Received: by 2002:a17:907:764b:b0:a3f:f8a7:e1f7 with SMTP id kj11-20020a170907764b00b00a3ff8a7e1f7mr1880347ejc.5.1709626823544;
        Tue, 05 Mar 2024 00:20:23 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id tb5-20020a1709078b8500b00a4329670e9csm5725377ejc.126.2024.03.05.00.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:20:23 -0800 (PST)
Message-ID: <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
Date: Tue, 5 Mar 2024 09:20:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan, Greg, everyone,

On 04. 08. 23 21:09, Alan Stern wrote:
> An outstanding syzbot bug report has been traced to a race between the
> routine that reads in the device descriptor for a device being
> reinitialized and the routine that writes the descriptors to a sysfs
> attribute file.  The problem is that reinitializing a device, like
> initializing it for the first time, stores the device descriptor
> directly in the usb_device structure, where it may be accessed
> concurrently as part of sending the descriptors to the sysfs reader.

I have a suspicion that some of these patches (three from the original 
series, plus the "Fix oversight..." one) introduced a regression we see 
with some USB devices in Home Assistant OS (but in mainstream distro as 
well, see below). In particular it's Z-Wave.me UZB stick (0658:0200), 
however roughly at the time of introduction of these patches, we started 
to see a few more reports of issues with USB devices (in general radios 
for IoT protocols), so I can't rule out it's source of more regressions. 
For this particular device, we have most detailed tracing of the issue, 
confirming it also manifests on mainstream distribution (Debian) which 
included these patches in its kernel. Most issue reports come from RPi 3 
but we also got them on amd64, and both on HAOS and Debian.

I'm a layman in terms of the USB stack, so I might be wrong about some 
assumptions, but anyway, the device seemed to always misbehave due to 
poor HW (?) implementation - every time it's plugged into an USB slot, 
the following messages appear:

[ 1134.073005] usb 1-1.4: new full-speed USB device number 12 using dwc_otg
[ 1134.153006] usb 1-1.4: device descriptor read/64, error -32
[ 1134.341003] usb 1-1.4: device descriptor read/64, error -32
[ 1134.529004] usb 1-1.4: new full-speed USB device number 13 using dwc_otg
[ 1134.609063] usb 1-1.4: device descriptor read/64, error -32
[ 1134.797005] usb 1-1.4: device descriptor read/64, error -32
[ 1134.905181] usb 1-1-port4: attempt power cycle

However, kernel versions prior to 6.1.52, or 6.1.73 with these patches 
reverted, were able to recover:

[ 1135.717049] usb 1-1.4: new full-speed USB device number 14 using dwc_otg
[ 1135.741234] usb 1-1.4: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[ 1135.741275] usb 1-1.4: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 1135.743959] cdc_acm 1-1.4:1.0: ttyACM0: USB ACM device

Without these patches reverted, 6.1.73 goes 2 another rounds of device 
descriptor read errors, and ends with:

[ 263.705865] usb 1-1-port4: unable to enumerate USB device

Also it should be noted that it seems that this only happens on USB 2 
ports, on USB 3/SS ports, the descriptor read errors are "protocol 
error" instead of "broken pipe", and the driver recovers (realizing 
this, I am now finally able to reproduce the issue in my environment):

[ 38.244292] usb 2-3: new full-speed USB device number 3 using xhci_hcd
[ 38.372319] usb 2-3: device descriptor read/64, error -71
[ 38.608317] usb 2-3: device descriptor read/64, error -71
[ 38.844287] usb 2-3: new full-speed USB device number 4 using xhci_hcd
[ 38.972317] usb 2-3: device descriptor read/64, error -71
[ 39.208325] usb 2-3: device descriptor read/64, error -71
[ 39.316405] usb usb2-port3: attempt power cycle
[ 39.936295] usb 2-3: new full-speed USB device number 5 using xhci_hcd
[ 39.957228] usb 2-3: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[ 39.957241] usb 2-3: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 39.999591] cdc_acm 2-3:1.0: ttyACM0: USB ACM device
[ 39.999639] usbcore: registered new interface driver cdc_acm
[ 39.999641] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters

This is the gist of the problem, more detailed findings can be found in 
reports by @FredrikFornstad in the GH issue [1], who managed to 
reproduce and pinpoint the likely source of the problem.

Let me know if you need any more details, or if there's something more 
to try, I'll be happy to help with getting this resolved.

Thanks,
Jan


[1] 
https://github.com/home-assistant/operating-system/issues/2995#issuecomment-1973507518

