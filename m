Return-Path: <linux-usb+bounces-6904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CF85FDED
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 17:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F77B22682
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC351509B5;
	Thu, 22 Feb 2024 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8nzsvZG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAF1B7E6
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708619005; cv=none; b=JkjV5if1Be1HLo2cv+wqkrPSEMGddzjCgcgvPMYhSdzghRj4I7yDANU1WBJ8kYiFSfJXE+gXGrEfthGjuU8O30YFn/MI32+1AhWp+XWr0PeMMV4XxksD+2DljpREwL6nEX7bbkLoxyCPuImg/Jq+mz4xx/rk4rXtNqF+wFXy5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708619005; c=relaxed/simple;
	bh=DJ0u2EiwH9eIxajiI6fa84wSbOU9bvZM23TaXE4UdC0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=sO01BIjaC4Gsb9dBX8/Zemr+HC50eXdB3OEY4kDoef9tEMOSaRckTBrYdx8SdQ9AdEFL8/AeDwXMDEWPIbXGTuLQqWXKHWJIacwP0EzL18t0WLBpE/dM/HnGG12GsQaNMdXT9CQP80GKcPsk00Owsv9zxu27/D6SH1O8cOvLQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8nzsvZG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708619004; x=1740155004;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=DJ0u2EiwH9eIxajiI6fa84wSbOU9bvZM23TaXE4UdC0=;
  b=Y8nzsvZGl2NTxT6me5SzdTocLZx7B8WC0Sy7Ll5VqG4OOKsLwv8JUzrA
   h95PMrmIuQaDCL6QIBHdIrat6jdQyDVkur4BEztN6upfzGGOfmkJ5YMkd
   H94Y3dESjgD1a7gzhhTbT5SKjxCLVSEQAlF98CuQ24GhX3F/XYLTPhr4k
   juo5xwhY3fi4iyqPqxHwAng98NaJLa3H+8jQjOWrEmVdmtYqpsl9MGE84
   Iu0RVv9wIvxvhHIZ3MSBroacoXRMDyz4O2J2sdPG7KokRzgME3dUMdTyT
   o/n/OCTJ7s9bTyYs+9tCX+RK0utLrighbpPhEtysbnif4a4NEtjNSubs1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3006077"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3006077"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936869866"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="936869866"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 08:23:21 -0800
Message-ID: <0c5f5512-d015-c77f-4e1e-281f95c04197@linux.intel.com>
Date: Thu, 22 Feb 2024 18:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
 <2024022238-caddie-fanning-8ab5@gregkh>
 <fc15052f-c5de-0136-484e-c3ac735ae799@linux.intel.com>
 <2024022230-gusty-tactics-34d1@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
In-Reply-To: <2024022230-gusty-tactics-34d1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.2.2024 17.50, Greg KH wrote:
> On Thu, Feb 22, 2024 at 04:46:16PM +0200, Mathias Nyman wrote:
>> On 22.2.2024 16.06, Greg KH wrote:
>>> On Thu, Feb 22, 2024 at 03:38:18PM +0200, Mathias Nyman wrote:
>>>> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
>>>> "not connectable" are not wired to any connector or internal device.
>>>> They only exist inside the host controller.
>>>>
>>>> These ports may not have an ACPI _PLD (Physical Location of Device)
>>>> object.
>>>>
>>>> Rework the code so that _UPC is read even if _PLD does not exist, and
>>>> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
>>>> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
>>>>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> Does patch 2/2 need this?  If so, why isn't it marked for stable?
>>
>> 2/2 alone fixes the real world port peering problem seen.
>>
>> This is something I stumbled upon while debugging that issue.
>> This patch just makes sure we don't skip marking some unused ports as
>> unused due to how we parse ACPI tables.
> 
> Ok, so should patch 1/2 go to usb-next and patch 2/2 go to usb-linus?

That works as well.

Thanks
Mathias


