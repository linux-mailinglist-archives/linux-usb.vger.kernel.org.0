Return-Path: <linux-usb+bounces-25166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA48AEB942
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7C87B5493
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 13:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B3B2D9EF1;
	Fri, 27 Jun 2025 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8EEetg1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7C01552FD
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032300; cv=none; b=s0kwaWQhUpWHzoYY9enE4UgcyV+XEev+Cvhvl2QHDF/RTSZqAWJlXJGTQZxqIcVviAe8U2w7bnhb2Kt2AyAJKIXYLC2iM+5BDwSZGLco1UWpahlgpdqLqBxlTErbZ5micIzYqrTEyB745wuNxhSKWdRknDVbm7NJ6YB3Ad8HeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032300; c=relaxed/simple;
	bh=pW3XQM8eThmORAyMzGWIRDbSua0dUgj6M8UPdQT6Lnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0jF1X9umG5+402qOtYVJBIykSk7gHeJWsBZqC2U86C7QMAzjqdzokJjbtZzkWy6shQ3PSO1O3KH2VAOUW9kOvWAyBjs8qD38gLQGkAWgr/ypc7TWj+ONSc8yqbvr7cSbL3wa0Y6aChwtsLPoC7a/A8aQJUnjTCOPMh5KNh+bDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8EEetg1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751032298; x=1782568298;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pW3XQM8eThmORAyMzGWIRDbSua0dUgj6M8UPdQT6Lnw=;
  b=I8EEetg1M8+VN//Lw5Vcr08kA9Ai9qD+fPjllGSWoIUjJjvo4z7fhLyW
   pL6LSGUCtGDXMPIEtaknW2ZNTOLWZvZymiCnSEofHG6xHe78hUdOzA9ca
   6Vc9oQ1rXL8Qtf72BSCeUN2FErqgvuJO6tZY3Qp1eB7q8JGipiUROph/v
   E6MG+KGijR3JHtObMqEFojHcdNsijHxJgtFtCuaFTm2AIW/yr5CP8inhm
   CRt8vgW8O1HAaXqHUw/j4QuaI94JpaN4mKKfPC2YkBF3a/NDLxaPaMQ76
   ZxKcp3ozEmzioKOsgEcQ5SVOUUppzGS5Pt4I4Y2RMuvFA8ZZ3Wz+rKxw6
   g==;
X-CSE-ConnectionGUID: 7ajbqCpvRRKvkTKoY3MHMA==
X-CSE-MsgGUID: 1xQ4z0ArR1qQClThmty1jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="78783946"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="78783946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:51:37 -0700
X-CSE-ConnectionGUID: 5hgRHM1kTZmJg8/3eu6BSQ==
X-CSE-MsgGUID: eauxWi3bQaamNo8z7xlUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="156859152"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2025 06:51:35 -0700
Message-ID: <50cbe7a8-c103-4922-b06b-d183a37ee08d@linux.intel.com>
Date: Fri, 27 Jun 2025 16:51:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed work
 that tunes runtime pm
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, oneukum@suse.com, konrad.dybcio@oss.qualcomm.com,
 stable@kernel.org
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
 <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
 <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.6.2025 12.58, Mark Brown wrote:
> On Thu, Jun 26, 2025 at 04:01:02PM +0300, Mathias Nyman wrote:
>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>> of high tier USB3 devices behind suspended hubs").
>>
>> This delayed work needs be flushed if system suspends, or hub needs to
>> be quiesced for other reasons right after resume. Not flushing it
>> triggered issues on QC SC8280XP CRD board during suspend/resume testing.
>>
>> Fix it by flushing the delayed resume work in hub_quiesce()
> 
> I'm seeing NFS boot failures on the Raspberry Pi 3B+ in pending-fixes
> which bisect to this commit.  The networking fails to come up so the
> rootfs can't be mounted, the ethernet on these boards is USB based.
> 
> Full log:
> 
>     https://lava.sirena.org.uk/scheduler/job/1516948#L1142
> 

Thanks for the report

The Raspberry Pi 3B+ doesn't have USB3 ports, so it should not be due
to pending post resume work.

The same hub->init_work is however used for other purposes as well, it
could be that we end up flushing some other work.

If I write a v2 patch that puts this post resume work into its own
dedicated work item, and only flushes that, could you try it out
on the Raspberry Pi 3B+

Same with the QC SC8280XP CRD board, would be grateful if Konrad could
try out a version 2.

Thanks
Mathias

