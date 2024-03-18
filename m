Return-Path: <linux-usb+bounces-8045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336987EB1F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 15:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35061C2104E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236B74D9E5;
	Mon, 18 Mar 2024 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dut8tEj/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353934BA88
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710772483; cv=none; b=QhF7WuwP/HaPUGPiaKYg9xIfOKMg4j3lGW5E6Fhpt0jrJPWPGFlSVBEjeeOvwvgVYqebdLoJxP3rJ+wl2NAnq9ilwwtX+xMEo9+qr105T3q2OtMJ4YqJ//7ZIghwuCZB4QtPTC8MPptuuNfs0g4RnZ7TT1w+04nmhIdr5qIRYAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710772483; c=relaxed/simple;
	bh=YPd6pbSnyv+ExIdq3eRS6CRZthCKDHzc64hac2nFvSs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=jIoU58pRt/Ve1fPmutloHF+S3Cmvau5O/NLtg7b2QHDqaaDYM/28DdYp9BYDOOEBcSS8RTHnpentM2L9flO14Q2iwCxSQgxn/18N1vY68SPEVQhR8iU5bmc/xK3DKgKvQbtKYtHvD+8enhrSto6zROimZLHM6CChQynjb9OrWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dut8tEj/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710772483; x=1742308483;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=YPd6pbSnyv+ExIdq3eRS6CRZthCKDHzc64hac2nFvSs=;
  b=dut8tEj/RDjLuTFE3shISgmlVJQVfgPERAM51oxIOCTvOz/e++xuVKLL
   Nwmfx8Y9hybqdVCNxk01ONx7QR8vYE+UakD/zZ7gHEm7jcwZZVVKpy2a+
   +Wm2pb/JhjosC9SKmfli6+O//lpz3NwcoMkcgHxLQAvsu4+6/TBGfIuWI
   l8mk6Vkg4cXCKYGeUkuY/nLiJD3W+MC+rLYRouChv2o7ERgMT9mV7w+5e
   dS2TsWEuH04K93iagv6g2Kx+bZBH1dLSm4L4QcH5bBfsITVplUYSAudZ1
   s7TFx3l4L+n+IahEoAGF+PQXEiDfe3/Vl3rmCmJ1k7yCXcI/miw0SMbOR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5716286"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5716286"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 07:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060396"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060396"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2024 07:34:39 -0700
Message-ID: <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
Date: Mon, 18 Mar 2024 16:36:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Aishwarya TCV <aishwarya.tcv@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 Klara Modin <klarasmodin@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
In-Reply-To: <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.3.2024 15.30, Aishwarya TCV wrote:
> 
> 
> On 08/03/2024 11:34, Mathias Nyman wrote:
>> If reading the ACPI _PLD port location object fails, or the port
>> doesn't have a _PLD ACPI object then the *pld pointer will remain
>> uninitialized and oops when freed.
>>
>> The patch that caused this is currently in next, on its way to v6.9.
>> So no need to add this to stable or current 6.8 kernel.
>>
>> Reported-by: Klara Modin <klarasmodin@gmail.com>
>> Closes: https://lore.kernel.org/linux-usb/7e92369a-3197-4883-9988-3c93452704f5@gmail.com/
>> Tested-by: Klara Modin <klarasmodin@gmail.com>
>> Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
> 
> Hi Mathias,
> 
> When booting the kernel against next-master(next-20240318) with Arm64 on
> JUNO using ACPI, the kernel is resulting in boot failures for our CI.
> 
> A bisect identified f3ac348e6e04 ("usb: usb-acpi: Set port connect type
> of not connectable ports correctly") as introducing the failure.
> Bisected it on the tag "next-20240308" at repo
> "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".
> 
> I believe this is the patch to fix the issue. Kindly note that the
> failure is seen on next-master runs from the past week. Any chance that
> you could get this merged into next-master sooner?

Hi

We are already mid merge window.
Not sure if there's some way Greg can still get this in, otherwise I'm
afraid we need wait for rc1, and try to get this into rc2.

Thanks
Mathias


