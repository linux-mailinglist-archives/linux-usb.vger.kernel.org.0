Return-Path: <linux-usb+bounces-30019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA2C2E65B
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 00:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8180034BC56
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 23:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE012FF178;
	Mon,  3 Nov 2025 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYrXWDHR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CF2C11CB;
	Mon,  3 Nov 2025 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762212501; cv=none; b=gM4uEuuYecxdP0/lBZu5hWnN+4qhUSbjBnJ/Q5+gZpOO2z+qrC5Y7bqmix+C9lHU09vGE8If6PVJeAD0TC/ktI6efHTWhIBrXbCHk7MsOQag4ltpzDxctxZbObvm7On2QhPA63mmvslifSRuEaaNe2SEQ5SOr4Z0WkD2tdwezOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762212501; c=relaxed/simple;
	bh=n2NRhKCNJGjVXeqZ//t/gyTqSSewm7rpD74Fyk9Al1I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lxcI+lUers0f4m9ibUcMVs/MFMbpAAwRsME3pEpPxGch7N86PJncCdSQYmtCybgTxoFrraK6rmXBxEDCOP5d849CzXRncVsZtqxWAPm7dhlpD9YiQWcQlV43PPkluHANpCTKoOb7B4mKOtk66fUUrQJ59qCJ/ojSws1GPK7vG14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYrXWDHR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD19C4CEE7;
	Mon,  3 Nov 2025 23:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762212501;
	bh=n2NRhKCNJGjVXeqZ//t/gyTqSSewm7rpD74Fyk9Al1I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jYrXWDHRhecHm/nV1g/5/JkGVsmLQDFLP/jxdotsl/tTkdXKaiERGMkEm0Ms+spb/
	 rwodGM7yoWm+cIdNWNeMqDH32CBYgUdFu0YwQeRssYf41EJnN1tXIIfA7rGClJasGH
	 d5KM+PpLPH7mtVa3x6fH4dyKqbwg0PrO+FayYxGr2UJgDPt5lukAJ/8ha+y2/cm2xh
	 vZYvu4Ajo3V+PSW+TJSnRDPrgw6Z7bVfJ2jQqLH0FuYkAvh+odRAJ+cxH6iUpCq7rl
	 Jn4/8xPd0hUMmcbAHUxqtbLfWm1NMPL2JH6Rw1Z+ziRUzD5+CVwvg4Qz/kN/HcDWGb
	 OyEoixeFOqJdw==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 00:28:16 +0100
Message-Id: <DDZG710VN30W.1VGG8JWIELQYV@kernel.org>
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251103110115.1925072-1-dakr@kernel.org>
 <2025110425-anew-squall-2ac8@gregkh>
In-Reply-To: <2025110425-anew-squall-2ac8@gregkh>

On Mon Nov 3, 2025 at 11:56 PM CET, Greg KH wrote:
> On Mon, Nov 03, 2025 at 12:01:03PM +0100, Danilo Krummrich wrote:
>> A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
>> USB abstractions.
>>=20
>> """
>> error[E0599]: no method named `data` found for struct `core::pin::Pin<kb=
ox::Box<T, Kmalloc>>` in the current scope
>>   --> rust/kernel/usb.rs:92:34
>>    |
>> 92 |         T::disconnect(intf, data.data());
>>    |                                  ^^^^ method not found in `core::pi=
n::Pin<kbox::Box<T, Kmalloc>>`
>>=20
>> error: aborting due to 1 previous error
>>=20
>> For more information about this error, try `rustc --explain E0599`.
>> make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
>> make[1]: *** [/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-2025=
1103/linux-6.18.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: =
prepare] Error 2
>> make: *** [Makefile:256: __sub-make] Error 2
>> """
>>=20
>> This slipped through, since the USB abstractions are globally disabled.
>> However, the USB tree recently enabled them, hence it showed up in
>> linux-next.
>
> Sorry about this, should we also enable it in the driver-core-next tree
> as well, to catch these types of things?

No worries -- I actually enabled it locally, but then forgot to re-test aft=
er a
rebase.

I'm fine either way, I only expect one more patch touching the USB stuff in=
 this
cycle.

