Return-Path: <linux-usb+bounces-31714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56511CDA497
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 19:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BBA302BD01
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 18:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FC4309F00;
	Tue, 23 Dec 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hLIAljoC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C141175D53
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766515067; cv=none; b=E9qrOdU/EXhBxrzkCaO1VF9RGbKY65vK2t06Bk2t6bIVTQI8FZDbtOh5z7Camewme8THVTC6EoPnD37ssfS6NzAikgEPa45MyzRZr5zYlq1Nv/OYqKdO8PeETtfxLB09XXZZfkZqQcyEwkYOc+H20asWjeg7Ujaab31/hUnLyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766515067; c=relaxed/simple;
	bh=TTOegtM71JgL5KsQZSoaynR0pwASUtNB7CZT7kIWu3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mu8keAWkXf8ZpY+ixtVTV/yKTHuE6lNmH19dnzcw2UCrBVwJmohEDvqAAmGh8XIgAwsJC052LQP5KWCRoDJvmQY7uDlISpIg8GxQTs6va7AK0ezoMp+Zs64nd8l1d6Rg7rOEiGPaQ9lVrU9zS1LRgpisS2sDzrfKddEAeQWIO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hLIAljoC; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c0f15e8247so409643585a.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 10:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766515065; x=1767119865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u0j4LAFobnrBxzb5CSmyLVrIzp2PLl+G9PcoqUtHqJw=;
        b=hLIAljoCGWxtw/hT4h287F2oX4st2C2pa/cDM4/1ELeA1dgtHyZaODvOqRudT7/0an
         BJ0OEpJqpA/5y3RFXPpGwI6bJB2FHGIP3EIcA2un9QywKeHyQyU75vrVW2iZNQ0lOuli
         ao1E+DS0Cw/PUrsT7MJXSTu4Za7Y/rqwrQ5jmU6ZhdZ0Fss2w1bfHR+FuGs7E6u2qtUx
         3SOpd9msyLGxv9aTaeHWfVx8n4Yy41aL3KWFKNLKUqP9Ny2DUMgx01aUBepNZ61/OAds
         532GfMikUop3J+krLDrRFqOQ0FqW9Aky41zgGkldziRm6/JZqgTq7FtAjutDgIa+q7Hd
         gfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766515065; x=1767119865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0j4LAFobnrBxzb5CSmyLVrIzp2PLl+G9PcoqUtHqJw=;
        b=jBI9Ym42i1jnw9kwFlgZWpSL2uipCvL6CncIUrw/JpWnQzUncMfBDkzIuh48MWEPfy
         dxAA2SRxruQK993VZ76YVsbFJFTWG2Tuhkpdr0p+U6qwzSTJZzoJV5eKMtRnlhCTWR7B
         Mwi1w47uRa7Qc5rQZRQ6UrBGwca0xIWa9URiSNDAn3Vzt3IU7C7KG26N/WRnNVWKYMTR
         aA+95g+ATnw5bZgT1AV/gbvfJXv13V9K46a2XP2UNW5CZ9b5AQ4FXeZnwGBReSq4/k03
         TjmlzWyjYMxjBd1Y1cq8+XiOJ/qvUEeqKO0D3xqsqW3luHVoRXC8FPMDgwI78W4pfF2n
         BZww==
X-Forwarded-Encrypted: i=1; AJvYcCU1u2EFEw51plnk2XaoQU1bVmijN0CzPDZpf3Gf96umF8q+IkuipRYMMKhVrksDZio3kBQRJm9b3VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHf1lLAXfSUvoTekqAkmifLc7pX9EJdNV0/9ZTVpOzQ7xtJUm/
	/Y/l3qUdmEGSv5QjoWp0pa6Z+/uPYCmKzCalOCOLZmmp8YRM7N+1MGzXeqMYWTxGjQ==
X-Gm-Gg: AY/fxX5bQyMYiLgYbK3JMWQQR2AzMqxLwLDhXkS+udJDtFGjllWYeHDz7XQvGmnD8PN
	rJ04t5/c/7mC9xxaI8qLmGLyRxgUJiUScJV85gmHsC8KVTMRnkW27nXj0lqtiCKBAn0Wp4YObBK
	i6EqAPVEWi4+0WadJvYj3VcUDjBE8E/7eQja3jsOTNW7FsYAmBV/7pM43sT+7nrsMPiNbLLqqs4
	PKtPOyxcgGAyOdHHceHU671WIirxGxv95DbvzyXKzn6Qbsrk1NHbnzGlyin+E4fiBmbRviaF5IQ
	HjWzPXa5iwm49OED1tUbaCCZIcj+uUSHR1+zzJdZB86UU+Z4dq2odMEq3KudLjPI1OUTqmvHLzP
	xu9S2dxGMyl+m9R2bFIElcg4D+OynGIjS2BiYTNLIcqQ1w7wDWH3SpWnODx0SrYjCA2CnINgX6z
	JNb/aSv1N72JsvYU+o7GopwRWc+l/qD1reBg==
X-Google-Smtp-Source: AGHT+IHCUwx67bfeRh6E4YqAHMq7oiVdadkZTreURfl6BYzb74qMXf6HiEQUHoJC0ZR863WZPQg6Ww==
X-Received: by 2002:a05:620a:40cb:b0:893:2ba8:eec8 with SMTP id af79cd13be357-8c08fd18594mr2235025285a.79.1766515064989;
        Tue, 23 Dec 2025 10:37:44 -0800 (PST)
Received: from rowland.harvard.edu ([2600:4040:71c9:4400:6b5c:ec6b:a8b3:3b14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm1132218485a.40.2025.12.23.10.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 10:37:44 -0800 (PST)
Date: Tue, 23 Dec 2025 13:37:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <ce74e3b4-ec01-4d99-9080-41dc15a13977@rowland.harvard.edu>
References: <20251222064252.GA1196800@google.com>
 <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
 <20251222174934.4c9b62d2.michal.pecio@gmail.com>
 <38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
 <20251222220349.2d6c1a43.michal.pecio@gmail.com>
 <e2ec66ae-2516-4030-8bb2-51ed5c8918db@rowland.harvard.edu>
 <20251223110621.2b53f63d.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223110621.2b53f63d.michal.pecio@gmail.com>

On Tue, Dec 23, 2025 at 11:06:21AM +0100, Michal Pecio wrote:
> Indeed, the crashing call stack looks like some driver manually
> resuming a USB device.
> 
> [ 4021.987702][  T332]  usb_hcd_alloc_bandwidth+0x384/0x3e4
> [ 4021.987711][  T332]  usb_set_interface+0x144/0x510
> [ 4021.987716][  T332]  usb_reset_and_verify_device+0x248/0x5fc
> [ 4021.987723][  T332]  usb_port_resume+0x580/0x700
> [ 4021.987730][  T332]  usb_generic_driver_resume+0x24/0x5c
> [ 4021.987735][  T332]  usb_resume_both+0x104/0x32c
> [ 4021.987740][  T332]  usb_runtime_resume+0x18/0x28
> [ 4021.987746][  T332]  __rpm_callback+0x94/0x3d4
> [ 4021.987754][  T332]  rpm_resume+0x3f8/0x5fc
> [ 4021.987762][  T332]  rpm_resume+0x1fc/0x5fc

rpm_resume() is in the PM core.  So this isn't just a USB thing.

> [ 4021.987769][  T332]  __pm_runtime_resume+0x4c/0x90
> [ 4021.987777][  T332]  usb_autopm_get_interface+0x20/0x4c
> [ 4021.987783][  T332]  snd_usb_autoresume+0x68/0x124
> [ 4021.987792][  T332]  suspend_resume_store+0x2a0/0x2b4 [dwc3_msm a4b7997a2e35cfe1a4a429762003b34dd4e85076]
> 
> Before we got here, we should have attempted an hcd_bus_resume().
> If xhci_hcd tracked its HW_ACCESSIBLE state better, that would have
> failed and hopefully aborted device resume before it crashed.

The reason we didn't is because the PM core thought the HC and root hub 
were already at full power.  Possibly because they were resumed before 
the start of the log, or possibly because they were never suspended.

We really need to know what happened leading up to this crash.

> If HW_ACCESSIBLE isn't set then xhci_bus_resume() returns -ESHUTDOWN.
> It always returns zero otherwise.
> 
> So in the light of your explanation, the fact that xhci_resume() sets
> HW_ACCESSIBLE before actually completing resume and thus allows root
> hub resume to pretend to work, is obviously a bug.

No, not really.  The proper time to set HW_ACCESSIBLE is when it becomes 
possible to do I/O to the HC's registers, i.e., when the controller 
changes from D3 to D0 (and maybe a few other things like 
pci_set_master() have been done).  By the time xhci_resume() gets called 
this should already have happened, so setting the flag immediately is 
the right thing for it to do.

> xhci->segment_pool is only modified by xhci_mem_cleanup() and by
> xhci_mem_init() if allocation fails. And those functions are only
> called at probe time, during HC resume and by hc_driver->stop().
> 
> I'm out of ideas without more logs. The xhci HW_ACCESSIBLE bug should
> be fixed, but I'm not sure about correct ordering of setting this bit
> wrt some calls done by xhci_resume(), so no patch from me.

Agreed, we can't do anything without more and better logs.  Adding 
dev_info() lines to the start and end of the various xhci-hcd suspend 
and resume routines, as well as xhci_mem_cleanup() and xhci_mem_init() 
and whatever else you can think of, would be a good start.

Can you write a patch that does this, and can 胡连勤 test it?

Alan Stern

