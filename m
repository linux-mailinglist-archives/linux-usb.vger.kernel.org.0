Return-Path: <linux-usb+bounces-24153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFAABF1BE
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 12:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA54B16B92D
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 10:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83D925C834;
	Wed, 21 May 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CVSg2+3/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAFD238C3A
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823682; cv=none; b=OCt1xuW5xi2+Zj/DhC+/vVjqQs0Ym98sU6gkY+X9UnIp4Bor+RmewWuR9w8UOt1J/SzUAQ+7kYN0svpQ3IBoPicO98CagAgH8SfunSAK7mNA8IponF5xHJUfMy8fDNXZX9NEKOUByeL8HNjsbPEskH3ToeTrUs1/uVp93eyeFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823682; c=relaxed/simple;
	bh=5HSwGNpGlgaEB7RBQ1YVouQF3RCe3t95wrthor0FxcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ave6lEVekK0vJCMdfJ3xLVnyM2EBaqGAYmX6550GltwuxkEe/DlDpOfzLmAuRrw4oCnMqZrggnMr3qmZql/9gs/jgo3w5UDm3/ZcnzXDuT1/hqwoENXas0cbK/grjU0oEPYq1zcbCiejB3hPQ0eF0eFQhN7kisQwDoMcms9Kf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CVSg2+3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358CBC4CEE4;
	Wed, 21 May 2025 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747823680;
	bh=5HSwGNpGlgaEB7RBQ1YVouQF3RCe3t95wrthor0FxcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVSg2+3/Cb2YCizTz/GABIN82w5u93NFxl2cSCXxHjYf+5PvAZgTsY7DQynVLbAg3
	 0Ap8racdZMy4UmH8zb47HvIk7aKre5cCCo3fww2D2LwD2htXJIAgDw9UGK0i8AJl3i
	 4dQb/OF9VLJWSTeR4XMRIZw0+M0gI8LYJbLaX9aY=
Date: Wed, 21 May 2025 12:34:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 23/24] usb: xhci: add warning message specifying which
 Set TR Deq failed
Message-ID: <2025052136-apostle-floral-9c23@gregkh>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-24-mathias.nyman@linux.intel.com>
 <20250516144310.12b4f072@foxbook>
 <c6c2a7f6-35fb-4f92-9d07-b0a2fa703223@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6c2a7f6-35fb-4f92-9d07-b0a2fa703223@linux.intel.com>

On Mon, May 19, 2025 at 05:33:41PM +0300, Mathias Nyman wrote:
> On 16.5.2025 15.43, Michał Pecio wrote:
> > On Thu, 15 May 2025 16:56:20 +0300, Mathias Nyman wrote:
> > > From: Niklas Neronin <niklas.neronin@linux.intel.com>
> > > 
> > > Currently, errors from the Set TR Deq command are not handled.
> > > Add a warning message to specify the slot, endpoint, and TRB address
> > > when a Set TR Deq command fails. This additional information will aid
> > > in debugging such failures.
> > > 
> > > Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > ---
> > >   drivers/usb/host/xhci-ring.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-ring.c
> > > b/drivers/usb/host/xhci-ring.c index e3c823e1caee..eff6b84dc915 100644
> > > --- a/drivers/usb/host/xhci-ring.c
> > > +++ b/drivers/usb/host/xhci-ring.c
> > > @@ -1448,6 +1448,11 @@ static void xhci_handle_cmd_set_deq(struct
> > > xhci_hcd *xhci, int slot_id, unsigned int ep_state;
> > >   		unsigned int slot_state;
> > > +		xhci_warn(xhci, "Set TR Deq error for TRB 0x%llx in slot %d ep %u\n",
> > > +			  (unsigned long long)xhci_trb_virt_to_dma(ep->queued_deq_seg,
> > > +						ep->queued_deq_ptr),
> > 
> > Is printing this pointer actually useful? It doesn't tell why
> > the error happened. It will not relate to other messages - the
> > command failed, so dequeue stays at its old position.
> Printing the DMA address has turned out to be quite useful, quickly shows corner
> cases like end or beginning of ring segment, or address missing upper 32 bits.

Printing kernel addresses is not allowed.  If you really want to do
this, use the proper printk flag for it (%p I think).

> Comparable with the "trb not in TD" error messages

Should that be fixed too?  Again, don't print kernel addresses please,
people consider that an information leak.

thanks,

greg k-h

