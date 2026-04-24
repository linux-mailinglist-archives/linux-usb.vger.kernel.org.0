Return-Path: <linux-usb+bounces-36469-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJfYJ1E162nRJwAAu9opvQ
	(envelope-from <linux-usb+bounces-36469-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 11:18:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D345C0A8
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 11:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B30305DF2B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 09:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42F92853EE;
	Fri, 24 Apr 2026 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6tLDcR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85417D6
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022040; cv=none; b=NlMiWjZfYqVTHxpGgdDeI+C4VwhTcscVVxdgQEvlsPR3hx1oFTj6iZWLKRUaljNwDcAh6dzP3Dw8cSZhsyI9s5l2Aa1YNN2HI31vG4lZtYztTNGbgANSi4GmfiL1qK2PIR7T6El2j43jh16Z3vpepndD3j0h8lefqps2c41XiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022040; c=relaxed/simple;
	bh=/x82bhQ3uz+4fs1hd8uBvijMEXqMcHKPWznKfPoTFeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQUe0Al17nUFZM0k8raqF0TQZ2Dhlk7lIu3iqiwj8pP1dVIBN4l9tz4agXbMKYVm/1BARExoyo1SOE4x3wfna60A69KrfiXbX8sSzm6zzFu2YLSjqP6gWdfNoJzMjZPs5Tn3o1hsmSSpd/D/CIXoAfCKe8caX5XOe13RYcPZWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6tLDcR3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777022028; x=1808558028;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/x82bhQ3uz+4fs1hd8uBvijMEXqMcHKPWznKfPoTFeE=;
  b=U6tLDcR3OiB0RDce3S3OaD5W7l/Pp+1rm4vn0Tp3JoJKLPC1GSNCgBj0
   pWUu3icRK0q0KGhlA7BKO4naoqUYHgRhuANu/m6IUzpuyCOxmAp66BQ+I
   dbQPngXurC10VJoAd6Mwvv7ZFJzIVW8fljUUr9tCDITbRprHDvpMAd+sm
   blCmDWavREZtA4s58aENvKWbhrRYtq/0FIV97ojpqOMnv8lpAURSQc3uJ
   DsR7DnJPZK1T5oqoe6mtjPCo+Z7OgLtXFxYhRR9oG1S97d9wRaz1EOeDP
   5UfsZy4SPSixNua0YxmElaFA9lV62FESwu2nIjUAo7Q9kAWsTwDOuwezv
   w==;
X-CSE-ConnectionGUID: qUyebJA1SZCeLXxPezOFDQ==
X-CSE-MsgGUID: i2Ga0cdjS9C3IZ1+O4pdGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81606845"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81606845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:13:48 -0700
X-CSE-ConnectionGUID: NXMEhiO+QZuhmoQ7H+UD+A==
X-CSE-MsgGUID: AGdt6ULxQDG+FSg4x0EC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="231900865"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.79]) ([10.245.245.79])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:13:46 -0700
Message-ID: <bde7e968-e0f6-491c-ad45-3446fdf3a8f0@linux.intel.com>
Date: Fri, 24 Apr 2026 12:13:44 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
References: <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
 <20260422073054.0bd482ba.michal.pecio@gmail.com>
 <e06dcae8-5b8e-4e58-a0cc-1c67e5a08170@linux.intel.com>
 <143b5a40-4ad3-4ec2-b061-bc083635542b@rowland.harvard.edu>
 <557aff2a-5124-4067-8637-6dde703f919b@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <557aff2a-5124-4067-8637-6dde703f919b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AD8D345C0A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36469-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,synopsys.com,vger.kernel.org,suse.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]

On 4/23/26 17:12, Alan Stern wrote:
> On Wed, Apr 22, 2026 at 11:35:42AM -0400, Alan Stern wrote:
>> On Wed, Apr 22, 2026 at 04:51:30PM +0300, Mathias Nyman wrote:
>>> On 4/22/26 08:30, Michal Pecio wrote:
>>>> On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
>>>>> Can you confirm that it's also possible for xhci-hcd to prevent
>>>>> control endpoints from restarting when a transaction error (-EPROTO)
>>>>> occurs?  Up until usb_reset_endpoint() or a new callback?
>>>>
>>>> Doable. They halt like any other and it's SW's choice how to restart.
>>>
>>> Yes, doable.
>>>
>>> Would this be used in cases where all hope is lost and we want to reset the
>>> device, canceling all pending control URBs before restarting the ring,
>>> thus avoiding sending any extra URBs to the device just to wait for
>>> them to fail or timeout?
>>
>> That wasn't my intention.  The purpose was to avoid getting into a tight
>> loop such as in fuzzing tests with dummy-hcd.  When a device is
>> disconnected, if the class driver's completion handler immediately
>> resubmits after a -EPROTO error, and the resubmitted URB immediately
>> fails with -EPROTO status, the resulting loop can use enough of a CPU's
>> time to cause a "CPU hung" error.
>>
>> The same sort of thing can happen with real host controllers, although
>> the loop won't be quite so tight.  But if we prevent resubmitted URBs
>> from failing until the endpoint is reset or restarted, that will slow
>> down the loop a lot.  Especially with a series of increasing delays
>> between the restarts.
> 
> You know, on further thought I'm not sure the benefit is worth the
> effort.  I'll see if the tight-loop problem in dummy-hcd can be fixed by
> changing dummy-hcd.
> 

The tight loop -EPROTO return case is probably not a big issue for xhci
anyway  as both xhci driver and hardware cause some delay before giving back
an URB with EPROTO status.

xHC halts the host side of the control endpoints on transaction errors, and
driver will reset the internal endpoint and move the ring dequeue pointer past
the URB before giving the URB back with -EPROTO status.

-Mathias


