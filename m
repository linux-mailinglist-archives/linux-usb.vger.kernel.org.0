Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D123F2A7D7E
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 12:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgKELuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 06:50:12 -0500
Received: from mga04.intel.com ([192.55.52.120]:56552 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKELuM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 06:50:12 -0500
IronPort-SDR: HJFn/blQux31Rx8pKLeIRH96vyoN2TXJVFB9Te2abykNduBv7eMG5ZX8G5LbpekRRYcCqI5Vms
 V4HBlyq3TEKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="166777671"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="166777671"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:50:11 -0800
IronPort-SDR: w+s/FcFNRE74TnRnpWe2wZowUbn5Cg+PpABGnWC4uA0ZNj7WGYRjteBCpR7UzfATA0J2eD+Nym
 gmiPxztJEd4Q==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="539368444"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:50:08 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Nov 2020 13:50:06 +0200
Date:   Thu, 5 Nov 2020 13:50:06 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default for Intel
 Maple Ridge xHCI
Message-ID: <20201105115006.GH2495@lahna.fi.intel.com>
References: <20201105110031.8691-1-mika.westerberg@linux.intel.com>
 <87imakqbkp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87imakqbkp.fsf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 05, 2020 at 01:37:10PM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Mika Westerberg <mika.westerberg@linux.intel.com> writes:
> > Intel Maple Ridge is successor of Titan Ridge Thunderbolt controller. As
> > Titan Ridge this one also includes xHCI host controller. In order to
> > safe energy we should put it to low power state by default when idle.
>   ^^^^
>   save

Indeed, thanks.

> > For this reason allow host runtime PM for Maple Ridge.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/usb/host/xhci-pci.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index bf89172c43ca..d17e463087df 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -55,6 +55,7 @@
> >  #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
> >  #define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
> >  #define PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI		0x9a13
> > +#define PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI		0x1138
> >  
> >  #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
> >  #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
> > @@ -238,7 +239,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
> >  	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI ||
> >  	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI ||
> >  	     pdev->device == PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI ||
> > -	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI))
> > +	     pdev->device == PCI_DEVICE_ID_INTEL_TIGER_LAKE_XHCI ||
> > +	     pdev->device == PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_XHCI))
> >  		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
> 
> the ever growing list of quirks to *allow* PM :-) Perhaps the logic
> should be inverted here and call a quirk to something that *can't*
> handle PM?

I'm not a xHCI expert but I would expect that list to be even longer ;-)
