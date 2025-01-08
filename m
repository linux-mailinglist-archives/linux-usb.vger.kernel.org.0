Return-Path: <linux-usb+bounces-19140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA5A05CBF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 14:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 637931889506
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 13:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06F71FBCB9;
	Wed,  8 Jan 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAeEnwPs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA81FBC90
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342894; cv=none; b=LfqiwX007aw3VNc9HHKJJchbMx4opnReDQ/mvRSzKMTjr8AFIY2j7a7HurilMmJupnJ3R1Cz4sPHxyJTGT2RqfUAoXj+ntPlKwDPMZ0lD4mBukPoDhJbGTH4I+LyNDXwGUigWn2AG5vYuDeupjILzJQZhKPvyzLPKmW4gJA/Ojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342894; c=relaxed/simple;
	bh=IfAicKvmiIqpYIo0N9HIguR7CFrSIPXdKECW+m+CMYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzxQf1K0CwyNFIX8c1qvqv04FlP1HpKMjSi6eQTdzZ3oBGK+h2EEJlqg0K4NJ6FYxkKStbRG0pRMk8k0/wjyhkStbMeQ5m7Oh0lWl+9DVaBEnyp2e28E+kFdC+h+zgWbXrlbDcSve60VfxNcHjn4iCWmVPWUWzNxGI6F3TPlggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAeEnwPs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736342892; x=1767878892;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IfAicKvmiIqpYIo0N9HIguR7CFrSIPXdKECW+m+CMYc=;
  b=FAeEnwPsHHofBUYjqEAn5VOSpNp9uBBf4ipkwL0EvueuUcP/ptUFTzMv
   Wb6d5TZK/zPuY/q2bXNRcYNuUVCeHLUDiWSFptHVuNaTdChnX060Blh6r
   vLEq/D2ACmAtk9ZaTBp6SgYmcVWaSDi0tzXV4b5HaqL747KEdXgoZlBJ2
   GlKuiP4NGxJp42kqb13/UGjMtDcvrIynvEKpJOgE+IqU9wX8Yqz31VZ25
   50BPyhbrjaIQQTlvN0NFazbxubOtjXhZ7wYF01zZ4ETU1LPxSocNaUenI
   l9H/7Sej3WroW8nssDjEE/rxf1mas88qCgJVtNs0zif2Ucl4S97siuERe
   Q==;
X-CSE-ConnectionGUID: KnagkUP1TXeRmoJbuylb0g==
X-CSE-MsgGUID: jZC04/8nREm5epwm4WBZuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36728129"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36728129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:28:11 -0800
X-CSE-ConnectionGUID: GmyGYPbFT9uOwQb66eIkqA==
X-CSE-MsgGUID: ZyyeDDCKR4eUXiL+ArRu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103581709"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.102.28]) ([10.245.102.28])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:28:10 -0800
Message-ID: <7245189f-87bc-424a-bac0-0ef4ba154e7b@linux.intel.com>
Date: Wed, 8 Jan 2025 15:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding 5adc1cc038f4 ("usb: xhci: address off-by-one
 in xhci_num_trbs_free()")
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
References: <cdf7cc9d-48a9-4b00-8e6e-ddbfdbbdb47d@suse.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <cdf7cc9d-48a9-4b00-8e6e-ddbfdbbdb47d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/01/2025 13.17, Oliver Neukum wrote:
> Hi,
> 
> I was wondering whether this patch should go
> into the stable tree. As far as I can see the issue
> it fixes is old. What do you think?
> 
>     Regards
>         Oliver
> 
> 

Hi Oliver,

My patch does not change any functionality. The extra loop was never
executed, and the function's return value remains unchanged [1].
I addressed this issue primarily for the benefit of developers.
While the function is straightforward, the extra loop is not.
Identifying its redundancy wastes time.

Since the patch does not fix a bug, it was not added to the stable tree.


[1], The first 'if' statement in the do-while loop will always trigger,
before the loop can terminate. Because a ring always has a Dequeue and
Enqueue pointer; they are integral to the core functionality of a ring.

Best Regards,
Niklas Neronin

