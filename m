Return-Path: <linux-usb+bounces-19673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B252BA1A5AD
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39C71884355
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74877211464;
	Thu, 23 Jan 2025 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GQKn7BP+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565013212A;
	Thu, 23 Jan 2025 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642173; cv=none; b=I8gbgIOgV7ROFnFAsJL2gOw3ZJsWYsSByHi+/e4UUxv7VRKddTlhq4O5nqbtalX8FNt6zdVC9pWT0otPsbcRwQMw46X9yymIbh0KwW0ClCsRyDkI/340K/JNg9s1lG/I6LArxTVZpRe3v74Wh5Rlg/6Ms8a3gcoFnykQTDg88tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642173; c=relaxed/simple;
	bh=0kFeA99w9bYSvFp8Sk1IUH4TZfp9C8cKbQus6xz21xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2iLLTc+7ai+MrG8ed0h8rQaKsc3Q9/jGrSEHSGdrWCpne6faBPOKDH198XN7mGirXEdfXHb2rDvnqgCcEJ7YPjBHodw5tyvspf3dqklQeT1uvbDyuHQgiUB3ofFKln1mlgZSmJJXfMD2I2XLkEF2pHM/7v4761BGaFNWhKTfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GQKn7BP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE553C4CED3;
	Thu, 23 Jan 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737642172;
	bh=0kFeA99w9bYSvFp8Sk1IUH4TZfp9C8cKbQus6xz21xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQKn7BP+rExLCA02FTu9CeTX3yefpGsEwM+4pGYI3IVRNi+zIHLy5PL1JlNS0ljaX
	 UD0Ta8ludtwK8zPQNAakraOu67ZBx5h5uJ+OTYdxEYBQp/jyCCqQ54EnQgne3HxWKw
	 rXUCJ9ROjdvKBw0q0hmiNrfYQL1zdnAgviUbqo5g=
Date: Thu, 23 Jan 2025 15:22:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Fix documentation warning for sg member
Message-ID: <2025012322-fit-flagship-381c@gregkh>
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <2025012315-feminine-spiny-b288@gregkh>
 <CAPSxiM9vF0=fzOovxC2nj1t1Naxx9T=QJPaN-oi5U-h7s5OwLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPSxiM9vF0=fzOovxC2nj1t1Naxx9T=QJPaN-oi5U-h7s5OwLQ@mail.gmail.com>

On Thu, Jan 23, 2025 at 07:47:18PM +0530, Usman Akinyemi wrote:
> On Thu, Jan 23, 2025 at 7:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jan 23, 2025 at 01:31:02PM +0530, Usman Akinyemi wrote:
> > > The 'sg' member in struct dwc3_request was undocumented, causing a
> > > documentation warning when building the kernel docs.
> > >
> > > This patch adds a description for the 'sg' field, resolving the warning.
> > >
> > > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> >
> > What commit id does this fix?  And what about the reported-by: line?
> >
> > thanks,
> >
> Hi Greg,
> 
> Thanks for replying.
> 
> I was applying to Linux Mentorship(LFX) for fixing the Linux Kernel Bugs.
> One of the tasks was to look for documentation warnings and I saw this.
> 
> I created a patch for it and sent it also. So, it is not reported.

It was, you might have missed it on the mailing list:
	https://lore.kernel.org/r/20250120182219.30dcb3c6@canb.auug.org.au

Also it still needs a "Fixes:" tag.

thanks,

greg k-h

