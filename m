Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309CE2A7D33
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 12:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbgKELhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 06:37:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:55408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbgKELhR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 06:37:17 -0500
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E8B220A8B;
        Thu,  5 Nov 2020 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604576235;
        bh=pBp+PSOlqYChMbjW9M+N2OTIL46RqNqDn9FBuRaY9bU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Y+576v7iNcj4kMvB35eysruJOQdkR348xg5HcGVS+tQDPuC9XKkqsXpLQUoSBhsun
         PdAvNWVMFWx4IIPB7wYaRk99EriNFgiEuUwNa8mObtwaUATKqOvyTaoveviaTkGLLa
         IatMWOcPLeZ+E44kK/jPZYO+06UVwDVNk7wBFM2A=
From:   Felipe Balbi <balbi@kernel.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default for Intel
 Maple Ridge xHCI
In-Reply-To: <20201105110031.8691-1-mika.westerberg@linux.intel.com>
References: <20201105110031.8691-1-mika.westerberg@linux.intel.com>
Date:   Thu, 05 Nov 2020 13:37:10 +0200
Message-ID: <87imakqbkp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Mika Westerberg <mika.westerberg@linux.intel.com> writes:
> Intel Maple Ridge is successor of Titan Ridge Thunderbolt controller. As
> Titan Ridge this one also includes xHCI host controller. In order to
> safe energy we should put it to low power state by default when idle.
  ^^^^
  save

> For this reason allow host runtime PM for Maple Ridge.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/usb/host/xhci-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index bf89172c43ca..d17e463087df 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -55,6 +55,7 @@
>  #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
>  #define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
>  #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
> +#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
>  
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
> @@ -238,7 +239,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
> -	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
> +	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI ||
> +	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI))
>  		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;

the ever growing list of quirks to *allow* PM :-) Perhaps the logic
should be inverted here and call a quirk to something that *can't*
handle PM?

-- 
balbi
