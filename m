Return-Path: <linux-usb+bounces-29375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D3BE3C75
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 15:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A04189BD07
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B4E33CEAE;
	Thu, 16 Oct 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGh+YBVI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FA33CE94
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622176; cv=none; b=B2dh8AAy+53sn2YZU8mtvt+0tteN6Z5KAmDICZD8uScr0f2dBZcyRV7L0qWc3sJQNx49dY9TJUN4n2h4Ih2wS18AP9i9KHpYMK8Tul0JX1r6wWC25ruR6L0sGJKPyqTROV3ZA6fzAaPJlQw/2N05JsSd0woeB2XegwiqTKnfmHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622176; c=relaxed/simple;
	bh=30It4UMNhZjBdlZVu5fTsxRO5qarAYJYE30aBqJS/oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEMuDMVTUra7RGO7gq/WEzJY5cfslwJTSMuB+lpQ5Jf5GUH2wekz2X+gyq3R3Up+Ul0SXyTP+A9cPYdAcl36rbghPdsLPnttJCmZdoUYHtKN9Qg2j0NeOPbDOap9ZaFcCXdxd6tu4XwctloU/p8TD1xB2M4Z5QQ5RaxYuRXmrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGh+YBVI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760622175; x=1792158175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=30It4UMNhZjBdlZVu5fTsxRO5qarAYJYE30aBqJS/oU=;
  b=bGh+YBVIV/uDbSZVOoDOi65W/y4oivCueSBGFyTZTwLHrnjxJZ0bPPe7
   ymzHEuGSltXqgqf28ncSQNNJVhTYdsmLwEy3lmkpm23yBm2G9KsiYb71H
   XfmF/z/C7XOSfqBSGbmaLziq4D88zM1x1U3wID7CXZzdHst3wRcmEnsKM
   S05PpukG/j7jl4Od4PY578TcFxpR9hgo16ri5kC4Gm8NWexWz2N7jeufV
   WQfuo0BtegnzL4hbw1EJt/2SSDO7HhuutDsuGCg5s+N6tLXNh5ivpO24T
   Br/14kuwuluXVzsmICLhR8l9jYw9H5eadf9sDQ8DkMN3/iyZO99R4oky1
   A==;
X-CSE-ConnectionGUID: ktWXRsktTQWLw3EI89gXGw==
X-CSE-MsgGUID: oaChnp1nTQWOrhT6YcRoFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62722540"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62722540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 06:42:54 -0700
X-CSE-ConnectionGUID: wYxeYWZTRQuEa/JxFzxXow==
X-CSE-MsgGUID: jBzhJ/2+SIiTkKrWNL8T1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="206164825"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.215]) ([10.245.245.215])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 06:42:53 -0700
Message-ID: <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
Date: Thu, 16 Oct 2025 16:42:43 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/25 22:11, Milan Oravec wrote:
> Hello Greg,
> thank you for looking into it.
> 
> On Wed, Oct 15, 2025 at 11:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
>>> Hello, I'm trying to debug some hibernation related problems on my
>>> system, and need a USB DBC to see what is going on after screen off.
>>> I've connected USB debugging cable and got this error:
> > [St okt 15 20:57:24 2025] Linux version 6.17.3 (migo@migoG17) (gcc
> (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
> PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
> [St okt 15 20:57:24 2025] Command line: BOOT_IMAGE=/vmlinuz
> root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=keep,xdbc1
> debug ignore_loglevel sysrq_always_enabled
> force_early_printk sched_verbose ft usbcore.autosuspend=-1
> no_console_suspend hib_compression=lz4
> resume=UUID=54ed98b5-56c0-4ab9-95ea-da1a9322ce49
> [St okt 15 20:57:24 2025] BIOS-provided physical RAM map:
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000000000000-0x000000000009ffff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x00000000000a0000-0x00000000000fffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000000100000-0x0000000009afefff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000009aff000-0x0000000009ffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000000a000000-0x000000000a1fffff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000000a200000-0x000000000a211fff] ACPI NVS
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000000a212000-0x000000008e43dfff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000008e43e000-0x000000009443dfff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009443e000-0x000000009453dfff] ACPI data
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009453e000-0x000000009653dfff] ACPI NVS
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009653e000-0x000000009a5fefff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009a5ff000-0x000000009bffafff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009bffb000-0x000000009cffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000009d7f3000-0x000000009fffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x00000000f0000000-0x00000000f7ffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x00000000fd000000-0x00000000ffffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000100000000-0x0000000837ffffff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000838000000-0x0000000857ffffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x0000000858000000-0x000000085de7ffff] usable
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000085eec0000-0x00000008801fffff] reserved
> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> 0x000000fd00000000-0x000000ffffffffff] reserved
> [St okt 15 20:57:24 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
> [St okt 15 20:57:24 2025] ------------[ cut here ]------------
> [St okt 15 20:57:24 2025] WARNING: CPU: 0 PID: 0 at
> mm/early_ioremap.c:139 __early_ioremap+0xae/0x190

This WARN in __early_ioremap() is triggered when the size is too large

	/*
	 * Mappings have to fit in the FIX_BTMAP area.
	 */
	nrpages = size >> PAGE_SHIFT;
	if (WARN_ON(nrpages > NR_FIX_BTMAPS))
		return NULL;

The size is in this case read from the PCI config space of the second xHCI PCI
controller.

Maybe the controller returns odd BAR Address0 size, or we parse it incorrectly.

what does "lspci -vv -d ::0c03:30" show?

Thanks
Mathias


