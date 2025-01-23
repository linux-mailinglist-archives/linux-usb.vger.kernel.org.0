Return-Path: <linux-usb+bounces-19683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CADA1A774
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55EBA168B07
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA7C21325E;
	Thu, 23 Jan 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O6B4wrBb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F1212FB4;
	Thu, 23 Jan 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647883; cv=none; b=bTyaeDeiOlpp3cu2QkEGshHCAkxFuXa5rH5CpbkC5jCupHfkj3Y8AXLujYShSEEm4DrQFZo54a1TQdTvwcGAy86RYUhWW90adIR4LZpkthaTqu2vgAf5bV2SZFCMjRwjusG9drsqzbRUFahkQjVc22O1wbgPODXswzBlzTR5LgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647883; c=relaxed/simple;
	bh=EYk5tYrgomuvG6I8nsPPS+VFjRK9UyLfFz8DPd/KFmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhpdwkbOHzSBZE/DHIgSJjYzGUoC6P3fDHq8aDOCX1ctseGzmzHOvAHyuPqW9g3A38Ax+R14qY0GHdVc24q8akK4fWNkRmo2Kb1brqsNUNtZWIMiSHjzzrIhIZ9VPD/1ttovMsCPPQLi+c0pBdWCDtnNUEouuhXnnxMSnEcA1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O6B4wrBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0BFC4CED3;
	Thu, 23 Jan 2025 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737647882;
	bh=EYk5tYrgomuvG6I8nsPPS+VFjRK9UyLfFz8DPd/KFmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6B4wrBbndtYuM17E5egA4qQVfQ7jEKDqpbsCRETrLbEeOhD8SfL51N+QWEHFJ0ZN
	 +cAMK7ZwiysyjQzDcvzwir9kyPELoVBU5PY8tXEZtaLWcYmXlPL0T8kMZQ2Ia83lP4
	 oynmM903m44QBDGTiIOU+mYxRbKPn/HMaKtL/JM0=
Date: Thu, 23 Jan 2025 16:57:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] usb: dwc3: Fix documentation warning for sg member
Message-ID: <2025012332-bogus-fried-b840@gregkh>
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <20250123151335.15878-1-usmanakinyemi202@gmail.com>
 <2025012309-catfight-tightly-32f9@gregkh>
 <CAPSxiM8wejNRNU04MN6y78aR519GuYrSHe2gV_R-Eim7y7VeqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPSxiM8wejNRNU04MN6y78aR519GuYrSHe2gV_R-Eim7y7VeqA@mail.gmail.com>

On Thu, Jan 23, 2025 at 09:22:01PM +0530, Usman Akinyemi wrote:
> On Thu, Jan 23, 2025 at 9:08 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jan 23, 2025 at 08:43:35PM +0530, Usman Akinyemi wrote:
> > > The 'sg' member in struct dwc3_request was undocumented, causing a
> > > documentation warning when building the kernel docs.
> > >
> > > This patch adds a description for the 'sg' field, resolving the warning.
> > >
> > > Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> > > ---
> > >  drivers/usb/dwc3/core.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > > index ee73789326bc..0c417a12e6f4 100644
> > > --- a/drivers/usb/dwc3/core.h
> > > +++ b/drivers/usb/dwc3/core.h
> > > @@ -941,6 +941,7 @@ struct dwc3_hwparams {
> > >   * @request: struct usb_request to be transferred
> > >   * @list: a list_head used for request queueing
> > >   * @dep: struct dwc3_ep owning this request
> > > + * @sg: pointer to a scatterlist for DMA operations
> > >   * @start_sg: pointer to the sg which should be queued next
> > >   * @num_pending_sgs: counter to pending sgs
> > >   * @remaining: amount of data remaining
> > > --
> > > 2.48.0
> >
> > Wait, what kernel is this based on?  This structure does not have the
> > @sg field in it anymore in linux-next, so why is this warning still
> > showing up?
> >
> > confused,
> Ohh, sorry, this is the 6.13.0 version, right from Linus fork on Git.
> 
> Maybe, it is already being fixed and I did not have the latest update
> as I have some new commits.

Please always work off of linux-next when doing development so that you
don't end up duplicating the work others have already done.

thanks,

greg k-h

