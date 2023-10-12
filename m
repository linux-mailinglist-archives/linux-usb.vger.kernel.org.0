Return-Path: <linux-usb+bounces-1510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C77C7046
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960751C209C6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 14:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C2A31A6B;
	Thu, 12 Oct 2023 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eORk5bk9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FE1EA95
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 14:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3F4C433C7;
	Thu, 12 Oct 2023 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697120950;
	bh=0zepIBMYqAlKUO2MDAqi4ujk5GjeQTtEjMF27O3SY1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eORk5bk9QWyM1mxIY6B0dMMFC/ITZh0n3PfEJ/gBXGEkKmBTqRae24uq5Wh2XtbKv
	 cpOkoNItYL/AiO+VVDoSBUaF169h+TK6uBj2VlfHvM3gkD9ivRX82z2/ulIOLV4Tu1
	 8nh0/N6MAlKSYiq0CqiTYvofAginQZ/4SibKu6OOqoN2imTjAgIoVBn6i9SvTrFf3r
	 B/hfau1Dz33T8SaTWPJnNGcYLXxJzqXPXhss9CYR6Jg6rU+/BZaxt7nWPaVijcgb1k
	 9skIDbZP+VMr3OsHyReprmFmRU73KcPMC7iZwz/bMmwkV3w/KxI+V2k197Ecq1eyLI
	 nX7mJocuZ48cg==
Date: Thu, 12 Oct 2023 22:28:59 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Peter Geis <pgwipeout@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: chipidea: Simplify Tegra DMA alignment code
Message-ID: <20231012142859.GC1010588@nchen-desktop>
References: <cover.1695934946.git.mirq-linux@rere.qmqm.pl>
 <a0d917d492b1f91ee0019e68b8e8bca9c585393f.1695934946.git.mirq-linux@rere.qmqm.pl>
 <ZScZWFJCCMr7oWwX@orome.fritz.box>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZScZWFJCCMr7oWwX@orome.fritz.box>

On 23-10-11 23:53:28, Thierry Reding wrote:
> On Thu, Sep 28, 2023 at 11:06:03PM +0200, Michał Mirosław wrote:
> > The USB host on Tegra3 works with 32-bit alignment. Previous code tried
> > to align the buffer, but it did align the wrapper struct instead, so
> > the buffer was at a constant offset of 8 bytes (two pointers) from
> > expected alignment.  Since kmalloc() guarantees at least 8-byte
> > alignment already, the alignment-extending is removed.
> > 
> > Fixes: fc53d5279094 ("usb: chipidea: tegra: Support host mode")
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/usb/chipidea/host.c | 45 +++++++++++++++----------------------
> >  1 file changed, 18 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index abddd39d1ff1..0cce19208370 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -30,8 +30,7 @@ struct ehci_ci_priv {
> >  };
> >  
> >  struct ci_hdrc_dma_aligned_buffer {
> > -	void *kmalloc_ptr;
> > -	void *old_xfer_buffer;
> > +	void *original_buffer;
> >  	u8 data[];
> >  };
> >  
> > @@ -380,60 +379,52 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
> >  	return 0;
> >  }
> >  
> > -static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb)
> > +static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb, bool copy_back)
> >  {
> >  	struct ci_hdrc_dma_aligned_buffer *temp;
> > -	size_t length;
> >  
> >  	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
> >  		return;
> > +	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
> 
> This threw me off a bit until I realized it was already there
> previously, just in a different place. Is there a particular reason why
> this is moved?
> 
> Regardless, this looks fine, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

