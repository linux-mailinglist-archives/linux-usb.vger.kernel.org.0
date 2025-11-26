Return-Path: <linux-usb+bounces-30961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B0C8936B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 11:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AB2883508C2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651F42FB99D;
	Wed, 26 Nov 2025 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tdJUDtfm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19F12E7193
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152092; cv=none; b=h+CndfCJeGRi5wip3DDEYRSYHoGNo7w9srnsB6YdPMK6qOLE5sf6R8kYycaNIfGeLL191GVs3mAjKjZceIHGVX1opFkSmFmiR0bS68pU8FF0Qyq61A+7PPMjxw3XFNW7oE86EbfNBgKV5y4XQykZChBDRaqHgTbaHghk3nv30Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152092; c=relaxed/simple;
	bh=pmS72V7T2dym9obEQrsSJy/UAVcBvk/0MnZbNwlPpuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kby7rohmCTio75w60JIpbZLbhqbE5IjuG5owpfmknE4uOdhcuvKQRtOd2xpPH1UYzTZaPN0lz6AsTlmRB9SWnUrbptmvlsN6MEyHhyMWHlLINLbfa52OZm4bC0t3IlJhZsgzVR/bYmb0D0DDXFc9UbPW5CcB6GFbXLdy6FDLQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tdJUDtfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AC5C113D0;
	Wed, 26 Nov 2025 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764152092;
	bh=pmS72V7T2dym9obEQrsSJy/UAVcBvk/0MnZbNwlPpuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdJUDtfmYDwjhRjynRPS53anD7e1y44KuQxS++sp5JdWyn2TO0rrfBR1ItKBMooUS
	 dDFsrcaMR2TMMV3Zg3UX1vgTcBDe/0AY8nZoYd6LTDxkqCETqI+sIWcQz9CQVtEoaq
	 SfaKcMQNxeQSFyIoINFUHLip0Ik3VQJdIeU6Lcms=
Date: Wed, 26 Nov 2025 11:14:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
Message-ID: <2025112625-uniformed-payphone-f5b3@gregkh>
References: <20251125142532.2550612-1-ukaszb@google.com>
 <2025112616-gestate-disperser-c055@gregkh>
 <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>

On Wed, Nov 26, 2025 at 08:58:10AM +0100, Łukasz Bartosik wrote:
> On Wed, Nov 26, 2025 at 8:15 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Nov 25, 2025 at 02:25:31PM +0000, Łukasz Bartosik wrote:
> > > From: Łukasz Bartosik <ukaszb@chromium.org>
> > >
> > > When DbC is disconnected then xhci_dbc_tty_unregister_device()
> > > is called. However if there is any user space process blocked
> > > on write to DbC terminal device then it will never be signalled
> > > and thus stay blocked indefinitely.
> > >
> > > This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
> > > The tty_vhangup() wakes up any blocked writers and causes subsequent
> > > write attempts to DbC terminal device to fail.
> > >
> > > Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> > > Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> > > Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google.com
> > >
> > > Fix typo indifinitely->indefinitely
> > >
> > > --
> > > 2.52.0.460.gd25c4c69ec-goog
> > >
> >
> > I see no patch here :(
> 
> Hi Greg,
> 
> The typo I fixed was in the commit message indifinitely->indefinitely.
> 
> Would you please elaborate what is your expectation for a fixup in this case ?

Ah, I thought it was a change to the diff.  We can't change changelogs
after they are in the tree, sorry.

thanks,

greg k-h

