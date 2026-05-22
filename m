Return-Path: <linux-usb+bounces-37927-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN1ECeAjEGqsUAYAu9opvQ
	(envelope-from <linux-usb+bounces-37927-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:37:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 708DC5B14EE
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA27302590F
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEA23C198A;
	Fri, 22 May 2026 09:36:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997B3783AD;
	Fri, 22 May 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442576; cv=none; b=iWJ+ccEKLvTrGoAdN+kuGMo+rTwR36wAlKZPdZQ3yhxY8f/wkzaJoUqMZTMibX+z+ljYub8DI+33nsaYKKcZJj7BVKk4yp2v7X3iLc+45QWcb6W0Cr0f7/1xhA2JopE5BmQ2R1j8OXcnRwqFQ8zPkhPILPJ+yRuACFbmvEdzIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442576; c=relaxed/simple;
	bh=JxA2P3pn3hxYLYdZUuKf6s9UHoINE9e6sZxVc+Eh/wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbt5VpgG5rF5ZJm60qOoVd9Ve9v8kk4ikTbx1+cUSY6SVgmHLoPp9pbbzAX2F6qTBQDf7K07mecwjwry/b0fEuoUhjQqe2Cv18PQtcZ8doLWO8fxgFg58SijEUhmv01HbIKc4HVHMfbTtIpP4EtJ+S54P0l9TtcEqN0qwSdOErk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id DB3FF4C1511A93;
	Fri, 22 May 2026 11:35:48 +0200 (CEST)
Message-ID: <fdb02568-2267-49b7-bfab-f4159d211863@molgen.mpg.de>
Date: Fri, 22 May 2026 11:35:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xhci: check for a pending command completion during
 command timeout
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 George D Sworo <george.d.sworo@intel.com>,
 Matt DeVillier <matt.devillier@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
 <20260522085828.24142-4-pmenzel@molgen.mpg.de>
 <2026052213-deserving-oppressor-bb81@gregkh>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2026052213-deserving-oppressor-bb81@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37927-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlesource.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 708DC5B14EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Greg,


Am 22.05.26 um 11:23 schrieb Greg Kroah-Hartman:
> On Fri, May 22, 2026 at 10:58:27AM +0200, Paul Menzel wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> It's possible a command times out even if xHC hardware already completed
>> the command. Driver is unaware of the command completion if interrupt
>> handler is blocked for a long time.
>>
>> Check if there is an unhandled command completion on the event ring during
>> command timeout.
>>
>> In this case just give the command additional time to complete. There's no
>> point in aborting the command ring to move past a stuck command.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
>> Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
>> [pmenzel: one adaptation for mainline 7.1: next_trb() uses the
>>    2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
>>    dropped the xhci and ring arguments present in the 6.12 source the
>>    patch was ported from.  xhci_pending_interrupt() is used directly as
>>    it is now committed as the preceding prerequisite.]
>> Assisted-by: Claude Sonnet 4.6
>> [pmenzel: No devices with the problem available, but no regressions on
>>    Dell XPS 13 9360 and QEMU 7.2.0.
>>
>>        qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0
>>
>>    xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
>>    hubs and USB mass storage device enumerated without errors.
>>    The specific race (command timeout with blocked interrupt handler)
>>    cannot easily be forced in QEMU, but no regressions in the normal
>>    command path were observed.]
> 
> What are these additions from?  Did you mean to send these out to the
> lists?

Yes, they are authored by me and meant for the list. I wanted to 
document, where I got the patch from and how I tested the change. Feel 
free to remove them.


Kind regards,

Paul

