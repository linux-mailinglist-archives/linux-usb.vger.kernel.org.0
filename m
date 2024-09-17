Return-Path: <linux-usb+bounces-15195-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128A97B4E1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 22:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C49ECB225AE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 20:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0371D1917C9;
	Tue, 17 Sep 2024 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="czwqEBEA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0EA13C3D5
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726605941; cv=none; b=sSA3er5L74scAg6hTsC/D/gT0+D1brIcZHaB6OFi0hPS6N6g2zwa8Kl9lNYLwmQJ76xEZHdRE3i8cOcI5j+VtSm3EryIMJH/hOpZjAc1FAJ+PF4NX4wDf388t4Hi/f8vkVCt2uGpYPwVSVnHpjbtbst4qL1f9lhvNHhHmXl4g8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726605941; c=relaxed/simple;
	bh=t527FZ2dUKRQXa8PZ/yilT72OIBfuNtYnBazVFUSHpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anDRsgg/uWxKnicMUQ/Vlpnh7xvym/o0iHkrq37ng8VC6QuR965AjtvEGnd1qrT7s71T+SvI0ANOXMZL9E85P6QALr3hs0QJPLeepcQCNsAXo+aSYqfR3OWR5NtiNixyhFS1oAyTu2x3rgRxxKE/B5HqABKOlsdeXW/2VKALjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=czwqEBEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67F5C4CEC5;
	Tue, 17 Sep 2024 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726605941;
	bh=t527FZ2dUKRQXa8PZ/yilT72OIBfuNtYnBazVFUSHpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czwqEBEAgJiNMkMo+ywC0hY2WUvQxQfasbc/DG/Kw2bSVzEZrjVrm/ClhX9z9ignr
	 A3kL1mxrMQasrL5c19F7lCo4M0o4gjlZfKFlYyYdWwho7H0ge3M0O1e51l8z9SG7WG
	 0hudeJhR+Fkl86oZwVA2SW1uwYbr1rnHJ7VyFfks=
Date: Tue, 17 Sep 2024 22:45:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: PATCH: Fix problem with xhci resume from suspend
Message-ID: <2024091756-gathering-ocean-ba9c@gregkh>
References: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>

On Tue, Sep 17, 2024 at 08:47:43PM +0200, Jose Alberto Reguero wrote:
> I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD,
> and other from ASMEDIA. The one from ASMEDIA have problems when resume
> from suspend, and keep broken until unplug the  power cord. I use this
> kernel parameter: xhci-hcd.quirks=128 and then it works ok. I make a
> path to reset only the ASMEDIA xhci.
> 
> 
> Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
> 
> diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
> linux-6.10.8.new/drivers/usb/host/xhci-pci.c
> --- linux-6.10.8/drivers/usb/host/xhci-pci.c 2024-09-04 13:30:16.000000000 +0200
> +++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c 2024-09-12
> 19:37:14.378870385 +0200
> @@ -76,6 +76,7 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI 0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242
> 
>  static const char hcd_name[] = "xhci_hcd";
> @@ -447,6 +448,10 @@
>   pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>   xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> 
> + if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> + pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> + xhci->quirks |= XHCI_RESET_ON_RESUME;

Something went wrong with the whitespace here, can you try sending it
again?  You can't use cut/paste from a web client for patches, the email
documentation should explain how to do this properly from gmail if you
have problems.

thanks,

greg k-h

