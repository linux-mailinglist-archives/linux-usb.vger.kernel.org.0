Return-Path: <linux-usb+bounces-32311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0ED1C3CC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 04:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEBF33014EA8
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 03:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC5330146C;
	Wed, 14 Jan 2026 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="U/VcExNK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229A2F3C30
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 03:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768360858; cv=none; b=gAvkJtt8MoxzfJzpDX/dFpg+EbdtFiHKB3XPhps0bVIxPM+cGtzqobSn5uhIVQOvl0BfUdrgZ1gNFqJRtFoNNvwmwTUGGccf1Z9WxzGkqhgATqaFlihayj5ftWo8R87JEnBv5PSiuVm5O9E255UcA+1EjDT02sxUkdCXBpp48xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768360858; c=relaxed/simple;
	bh=ZAqfmbqHmOrwKHuVdxGgyq2zB7+940DdtjRENOb9d2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4CiPJpxm+t6PjABHak6qLxgfFoZbDWLvldgI/dbzRVWfTV/rEntC/1NdpNNyvLla0np8aW4ZN/yyXMWsXN8TWWirKQs4fycezttfeHCRJYWZvRvYI5S6yNHoJM8vodTM/ojiUvaOTuQuZ0CImQRyXWZPODDu4oUG9jqElRUGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=U/VcExNK; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ba3ffd54dbso1211221385a.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 19:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768360854; x=1768965654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4iPZHKbl8MdY5hLvluvOrXfesCaDcyAvHHbo6IMrf8=;
        b=U/VcExNKBzjJCLMp8EatpDd/bjdpUTNTa29G0Dpr/D4ClAV0dd1FWq26VJR5eIW7iC
         rG9qkfw4JPRnNfIq3KvTxI1YBDoAlEhOq+0eVat4HWl+kl+gpystjJkKR3WMf/rAmX0I
         1x/T6Tlv1PJvUGDyvxB/JVIH9fdeTSKRF5S99k/eGcf5D1JoVHMSiKqyYMkL53TE0nHL
         3ooDWXb2Ts9eOYzqOAf3Zsy0B5TPT57kxAp4vprTVh2IuK3a3XjHRnfE94DmCtcXMcdS
         yAOib/PuHm8mx2wIjY02CHDGvGV3iBaAykvgCk2VXKGFrBOp3rie+mhoBaq5vM5kFve9
         Ut0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768360854; x=1768965654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4iPZHKbl8MdY5hLvluvOrXfesCaDcyAvHHbo6IMrf8=;
        b=eq34J5tBCCxkYpmevlvCMpm4uoqm1MWzklEvUEVP6wD15lAdgfRjyzjk3+NOyyvy0K
         zWLwBtMTUKA80SMmj3tThhNRqA2nXMNl+/1ii7X/hjKxfxZWKtxV0O1EzX0OB2N13Wsr
         9TlyRItaUgB+3TIXhe60XsqPcS0xnK7UKVafglEJHE8ZeoWcsrFrs9qXb68jKKSSpM/P
         YYNiO0jl6QfsruWHzGuMoeXRnOpc8i1Bf6QBTeu/mdgbHDWkKaX/5zoLv7fu0LTc706S
         ij2hDfvD6H2NqyeuDJuqy28PK9nMZwSKRsE4/yZRKoH1jDuMk3723AF/SaprEtOHad7t
         SePg==
X-Gm-Message-State: AOJu0YwBOZmOfd+U/1lnb1CUWMqPIh1DXpTlfO0HN7vr9d+hLHN0no5c
	73SnJTUkhXK352vIeURcld4rIW+rm6/eZbaF6gB28M+zDKimS3kBW8r5c75dfu+H7lZmh4IIl/U
	8huk=
X-Gm-Gg: AY/fxX57T3uZQ7Wxl7Z7p3G99UjjPn5PbkThomV0P75PU9tm0y9Dbmol5EGemwjWZ1+
	3XSZ3PNeiaJONNMU2bKKoRfux653qnlEVQqw6Cy/v7KyHOcmxegt8cCYSL+Lqmwbfl2wE0XexdG
	e30T/ovb/Sa6zWqMdpPi/Tzj69/ne+V0tLKsvRGqWaIU9QsVK2D4aCwAa/7DyJr/esN9TgwWa0F
	hj0XWRwhplP8MPm9VBFYaWpaM6USKXT6nX2zdnlNLzD2R4p4tZzOvM/iGoldjvHy0viNb1rT6za
	P2bu/oI4GmeujEcJth2ZbjfGSf5DdtlJpWC9PrRS/zc5KmJxATTHxeBKIAa5ATqtxuPB2TdE8tX
	CFMI+ATiHWtwanUk9OFNgVl49g4wukZOLNfCjQ7nLqotyhyATDJxUZWqon9nuZTpQNrvZ65+kB2
	xy2afAHjE3CamC
X-Received: by 2002:a05:620a:4153:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c52fb3934cmr204857585a.16.1768360853468;
        Tue, 13 Jan 2026 19:20:53 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a6c678sm78774385a.9.2026.01.13.19.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 19:20:53 -0800 (PST)
Date: Tue, 13 Jan 2026 22:20:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>

On Tue, Jan 13, 2026 at 10:15:59PM +0100, Diederik de Haas wrote:
> I'm now wondering if there's something wrong with the Quartz64-A ...
> I already thought that it took way too long before I got a login prompt.
> 
> In my first attempt I noticed I did NOT have the "Warning! ehci_hcd
> should always be loaded before uhci_hcd and ohci_hcd, not after"
> It took so long I forgot to keep counting, but most of all I forgot the
> dynamic debug command, so I tried again ...
> 
> This time I did the dynamic debug command and the above "Warning!" was
> present. Plugged in the keyboard adapter, started a stopwatch on my
> phone and monitored the ``dmesg -W`` for any changes ...
> 
> It took slightly more then a MINUTE for anything to appear in dmesg :-O
> 
> ```
> root@quartz64a:~# dmesg -W
> [  357.343890] usb usb4: usb wakeup-resume
> [  357.343970] usb usb4: usb auto-resume
> [  357.344023] hub 4-0:1.0: hub_resume
> [  357.344243] usb usb4-port1: status 0501 change 0001
> [  357.446845] hub 4-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [  357.447094] usb usb4-port1: status 0501, change 0000, 480 Mb/s

That's the EHCI controller detecting the new connection.  If this took 
more than a minute to happen then something is wrong with the EHCI 
controller or its associated hardware.  Or possibly with the way the 
computer handles wakeup signals.

> [  357.510889] hub 4-0:1.0: port_wait_reset: err = -16
> [  357.510909] usb usb2: usb wakeup-resume
> [  357.510956] usb usb4-port1: not enabled, trying reset again...
> [  357.510980] usb usb2: usb auto-resume
> [  357.586708] hub 2-0:1.0: hub_resume
> [  357.586936] usb usb2-port1: status 0101 change 0001
> [  357.690841] hub 2-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [  357.691090] usb usb2-port1: status 0101, change 0000, 12 Mb/s
> [  357.714843] usb usb4-port1: not reset yet, waiting 200ms
> [  357.874717] usb 2-1: new full-speed USB device number 2 using ohci-platform

This usb2 stuff is the OHCI controller reacting to the new connection, 
after the connection was switched from the EHCI controller to OHCI.

> [  357.918838] usb usb4-port1: not reset yet, waiting 200ms

These messages aren't supposed to occur.  The EHCI controller is 
supposed to realize that there is no device connected to it any more, 
now that the connection has been switched over to the OHCI controller.

> [  358.082679] usb 2-1: ep0 maxpacket = 32
> [  358.087855] usb 2-1: skipped 1 descriptor after interface
> [  358.087926] usb 2-1: skipped 1 descriptor after interface
> [  358.089798] usb 2-1: default language 0x0409
> [  358.093839] usb 2-1: udev 2, busnum 2, minor = 129
> [  358.093904] usb 2-1: New USB device found, idVendor=1997, idProduct=2433, bcdDevice= 1.06
> [  358.094803] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  358.095481] usb 2-1: Product: mini keyboard
> [  358.095889] usb 2-1: Manufacturer:
> [  358.097629] usb 2-1: usb_probe_device
> [  358.097691] usb 2-1: configuration #1 chosen from 1 choice
> [  358.099335] usb 2-1: adding 2-1:1.0 (config #1, interface 0)
> [  358.100603] usb 2-1: adding 2-1:1.1 (config #1, interface 1)
> [  358.101371] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [  358.126129] usb usb4-port1: not reset yet, waiting 200ms
> [  358.203797] hid: raw HID events driver (C) Jiri Kosina
> [  358.227055] usbhid 2-1:1.0: usb_probe_interface
> [  358.227080] usbhid 2-1:1.0: usb_probe_interface - got id
> [  358.231307] usbhid 2-1:1.1: usb_probe_interface
> [  358.231331] usbhid 2-1:1.1: usb_probe_interface - got id
> [  358.236333] usbcore: registered new interface driver usbhid
> [  358.236850] usbhid: USB HID core driver
> [  358.267050] input:   mini keyboard as /devices/platform/fd8c0000.usb/usb2/2-1/2-1:1.0/0003:1997:2433.0001/input/input2
> [  358.326722] usb usb4-port1: not reset yet, waiting 200ms
> [  358.326992] hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [  358.327125] usb usb4-port1: status 0100, change 0001, 12 Mb/s

And here is where the EHCI controller finally reported that nothing was 
connected.

It certainly looks like the EHCI controller isn't working right.  Just 
as a test, you can try unloading the ehci-hcd module, together with any 
modules depending on it, before you plug in the keyboard adapter.  It 
would be interesting to see if that makes any difference.

Another thing to try is to see if disabling EHCI runtime suspend changes 
anything.  To do this, don't remove any modules.  Instead, before 
plugging in the keyboard adapter, do:

	echo on >/sys/bus/usb/devices/usb4/power/control

Alan Stern

