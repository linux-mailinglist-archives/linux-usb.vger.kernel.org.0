Return-Path: <linux-usb+bounces-15209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BAA97B77C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 07:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC66DB21E59
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 05:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BBB13B787;
	Wed, 18 Sep 2024 05:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GvMnIx0s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1228EF
	for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2024 05:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726637951; cv=none; b=ZQc5uTP6zkCNj55qeGEHVNuRj3BmAc1ihlZ40GfRTUf8Ard7ys84YRYBHNd2BgSZJ0J3SsOtlKnyrdq9sNSOuZiA+Vqnny8dmMzvZs2FF+ThtMfM8sacjvFoXfOx8K0NaAvJ3XiXvBBiRPoVrPGf5PeufCjW7LkLq9DBLeBZMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726637951; c=relaxed/simple;
	bh=aMrS9HSO0aYG30GaxBoOxOSic0rtJEIfq6zmGrGaTVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUZksGdiSSBES+uxvWrb7tuX5b+2cM3MsE/kH95utsNjL1HEJHL4p4KrsUUArTAvdvUH4dtiW2VBYFqg2n0Szr3aYqoOsPVSPEj4RDrRzsy2M4nY2kAoAN17Fi/jJLeVIUZwduWmhm8/cdzUP/CnfOGI99so+27YJbpfKuTwJH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GvMnIx0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F1DC4CEC3;
	Wed, 18 Sep 2024 05:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726637950;
	bh=aMrS9HSO0aYG30GaxBoOxOSic0rtJEIfq6zmGrGaTVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvMnIx0sa9lZK91Bpl/dqN8HxdamETI/c8FS9Pyq2oWPqpSAYtKMKcnyyhi6Nm0tI
	 eiMFzwcwHFcLQYSAoiiKh5jksDtAwOB+0XDEFjOEj3QMifzoDGfHtidLv4jFyFYQiz
	 +EK/YkKhI1HJln/WR3CjejY+3JzLNiFxJ2213kKg=
Date: Wed, 18 Sep 2024 07:39:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: jose.alberto.reguero@gmail.com
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: PATCH: Fix problem with xhci resume from suspend
Message-ID: <2024091824-village-surgery-c283@gregkh>
References: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
 <2024091756-gathering-ocean-ba9c@gregkh>
 <018846f9a846e70d22f31203e4e8e93a1ee58de1.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <018846f9a846e70d22f31203e4e8e93a1ee58de1.camel@gmail.com>

On Wed, Sep 18, 2024 at 12:10:24AM +0200, jose.alberto.reguero@gmail.com wrote:
> El mar, 17-09-2024 a las 22:45 +0200, Greg KH escribió:
> > On Tue, Sep 17, 2024 at 08:47:43PM +0200, Jose Alberto Reguero wrote:
> > > I have a ASUS PN51 S mini pc that has two xhci devices. One from
> > > AMD,
> > > and other from ASMEDIA. The one from ASMEDIA have problems when
> > > resume
> > > from suspend, and keep broken until unplug the  power cord. I use
> > > this
> > > kernel parameter: xhci-hcd.quirks=128 and then it works ok. I make
> > > a
> > > path to reset only the ASMEDIA xhci.
> > > 
> > > 
> > > Signed-off-by: Jose Alberto Reguero
> > > <jose.alberto.reguero@gmail.com>
> > > 
> > > diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
> > > linux-6.10.8.new/drivers/usb/host/xhci-pci.c
> > > --- linux-6.10.8/drivers/usb/host/xhci-pci.c 2024-09-04
> > > 13:30:16.000000000 +0200
> > > +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c 2024-09-12
> > > 19:37:14.378870385 +0200
> > > @@ -76,6 +76,7 @@
> > >  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
> > >  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
> > >  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
> > > +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI 0x3042
> > >  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
> > > 
> > >  static const char hcd_name[] = "xhci_hcd";
> > > @@ -447,6 +448,10 @@
> > >   pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> > >   xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> > > 
> > > + if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> > > + pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> > > + xhci->quirks |= XHCI_RESET_ON_RESUME;
> > 
> > Something went wrong with the whitespace here, can you try sending it
> > again?  You can't use cut/paste from a web client for patches, the
> > email
> > documentation should explain how to do this properly from gmail if
> > you
> > have problems.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sorry, submit it again. Hope this time is alright.
> 
> Jose Alberto Reguero
> 
> diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c linux-
> 6.10.8.new/drivers/usb/host/xhci-pci.c
> --- linux-6.10.8/drivers/usb/host/xhci-pci.c	2024-09-04
> 13:30:16.000000000 +0200
> +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c	2024-09-12
> 19:37:14.378870385 +0200
> @@ -76,6 +76,7 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
>  
>  static const char hcd_name[] = "xhci_hcd";
> @@ -447,6 +448,10 @@
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>  		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> +		xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device ==
> 0x8241)

It is line-wrapped :(

Try sending it to yourself first, and then see if you can apply it to
the tree from that email.

Or use 'git send-email' that will do it all properly for you, we
recommend that.

thanks,

greg k-h

