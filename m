Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30D6178D02
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 10:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387626AbgCDJCv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 04:02:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:59320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387473AbgCDJCu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 04:02:50 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 804FA20870;
        Wed,  4 Mar 2020 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583312570;
        bh=d1d7T8bhYI6RdCBRlzoxxnWI5VOqnAQwwNJieXXrTXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ShAHlSwNGNGkTu5uV62qoSLw5L8bD3bkQv/j55ixmEyofa5ndn6/R4lBLnpQKm76P
         dCC41gY36t78FnaBufnW1uGJOgCNFp8qKytN2Hauu/GOMFm+yiOEKcSC7z+9xtRU3s
         h9yNyKVT2XhJ3yJy77sdzjWdimY4jqp2NE+ylq/Q=
Date:   Wed, 4 Mar 2020 10:02:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Alberto Mattea <alberto@mattea.info>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH resend] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI
 controller 1022:145c
Message-ID: <20200304090246.GB1429273@kroah.com>
References: <5338586.DvuYhMxLoT@alby>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5338586.DvuYhMxLoT@alby>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 17, 2020 at 05:54:19PM +0100, Alberto Mattea wrote:
> This controller timeouts during suspend (S3) with
> [  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
> [  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
> thus preventing the system from entering S3.
> Moreover it remains in an undefined state where some connected devices stop
> working until a reboot.
> Apply the XHCI_SUSPEND_DELAY quirk to make it suspend properly.
> 
> Signed-off-by: Alberto Mattea <alberto@mattea.info>
> ---
>  drivers/usb/host/xhci-pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 4917c5b033fa..1533310b3d6b 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -135,7 +135,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		xhci->quirks |= XHCI_AMD_PLL_FIX;
>  
>  	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
> -		(pdev->device == 0x15e0 ||
> +		(pdev->device == 0x145c ||
> +		 pdev->device == 0x15e0 ||
>  		 pdev->device == 0x15e1 ||
>  		 pdev->device == 0x43bb))
>  		xhci->quirks |= XHCI_SUSPEND_DELAY;
> -- 
> 2.17.1
> 
> 

$ ./scripts/get_maintainer.pl --file drivers/usb/host/xhci-pci.c
Mathias Nyman <mathias.nyman@intel.com> (supporter:USB XHCI DRIVER)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:USB XHCI DRIVER)
linux-kernel@vger.kernel.org (open list)


{sigh}

Always include the maintainer of the driver in your cc: list.

I've added Mathias to this message now, hopefully he can pick this up
for his next round of patches.

thanks,

greg k-h
