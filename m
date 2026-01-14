Return-Path: <linux-usb+bounces-32337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D228BD1FE06
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76A09303506C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411592D837E;
	Wed, 14 Jan 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="fNtB/4rA"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0239E6C2
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405293; cv=none; b=FHwA0RsegQAVUbrYNspcvKdimqmkYjEK/EHFSP/BzEFZObsDh4qM5Wi607hCw5FDpT+v0G9Spgb0B8+hCqkcaOM99GY/tTUa1348dob7F8rcF8SRQggVnZw4HThEOJpWwmdWaGz/p7kvk7X8JjGZPY1lMnUW/HxXMt2fbRVwX4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405293; c=relaxed/simple;
	bh=x+T2cKmyr6b89l7NP6mmHB43HSCxIsgsq13SJKuMOVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qS+dEpLkSZPZOsKqS3Pv0V+h+yaJr/1zReEJ07zFppD4LUF4CZgMcLpwoVdjSuk3F4YQxZFD+6QWxuGqAYxhVp/y7ehnnYEX0Ruu+uGcxfhiGld/gDg0nPioWOwmMXOEAn5bjgIbcoR46ehahIIeF3LG42Qgr7fT9rpTSYc8FeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=fNtB/4rA; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768405277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLGtEW2rVXxeAKQ7IO/aDrpsAcXoI6YCU6kF2PJD+3c=;
	b=fNtB/4rAQltgBsqyuQEm7Xb9ZWnquvLi8GOWtG8/ed2BHlzSe9Vb0DTflsyxkTfGJPtfby
	NuSbq339amH4Rp68iSMp5WCDMVPKUebVr8eR8PRVIc8XHIFb+c4UImxnGsJmLzu4K2Snf6
	DO7DvHc+47Tmue4pgBOjRUEnNm/x6K8kvOR4R+FYVwLNzzIkNU7WKyICKiw/+GN0zv/hRj
	O26rm/9LLiY5pC6SPgLJUJuYxhVUWfjKP0atRQsmSjEEde6eSqy2SacPxUzlJFMw5JTBUj
	LLRfAQcvO2MyEy1QNtN8VQvL6b8gt9Nyv67lRzpEY5gJubujY0UlGH8Llk1b8w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 16:41:13 +0100
Message-Id: <DFOFCN7H0Z10.1FAC3SN3TX79O@cknow-tech.com>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
 <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
 <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>
 <91fb697a-7bfa-4e26-85cd-40810a8d2be5@rowland.harvard.edu>
In-Reply-To: <91fb697a-7bfa-4e26-85cd-40810a8d2be5@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Wed Jan 14, 2026 at 4:19 PM CET, Alan Stern wrote:
> On Wed, Jan 14, 2026 at 03:59:28PM +0100, Diederik de Haas wrote:
>> On Wed Jan 14, 2026 at 4:20 AM CET, Alan Stern wrote:
>> > On Tue, Jan 13, 2026 at 10:15:59PM +0100, Diederik de Haas wrote:
>> >> I'm now wondering if there's something wrong with the Quartz64-A ...
>> >> I already thought that it took way too long before I got a login prom=
pt.
>> >>=20
>> >> In my first attempt I noticed I did NOT have the "Warning! ehci_hcd
>> >> should always be loaded before uhci_hcd and ohci_hcd, not after"
>> >> It took so long I forgot to keep counting, but most of all I forgot t=
he
>> >> dynamic debug command, so I tried again ...
>>=20
>> I know it didn't result in the requested dmesg log, but isn't it
>> significant I had the problem *without* the warning? IOW: the connection
>> (correlation or causation) I thought there was, (possibly) isn't there?
>
> I told you much earlier in this discussion that the warning message was=
=20
> unlikely to be connected with the problem you were seeing.

Yep, you did :-)
For me, this was the first time I actively noticed *this* combo.
And I know far less (about this subject) then you do, so things may take
more time to land with me and/or I don't recognize the significance of
certain messages, which may be obvious to you.

>> This was with a 6.19-rc5 based kernel (with mostly media patches added
>> on top) and on a Rock64 (rk3328) I got a whole bunch of these warnings:
>>=20
>> WARNING: drivers/gpio/gpiolib.c:3523 at gpiod_get_value+0x64/0x98, CPU#0=
: swapper/0/0
>>=20
>> log of a few of them:
>> https://paste.sr.ht/~diederik/154c5023a3a50d77f1da2195e7bb9a96f6a88555
>>=20
>> and I suspect (but don't KNOW!) this commit is relevant:
>> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
>>=20
>> So I'll switch to a 6.19-rc4 based kernel, which is mostly the same,
>> but doesn't have that commit.
>
> It's very hard to tell whether this is at all connected to your problem. =
=20
> It could easily be a totally separate issue.

True and it may just be in my head. But I'd rather exclude a *possible*
factor then having the possibility that it may have an/some effect.
AFA*I*K, all the RK33xx/RK35xx devices uses the same USB2 'stuff', so
while I didn't see it with the Q64-A, I'd rather not take the chance.

>> FWIW: I'd expect to see sth in dmesg within a second of me plugging sth
>> in, so I was surprised by you calling '30 secs' a short period.
>
> 30 seconds was a generous estimate on my part; 5 seconds probably would=
=20
> have been enough.  However, the USB subsystem does include some timeouts=
=20
> that are 2 seconds long and others that are 5 seconds long, and some of=
=20
> these timeouts are inside retry loops.  So a 30-second wait isn't=20
> unreasonable.

But that's all processing times *after* it detected a USB device?
The thing that really surprised me that it took the kernel a minute to
detect anything had happened at all. If that had taken 30 secs, that
would've surprised me too. If it then took some time to make the device
fully available and operational, sure, fine.

Cheers,
  Diederik

