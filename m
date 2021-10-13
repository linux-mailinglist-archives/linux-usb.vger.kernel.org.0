Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC33D42C695
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 18:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhJMQpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 12:45:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhJMQpB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 12:45:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E25160E54;
        Wed, 13 Oct 2021 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634143378;
        bh=cfGo6nb8Yi98w3LNbioZBoDEsxRuSDIu85XbWaDkWg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L80LerA03ZnTWGtutda/nui21y5WODXp/LEnfwx8wvYIYRIfrcYmldmsGrGSO6H45
         YYuXX3qUlC9ESPZTs/yBr7GvQkxhePkvugd3aCuAyZOI3kUGCBT68Vp+bx8FeQJWbA
         LoQj9sOjgjVNuQwO+0u+ymJ/9gf6uNz/2tzTuGiM=
Date:   Wed, 13 Oct 2021 18:42:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH 1/1] usb: xhci: Enable runtime-pm by default on AMD
 Yellow Carp platform
Message-ID: <YWcMkCR0U/sWGujD@kroah.com>
References: <20211013151633.67355-1-mathias.nyman@linux.intel.com>
 <20211013151633.67355-2-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013151633.67355-2-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 13, 2021 at 06:16:33PM +0300, Mathias Nyman wrote:
> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> 
> AMD's Yellow Carp platform supports runtime power management for
> XHCI Controllers, so enable the same by default for all XHCI Controllers.
> 
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-pci.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 2c9f25ca8edd..0e571d6af2ab 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -69,6 +69,12 @@
>  #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI			0x1242
>  #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI			0x2142
>  #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_1	0x161a
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_2	0x161b
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_3	0x161d
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_4	0x161e
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_5	0x15d6
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_XHCI_6	0x15d7

Please keep the ids aligned whenever possible.  Why is there not 2 tabs
being used here?

thanks,

greg k-h
