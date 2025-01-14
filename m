Return-Path: <linux-usb+bounces-19341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DACA10B44
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 16:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534383A9BFA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E565194A74;
	Tue, 14 Jan 2025 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax/D5hzE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54551AA1DC;
	Tue, 14 Jan 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869190; cv=none; b=R1HjysXuFJ/I8GnfIAi/vAtGOTmDpdvnVUoKfwzx1F4Cra67ku5gXHTLPJK2xz6EJjlcZ410Nc52lG4PPZJgmpckKSviuUEY7eGfsJ336wetzTrZ4mT5+YZw8cL1BIKkCE/7JZVK5E2itH3pCvF7ZVsS1SdtPMqG89e9sHKGNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869190; c=relaxed/simple;
	bh=BCbMtLZz9pA5XjvAqLbwUbiO+hp3YmOhY/G9kv8IL98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxIdvmrgq5tNlwR+iNRu4kHXtWCf2biD4CE1lgsdcsIEO/bS7n60uEm3M/AzHhEpMSTOHOA9F1GiT4FA+fHk04CpaHfAvdaV+ygzvaLHK8e5+sf7xSMf8d0Xq/VbBQ0PaNZfvAi3EZtkoGjUkWJmN4mINU4kBAxZ58MuyiFMJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax/D5hzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF07C4CEDF;
	Tue, 14 Jan 2025 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736869190;
	bh=BCbMtLZz9pA5XjvAqLbwUbiO+hp3YmOhY/G9kv8IL98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ax/D5hzEjiI8lozfrmaycUliytMWlA54LrUZxfuzdHDHMlHUb5n8JdZXBw9lZH+0M
	 QVJR0ZH/CtFdhBfnr/3HZtiIKWzph48cy8MAxSvkvt98GSwLBdpYQgSJnJxjODK0zx
	 zTJqZH6Uo3HT7j97z5iLPao9UhNzOvio1mt3CiEMyepIvU7QJSGO2TL483GOaO4BXO
	 HGaKay8ZeGi3RX9X2RDZgEn/8oEf0WB0efGHDPq4uCLtu83sm6RDyK3v90kYCUx4NM
	 JN3eKnakyv/l66cv/tOXarjWppPkWjBv6BeI2YcgmDB/9DnDQffSa0cwKdbcg3zto0
	 nUraw+SMfkhCw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tXj1E-00000000803-0Zyg;
	Tue, 14 Jan 2025 16:39:52 +0100
Date: Tue, 14 Jan 2025 16:39:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
Message-ID: <Z4aFSCnJTX2WHGY_@hovoldconsulting.com>
References: <20240507131522.3546113-1-clabbe@baylibre.com>
 <20240507131522.3546113-2-clabbe@baylibre.com>
 <Zp5q5V_OnLAdvBrU@hovoldconsulting.com>
 <CAFBinCC9ftXxkyoiY=3ia6UubTeG-cHXa40ddd7WMNUhvVjr+g@mail.gmail.com>
 <Zp_WiocH4D14mEA7@hovoldconsulting.com>
 <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCATe+RXHz6Cy9cbo=vYL+qm_kz1qDTB8oL775xdgk=TYg@mail.gmail.com>

Hi Martin (and Corentin),

and sorry about the late reply here.

On Sun, Aug 25, 2024 at 12:56:17PM +0200, Martin Blumenstingl wrote:
> On Tue, Jul 23, 2024 at 6:13 PM Johan Hovold <johan@kernel.org> wrote:

> > > For slow speeds I never receive the "Transmitter holding register
> > > empty" interrupt/signal when using the full TX buffer.
> > > It's not that the interrupt/signal is late - it just never arrives.
> > > I don't know why that is (whether the firmware tries to keep things
> > > "fair" for other ports, ...) though.
> >
> > Perhaps you can run some isolated experiments if you haven't already.
> > Submitting just a single URB with say 128, 512 or 1024 bytes of data and
> > see when/if you ever receive a transmitter holding empty interrupt.
> >
> > How does the vendor driver handle this? Does it really wait for the THRE
> > interrupt before submitting more data?

> The vendor driver:
> - first acquires a per-device (not per port) write_lock [0]
> - then waits for the (per-device, not per port) write buffer to be empty [1]
> - and only then submits more data to be transmitted [2]

Ok, thanks for confirming, sounds like that's how the device works then.

> > You could try increasing the buffer size to 2k and see how much is
> > received on the other end if you submit one URB (e.g. does the hardware
> > just drop the last 1k of data when the device fifo is full).

> I have not tried this yet but if still relevant (after the info about
> the THRE interrupt) then I can try it and share the results.

It would only be to really confirm that this is how the vendor protocol
and device works. Your call.

> [...]
> > > > > +             * If we ingest more data then usb_serial_generic_write() will
> > > > > +             * internally try to process as much data as possible with any
> > > > > +             * number of URBs without giving us the chance to wait in
> > > > > +             * between transfers.
> > > >
> > > > If the hardware really works this way, then perhaps you should not use
> > > > the generic write implementation. Just maintain a single urb per port
> > > > and don't submit it until the device fifo is empty.
> >
> > > I tried to avoid having to copy & paste (which then also means having
> > > to maintain it down the line) most of the generic write
> > > implementation.
> > > This whole dance with waiting for the "Transmitter holding register
> > > empty" by the way was the reason why parts of the transmit buffer got
> > > lost, see the report from Nicolas in v6 [1]
> >
> > I understand, but the generic implementation is not a good fit here as
> > it actively tries to make sure the device buffers are always full (e.g.
> > by using two URBs back-to-back).
> >
> > If you can't find a way to make the hardware behave properly then a
> > custom implementation using a single URBs is preferable over trying
> > to limit the generic implementation like you did here. Perhaps bits can
> > be reused anyway (e.g. chars_in_buffer if you use the write fifo).

> I cannot find any other usb-serial driver which uses this pattern.
> Most devices seem to be happy to take more data once they trigger the
> write_bulk_callback but not ch348.

Right. I think the io_edgeport driver maintains some kind of TxCredits.
I guess that's related, but not sure how relevant that is here (and you
probably shouldn't based anything on that old driver directly anyway).

> If there's any other (even if it's not a usb-serial) driver that I can
> use as a reference implementation for your suggestion?
> I'm not sure whether to use a dedicated kthread, single threaded workqueue, ...

Not sure what Corentin has been preparing, but yeah, you need some kind
of deferred mechanism to make write() non-blocking and hold off sending
more data to the device until you're sure there's room in its buffers. I
guess a workqueue should do fine.

Johan

