Return-Path: <linux-usb+bounces-31699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345FCD8D00
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 11:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11DCD302D282
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E95352924;
	Tue, 23 Dec 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faiMMrQl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707D357A4B
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484391; cv=none; b=XhOovsOMrMafuYvHnPFUGYzMXdHPTXkP+glIk/3s9DLwPoMGLuabgl84XapIhgB9FthwPdd4RIWsfHsby3bSgd9U+3p2K7fh/eIxk1MveJOgQW3EIZ2vF6Cu+WIjQdEdTN3AQfLba74JdGICKSadgZnIXu+PnWAvuYulCfDl/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484391; c=relaxed/simple;
	bh=5Fkn+5VzU1zCfX7VhROqZyNQ7AQdJvWc0ebzXz0ZRSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORWNHlc+x5fLqra7KNpeu6mWg8HqyXQrqYZiCSZaZ+Cnbl0mt4WdcuPDvhV4euOaU36Di073gcjFOuIvbwEBY/R2G6CJGLHuqitOVm1sW4kuQ7N3Jl0hlwplkBQe2Gc9sViweLSF1PMVvJmBsXJL1zBssIz42eb2qaNhWhDtDvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faiMMrQl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso591281766b.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766484386; x=1767089186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRWnjSr0jciI1Z5HoAfkG1mju3Morov9W5gQzuml8Uw=;
        b=faiMMrQld1T60IJN0TGcyH9Giy49bUZtWs2jBfL0/G3xQ7C1Jm8UDNp5J5A4KjtAtm
         g27nRL8BrnKzF+dBm1IZ4XWKGz6bko4tC2/QVnsGsa5q/H2cYQRiuevPmsOlhzO7Qj45
         54iT89Ha19ekh6ODNmUFM0W0/RWQFxpKzKvi6jsZ08bLNIIpLdgl/RvQK9tqr+xHjYHE
         tf1pHorecdKomp6cIGtsrAxzFNzx+BwWmVqt/12Oj5AM1PWpHKTzJz0ttICKe9BC2jnT
         K0tgmDjBuM6RcHv2tw2aLhTg0EjFy7x9tVQ1lZK35fXT0VPAc/3r+qUX/XPezREf+ldh
         2LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484386; x=1767089186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRWnjSr0jciI1Z5HoAfkG1mju3Morov9W5gQzuml8Uw=;
        b=Zg06eJJi+8MQlB4oWEe932g6Y+GuT1ZqnkqKgU8RrpqLGkLcahWaD+vxNX/q9wCA80
         Ma6Ft1tBbToCEuIGgKJXM93NsOcu7t/eJ5OKo3TDV6fVdTfeZOKcBYhcIkPws5c7FJDj
         EShp6D7P6QNBxm/QJAwiRKEyTpZHWIsp8GSTdvtqOERxSj+GkuOZRX/dRI2f8r2xGyiT
         1qymJJjbrtuJ/TUwFF6qhvCOYC1jztqZm6lStayQyDeDWxPaKAaWRmj7hFbqu+xMGtDW
         qvdn4WGOSG5W6HFvHmJghuaP03QWNX8YzIO09jJ+jXF26cIDfK/IG6REg4VQ7Q0o3oqG
         Gz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVBwy2QMloM62mR/BENeidJTjizW41reTxokVnRufQAhoB2OEu5h3iiiElLLyR8B9NcmwArC8ifWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Hnd4QsFtGSAx9uyrr9m1Z5xD6CiTBAZts3cvRf6cYTWViSKE
	M1gJZNO53TE7WM1gmsqFZYP7e6iMMV9aJ7d9agonn2HxkyyXeCMH/qXs
X-Gm-Gg: AY/fxX7CVQODQPLLmjxe26VGacIAO3BVW/B78//KJxV6Rm8FgMvBxpcK9AeO72z9Rod
	QH56nBimn9ZeRh39TxDZAg9474NWEE9JQg/YGPKO8qmZhxDuaU54yiNzG6X90k6YFpCt+NkH9nQ
	N0DpOAxUZm9YeeNStSN/bzt9F7Cea41EfQ+H+c9iCkQ6Dl47HTgkmmoHRc4BpkGmKIvvfPNEVoi
	ZmYv3mvwuASgxvAZms1FbEjlI7JOGOKbh7kTB0Mf0LfAEpCQyXhI7iajSEgLIoHUHWqf5/bHOGF
	TKOowLRCIAMFAEt2rOcX2V5NtU+xMyMG0Y1vlILTdVySb699lAzKjnA1Ti7G3kH1aECs5jdiU1d
	T3hc2hTWMUqDeLdeiEPNDYoAL195EYAlcXOPU+QfqC+XmVJNGLQxIjkoso96fmcy4hlchnVCDCz
	ojmxD2UQF9DrbJ2A41FYzzH+0=
X-Google-Smtp-Source: AGHT+IFu5veOu4SBeNEymO0Qtwjb4692B+3YWX9WqbFNp2m+8exlv+EKlDBSKlCxA2o28x/YCpJO2A==
X-Received: by 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id a640c23a62f3a-b803719ef9amr1225976066b.38.1766484385871;
        Tue, 23 Dec 2025 02:06:25 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de10dfsm1330374766b.36.2025.12.23.02.06.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Dec 2025 02:06:25 -0800 (PST)
Date: Tue, 23 Dec 2025 11:06:21 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251223110621.2b53f63d.michal.pecio@gmail.com>
In-Reply-To: <e2ec66ae-2516-4030-8bb2-51ed5c8918db@rowland.harvard.edu>
References: <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
	<20251222085543.4d7430d5.michal.pecio@gmail.com>
	<TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
	<20251222174934.4c9b62d2.michal.pecio@gmail.com>
	<38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
	<20251222220349.2d6c1a43.michal.pecio@gmail.com>
	<e2ec66ae-2516-4030-8bb2-51ed5c8918db@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Dec 2025 22:24:35 -0500, Alan Stern wrote:
> > I see that devices recursively call bus_resume() before resuming,
> 
> Are you talking about hcd_bus_resume()?  (There is no function named 
> bus_resume() in usbcore.)  That's the routine in charge of resuming
> root hubs.  The PM core ensures that all of a device's ancestors are
> at full power before the device is resumed, so it would (indirectly)
> call this routine if an entire USB bus was suspended when a resume
> was requested for one of the devices on that bus.

Yes, I mean this function and the bus_resume() method of the HCD,
which the function calls.

> I can't see it being an autoresume in that situation, though.  An 
> autoresume is one that was requested by the device itself -- a wakeup 
> request -- and that can't happen if the HC is suspended.

Indeed, the crashing call stack looks like some driver manually
resuming a USB device.

[ 4021.987702][  T332]  usb_hcd_alloc_bandwidth+0x384/0x3e4
[ 4021.987711][  T332]  usb_set_interface+0x144/0x510
[ 4021.987716][  T332]  usb_reset_and_verify_device+0x248/0x5fc
[ 4021.987723][  T332]  usb_port_resume+0x580/0x700
[ 4021.987730][  T332]  usb_generic_driver_resume+0x24/0x5c
[ 4021.987735][  T332]  usb_resume_both+0x104/0x32c
[ 4021.987740][  T332]  usb_runtime_resume+0x18/0x28
[ 4021.987746][  T332]  __rpm_callback+0x94/0x3d4
[ 4021.987754][  T332]  rpm_resume+0x3f8/0x5fc
[ 4021.987762][  T332]  rpm_resume+0x1fc/0x5fc
[ 4021.987769][  T332]  __pm_runtime_resume+0x4c/0x90
[ 4021.987777][  T332]  usb_autopm_get_interface+0x20/0x4c
[ 4021.987783][  T332]  snd_usb_autoresume+0x68/0x124
[ 4021.987792][  T332]  suspend_resume_store+0x2a0/0x2b4 [dwc3_msm a4b7997a2e35cfe1a4a429762003b34dd4e85076]

Before we got here, we should have attempted an hcd_bus_resume().
If xhci_hcd tracked its HW_ACCESSIBLE state better, that would have
failed and hopefully aborted device resume before it crashed.

> > this fails with -ESHUTDOWN if the flag is unset, which seems to
> > prevent device resume from progressing further and crashing. Is
> > this what is meant to happen in such case?  
> 
> I'm not sure what code in what routine you're talking about.
> However, it's obvious that if the host controller's registers can't
> be accessed then no downstream device resume is going to work.

If HW_ACCESSIBLE isn't set then xhci_bus_resume() returns -ESHUTDOWN.
It always returns zero otherwise.

So in the light of your explanation, the fact that xhci_resume() sets
HW_ACCESSIBLE before actually completing resume and thus allows root
hub resume to pretend to work, is obviously a bug.

> > So I guess it's not happening because xhci_resume() sets this flag
> > right away and then it may drop the lock and start deallocating
> > memory to reset everything. So we can "successfully" complete
> > bus_resume() and allow USB devices to resume while HC resume is
> > still in progress.  
> 
> The root-hub resume (i.e., the ->bus_resume() callback) does not
> occur until after the HC's own resume handler returns.

If PM core is supposed to prevent it then this is getting weird.
If not, then I'm not sure what else can prevent it.

> Is it possible that the HC's resume handler decided that the HC was 
> dead, and so started deallocating stuff, but failed to call 
> usb_hc_died()?  (But note that resume_common() in hcd-pci.c calls 
> usb_hc_died() automatically on the HCD's behalf when a resume fails.)

Hopefully not.

xhci->segment_pool is only modified by xhci_mem_cleanup() and by
xhci_mem_init() if allocation fails. And those functions are only
called at probe time, during HC resume and by hc_driver->stop().

I'm out of ideas without more logs. The xhci HW_ACCESSIBLE bug should
be fixed, but I'm not sure about correct ordering of setting this bit
wrt some calls done by xhci_resume(), so no patch from me.

Regards,
Michal



