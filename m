Return-Path: <linux-usb+bounces-32372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9BD2294F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81EE9302A79F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01002BD5B4;
	Thu, 15 Jan 2026 06:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iIIWBNw6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1726CE3B;
	Thu, 15 Jan 2026 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459064; cv=none; b=rPoqxCZYvXfiaggHhkJRBwkFhKoB8nUHgANEQKvw2tNCZKlzsCVYtoLA6DGNy3VdCj7Ydu2S5kAyP9FgP6SPuoKzKOaKA9OqsmMgaax7Sna66cHDkcEl2pY5plhvdZJZUP0PpLczD49ChFHNJw4XoD/aaO/q3SPvZQWCBwrnfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459064; c=relaxed/simple;
	bh=g8h+mDLIeaHWeRGg9MmTMyQ8bjGfBC1NPLs0RKDF690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkXJeq0zSfomktWVKfMV1xO5qLu1kly0yx9naM5t6khfLmX+kFbkoi63vp3kt9G7GdR2nET5HNjeAkR3dokoNvc2ooSeRKyPrNT8kT5edmnwNobeGMXNr+RBBTVdPBgAm2Wb2zkKqYx6vK1dx4chHyfsJyFW3N8pesYAVSbLKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iIIWBNw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6084DC116D0;
	Thu, 15 Jan 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768459063;
	bh=g8h+mDLIeaHWeRGg9MmTMyQ8bjGfBC1NPLs0RKDF690=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIIWBNw6o+d5snvVRhnE+xQxm8iw4di1A/uuxJiGx4zNCSNuD/hrg9WVRDCkYN+Lh
	 WfURJGEnm7SKiYH14lwPIJnVrUJVWH7GG97SyfBr5kVA2F3Yhc+cqubcGg7e9VVhAs
	 vOroTUHEUAe49xHcnDe798ER68OxUqq/6NoYfRbs=
Date: Thu, 15 Jan 2026 07:37:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Message-ID: <2026011500-safehouse-alphabet-3056@gregkh>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114235357.zueeylekf4lfdq4g@synopsys.com>

On Wed, Jan 14, 2026 at 11:54:03PM +0000, Thinh Nguyen wrote:
> On Wed, Jan 14, 2026, Thinh Nguyen wrote:
> > On Wed, Jan 14, 2026, Greg Kroah-Hartman wrote:
> > > On Wed, Jan 14, 2026 at 03:37:48PM +0530, Prashanth K wrote:
> > > > + * @address: Cached lower 32-bit base address to be used for logging.
> > > 
> > > Why are 32bits enough / ok?  Why not use the full 64 that you really
> > > have?  What happens if you have 2 devices with just the upper 32 bits
> > > different?
> > > 
> > > This is a resource value, so why not use the proper type for it?
> > > 
> > 
> > This is only intented to be used for logging, so I suggested to use u32.
> > I want to avoid treating this struct member as a phys_addr_t where it
> > may be misused.
> > 
> > As for the reason to capture only the lower 32-bit, it's just base on
> > what I've seen so far. That I have not seen designs where the 2 or more
> > instances are placed that far apart and share the same lower 32-bit.
> > It's a bit nicer to shorten the address print at the start of a
> > tracepoint. But if it's insufficient, there's no problem with using
> > 64-bit.
> > 
> 
> Or we can just remove this and print the address from
> dwc->xhci_resources[0].start.

I thought I asked for that a few revisions ago :)

I'd prefer that, instead of saving off a value that you can look up if
you need it.

thanks,

greg k-h

