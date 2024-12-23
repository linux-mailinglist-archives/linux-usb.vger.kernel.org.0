Return-Path: <linux-usb+bounces-18741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB29FB3AD
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 18:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9F1D166639
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 17:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF701B87C6;
	Mon, 23 Dec 2024 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PYfcoiIn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3270170A13;
	Mon, 23 Dec 2024 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734976018; cv=none; b=aVH+JHROxR9JTj/hiVJnmayecXpJzHEvl1dQlZEc81iqFUz6Ol6J6C0IDXtzUwFw/nqWrZNveBmRy5cA7UoyCFwOHAFiYrCoVG1QgS03DaCNzfSiHoV+T8rEOvdt603zadzIZzoPxsxW2XAcExY++Gt2kyf3EidiuTWrSjLKhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734976018; c=relaxed/simple;
	bh=B9zCJUqpoc3vvBjDEOXyj2me1DRRugPlKmGTbz0b8zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e83d6yligUEvwkNVKZXyH1x4PlZNnwlHTZo9SK+avVO3hxpWbrAkAoDTrQMtlJPskEbC2JhU7JYMAY/3h9Hrl2eIQ+vbbcICOqI0hg5+KwYTx156lJZko5vXmjmghL8nnrIwej3sSDhLO2Fuj0FZKBoYsaVC9dwPlVn5G07FgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PYfcoiIn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D86C4CED3;
	Mon, 23 Dec 2024 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734976017;
	bh=B9zCJUqpoc3vvBjDEOXyj2me1DRRugPlKmGTbz0b8zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYfcoiInuRvOBJYP/msr9wj0WGgPaZWT+LF3hzhM11EYMMEU9Y7FTKd3s2i9wFV2O
	 vKS6z6/db+WjE/jB+0pxRABrIC6XI4K6NZJu7gH/knSd/PZ3FipR6ZjtxQABAffkeG
	 DiBn6hCh9AAV7qHhh/YiJPHeeL0Ztd6+LdkkYlro=
Date: Mon, 23 Dec 2024 18:30:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] usb: gadget: m66592-udc: Add check for clk_enable()
Message-ID: <2024122307-thaw-payback-b175@gregkh>
References: <20241215205358.4100142-1-zmw12306@gmail.com>
 <2024121606-preflight-lure-e02c@gregkh>
 <CAN4iqtQGJw+Nyt_K+uMSfpqXhfzGN4nLmFTPdEydyAf_wsWMog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN4iqtQGJw+Nyt_K+uMSfpqXhfzGN4nLmFTPdEydyAf_wsWMog@mail.gmail.com>

On Tue, Dec 17, 2024 at 10:06:26PM -0500, Mingwei Zheng wrote:
> Hi Greg,
> 
> On Mon, Dec 16, 2024 at 2:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Dec 15, 2024 at 03:53:58PM -0500, Mingwei Zheng wrote:
> > > Add check for the return value of clk_enable() to catch the potential
> > > error.
> > >
> > > Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use module_platform_driver()")
> > > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> >
> > Why this order of signed-off-by lines?  Shouldn't yours be last?  Who
> > wrote this patch?
> >
> 
> I listed two names because both of us co-authored this patch.
> 
> > > ---
> > >  drivers/usb/gadget/udc/m66592-udc.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
> > > index a938b2af0944..bf408476a24c 100644
> > > --- a/drivers/usb/gadget/udc/m66592-udc.c
> > > +++ b/drivers/usb/gadget/udc/m66592-udc.c
> > > @@ -1606,7 +1606,11 @@ static int m66592_probe(struct platform_device *pdev)
> > >                       ret = PTR_ERR(m66592->clk);
> > >                       goto clean_up2;
> > >               }
> > > -             clk_enable(m66592->clk);
> > > +             ret = clk_enable(m66592->clk);
> > > +             if (ret) {
> > > +                     clk_put(m66592->clk);
> > > +                     goto clean_up2;
> > > +             }
> >
> > How did you find this and how was it tested?
> >
> > thanks,
> >
> > greg k-h
> 
> We found it through a static analysis tool.

Then you need to properly document that as our documentation says it is
required, right?

thanks,

greg k-h

