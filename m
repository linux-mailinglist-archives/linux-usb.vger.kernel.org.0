Return-Path: <linux-usb+bounces-17995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0709DFABF
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 07:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D67CEB212EB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 06:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6461F8AF6;
	Mon,  2 Dec 2024 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="syb3Q8NQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9433F6;
	Mon,  2 Dec 2024 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733121176; cv=none; b=agmZ2eMHU0SKn3b41TyoPbuQ74vBd6nzpM1eiOXt2kSp6C8AlWf0MGT+z/7Ssvmv3dk9nmgWcy0/8jL8uGvJImxE7uJq7hAmBdafAEMH12WwmiNStd0io+inSJRHtJUSzs4Pud7jRsNZONfmPUk051jtpEhkbY0xrfYYm9fVE6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733121176; c=relaxed/simple;
	bh=FKejrmxPaO2Kf6aanyz6BPixRTVTPy+IRBJ8nEgtwno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaXegmi1LB9I5kRW/ZT6Vt/LyH0JsoTRuKVQyHsINRcD3fmgD0wcu2xx6kt6+Rf90GSJaNoAC5fbPGPtaflvEWCLEA6h0AYrsgOcYh52Q2bHlMgKNi5WkTzF9JJo5iUxeyxKurDy9D/5jSAg4bDGwMktQFxx4AB4Ib9F4N2GsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=syb3Q8NQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1C6C4CED2;
	Mon,  2 Dec 2024 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733121176;
	bh=FKejrmxPaO2Kf6aanyz6BPixRTVTPy+IRBJ8nEgtwno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syb3Q8NQl4QlQIejvWOmznnidIBZIu5RYQoZOEMHKffK82hv68C1l+6zQIW4p6qKm
	 0VJuHNMNrTIIrk9ZUuefeazTYNXRKaWO2i1agqeXCVadvzNjr7NIaKm3tcNWvzQsj0
	 ZbPtgADbjkoT6fK5l1eBQwDQCOb0E+1hhvZkPOcU=
Date: Mon, 2 Dec 2024 07:32:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: host: Improve port index sanitizing
Message-ID: <2024120211-scruffy-query-1a50@gregkh>
References: <20241129113318.296073-1-xu.yang_2@nxp.com>
 <2024112946-undercut-ivory-5fe2@gregkh>
 <20241202023311.2q6bmef7wykymbno@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202023311.2q6bmef7wykymbno@hippo>

On Mon, Dec 02, 2024 at 10:33:11AM +0800, Xu Yang wrote:
> On Fri, Nov 29, 2024 at 01:14:35PM +0100, Greg KH wrote:
> > On Fri, Nov 29, 2024 at 07:33:18PM +0800, Xu Yang wrote:
> > > Coverity complains "Illegal address computation (OVERRUN)" on status_reg.
> > > This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
> > > improve port index sanitizing.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/host.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > > index 0cce19208370..442d79e32a65 100644
> > > --- a/drivers/usb/chipidea/host.c
> > > +++ b/drivers/usb/chipidea/host.c
> > > @@ -256,8 +256,14 @@ static int ci_ehci_hub_control(
> > >  	struct device *dev = hcd->self.controller;
> > >  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> > >  
> > > -	port_index = wIndex & 0xff;
> > > -	port_index -= (port_index > 0);
> > > +	/*
> > > +	 * Avoid out-of-bounds values while calculating the port index
> > > +	 * from wIndex. The compiler doesn't like pointers to invalid
> > > +	 * addresses, even if they are never used.
> > 
> > The compiler does not care so what does care?  Why is this needed if it
> > is never accessed?  This comment is odd to me.
> 
> I refer to Alan's comments[1]. So the compiler may report this issue on his
> side. On my side, the static analysis tool is Coverity from Synopsys. It's
> reporting that port_index may be bigger than HCS_N_PORTS_MAX(15). So
> illegal array pointer may be caculated. 
> 
> [1] https://lore.kernel.org/r/20211002190217.GA537967@rowland.harvard.edu
> 
> > 
> > thanks,
> > 
> > greg k-h
> > 
> > 
> > > +	 */
> > > +	port_index = (wIndex - 1) & 0xff;
> > > +	if (port_index >= HCS_N_PORTS_MAX)
> > > +		port_index = 0;
> > >  	status_reg = &ehci->regs->port_status[port_index];
> > 
> > So this is used?  But what controls wIndex here and how can it be too
> > big?
> 
> The wIndex stands for port number here. Actually wIndex won't be too big.
> However, the static analysis tool just see:
> 
>   port_index = wIndex & 0xff;
>   port_index -= (port_index > 0);
> 
> and it think the value of port_index is now between 0 and 254 (inclusive).
> 
> ehci_def.h define port_status as below:
> 
>   #define HCS_N_PORTS_MAX         15
>   u32     port_status[HCS_N_PORTS_MAX];
> 
> So the tool think illegal array pointer may be obtained.
> 
>   status_reg = &ehci->regs->port_status[port_index];

Many times, static analysis tools are just wrong :)

But ok, this makes a bit more sense, can you resend this with the
additional information in the changelog text?

thanks,

greg k-h

