Return-Path: <linux-usb+bounces-37897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDC8Flk4D2rUHwYAu9opvQ
	(envelope-from <linux-usb+bounces-37897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:52:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E744E5A9A47
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB8FB34E8333
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 15:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852A5351C09;
	Thu, 21 May 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sk6Jp3n4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0D3446A7
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377052; cv=none; b=eERTh/kGffKdi16P+TjTyHqeCdJZW8qUkeYhyJo5XsMxd4K41gldBPLMHMheaMxvEFpjAqzSMQ4dUuSPoSbdczxcIOkEaLUjF3oiEYVRwD7UcGuNIgDOyuRFSGDrUQ1ArGOLTFogL8ESofEQrh1ekKDfu+8mFOPA6riLsnd66m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377052; c=relaxed/simple;
	bh=28e0KvhZ2/fZBAof2STbM1P1QIDaimZ/USD5AXOsInE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wh90xzLmu0uNzvSueLBt7hCpkyhe9CE3BjH+mJTLCZFQa/RJf66ghsFzYskK4ZzWqTAEAu7mxVaaJzTRbT/h5XkWxVODWngOsl9O+829zZOyxMy4ezcDLKQsW4RspeoeobkL7JXS6+sElOqe9eOf0Cjkv6aLD/XpnBxXhrpwP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sk6Jp3n4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377050; x=1810913050;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=28e0KvhZ2/fZBAof2STbM1P1QIDaimZ/USD5AXOsInE=;
  b=Sk6Jp3n4fdSUjYiANjl2COnLHwDi6F5BgupBUxkcSHhroWYcJeHPy6LK
   LHv0QJiFLVRM1c7G8VTp9a5OGY0FWRClW8gfpdEizb1p123FVgKDJ08Z7
   FdD9kyQK+pXMeAD6AZKwoW/E0UA5OACORbNgh/9B8zxdpWCwdhYwy5ZSh
   0KPfnbtPcMZ4D9mA+Tyit0+k0MZJsA4E+pry7QRMMIgCzrETwWry2tjyA
   govyRdtG6rmeoKkjvTiWfe64zv9+SF5C1Vj4bp/i0Ly1THcWQeHRXYWzm
   YLaw31Dqagvjf8Qd2jH3x05Z7fEwOcbIUoEV+Lm8y4T7cYtoBArHlCP5v
   Q==;
X-CSE-ConnectionGUID: ZHhGCRsjS1qT0V1j+7PRMg==
X-CSE-MsgGUID: Q00E+cwDSHuJVBoJDAWCWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91405804"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="91405804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:24:10 -0700
X-CSE-ConnectionGUID: 66gTi1z1RwuGgQ3kE1YqQQ==
X-CSE-MsgGUID: WXrf9FPKRcCdevIbh0Cddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="239538900"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.42]) ([10.245.244.42])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:24:08 -0700
Message-ID: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
Date: Thu, 21 May 2026 18:24:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Dylan Robinson <dylan_robinson@motu.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 stern@rowland.harvard.edu
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
 <20260512110810.17fbde0a.michal.pecio@gmail.com>
 <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
 <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
 <20260515063210.4ed0a940.michal.pecio@gmail.com>
 <CA+Df+jc=z96K52NJ6YXG4x8gK95udcbFHs=0hTQS6cm1r8z0zw@mail.gmail.com>
 <20260518091327.470d8fb5.michal.pecio@gmail.com>
 <CA+Df+jc7rPGBWzvW4eU1WA1GB=S59OsF3_q0O9HmrczM06CV9g@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CA+Df+jc7rPGBWzvW4eU1WA1GB=S59OsF3_q0O9HmrczM06CV9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37897-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: E744E5A9A47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On 5/21/26 17:20, Dylan Robinson wrote:
> On Mon, May 18, 2026 at 3:13 AM Michal Pecio wrote:
>> Underruns are the most important thing to test here
> 
> Agreed.
> 
>> Yes, this is very annoying because it's undetectable (without CFC).
>> It seems we need to handle Ring Underrun/Overrun events, somehow.
> 
> I think handling ring underrun and overrun events is probably the
> right approach here. I started putting together some tests, but ran
> out of time. I hope to spend some more time on it this weekend.
> 
> My current thinking is that for an URB submitted after an underrun or
> overrun has actually occurred, but before the xrun event is reported
> or handled, there will be no way to determine its true start frame,
> since it will have been submitted with SIA set.
> 
> However, because completions are processed in order, the HCD should
> still be able to determine by completion time whether an xrun occurred
> before completion of the URB, and could therefore indicate to the
> completion handler that the reported start_frame is uncertain.
> 
> Hopefully, USB drivers could then detect the discontinuity either:

I've been working on a solution like this

If URB is submitted after a overrun/underrun then re-calculate its
urb->start_frame based on running microframe index

If xhci driver handles the overrun/underrun event after a new URB is
already submitted then kick the urb->start_frame forward by one ESIT

If xHCI CFC is used then don't touch urb->start_frame

I promised to focus on xHCI DbC issues next week so I'll share v3 now
even if it again is not tested at all, and has some 'FIXME' cases left.
First two patches are the same as v2.

Code should work and be testable

It does change a bit how MSE (+ skip flag) + overrun/underrun cases are
handled. I haven't fully yet figured out all those cases, hopefully this
doesn't make it much worse.

Would be good to get Michal's comment on that

I
> 
> Not to repeat myself too much, but I think this discussion also helps
> illustrate the value of allowing drivers to supply a specified
> start_frame, since xrun events become much less likely when scheduling
> sufficiently far into the future. That said, I think it is worth
> sorting out these underlying frame id calculation issues first.

Maybe we could add something like a 'delay_start_by_intervals' to the
URB? telling the host that class driver wishes stream to start n intervals
after usb was submitted.

Thanks
Mathias


