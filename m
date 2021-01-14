Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5AB2F5792
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbhANCCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:02:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:50594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727932AbhAMXWd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 18:22:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C0232339D;
        Wed, 13 Jan 2021 23:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610580060;
        bh=DjPgudHbrnHAGcPGdkrf9UfBtWEcCS9KiLS476ze6qA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XyBmY50wB5phYVMcRm3FMAMiQ1KgmcQP6WqXSqqi7eTaACdd5Q7Q0aUwMvEa5PH+g
         pQswJX2kbhdgg+vFwxZ+m21qpYKJ71XJVVyFibOMVrYa65IQnfR5m62wxYq5OKKInt
         /AsY/67mvjlMBfKD2KB3zCenYvYT9G57fps6myOuhXcDiUorWv4aMdhwh2pskTBbQE
         HiYt4v5Dpsd/J65Rp30w39ppSImgsU1/LM3ZGIGzCmC/QNcZ8FbXmnz1ip+Ca2L7zX
         RrsFfBmyPvpXtobOrVV8AVsSQvXt+eYgC/PghNzqtyD285NoFEoDSH14Vyo2D0rKOs
         Q/egy6ur/qvMw==
Received: by pali.im (Postfix)
        id D06427C5; Thu, 14 Jan 2021 00:20:57 +0100 (CET)
Date:   Thu, 14 Jan 2021 00:20:57 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: host: xhci-plat: fix support for
 XHCI_SKIP_PHY_INIT quirk
Message-ID: <20210113232057.niqamgsqlaw7gojw@pali>
References: <20201221150903.26630-1-pali@kernel.org>
 <20201223161847.10811-1-pali@kernel.org>
 <20201224055836.GB27629@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201224055836.GB27629@b29397-desktop>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday 24 December 2020 05:59:05 Peter Chen wrote:
> On 20-12-23 17:18:47, Pali Rohár wrote:
> > Currently init_quirk callbacks for xhci platform drivers are called
> > xhci_plat_setup() function which is called after chip reset completes.
> > It happens in the middle of the usb_add_hcd() function.
> > 
> > But XHCI_SKIP_PHY_INIT quirk is checked in the xhci_plat_probe() function
> > prior calling usb_add_hcd() function. Therefore this XHCI_SKIP_PHY_INIT
> > currently does nothing as prior xhci_plat_setup() it is not set.
> > 
> > Quirk XHCI_SKIP_PHY_INIT is only setting hcd->skip_phy_initialization value
> > which really needs to be set prior calling usb_add_hcd() as this function
> > at its beginning skips PHY init if this member is set.
> > 
> > This patch fixes implementation of the XHCI_SKIP_PHY_INIT quirk by calling
> > init_quirk callbacks (via xhci_priv_init_quirk()) prior checking if
> > XHCI_SKIP_PHY_INIT is set. Also checking if either xhci->quirks or
> > priv->quirks contains this XHCI_SKIP_PHY_INIT quirk.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > 
> > ---
> > Changes in v2:
> > * Check also xhci->quirks as xhci_priv_init_quirk() callbacks are setting xhci->quirks
> > * Tested with "usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720" patch
> > * Removed Fixes: line
> > ---
> >  drivers/usb/host/xhci-plat.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index 4d34f6005381..0eab7cb5a767 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -89,13 +89,6 @@ static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
> >  /* called during probe() after chip reset completes */
> >  static int xhci_plat_setup(struct usb_hcd *hcd)
> >  {
> > -	int ret;
> > -
> > -
> > -	ret = xhci_priv_init_quirk(hcd);
> > -	if (ret)
> > -		return ret;
> > -
> >  	return xhci_gen_setup(hcd, xhci_plat_quirks);
> >  }
> >  
> > @@ -330,7 +323,14 @@ static int xhci_plat_probe(struct platform_device *pdev)
> >  
> >  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> >  	xhci->shared_hcd->tpl_support = hcd->tpl_support;
> > -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> > +
> > +	if (priv) {
> > +		ret = xhci_priv_init_quirk(hcd);
> > +		if (ret)
> > +			goto disable_usb_phy;
> > +	}
> > +
> > +	if ((xhci->quirks & XHCI_SKIP_PHY_INIT) || (priv && (priv->quirks & XHCI_SKIP_PHY_INIT)))
> >  		hcd->skip_phy_initialization = 1;
> 
> I am not sure if others agree with you move the position of
> xhci_priv_init_quirk, Let's see Mathias opinion.

Hello! Do you have an opinion how to handle this issue? As currently it
is needed for another patch which is fixing issue/regression in xhci-mvebu:
https://lore.kernel.org/linux-usb/20201223162403.10897-1-pali@kernel.org/
