Return-Path: <linux-usb+bounces-29322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B341BDDB81
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 11:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002EC3A4FD8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 09:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3DC31A7F5;
	Wed, 15 Oct 2025 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Na8hvlOB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4A31C593
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519632; cv=none; b=BobO7OcbzTDB2KTxurueewF4IspWpYDS+F/yFP0X8pxQpafb7cmGdARM5U0jhU/fsS8IG19/kUIZmaJOUTy86nmvWdCGmEdFW/U/fus04MNk8ER2gHSb95NOFAC/oUvSerxazm9DdoLiv64S2Bchmz7AfvgeG5NgXgx435feByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519632; c=relaxed/simple;
	bh=N3GKeA8+s/KJffHg43/De6cLcwWGZCocBgNwYHU2+UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVPoLZsQ+ymT5OPynI02rdCKE7cq8gmHi5RdPnFFelJpRrsxt5UFpqKRz3Ko6Msvv+s8FQnXM3Wk0r0ShJFTdNRVexfQW44T6mk/7YKYuFlr4pBYCR81Ui0UJZstSdhZx+qB1xmw77f1C1BtXquhiE/8XHG+vK60V205+O8ykQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Na8hvlOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8497C116D0;
	Wed, 15 Oct 2025 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760519631;
	bh=N3GKeA8+s/KJffHg43/De6cLcwWGZCocBgNwYHU2+UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na8hvlOBs6vKts616+UzqZxGBETQGAMJ30WRjqQubVWgHl21nqiEiYE5p8X+htll/
	 b2dSfdnaRyhMv59F6TrpC2mklVrJD5Y3xRZdCUD2AapG4LLmoWi0/m7Ha/ZmOmcNYA
	 /j8QtJ0KkIcOjS0NqfLbC7YOp0QiKhyeQ+n9KK5M=
Date: Wed, 15 Oct 2025 11:13:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milan Oravec <migo.oravec@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
Message-ID: <2025101544-galore-sculpture-b243@gregkh>
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>

On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
> Hello, I'm trying to debug some hibernation related problems on my
> system, and need a USB DBC to see what is going on after screen off.
> I've connected USB debugging cable and got this error:
> 
> [    0.000000] Linux version 6.17.2 (migo@migoG17) (gcc (GCC) 15.2.1
> 20250813, GNU ld (GNU Binutils) 2.45.0) #54 SMP PREEMPT_DYNAMIC Sun
> Oct 12 19:07:00 CEST 2025
> [    0.000000] Command line: BOOT_IMAGE=/vmlinuz
> root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=xdbc1,keep
> debug ignore_loglevel sysrq_always_enabled force_early
> _printk sched_verbose ft usbcore.autosuspend=-1 no_console_suspend
> hib_compression=lz4 resume=UUID=54ed98b5-56c0-4ab9-95ea-da1a9322ce49
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afefff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000009aff000-0x0000000009ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a211fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000000a212000-0x000000008e43dfff] usable
> [    0.000000] BIOS-e820: [mem 0x000000008e43e000-0x000000009443dfff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000009443e000-0x000000009453dfff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x000000009453e000-0x000000009653dfff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x000000009653e000-0x000000009a5fefff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000009a5ff000-0x000000009bffafff] usable
> [    0.000000] BIOS-e820: [mem 0x000000009bffb000-0x000000009cffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000009d7f3000-0x000000009fffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000837ffffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000838000000-0x0000000857ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000858000000-0x000000085de7ffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000085eec0000-0x00000008801fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1

What is the exact command line that you are passing into the xdbc
driver?  That seems to be crashing the parsing logic here.

Ah, I see it above, sorry, it is "xdbc1,keep", right?

Do you really have 2 different xhci debug controllers in the system?
You are asking to connect to the second one, what happens if you change
it to just "xdbc,keep"?

Also, how about switching them around:
	"keep,xdbc"
?
In looking at the code, i think order matters.

thanks,

greg k-h

