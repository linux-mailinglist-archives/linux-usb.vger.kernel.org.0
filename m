Return-Path: <linux-usb+bounces-37933-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EU0AdZVEGraWQYAu9opvQ
	(envelope-from <linux-usb+bounces-37933-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 15:10:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9125B4DAB
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 15:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17B3A311D5F2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 12:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B64395AFB;
	Fri, 22 May 2026 12:38:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DDD382285;
	Fri, 22 May 2026 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453509; cv=none; b=LJEPyhcAcG1rsUN9Bcw39A2Bu8BFeRiibY5O8e5DgKe+m1AR/Qya76GJdxhNHnB1u0dTKVNWg70dl1LSrL3uy5+DHRphJUlGZ3dllsKJLoQA5cF02fGChNdg+2YKKWA+k5WTlRv2jX3WJfm6dfyslNCPEpumUZ7pfAUK9sZBsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453509; c=relaxed/simple;
	bh=oa/Psw0b1exmCXbqVOByVJQUETaBj7pk92A8HVeh1Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ird3RL+kUIK9lAT0iAScfU4c7WlzblRhZ1dp59NGyU1dCZ8c/618grm3NILQaOiyEUwhKwtptPadUsgzU7xquYmlFRjpSP/aDpNDwWf36abjivHVWHmLaz81D3OVrDOElHPM+2whbCkv1tzHhCaArvdg4/GN75L1v0Rm/8KWijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2166A4C1511A9D;
	Fri, 22 May 2026 14:38:08 +0200 (CEST)
Message-ID: <9312b110-f126-464f-8c78-c82a35ff517c@molgen.mpg.de>
Date: Fri, 22 May 2026 14:38:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xhci: check for a pending command completion during
 command timeout
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 George D Sworo <george.d.sworo@intel.com>,
 Matt DeVillier <matt.devillier@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
 <20260522085828.24142-4-pmenzel@molgen.mpg.de>
 <2026052213-deserving-oppressor-bb81@gregkh>
 <fdb02568-2267-49b7-bfab-f4159d211863@molgen.mpg.de>
 <2026052218-starboard-reach-5db4@gregkh>
 <4dd74c17-eecf-432c-a39e-e722816bb74f@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <4dd74c17-eecf-432c-a39e-e722816bb74f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37933-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,googlesource.com:url,intel.com:email]
X-Rspamd-Queue-Id: 9D9125B4DAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Mathias,


Thank you for your response.

Am 22.05.26 um 13:11 schrieb Mathias Nyman:
> On 5/22/26 13:39, Greg Kroah-Hartman wrote:
>> On Fri, May 22, 2026 at 11:35:47AM +0200, Paul Menzel wrote:

>>> Am 22.05.26 um 11:23 schrieb Greg Kroah-Hartman:
>>>> On Fri, May 22, 2026 at 10:58:27AM +0200, Paul Menzel wrote:
>>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>
>>>>> It's possible a command times out even if xHC hardware already completed
>>>>> the command. Driver is unaware of the command completion if interrupt
>>>>> handler is blocked for a long time.
>>>>>
>>>>> Check if there is an unhandled command completion on the event ring during
>>>>> command timeout.
>>>>>
>>>>> In this case just give the command additional time to complete. There's no
>>>>> point in aborting the command ring to move past a stuck command.
>>>>>
>>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
>>>>> Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
>>>>> [pmenzel: one adaptation for mainline 7.1: next_trb() uses the
>>>>>     2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
>>>>>     dropped the xhci and ring arguments present in the 6.12 source the
>>>>>     patch was ported from.  xhci_pending_interrupt() is used directly as
>>>>>     it is now committed as the preceding prerequisite.]
>>>>> Assisted-by: Claude Sonnet 4.6
>>>>> [pmenzel: No devices with the problem available, but no regressions on
>>>>>     Dell XPS 13 9360 and QEMU 7.2.0.
>>>>>
>>>>>         qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0
>>>>>
>>>>>     xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
>>>>>     hubs and USB mass storage device enumerated without errors.
>>>>>     The specific race (command timeout with blocked interrupt handler)
>>>>>     cannot easily be forced in QEMU, but no regressions in the normal
>>>>>     command path were observed.]
>>>>
>>>> What are these additions from?  Did you mean to send these out to the
>>>> lists?
>>>
>>> Yes, they are authored by me and meant for the list. I wanted to document,
>>> where I got the patch from and how I tested the change. Feel free to remove
>>> them.
>>
>> These make no sense, please remove them yourself and resend.
> 
> I do remember writing these as part of debugging and/or a temporary workaround,
> but they were not supposed to go upstream, or become a permanent solution.
> 
> These patches just hide the fact that xhci event handler isn't run when we expect
> it to. rootcause is unknown.
The ChromiumOS folks still carry it, and I am unable to look at the bug 
reports to see what device it was seen with. Do you have any more 
insight, if these bugs still happen?


Kind regards,

Paul

