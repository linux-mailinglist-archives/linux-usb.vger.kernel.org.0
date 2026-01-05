Return-Path: <linux-usb+bounces-31898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB59CF2593
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 09:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F19C13001BE9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 08:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F65311C0C;
	Mon,  5 Jan 2026 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eCfpRY44"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6AB311979
	for <linux-usb@vger.kernel.org>; Mon,  5 Jan 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767600533; cv=none; b=L5zz5jTbvfv8eg0dl7jFBeVYuCFVVqbKVppWasVTPlawkQaefjygP/RxLnGjrEKLS/I3NI+8QwsI34loil+iPaZgTGkuCvhOUw+8rfyVKelBopqJxXVm6HRj5SAoDMkQ7sTGsjm4vqLGn2eOB/lQsM3DZj6OaR1DkH+hYcgKhUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767600533; c=relaxed/simple;
	bh=C2GuqfS6hh7WzCuDFjXtYYvziJ+dLJ0x5Yy8GOgFOIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8JxLiDRwPhjrIQbQFc9cKedWQrm8PFSHSA3OVWPkyIV37eWvA0nM5sn2YXVRmp5c40fWp0EFXoxrpOT1SYrIaVdl7qH79tp1lII25DqRC7jTrG6CAxJMEQgy0w98mnRwGAk9+zg9g7aWQnDknClKzr2z1973ppgR3rEgl482YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eCfpRY44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9EAC116D0;
	Mon,  5 Jan 2026 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767600532;
	bh=C2GuqfS6hh7WzCuDFjXtYYvziJ+dLJ0x5Yy8GOgFOIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCfpRY44eT8GVjvUb1KX5iH5UWER1wGf8hmzKrSgb7XYFncucPe+5i3hHuRl487cB
	 g1SqGK60FO20352yhQQxzy5XNqFAmQq2V9g02FUrPx9XDomd03tnL+irqerfoFBlb0
	 RleI+QiAiyGgibSqaBYWYDivpxxAxckjscbUw+NQ=
Date: Mon, 5 Jan 2026 09:08:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Marco Schuschnig <m.schuster91@googlemail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: usbip: Kernel oops when trying to bind devices from Windows
 client
Message-ID: <2026010533-swiftness-character-1cc3@gregkh>
References: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEhB=Bt13wr1+cc1rfzwPxnEEuawMgTew=RJic2FsVb=Gccm+A@mail.gmail.com>

On Mon, Jan 05, 2026 at 12:13:01AM +0100, Marco Schuschnig wrote:
> Hello all,
> 
> I am trying to get usbip working with a Raspberry Pi Zero 2 W
> (Raspberry Pi OS / Debian Trixie, kernel 6.2.47) as host and a Windows
> 10 machine as client (using usbip-win2 0.9.7.3). The device to be
> shared is a "145f:0276 Trust GXT 165 Gaming Mouse".

That is a very old, and obsolete kernel version, one of which we really
don't know anything about anymore, sorry (there is no 6.2.47 kernel
release).  I would contact whomever is supporting / creating that kernel
image and ask them for help with this as even if we can point you at a
fix, you'll have to get it updated into that tree, right?

sorry,

greg k-h

