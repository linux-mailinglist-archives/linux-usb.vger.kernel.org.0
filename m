Return-Path: <linux-usb+bounces-33053-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fmFPL+6Xgmm6WgMAu9opvQ
	(envelope-from <linux-usb+bounces-33053-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 01:50:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA4E01F8
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 01:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C51303AF17
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 00:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CC8221DAD;
	Wed,  4 Feb 2026 00:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dySEbZv4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920C1397;
	Wed,  4 Feb 2026 00:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166245; cv=none; b=HCycH7AapBhsZ8WDms7ofYfZCNf0rwKsEjIaCK/tTFjf9YIbb7VekWfoj6VKs8nKFrVWSU3SMrZRVSHvrvfsQ2Ng7MpZD7czCWQJ66ZGbtlC5gy76S1BNfaJBPDPLyQGc9WudoCO8nG0Pg2SlruX0EFqlBIK8CJZ5s4cVQdtFlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166245; c=relaxed/simple;
	bh=vsircE2807ZNyKViNWjtUIVpwQx5UBwTcYOXHbWoNY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwIS3MCURh7fAEhfMBwsXuaz6dCUmysD2cVGZ8uCbxfCmRo8BnHE4qOlyCnD0MQIuKCLZLNPyKL1h7pEfGalabrUjuT9uXV6BwsY/MsfJMBCOK94k96VNHDTanXg05cjDtSy0kKFEF1GqDH/TumhR4nTieFMpyX5LWA+WoCcYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dySEbZv4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770166242; x=1801702242;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vsircE2807ZNyKViNWjtUIVpwQx5UBwTcYOXHbWoNY0=;
  b=dySEbZv4NohOvtQE6QpUoYw2j8InSFO0ZWuP5WGoTyUmXvig18MZWtBQ
   4rhYpzT8Krq5fFmcheHMo7nsaZ04tbVoENfisJgn3VkWQAQ2QH3hOLttb
   eYPYrJQY+PHdtQtMmip87K4p6T6eKgGiK1sxT23mKnVkUpkRuvqNCkyxJ
   jJ6s0Wo/V4bPg04UX891ZZqrS+1eNrODF1nQWccXh5+r3WHIMgQU5jhyR
   sHRI1ydyk6sXFWQPNmJKisN7IC0JJyR5te0PX4k2Sx67lxPEHUoUwcfH1
   N4wWMNUmHxAAqhRkNYwwzJ0OHbbsdLEfxYPjlgCQI1PQsibjwdg0lqemZ
   w==;
X-CSE-ConnectionGUID: 9sAp9/f9Si6vXCZCFdrnPw==
X-CSE-MsgGUID: qDNdNq0pSJqVjThQCwU4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70548558"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="70548558"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:50:42 -0800
X-CSE-ConnectionGUID: CR304B8cQ1up0ZjXPmr2AA==
X-CSE-MsgGUID: CTOWE8g4R1+QHWyRm7d9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210040742"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.193.43]) ([10.121.193.43])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:50:41 -0800
Message-ID: <0819af50-d19c-4169-b3be-74cde9388802@linux.intel.com>
Date: Tue, 3 Feb 2026 16:50:28 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: Kenneth Crudup <kenny@panix.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <superm1@kernel.org>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
 <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
 <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
 <e821e8a1-8256-4f80-ab30-95f066d25946@panix.com>
 <54d7e199-0887-4129-8743-dce13cc5d60a@linux.intel.com>
 <9976ae02-f48e-4727-9d48-54daac0e2a45@panix.com>
 <31ec74be-13b6-4d74-8643-6bd68659299b@panix.com>
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <31ec74be-13b6-4d74-8643-6bd68659299b@panix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-33053-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56DA4E01F8
X-Rspamd-Action: no action

Hi Kenny,

On Thu, Jan 29, 2026 at 05:42:43PM -0800, Kenneth Crudup wrote:
> 
> BTW, I had no TB connectivity until I'd unplugged/replugged.
> 
> -Kenny

Thanks for testing the patch series!

To help diagnose the warning/issue, can you share your TB dock/setup
information and the steps that you are following? Also it would be
helpful if you can provide logs with dynamic debugging enabled for
thunderbolt. I am not able to reproduce the issue at my end, so the
above information would be really helpful to look into the issue while
I continue checking on my end. From the warning it appears that the tunnels
are invalid from the stack trace in the logs.

> 
> On 1/29/26 17:39, Kenneth Crudup wrote:
>>
>>>> The issue I'm trying to chase down (and not sure if any of this will
>>>> help with this, I wonder if it's really BIOS/EC related) is often times
>>>> that after a suspend (or hibernate, but I use "suspend then hibernate",
>>>> which I think does both and chooses which to use upon resume) and then
>>>> connect to a different dock (or setup) from the one I'd suspended with,
>>>> sometimes I have to unplug/replug my TB cable, otherwise I either get no
>>>> recognition of my new display setup (and sometimes TB devices) or it'll
>>>> try and use the same monitor resolution of the previously-connected
>>>> monitor (as if the TB subsystem doesn't recognize things have changed).
>>
>> On 1/29/26 15:13, Katiyar, Pooja wrote:
>>
>>> Below is the patch series that addresses mentioned issue. There are two
>>> patches in this series. The series takes care of releasing the DP resources
>>> as part of freeze call before the hibernation image is created. You can test
>>> it for your issues and let us know if it helps.
>>>
>>> Please note that these changes are still under internal review and are
>>> subject to change.
>>
>> I tested this against Linus' master (4d310797262) and while the jury is still out on my issue (a few tests against different monitors looked good, the big test is when I get back home later), I did see this on the 3rd resume from hibernate (full dmesg attached):
>>
>> ----

Thanks and Regards,
Pooja


