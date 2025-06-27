Return-Path: <linux-usb+bounces-25191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B50AEBDC4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69EE645A05
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4C02E4240;
	Fri, 27 Jun 2025 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK2bKIxj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15103171092
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042930; cv=none; b=IyEZKg2zBD49ZNJ+3/mDauen9/r6Cl9XMZ8kHe+AqsRgHjCOZyYLVu+xcwN8uGDMcteM51N+xI9FXaTBhVQ0S2nW+0AhfkiyXuQMPy3UhVHV8028003XSEIHJO+qTSKJua34Gwy47xWOQPovieVAK7ouIcwiIXTfBcYkLutnY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042930; c=relaxed/simple;
	bh=fBv61eumfAvPyDBJGj3EZCa46rNjZmWh/+gK4tQN+SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTTU0mRsNaHFAbifTu18EP9GtIK9QLGB+q8rKNVRtTyygFsBRPvyFTtWQm2FL1t6I/dvR1Ox78YezLaqQqu/cVbDB0lw2BaMiXRxmFrnwEz8qg9sIwcJIlN9Y9ZtKC6Z7sgZisjZPqzNpejmosNGCrtct1+L1v7LILXTprPY25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK2bKIxj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042929; x=1782578929;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fBv61eumfAvPyDBJGj3EZCa46rNjZmWh/+gK4tQN+SM=;
  b=KK2bKIxjVwAptbmt/uh+OydoYJmUcKwQWlS2lHfBEM5bMdfAzUIsT1Iv
   B2PRoV8GJVtyVdheozeeatC5XYnNk22Yyw0JBQ7otAF1o1FF738RdMiFr
   VgrVDXF3moJcADE9r8EhMsyX98LdhDqE4SYcldW3hsMEc9UPM7g3ZAszb
   JPyrjDPqBksy95zUGJAw+HRIOFrVLm5xo1XL+q+gLbHX3+h478F7u6prq
   VGBaMFCd3lme3cxOn1dOqbcZ03gVzQTRGdFtNHNHUfdKpSdxhsobAG62e
   MguhmJYnf6NtWPKoilktcKs/ksJ0JjKgHOAiWLf6rEUmeBmMwHgi4UXwN
   g==;
X-CSE-ConnectionGUID: hxe0yRFoQ4ey1gbgS8IdCQ==
X-CSE-MsgGUID: iDKR+RF4S4yXFXMVDfygVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52590878"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52590878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:48:48 -0700
X-CSE-ConnectionGUID: JCePC7OJTiC5Tlrne1ArpQ==
X-CSE-MsgGUID: MhJUAJRyQBS5bAkA9wJ7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183887348"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 09:48:46 -0700
Message-ID: <2cd18efe-d51e-4544-ae52-992613804a30@linux.intel.com>
Date: Fri, 27 Jun 2025 19:48:45 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, oneukum@suse.com, konrad.dybcio@oss.qualcomm.com,
 stable@kernel.org
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
 <3f24a333-48d9-4bb6-8180-fc0b8e8a9e43@sirena.org.uk>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <3f24a333-48d9-4bb6-8180-fc0b8e8a9e43@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.6.2025 18.19, Mark Brown wrote:
> On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>> of high tier USB3 devices behind suspended hubs").
> 
> ...
> 
>> Cc: stable@kernel.org
>> Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
> 
> Tested-by: Mark Brown <broonie@kernel.org>
> 
> applied directly on the above commit, I'm happy to also test a rebased
> version.

Thanks for testing, much appreciated.

I just finished the rebase and sent it as RFT PATCH v3

Thanks
Mathias

