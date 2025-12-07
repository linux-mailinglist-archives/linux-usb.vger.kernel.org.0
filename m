Return-Path: <linux-usb+bounces-31228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B103CAB00A
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 01:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA8413050580
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 00:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015872222C4;
	Sun,  7 Dec 2025 00:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tx9Y1jwv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2961A58D
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765069183; cv=none; b=fRfZnFR10PsDovPD8G8YZW9XFZYmUcHGFexP7t58t96ouZ6nF5b6ZOi2OrpP/3WKxoNgg8P3CnYHpZsShyLl8ErUEppU20spUcLpyAFGPRHfUI/88KdFqZCytwY70tMlU8mcEaA4PXw3v9rUKcH4CL3cD/L2/LJBqY4mAub9IM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765069183; c=relaxed/simple;
	bh=3Luv5YYW6uuSvnVAPojBDXNvYDD1YRR6iuUIM6Ut3u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzk1MBpumCcFO28jz1CoFwciGx7y3xBxdV/mdqWzwVNsDmhVGXkMdY+iPl4M05j5ZojuJWZKb7jkaXNx8XYaDmNaofIeoV2A0T0C97ys/jdUJDobuMOIIPV945LaGkRJ6C4GL6oUXeJZKLRzC73eK89kfS3P4jzsApl+uouM310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tx9Y1jwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DD6C4CEF5;
	Sun,  7 Dec 2025 00:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765069183;
	bh=3Luv5YYW6uuSvnVAPojBDXNvYDD1YRR6iuUIM6Ut3u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx9Y1jwvKH62OpOaMPNkIVzUeUsx3jmGOtwV3jSpmcQTkQ2J1zCzvmgkNw3l+drUP
	 +QKbSgiONp3kyHVtFyIf+8m8IqnToBi219nO6MKNkOgtlKHN+6I7rfSS1FsMrLFrFz
	 +SnNaEAVXL4Xu2nxIi7HkKLvB3eHvE58CEcpEtwA=
Date: Sun, 7 Dec 2025 09:59:40 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: add USB_QUIRK_NO_BOS for devices that hang on
 BOS descriptor
Message-ID: <2025120714-jingle-prorate-5435@gregkh>
References: <20251207000007.11631-1-johannes.bruederl@gmail.com>
 <20251207013734.4e99331f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251207013734.4e99331f.michal.pecio@gmail.com>

On Sun, Dec 07, 2025 at 01:37:34AM +0100, Michal Pecio wrote:
> On Sun,  7 Dec 2025 01:00:07 +0100, Johannes Brüderl wrote:
> > Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
> > for devices that cannot handle it.
> > 
> > Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
> > the BOS descriptor is requested at SuperSpeed Plus (10Gbps).
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=220027
> > Signed-off-by: Johannes Brüderl <johannes.bruederl@gmail.com>
> 
> IIRC what we found in this bug is that the device will happily respond
> to BOS descriptor requests issued by lsusb after it's enumerated.

That's very odd.

> So it appears that (only when running at 10G, wtf) the device expects
> something to happen before it is able to produce this descriptor. And
> apparently Linux is doing things in different order than certain other
> operating system supported by the vendor.

Any ideas what "order" is not the same here?  Should we just not be
reading the BOS descriptor at early enumeration and just wait until
someone actually wants it?

> But the reporter simply applied a patch similar to yours and lost
> interest in debugging any further.

Understood, but I'd like to get to the root of this if possible so that
we don't end up just adding a bunch of devices to this quirk because we
are doing something "odd" that normal USB-IF testing isn't catching.
That feels like a bad overall decision to make.

> And unfortunately WinPCAP fails to capture most of enumeration process,
> so I don't know how that other software is doing it.

usbmon with windows in a virtual machine might catch this?

thanks,

greg k-h

