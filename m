Return-Path: <linux-usb+bounces-936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7157B56E0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 31F8F282475
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC16C1D530;
	Mon,  2 Oct 2023 15:46:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFA1CFBE
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 15:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6377EC433C7;
	Mon,  2 Oct 2023 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696261612;
	bh=giO6yTDPYsIHUPl4IocJu5KNEwm8QrDYd0E9A53jQd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNWMof490ByBbYRaekI4eeVyhAPb8/GjD92mJuUyEYOdRercVeebtctz8uUzhyfcD
	 fRG+cj7ZdMCrlMHs/+3S7o1FNRbJSIMZWZiu0LxWDViF0cD13z4/l0EWNHf/A57rnF
	 j2ZXy2XNYU3obhiZXl9Wrv0ufCkcfmnl4M+0K/no=
Date: Mon, 2 Oct 2023 17:46:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: swarup <swarupkotikalapudi@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <2023100207-unmoved-arbitrary-2c33@gregkh>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
 <2023100253-aide-authentic-5aa1@gregkh>
 <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRrkbkjoHgEnuy/m@swarup-virtual-machine>

On Mon, Oct 02, 2023 at 09:10:30PM +0530, swarup wrote:
> On Mon, Oct 02, 2023 at 04:42:03PM +0200, Greg KH wrote:
> > On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> > > Fix kernel-doc warnings discovered in usb driver.
> > > Fixes this warning:
> > > warning: Function parameter or member 'gfladj_refclk_lpm_sel'
> > >          not described in 'dwc3'
> > > 
> > > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > > ---
> > >  drivers/usb/dwc3/core.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > What commit id does this fix?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> Please find the commit id as mentioned below,
> next time onwards i will mention it:
> 
> Fixes: 5cd07f96c0c6 ("usb: fix kernel-doc warning")

That is not a valid commit id in Linus's tree, are you sure it is
correct?

And please resend the patch with that information in it.

thanks,

greg k-h

