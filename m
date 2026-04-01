Return-Path: <linux-usb+bounces-35794-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOlmNtc3zWmxawYAu9opvQ
	(envelope-from <linux-usb+bounces-35794-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 17:20:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C037CED8
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 17:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76425316E0D3
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 14:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25442361DD4;
	Wed,  1 Apr 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyR2WfO2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B540F8DE;
	Wed,  1 Apr 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054881; cv=none; b=IEE1fQLxN6b6UH0Wb8k2YnwPlUm63WZIxCVxzOizF7wjsIXRSGL7xhUIFzd2EATbbD0yXUqeLpz1v8ospnCbCIu7gYNOMXmUAUTcDufdYXXVlX4zH7fJYLjN+/rjv/1SLxCpJKggPSVrt7Gmn/MmnaW0HuIQCl5OVFgy+nrWRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054881; c=relaxed/simple;
	bh=0Ny0N1xj0M6XzhxozbC2k7qxmaTwUj5U300NbYnX5MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAbY8ivMTzRHhuDAJfu5iq5+SRP/78Vl0f3+6BgNvNfJI6N+UTq+aSc2U5c/8wXKWXRllfkQjCFUNfnjJOE3cBFQbi9ldP6mxTHCw+13sfwxQYfbdOGh6TaUwRMKzyU4+Y7GlXj2eKUvSFBUZ+CjEpqIpTZ29FyYS9y+9YbK5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyR2WfO2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775054880; x=1806590880;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0Ny0N1xj0M6XzhxozbC2k7qxmaTwUj5U300NbYnX5MA=;
  b=KyR2WfO2UUDozIe6abBuq6/QjWkyKnOmMGyIv+e11JTm0q8qsdoEhbHX
   fcX6oz8wPc7BWVdSZNLEZpQD30kF8pQTpleQckmw3NX/d1Ky6/uFwJvZU
   qYeSViPPUxjfQxQAoJYoqst/5gd0G/0+Udj62J0HxJCcJ0Kz8SeVCxl2H
   YtJQB3AGKBYM+d57E8K1LWmQTOWBKO8n9HNrX9MAxLxjzDakD1tsCLygh
   bxbaDXkkd8MrL3XavpwR1OvyxQKRjvI1Yzt76bfcTGh2HhXZ80CANqYMt
   G7urboJ4KkT4z3A8RR/0AXD4Drw2jVznPX/rGx4vASBzEZCDLTOSCTvN8
   A==;
X-CSE-ConnectionGUID: eHkq6m6gQmCsCeEWu8NxFQ==
X-CSE-MsgGUID: WY0JWsfpRjO+RvfzFciN+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78687434"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="78687434"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 07:47:58 -0700
X-CSE-ConnectionGUID: lGBKpemaQBG8TMCescEnnQ==
X-CSE-MsgGUID: KnsR4Y8sTEyB8FVjM/alkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249912695"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.145]) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 07:47:54 -0700
Message-ID: <885a239a-9ead-41e7-8a86-50fa02d41093@linux.intel.com>
Date: Wed, 1 Apr 2026 17:47:51 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
To: Greg KH <gregkh@linuxfoundation.org>, Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, perex@perex.cz,
 dominique.martinet@atmark-techno.com, eadavis@qq.com, hannelotta@gmail.com,
 tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de,
 xiaopei01@kylinos.cn, wesley.cheng@oss.qualcomm.com,
 sakari.ailus@linux.intel.com, stern@rowland.harvard.edu,
 amardeep.rai@intel.com, xu.yang_2@nxp.com,
 andriy.shevchenko@linux.intel.com, nkapron@google.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260401123238.3790062-1-guanyulin@google.com>
 <2026040148-cucumber-automatic-9a6b@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026040148-cucumber-automatic-9a6b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,perex.cz,atmark-techno.com,qq.com,gmail.com,suse.com,quicinc.com,kernel.org,arndb.de,kylinos.cn,oss.qualcomm.com,linux.intel.com,rowland.harvard.edu,nxp.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35794-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2A6C037CED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 16:38, Greg KH wrote:
> On Wed, Apr 01, 2026 at 12:32:16PM +0000, Guan-Yu Lin wrote:
>> The current USB offload implementation couples the allocation of xHCI
>> sideband interrupters with the device's offload usage counter. This
>> coupling is conceptually incorrect, as hardware resource availability
>> and power management state serve distinct purposes.
>>
>> Furthermore, the reliance on the coarse USB device lock for offload
>> state updates has led to potential recursive locking issues,
>> especially during device disconnect when the lock is already held
>> by the USB core.
>>
>> This series refactors the offload synchronization by introducing a
>> dedicated spinlock for offload state, allowing for more granular
>> concurrency control and avoiding deadlocks. It also optimizes power
>> management by ensuring that offload state is only modified when the
>> device is already active, avoiding unnecessary auto-resumes.
>>
>> Patch 1 introduces the `offload_lock` spinlock and `offload_pm_locked`
>> synchronization, replacing the coarse `udev->lock` and the legacy
>> `offload_at_suspend` flag. It also updates `usb_offload_get/put` to use
>> `pm_runtime_get_if_active()`.
>>
>> Patch 2 removes the implicit usage tracking from the xHCI sideband layer
>> and delegates the responsibility to class drivers, who have the
>> correct context for managing offload data stream activity.
> 
> Ok, this looks much better, thanks for the revisions.
> 
> If the xhci maintainer acks these, I'll be glad to apply them to my
> tree.

For both patches:

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


