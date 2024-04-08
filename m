Return-Path: <linux-usb+bounces-9028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0ED89B958
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 09:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4CFD281757
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 07:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465C638DF2;
	Mon,  8 Apr 2024 07:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w2XAAWod"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96138DEC
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562588; cv=none; b=iGD2diFyMJ2Xj6YW0lmSifdGe8Ah0VOcP0v9TLdqL5EfaVJDStl6h102Gxtz78+M/yo276ouKrp5l6jsCImvPaL6mgFT00j/VaVbVqmnUwSClMituZ34Sj3414ivltTq7gkk+d9z7ZYQd6GzzLSzLvJge+fBS4r4OcJhvtFAZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562588; c=relaxed/simple;
	bh=CfXkCQjOYbBcIsKSAALWc4xDDdSVOag1GrRr/QPtLEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I33933ng8zi3UnXsAiV/eu4Ku0rfuRz+bP6HxuXvURmSHWBLAxECtQgiLwdXMtGyPru5EV+ucFkhZdPRgSFaj3kHsR9Sb0yd5pGP1RivsC75GZ+CondvSUCtbD+4WO/nkFF+iS38ASgS57a/9DA+0bkDpowidYQkduwvnrxficE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w2XAAWod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E51C43394;
	Mon,  8 Apr 2024 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712562588;
	bh=CfXkCQjOYbBcIsKSAALWc4xDDdSVOag1GrRr/QPtLEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w2XAAWoduTHQF51z9GDYKSscPJTiknHrqBg7bISpalsoEsDHWwMx7X5tYWlaoznga
	 8mSgnZft5ksoaF7deqoxEO/js/dXzTB2ERcetZu105wtu52HOOhtvwf6dFsy8rw4Jc
	 LaY1Lg3EiruNt0t1xO7NSV5cKEwOoFmQu+94Dp1s=
Date: Mon, 8 Apr 2024 09:49:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [bug report] usb: dwc2: host: Fix ISOC flow in DDMA mode
Message-ID: <2024040834-ethically-rumble-701f@gregkh>
References: <ab2cc5d9-3fc9-43a2-abe8-a20338bdcd02@moroto.mountain>
 <3a1e01ca-a491-2739-e47c-6a71b610f400@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a1e01ca-a491-2739-e47c-6a71b610f400@synopsys.com>

On Mon, Apr 08, 2024 at 06:04:42AM +0000, Minas Harutyunyan wrote:
> Hi Greg,
> 
> On 4/5/24 14:09, Dan Carpenter wrote:
> > Hello Minas Harutyunyan,
> > 
> > This is a semi-automatic email about new static checker warnings.
> > 
> > Commit b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
> > from Mar 13, 2024, leads to the following Smatch complaint:
> > 
> >      drivers/usb/dwc2/hcd_ddma.c:874 dwc2_cmpl_host_isoc_dma_desc()
> >      warn: variable dereferenced before check 'qtd->urb' (see line 870)
> > 
> > drivers/usb/dwc2/hcd_ddma.c
> >     869		u16 frame_desc_idx;
> >     870		struct urb *usb_urb = qtd->urb->priv;
> >                                        ^^^^^^^^^^
> > The patch adds a dereference
> > 
> >     871		u16 remain = 0;
> >     872		int rc = 0;
> >     873	
> >     874		if (!qtd->urb)
> >                      ^^^^^^^^^
> > The existing check is too late now
> > 
> >     875			return -EINVAL;
> >     876	
> > 
> > regards,
> > dan carpenter
> 
> Should I send new version of this patch or should develop fixup patch to 
> be applied to "usb-linus" branch?

A fixup patch please, I can not rebase this tree.

thanks,

greg k-h

