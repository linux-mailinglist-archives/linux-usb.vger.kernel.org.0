Return-Path: <linux-usb+bounces-5318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F05835726
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jan 2024 18:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B113B21DFF
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jan 2024 17:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6644D381CD;
	Sun, 21 Jan 2024 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BZnriBn5"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F2381AE
	for <linux-usb@vger.kernel.org>; Sun, 21 Jan 2024 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705859314; cv=none; b=XvDMcZCey/0D/z6Dp0Ey23fNbrv/AtvQkNDl90WhbbkMlmNtVH2bAWBjgyjtpnXyRAjYNSjq5QvGwP1NQD9LcuuC8Yz3/IO/t7cMpy01ts6Ia7zipA7X7lmiJETEZJnLO81t5Ue6tkHqirT8TdT8aOqsMYE4fcTU9p8Le0NFXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705859314; c=relaxed/simple;
	bh=wdbOxC626ogdaqVvOSq/VN8vWj3ERX0okjxeCZp7T4Q=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=iaqLX8+Z5+PojXCuW0fI2eJTInaLkJexdeRUfKXRoWIJt9KcpgeODYXK9+X/BHgZlosV/D59UcdGV4bVdHtcJXfYxx5BzdW+5gqocR+zkWFvDZ2XL8yzC4C8++XnWNB0cSectDioWSNK8p+0vo92+sAovgGhE+Itvgg7i+3BaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BZnriBn5; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p5fFhA36O9n6xllCJfu54ySEgkEMlwvzDPw6xTkNd7c=; b=BZnriBn5WO/fWw1usdB7HJMK9C
	hR30zjO4u/n7jDEIrkCV/apEhD6TbphtnHgXcRf/oE2Hg9wUakCcgK3hU1XzrF03/uG5BRHKJJUki
	CpMgvsHeUalpE+0W2dPrxJE1xeryYsfw5IjlBhzh7hSS96QPJguazHWPMBQOUt0XYU9wAKbnxcccv
	DRso6rBj4EEr5+U22J69h7pvlFQfEYq0BFS10vqrY+Ij2WYWoBYQR7ZmERs6PZYMYYxKUmsGbJ3Wa
	QGUy+HXXJXJosYYixU4s/Knd0hxhJpKgoVAc8b0M955u2SsdNMZt+rxWav7Y7Nx1/c/eLWwa5sbKL
	faIGIbiA==;
Received: from [187.34.227.214] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rRbve-008gXT-DK; Sun, 21 Jan 2024 18:48:18 +0100
Content-Type: multipart/mixed; boundary="------------eSuMehQPVLrRQ204TXLMz22f"
Message-ID: <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
Date: Sun, 21 Jan 2024 14:48:11 -0300
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
References: <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>

This is a multi-part message in MIME format.
--------------eSuMehQPVLrRQ204TXLMz22f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2024 21:39, Thinh Nguyen wrote:
> [...]
> That means the disconnection is initiated by the dwc3 driver. This
> should happen when you put the STEAM DECK in suspend while connected to
> the laptop. From your laptop, you should see the DECK is disconnected as
> if the cable is unplugged.
> 
> If that did not happen, can you capture the dwc3 tracepoints to see
> what's wrong?
> 
> You can follow this instruction to capture the tracepoints:
> https://www.kernel.org/doc/html/latest/driver-api/usb/dwc3.html#required-information
> 

Hi Thinh, thanks again for your patience and suggestions!

I've tried my best to determine the state of the USB port from my laptop
PoV when connecting the Deck there, but I was unsuccessful. The Deck
doesn't appear on laptop's lsusb output, and there's nothing on dmesg /
tracing (xhci), dynamic debug or some power interfaces I poked about
that. The way to go, IIUC, it's now trying to measure that directly in
the port, using a multimeter or some HW device for that. I don't have
that, but what I was able to do instead is collecting the traces you
asked, at least heh


So, I did 4 collections, all in the attached tarball.

(1) Right after booting the Steam Deck and enabling the traces [0], I've
changed the mode of dwc3 (in the debugfs) from host to device - results
on {trace,regdump}.1

(2) Plugged the USB cable connecting the Deck to my laptop - results at
{trace,regdump}.2 and as we can see, traces are empty.

(3) Attempt suspending the Deck (by running "echo mem >
/sys/power/state"), it failed as expected - then I've collected results
on {trace,regdump}.3

(4) [bonus] Collected the same results of 3 (after rebooting the Deck)
but running dwc3 with this patch/quirk - it's easy to notice in the
trace, as we can see the extras readl/writel prior to suspend. In this
case, suspend works...and results are on {trace,regdump}.4-PATCHED

Tests were done on kernel 6.7 mainline, no OOT drivers running. Hope it
helps to narrow down the issue, and again, thanks for your help here.

[0]
cd /sys/kernel/tracing/
echo 1 > events/dwc3/enable
echo :mod:dwc3 > set_ftrace_filter
echo :mod:dwc3_pci >> set_ftrace_filter
echo function > current_tracer


>  [...]
> That means to unplug the cable connected to the STEAM DECK. Put the
> STEAM DECK to suspend. Check to see if it stays suspend or it would wake
> up right away.

Oh, this case was tested before and it works fine =)


> Also, in your test, the connected host (the laptop) remained ON at all
> time while the STEAM DECK was tested for suspend right?
> 

Yes, laptop always powered ON!
Cheers,


Guilherme
--------------eSuMehQPVLrRQ204TXLMz22f
Content-Type: application/x-compressed-tar; name="dwc3.dumps.tgz"
Content-Disposition: attachment; filename="dwc3.dumps.tgz"
Content-Transfer-Encoding: base64

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
P/758z//B1fu+HAA8AAA

--------------eSuMehQPVLrRQ204TXLMz22f--

