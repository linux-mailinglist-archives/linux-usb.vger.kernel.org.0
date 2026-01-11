Return-Path: <linux-usb+bounces-32142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B36D0E1EE
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 08:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2984C3011415
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 07:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9642623D281;
	Sun, 11 Jan 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r0FDE7NF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB350276;
	Sun, 11 Jan 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768116837; cv=none; b=S1rd8wTBLvP5ePZ6gBE3Z3n6ZWbxH08S8qvqUHXqFeX+JcgZgT1f6chcPqAehrzj1XoMwelWjVpbuNiv4smCkzdoLGsc/ZkdwIimag9iSvwl1BrdRCuiANoxVtXeQ6GATvtdsqQFc0H7x7HRe5WC69QTtOrRq/xk96YLOF+p8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768116837; c=relaxed/simple;
	bh=Bw3UIR02zJWKeZyT1p4sdbNvMCyM2VOx59ZwAkPekQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWeiYnrCr2fuEXbe3faegUD/2btnpmhL4376QiNthcwdqgHkrGvHpQnPCVgI7utMb8jIXJCFnx5rfX+vzTdYrcQU/a7RmFtGUUo4KkJzQsIDIyRpMATN04Lj52riFlsmH8BqEkB+SL3WUp57IE0upA6W+ya2hLzwCxKxMPZMYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r0FDE7NF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64648C16AAE;
	Sun, 11 Jan 2026 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768116836;
	bh=Bw3UIR02zJWKeZyT1p4sdbNvMCyM2VOx59ZwAkPekQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0FDE7NFvOV9dff9A+bLDkzAB3UEfSdOqnd+7QCoRD8GhRgVrHsEqvIOR5SpztVHO
	 ayxjDwQQSqy7g48bdvWmOc4DiekfQms9faWMA77MfNblUxKJbOL9U2s7c37q/TrcJK
	 XvpVDsk38U2nQqGZ53vVfLovlXn2lrK+hoUkf14U=
Date: Sun, 11 Jan 2026 08:33:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix potential divide-by-zero in
 prepare_packet_read()
Message-ID: <2026011117-surrender-dude-9f5b@gregkh>
References: <20260110192233.31955-1-eeodqql09@gmail.com>
 <2026011022-cosmos-consult-4c50@gregkh>
 <CAAsoPpUv_G1Se_z9WRQ_4rHv=tiUW__eHU=03mytkdU9+kW1ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAsoPpUv_G1Se_z9WRQ_4rHv=tiUW__eHU=03mytkdU9+kW1ag@mail.gmail.com>

On Sun, Jan 11, 2026 at 02:25:54AM -0500, Seungjin Bae wrote:
> 2026년 1월 10일 (토) PM 3:02, Greg Kroah-Hartman <gregkh@linuxfoundation.org>님이
> 작성:
> 
> > On Sat, Jan 10, 2026 at 02:22:33PM -0500, pip-izony wrote:
> > > From: Seungjin Bae <eeodqql09@gmail.com>
> > >
> > > The `prepare_packet_read()` function calculates the number of packets
> > > required for a transfer by dividing the transfer buffer length by the
> > > maximum packet size (`td->maxpacket`). The `td->maxpacket` is
> > > initialized in `r8a66597_make_td()` function based on the endpoint
> > > descriptor. However, it does not validate whether `td->maxpacket` is
> > > zero before using it in the `DIV_ROUND_UP` macro.
> > >
> > > If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
> > > 0, it triggers a divide-by-zero exception (kernel panic).
> >
> > Same here, when can this happen, before a device is bound to the device
> > or afterward?
> >
> > thanks,
> >
> > greg k-h
> >
> 
> This logic triggers after the driver is bound, specifically during the
> packet preparation phase.
> 
> I checked `usb_parse_endpoint()` and confirmed that if `wMaxPacketSize`
> is 0, it only prints a warning and continues the binding process.
> It does not reject the device at that stage.
> 
> However, I missed that `usb_submit_urb()` explicitly checks if
> `wMaxPacketSize` is 0 before calling the driver's enqueue function.
> Since the core rejects such requests with -EMSGSIZE, this code path
> is unreachable in practice.

That's great to verify, thanks for checking.

also, when writing a patch that says "this will fix a crash", please
verify that the tool that found this issue is actually correct and not
making things up.  We have a lot of bad AI generated bug reports these
days, so be careful as we are getting much more sensitive to this.

thanks,

greg k-h

