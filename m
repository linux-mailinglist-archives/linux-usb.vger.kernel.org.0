Return-Path: <linux-usb+bounces-15232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8997C680
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 11:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B85284D52
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654B71991C9;
	Thu, 19 Sep 2024 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ViGqjVYm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FE186294
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736563; cv=none; b=DvrIv/YT0WK/pnTGmJcJapkkVI7EUzSUCrYo6/7Astl2mcuwoMRPU+GkEcwNK/Dc92MP+2FNBlLgrNH1fcziz6GSMurxEypYR+MdAcyImTkeEHRRXuUwmQXvu+KMAEqBP/dbDmX1QhsXCrWOsF36LrjCx0CzurHMJPmJvUIOpHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736563; c=relaxed/simple;
	bh=ao8ZtYkh9U923dKaFaXDNmNfrB0wnjw0VZcOPCIt4e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb5srdfIRuyk01M8QgYARKX++RzL2pX5ONzeCPxILTqggrSiafJJYX+1v++wj2uPEsccIKcwewBfxvCPV6H18WiBxNq9rNJfM3nXJUimzECP9JUTStmv7zEDTAEZC25n+e4dZLZT2cn7ZUqcECIcvVDBzQU5JzSpTn7j+fi9jp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ViGqjVYm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D2AC4CEC4;
	Thu, 19 Sep 2024 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726736562;
	bh=ao8ZtYkh9U923dKaFaXDNmNfrB0wnjw0VZcOPCIt4e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViGqjVYmtlgxhilFivfRCEVR74p5T3SythXGejwfbvNSkL0dvoRXuWrNESBKQzzyo
	 7XDptC3jPrznFZcxC3yTJwdFMQ31XH/6lghHUGAc8KBg2KDALxaEQ1T5WOOD/ZYQaH
	 bDnOrNJuVeK22OLooBWe8muJvqJlXtCtr6v+oxik=
Date: Thu, 19 Sep 2024 10:09:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] Fix problem with xhci resume from suspend
Message-ID: <2024091905-grudge-jawline-84e7@gregkh>
References: <20240918204427.17251-1-jose.alberto.reguero@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918204427.17251-1-jose.alberto.reguero@gmail.com>

On Wed, Sep 18, 2024 at 10:44:27PM +0200, Jose Alberto Reguero wrote:
> ---
>  drivers/usb/host/xhci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index dc1e345ab67e..8f075ab63f65 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -76,6 +76,7 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
> +#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
>  
>  static const char hcd_name[] = "xhci_hcd";
> @@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>  		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> +		xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
>  		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
>  
> -- 
> 2.42.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

