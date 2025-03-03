Return-Path: <linux-usb+bounces-21262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B617CA4BD5B
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B401A188B52F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AAF1F3BA8;
	Mon,  3 Mar 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="mmP9WUM9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319761F0E28
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999760; cv=none; b=hZpRapuhmAUeHP15cjTHTwIiOLNUffpbYOmoR6a7tGeQqQFmrxK0Vq92YG8FnxWwhiYWAcSq1NjlZpzUXiN39GgL5uMYrXLm5bW9u1Nwdhbx/xz2Bc0yjdGJVStiFSD+4+yAzwZWJkQlgnJKyz/47nNXtG1ghxK9Gbh+XOf5F7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999760; c=relaxed/simple;
	bh=IIWU3Ly/NfAphmYdx8iZny4a4rasFsmq5FPuNGmM9/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV7wABL5m+tQzWNkzrYKk+HlP2iFri9qIxmOmib6oASXndt0Mb/+65tjHubLIskD/tr7d7zuEZZMuW3+qTsc4EBiAB6x1vE6TFTFMeXNOr0d/G6Kz1LKI+aFEyuzM3rZuzkHImqVNTDXQLAu2xZWce5BJCkdRxTc6Z9UlznmY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=mmP9WUM9; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z5wrR1SHPz4qtZ;
	Mon,  3 Mar 2025 06:02:31 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1740999751; bh=IIWU3Ly/NfAphmYdx8iZny4a4rasFsmq5FPuNGmM9/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mmP9WUM9Ur86kGJBgtdZSRnbU1qNGCZwB8GQRdGo8rimmACbikbMsMDK2qIITvToy
	 MnuDDbT2v7gSotRjfdDsG9D4FV5geQdADjTN6X0vd/3Hoa1rbaXlWBuV/FuebKO3Vi
	 fs4Vu8/Zzn8BErsPSwzZ8eVzqoru01ic+crdg33U=
Message-ID: <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
Date: Mon, 3 Mar 2025 03:02:30 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303104618.GP3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/25 02:46, Mika Westerberg wrote:

> Like discussed, let's deal one issue at the time.

Understood, but when my machine keeps locking up after a resume from 
suspend/hibernate under normal use-cases I really need(ed) to get to the 
bottom of things, as it was beginning to interfere with my workflow.

OK, so first:

> 1) Hang/crash during resume when dock + NVMe is disconnected before resume.
> For the first is this now solved if you revert
> 9d573d19547b3fae0c1d4e5fce52bdad3fda3664 ?

Yes, and thank you for that.

> You can "isolate" this to PCIe side completely by doing the steps with the
> commit but don't connect any monitors.

Yeah, that's how I'd started to verify that, as the DP tunnel crashing 
issue was getting in the way of testing.

> If this gets solved by the revert then that's one issue nailed, good.

After several cycles this appears to be the case.
Now I'd like to help you guys figure out what was causing the panics.

> For the second issue, I'm not sure I know the steps but since you mention
> reverting d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation
> asynchronously"), it should trigger pretty much any time you plug in 
> monitor so we can follow different and hopefully simpler steps:
> 
> 1. Boot the system up, nothing connected.
> 2. Connect TBT 4 dock to the system.
> 3. Connect monitor to the TBT 4 dock.
> 
> Expectation: Monitor shows the screen properly.
> Actual result: Blank screen.

Actually, what was happening was connecting a monitor at any time worked 
as expected. The issue was approximately most of the time after a resume 
from suspend/hibernate, if I had an external (DP tunneled) monitor 
connected, I'd get OOPSes in the line mentioned in my first E-mail, 
which appeared from tracing to come from trying to write to a TB 
tunnel(?) which no longer existed; my (totally wild) guess was that some 
race condition between: resuming the machine and reenumerating the 
tunnels, my monitors taking their time coming out of sleep, and 
"something" happening with the async tunnel activation means it was 
hitting an NPE somewhere.

Bottom line is I've done quite a bit of testing with these reverts and 
have yet to get any resume from S/H failures since.

... and as with 9d573d19, I'd like to help fix this underlying issue, as 
maybe there's something unique to my laptop's chipset(?) (as I have 
different docks and monitors at home and when on the road but it happens 
in both scenarios).

-Kenny


