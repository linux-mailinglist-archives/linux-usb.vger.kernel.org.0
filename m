Return-Path: <linux-usb+bounces-29804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F4C161C6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 18:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094981C2206D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 17:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5923634B40D;
	Tue, 28 Oct 2025 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhQltkfh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22163469F7
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671951; cv=none; b=b08ucRWQCDtM1hbZhJ/NWMDXg7Idom5+BcwmjyjoQ7Fd1mf7zEDFn2GXUugakUuzcCaAh4jiDdVeIMLkmRtWjEx/GLM0uYhqtDadfZ6EyIWyd6puZFAO0LlO4UmhsIDbOKk8XeIWOXzW/618NRw9MRMq62eJOK4XKiSMSUCDFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671951; c=relaxed/simple;
	bh=wKveLsoo+x4e09aXi8rTIitrnLWmZLcULbjFHdEx5Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+Art5nitdWpxrHd/mWKpbzDUiZPEhvnZxAgFYU2i51OdCWZg9DXs8Luv1HApYFonw18wtRd/y83KoAAU7wpzknAScoP1/M0Wm2tf12TP+naCBUDJ3jOPF40q8AK1QIWiXPgyWZHpgfWSGFlKn+VCKqPNrGeTbDIJmdUbtPRHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhQltkfh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761671950; x=1793207950;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wKveLsoo+x4e09aXi8rTIitrnLWmZLcULbjFHdEx5Dc=;
  b=WhQltkfhg+4a3+4h8mxBSH8OjTcbbfkN6E0yFNMPDuKbAcox1GUcHF+L
   PuBm1KL6+IQ6ynz3ShJkzm4wZPbURsGIL1sscWLPxdB+XYaCclXwyuqRJ
   RvBWjPCPcuJYycV8w27B2LgSL4EuxLIJRElSrjmyg1p1fbRawCkt/aPT5
   Dk7QSsOH3ys5moer9RSlZ2OrwHqIy8PFK7kABymZz/HLU/VYef21ais6P
   uOiKjFxT8Z1+TefECxOKYJilTXJ5bWllrxturojhsv1Q8/pUvYSZRHsRm
   yb3JXCW1Ol+cUcGGaixQmPqGWFR/+hWkVXYiKMe48r40nEQOtShHwYffO
   g==;
X-CSE-ConnectionGUID: PlWNIFpETIijXcB1ucH0Jw==
X-CSE-MsgGUID: 746MLNQSSRS87lg5dmyBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67619548"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67619548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:19:06 -0700
X-CSE-ConnectionGUID: V63o3y6uQvWcngsteCXZMw==
X-CSE-MsgGUID: 9CctOO1lQbaPJtDfnwsUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189765325"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.148]) ([10.245.244.148])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:19:05 -0700
Message-ID: <9dc78bbb-b9db-4ab3-8cd9-bac40e0c8653@linux.intel.com>
Date: Tue, 28 Oct 2025 19:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
 <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com>
 <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com>
 <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
 <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 15:29, Milan Oravec wrote:
> Hello Mathias, here is dmesg output after applying additional patch:
> 
> [Ut okt 28 14:07:39 2025] Linux version 6.17.5-dirty (migo@migoG17)
> (gcc (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #59 SMP
> PREEMPT_DYNAMIC Tue Oct 28 11:54:08 CET
>   2025
> [Ut okt 28 14:07:39 2025] Command line: BOOT_IMAGE=/vmlinuz
> root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=keep,xdbc1

> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
> ioremap xhci-dbc with size 0x100000
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
> ioremap with reduced size 0x80000
> [Ut okt 28 14:07:39 2025] ------------[ cut here ]------------
> [Ut okt 28 14:07:39 2025] WARNING: CPU: 0 PID: 0 at
...> [Ut okt 28 14:07:39 2025] ---[ end trace 0000000000000000 ]---
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
> ioremap xhci-dbc with size 0x80000
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
> ioremap with reduced size 0x40000
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
> for DbC capability at offset 0x480
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
> for DbC capability at offset 0x490
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
> for DbC capability at offset 0x4a0
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
> for DbC capability at offset 0x4c0
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
> for DbC capability at offset 0x4e0
> [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: DbC
> capability found at offset 0x4e0
...> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: DCE successfully cleared
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
> xdbc table_dma page
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
> xdbc out_dma page
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> allocated event ring
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> allocated in ring
> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> allocated out ring
> [Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_start: waiting for connection timed out

This is promising, looks like code successfully interacts with hardware.

> [Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_early_setup: Failed to start
> xdbc ret: -110
> [Ut okt 28 14:07:44 2025] xhci_dbc:early_xdbc_setup_hardware: failed
> to setup the connection to host
> [Ut okt 28 14:07:44 2025] Zone ranges:
> [Ut okt 28 14:07:44 2025]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [Ut okt 28 14:07:44 2025]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [Ut okt 28 14:07:44 2025]   Normal   [mem 0x0000000100000000-0x000000085de7ffff]
> [Ut okt 28 14:07:44 2025]   Device   empty
> [Ut okt 28 14:07:44 2025] Movable zone start for each node
> [Ut okt 28 14:07:44 2025] Early memory node ranges
> 
> I've tested cable afterwards:
> 
> echo enable > /sys/devices/pci0000:00/0000:00:08.1/0000:09:00.4/dbc
> 
> [Ut okt 28 14:12:28 2025] xhci_hcd 0000:09:00.4: DbC connected
> [Ut okt 28 14:12:29 2025] xhci_hcd 0000:09:00.4: DbC configured
> 
> so cable is not the problem here...
> 
> Thank you!

your lspci listed four xHCI controllers:

07:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
	(prog-if 30 [XHCI])
	Region 0: Memory at fc600000 (64-bit, non-prefetchable) [size=32K]

09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD]
	Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
	Region 0: Memory at fc300000 (64-bit, non-prefetchable) [size=1M]

09:00.4 USB controller: Advanced Micro Devices, Inc. [AMD]
	Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
	Region 0: Memory at fc200000 (64-bit, non-prefetchable) [size=1M]

0a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD]
         Raphael/Granite Ridge USB 2.0 xHCI (prog-if 30 [XHCI])
         Region 0: Memory at fca00000 (64-bit, non-prefetchable) [size=1M]

Could it be that the cable is connected to xHCI at 09:00.4 while
earlyprintk=keep,xdbc1 refers to different xHCI? possibly the one at 09:00.3?

Does earlyprintk=keep,xdbc2 work? or trying a different usb port?

Thanks
Mathias



