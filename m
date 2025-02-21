Return-Path: <linux-usb+bounces-20916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA29A3EDE8
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 09:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9784171167
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DF81FAC4D;
	Fri, 21 Feb 2025 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="moMrCCBu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AE45009
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740125326; cv=none; b=a1hOt9eXVZcmK2LRfYbLr/CPn5kNun5g/WTIs7rnNaaBPDX6z33zbnzsR0SPro+5Kprne+qL75YnzOWZrXTz+rlifZatokH9K3gk3zEzB7JCMghlBQYH0rp+MOi9j9erlqgDxshiB+csWTgnUcCORY5ozGOJT7Kuc5BlYyO0A30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740125326; c=relaxed/simple;
	bh=JPY5ktmNlV76ZykCU+vEAr2TlW77ndMIAhpqGi9o4hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECSccUs/MX5r5m6L4wmnwjEca+A3Xi68XGaTdA7dM9bFSarL9oQ8wEavoptCxbMpK6/Q2B4SgkDw81nd/RbWCjSWFp1E5LobiNFmWC3sfnDKbL7O1IYHDQmPm/IBAy/7UjrTNqzvIvD+wBZ6sTiA2+2t0ItXJE3cGDwMXvdUAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=moMrCCBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05B1C4CED6;
	Fri, 21 Feb 2025 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740125326;
	bh=JPY5ktmNlV76ZykCU+vEAr2TlW77ndMIAhpqGi9o4hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moMrCCBuYXKssr3ePAMGZttpl5/NBTRMhfVIUVC0dA2DtHa0EtvH89qZwgTNtWdhX
	 zrz3ZPLttyzY1T06HrRhOUqba/vFa++zp1wFMGA1EAmD9OGJe3QZiBsIpLKZcGGR4f
	 Fgy13bngMLXcxjIKE6l0ZKWk9makutaGO2KjhFpM=
Date: Fri, 21 Feb 2025 09:08:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: use-after-free with Lenovo Ultra Docking Station
Message-ID: <2025022122-corrode-tactless-7789@gregkh>
References: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>
 <2025021853-stained-scared-9e60@gregkh>
 <e17329a8-eb65-4dbe-ae8f-3b68efcf11f5@secunet.com>
 <2025022009-hurricane-amiable-2195@gregkh>
 <4dc90eac-584b-4266-8666-d34b96124722@secunet.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dc90eac-584b-4266-8666-d34b96124722@secunet.com>

On Fri, Feb 21, 2025 at 08:48:52AM +0100, Philipp Leskovitz wrote:
> Hello Greg,
> 
> I can also reproduce it without the proprietary modules. The latest BIOS
> version N2IETA5W is installed. Attached is the log file. Only dm_mod,
> intel_lpss_pci, intel_lpss, pinctrl_cannonlake and pinctrl_intel were still
> loaded. I had also activated kasan.
> 
> Kernel version 6.1 seems to be one of the last versions with which the docking station works well.
> 
> The error doesn't always occur. I stress the device a little bit by
> connecting the notebook to the docking station and disconnecting it again.
> Sometimes I also plug in an external power supply. This combination
> generates the error in less than 10 minutes. I also had the case that the
> device was idle for about 30 minutes. Then it was connected to the docking
> station once and the error occurred.

Your kernel log shows that this is probably a bios bug:

> [  520.107312] pcieport 0000:03:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3a] add_size 200000 add_align 100000
> [  520.107323] pcieport 0000:03:02.0: bridge window [mem 0xa0000000-0xa01fffff 64bit pref]: assigned
> [  520.107601] pci_bus 0000:3a: busn_res: [bus 3a] is released
> [  520.109588] pci_bus 0000:03: busn_res: [bus 03-3a] is released
> [  522.973010] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
> [  522.973048] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
> [  529.409351] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
> [  529.409395] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q27 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
> [  543.303502] usb 1-5: new high-speed USB device number 12 using xhci_hcd
> [  543.340048] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
> [  543.340092] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)

And then later:

> [  647.629519] hub 1-5:1.0: USB hub found
> [  647.630656] hub 1-5:1.0: 5 ports detected
> [  647.656103] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.RP09.PEGP.NVDN], AE_NOT_FOUND (20240827/psargs-332)
> [  647.656140] ACPI Error: Aborting method \_SB.PCI0.LPCB.EC._Q26 due to previous error (AE_NOT_FOUND) (20240827/psparse-529)
> [  647.738644] ==================================================================
> [  647.738648] BUG: KASAN: slab-use-after-free in sysfs_create_link+0x8a/0xc0

Boom.

Now what is odd is that sysfs_create_link is showing a use-after-free,
which it shouldn't, but as your bios is spitting out invalid device
symbols, who knows what confusion the kernel got into with regards to
creating a symlink that was already present.

So maybe go poke the bios vendor to resolve this?

thanks,

greg k-h

