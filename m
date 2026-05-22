Return-Path: <linux-usb+bounces-37931-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBYaBpA7EGqeVAYAu9opvQ
	(envelope-from <linux-usb+bounces-37931-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 13:18:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A665B2DDA
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 13:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FAE3037EC2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482C83D566E;
	Fri, 22 May 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGrO+Ss6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DD3D4126;
	Fri, 22 May 2026 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448277; cv=none; b=csSVWdzoNsv1kJxH08pcjTuL3lxTM6F/Tg84drl9eef0Nzwq/yS/lS5s0d8VUnAxDEUsR27qP9N4ksrsShiVPJkRz7ztGjnFrJAdliR4XYUtbM0ZMz0p5am1Y+PcWejNUli29Q2Lcbr3h4fKVw11MvU1STXW+IccK1YinYf1pXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448277; c=relaxed/simple;
	bh=4i+SvMhbZig2pNnPe09HumfWMD61xlE71rrF6ut6sHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am8nCDTCveZhkPj4hZtJkaLnmyo8+8SQtW92CfniQtg6lUGTpTD7HQiHyWlG+0qsTZiW6s32N7LCdWA4TiV4ivzk7MCz3OjGpoUJbmU6cRzTvoJLBcT5uXrLt4+6w+PGnUD2akawwwBsrXI4wzVJP79//Ejwt+Fq+0hpJSfu98Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGrO+Ss6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779448276; x=1810984276;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4i+SvMhbZig2pNnPe09HumfWMD61xlE71rrF6ut6sHs=;
  b=VGrO+Ss6u4/clo+r7MtcHfx/3eL6TiDZyH5aMw1GwJB1SUNKo4ufAnzX
   B3RAXQmSFpRTdFFKY+KDM49YzLvP6GuPJqvGN7ujwFoJdaKHhhg53qh4L
   ZmDrIfpEV6TfLVzCtuHvdfQsEG3NwxBwU6lxp+UmaRsmRznaC0GwZRkMC
   jHO1MieSOWsQ10+MTikJRJCy8/1EMhqF91t6hGHLFkAf6p24ePdtXUWg+
   nv97vdwdtnQbC+TdTDm2uho0f2Ml9Ot7QTLt/r3fQVufQJris4XcZGGNN
   5QEVV0wUjpYogp5uADFzIKQtbT5Qv7YcqAHOHscDpKlxLj2H+qAKtZTPw
   Q==;
X-CSE-ConnectionGUID: mVOigbtKTlmwvYzzHiVUJg==
X-CSE-MsgGUID: xEZ9fugaSH2JpQxh2FJPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97798043"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="97798043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:11:15 -0700
X-CSE-ConnectionGUID: Id9Lea/kQfCFSPlhX7sKyQ==
X-CSE-MsgGUID: KSeYFpLkRs2RkEscSJwGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="242692701"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.10]) ([10.245.245.10])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:11:12 -0700
Message-ID: <4dd74c17-eecf-432c-a39e-e722816bb74f@linux.intel.com>
Date: Fri, 22 May 2026 14:11:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xhci: check for a pending command completion during
 command timeout
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 George D Sworo <george.d.sworo@intel.com>,
 Matt DeVillier <matt.devillier@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
 <20260522085828.24142-4-pmenzel@molgen.mpg.de>
 <2026052213-deserving-oppressor-bb81@gregkh>
 <fdb02568-2267-49b7-bfab-f4159d211863@molgen.mpg.de>
 <2026052218-starboard-reach-5db4@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026052218-starboard-reach-5db4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-37931-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,googlesource.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Queue-Id: 50A665B2DDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 13:39, Greg Kroah-Hartman wrote:
> On Fri, May 22, 2026 at 11:35:47AM +0200, Paul Menzel wrote:
>> Dear Greg,
>>
>>
>> Am 22.05.26 um 11:23 schrieb Greg Kroah-Hartman:
>>> On Fri, May 22, 2026 at 10:58:27AM +0200, Paul Menzel wrote:
>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>
>>>> It's possible a command times out even if xHC hardware already completed
>>>> the command. Driver is unaware of the command completion if interrupt
>>>> handler is blocked for a long time.
>>>>
>>>> Check if there is an unhandled command completion on the event ring during
>>>> command timeout.
>>>>
>>>> In this case just give the command additional time to complete. There's no
>>>> point in aborting the command ring to move past a stuck command.
>>>>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
>>>> Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
>>>> [pmenzel: one adaptation for mainline 7.1: next_trb() uses the
>>>>     2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
>>>>     dropped the xhci and ring arguments present in the 6.12 source the
>>>>     patch was ported from.  xhci_pending_interrupt() is used directly as
>>>>     it is now committed as the preceding prerequisite.]
>>>> Assisted-by: Claude Sonnet 4.6
>>>> [pmenzel: No devices with the problem available, but no regressions on
>>>>     Dell XPS 13 9360 and QEMU 7.2.0.
>>>>
>>>>         qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0
>>>>
>>>>     xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
>>>>     hubs and USB mass storage device enumerated without errors.
>>>>     The specific race (command timeout with blocked interrupt handler)
>>>>     cannot easily be forced in QEMU, but no regressions in the normal
>>>>     command path were observed.]
>>>
>>> What are these additions from?  Did you mean to send these out to the
>>> lists?
>>
>> Yes, they are authored by me and meant for the list. I wanted to document,
>> where I got the patch from and how I tested the change. Feel free to remove
>> them.
> 
> These make no sense, please remove them yourself and resend.
> 

I do remember writing these as part of debugging and/or a temporary workaround,
but they were not supposed to go upstream, or become a permanent solution.

These patches just hide the fact that xhci event handler isn't run when we expect
it to. rootcause is unknown.

Thanks
-Mathias

