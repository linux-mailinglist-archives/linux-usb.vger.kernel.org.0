Return-Path: <linux-usb+bounces-7080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F986762D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 14:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C09781F26A00
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 13:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5574F86627;
	Mon, 26 Feb 2024 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vTl2GAam"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A88595D
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708953163; cv=none; b=XaDmRnPs/OSiN+bV0KPeNhG0p4cJcfYLSCKzll937VdU+RcIPtphOMz/sEX0hu7OW11WlkdWR91B0IewIXcfgYsrpzcKl5GqBA5QThjRpP9tvhODJfvP84yi5KhZDRTNYwuWgMzQ2YUaOHi10D+RdSCDg/RMABcklrdAfEYkMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708953163; c=relaxed/simple;
	bh=KgHkhWrswVSawMCdCRgmfOLW20SJEGzPc7vOqK1eHzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWk22z3XJ+6soYdNmosVMA7bxll9ieFQAaqkGqhAKW0ITCavJKOd4MgiFA/FCN0FM3hhXDAgieL6SFnz9uUDmmc+5zQCllbNCRAI0K0XZcSx8/h19Hbw8nZqREH0edV9WwBcfRd2OgH5xbq/MPmJJDIihPhB094oZbKgFyKaO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vTl2GAam; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ACCC433F1;
	Mon, 26 Feb 2024 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708953163;
	bh=KgHkhWrswVSawMCdCRgmfOLW20SJEGzPc7vOqK1eHzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTl2GAamuAN/U1PjVkgqXJVFEcw7P2S1OWfiXu+T/V/0k9MVW0lrZZ90gXKnsaXfo
	 byqBja+kWTzVjZUTjJq0Lh9aCSbIQafKkpnyZJqgqzgDwy8XgZzouuRxp8HmM21Q3G
	 5uDRR+aFY2X3kaqlYmWrsbP9dOpeiBNCZV7Zo7v4=
Date: Mon, 26 Feb 2024 14:12:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	mario.limonciello@amd.com,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH] xhci: Allow RPM on the USB controller (1022:43f7) by
 default
Message-ID: <2024022616-paver-unified-1e29@gregkh>
References: <20240226123627.2144961-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226123627.2144961-1-Basavaraj.Natikar@amd.com>

On Mon, Feb 26, 2024 at 06:06:27PM +0530, Basavaraj Natikar wrote:
> The AMD USB host controller (1022:43f7) does not enter PCI D3 by default
> when nothing is connected. This is due to the policy introduced by
> 'commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
> xHC 1.2 or later devices")', which only covers 1.2 or later devices.
> 
> Therefore, by default, allow RPM on the AMD USB controller [1022:43f7].
> 
> Fixes: 4baf12181509 ("xhci: Loosen RPM as default policy to cover for AMD xHC 1.1")
> Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index b534ca9752be..1eb7a41a75d7 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -473,6 +473,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	/* xHC spec requires PCI devices to support D3hot and D3cold */
>  	if (xhci->hci_version >= 0x120)
>  		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> +	else if (pdev->vendor == PCI_VENDOR_ID_AMD && pdev->device == 0x43f7)
> +		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>  
>  	if (xhci->quirks & XHCI_RESET_ON_RESUME)
>  		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
> -- 
> 2.25.1
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


- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

