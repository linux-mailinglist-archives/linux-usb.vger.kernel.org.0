Return-Path: <linux-usb+bounces-5732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A5845A70
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 15:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0717E1C28BF4
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 14:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC81E5F46A;
	Thu,  1 Feb 2024 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hMqu7c1h"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84F5D49C
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706798428; cv=none; b=k90Ni4pfNsg9Od/d4fL9DY2Ks0bJsc5bMMG0AtFaO/wKZP0nvlAYKH+BNyCipnkMRJNbiSojYyOmMHgHBEGpSVcUGKEG3M0oKRDrZrKXHpUYeMxwrXaat/OlfuzstntFkpPjWVyL206rVzkQ6Tgp01qek1mcBPHUG92kHJ3jbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706798428; c=relaxed/simple;
	bh=L2AwrH6X/3GWZ4BdT/uE6cqdMRaHgQ+kOLO7+J++EHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8pgHgmMqujOeU1Bd9HM8xCVWIWsblXYZCDhMi/X4sP1rDh9feWioL+zip30o3Ry9ARBqYpKaWYbyZuGsIW94RftJrsIuE7h3HtSESPbJC7cQJak49hfFPbtueq8ZPFLmH4tN7vvMEEJqNcdWxHxK/wpqc1XqQj2E4/Hiy9xGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hMqu7c1h; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=inSDNcBhxDkEX2KZZdDYaa9KNUQCdAnMf42hlHArfCc=; b=hMqu7c1hXB3xEP4QS9seCiZ700
	ZARZ4t1GV6x02wWcIYl2Y5XacnHSrNIwDEz8YirMizrhGgDZecRbEtS/NknYT8yYvGtWBvVHutTJU
	tyUe6HS7eQzJhUXmjOCoRqhfS/LWrP+P870yG9LZB+OONFRwkPd96YABGRdCS8EguQ5n4hTAQ4uAN
	r2EF91CXnZZqt0Cgkb0755gn6GyaDDrSeEuEwkuOOl1M7SCiCYnw3kZJGCcwTvMEjf4lC7PFMTPQI
	Hz3AbKj5dYdeix/TRC5DR67UrS0/4AxooZVgGVQ1SYtzJLF+0900ph3sgaDqLpV8iugHsJQ/BbIBw
	K/nKQDNg==;
Received: from [187.90.178.235] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rVYEU-00CZqB-Do; Thu, 01 Feb 2024 15:40:02 +0100
Message-ID: <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
Date: Thu, 1 Feb 2024 11:39:56 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240201012301.qtp4vr67cwnte5im@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 22:23, Thinh Nguyen wrote:
> [...]
> I just expected this to happen for S4 and not S3. Our test environment
> is different. I guess the "local" clock is turned off for S3. Perhaps we
> should change the trace_clock for one that doesn't stop on suspend. If
> you're using x86 TSC clock, maybe try this next time?
> 
>  # echo x86-tsc > /sys/kernel/debug/tracing/trace_clock
>

Hi Thinh, tried it now in the first test with keyboard connected in host
mode:

            bash-1015    [002] ...1. 852256557544: dwc3_suspend
<-dpm_run_callback
  kworker/u32:19-1099    [004] ...1. 852259924040: dwc3_pci_suspend
<-pci_pm_suspend
  kworker/u32:26-1107    [002] ...1. 853901309968: dwc3_pci_resume
<-dpm_run_callback
            bash-1015    [006] ...1. 853944152544: dwc3_resume
<-dpm_run_callback
            bash-1015    [006] ...1. 853944158900:
dwc3_core_init_for_resume <-dwc3_resume_common

So...did it work?! System was in suspend mode for ~4 min, but how do I
map these TSC timestamps to real time? heh


>> [...]
>> $ dmesg | grep "suspend\|xhci"
>> [227.990149] PM: suspend entry (deep)
>> [228.012255] printk: Suspending console(s) (use no_console_suspend to debug)
>> [228.041056] xhci-hcd xhci-hcd.2.auto: xhci_plat_suspend:
>> device_may_wakeup: 0
> 
> This confirms that the xhci platform device created by dwc3 doesn't
> enable wakeup. This actually inline with what we thought in the
> beginning. But from the discussion and tests you did, we can deduce
> further what had happened now.
> 
> Can you test another scenario. Connect an HID device such as a keyboard
> to the STEAM DECK. Have the DECK run as host. Put it to sleep, check to
> see if the keyboard can remote wakeup the DECK. If remote wakeup doesn't
> work, can you try this in addition to the previous patch?
>

At first, it didn't work - I couldn't wakeup the system from the keyboard.

Then I added the hunk below on top of the previous patch:

        /* Perhaps we need to enable wakeup for xhci->dev? */
        if (dwc->sys_wakeup) {
                device_init_wakeup(&xhci->dev, true);
                device_wakeup_enable(dwc->sysdev);
        }


And..that also didn't work! With or without the patch (+ above hunk),
can't wakeup from keyboard, in S3/deep.

But guess what? Keyboard *does wake* the system in s2idle, with or
without the patch!!! Interesting ...

Notice that all my tests are on top of v6.8-rc2.


> [...] 
> No problem. I'm glad we can debug this without probing into the
> hardward. I'll rework the patch so that it can be submitted. Your
> Tested-by will be very helpful.
> 

Awesome, thanks again! Please CC my email in the final patch and I'll be
glad in testing.
Cheers,


Guilherme

