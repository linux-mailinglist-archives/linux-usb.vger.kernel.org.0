Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281A121AFE1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 09:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgGJHHx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 03:07:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgGJHHx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 03:07:53 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DA2F2077D;
        Fri, 10 Jul 2020 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594364873;
        bh=BvkMbxF8p9ePOnvbDwQMRLRHfDMC+k2cTE5KGnfyFng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dCCem0174HgReRB61ts5VlAlIeO+QeUb/sV0BQxtHfpKxM1rG4NrUlteBpeJAyxVu
         ym0TsOmbs6X1RR5CMGGscMyLfS28nNieP+1CNrxfL6ZGDJ/ihQImwH194/EgR2bkdw
         14ngeh+5rTgzYtWVqM/DToyzddPm8JDcyRNNZoFw=
Date:   Fri, 10 Jul 2020 09:07:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, yin1.li@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/2] usb: phy: Add USB3 PHY support for Intel LGM SoC
Message-ID: <20200710070758.GB1176018@kroah.com>
References: <20200617035818.54110-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200617035818.54110-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <87blknrjg6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blknrjg6.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 10, 2020 at 09:08:09AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> writes:
> 
> > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >
> > Add support for USB PHY on Intel LGM SoC.
> >
> > Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > ---
> >  drivers/usb/phy/Kconfig       |  11 ++
> >  drivers/usb/phy/Makefile      |   1 +
> >  drivers/usb/phy/phy-lgm-usb.c | 275 ++++++++++++++++++++++++++++++++++++++++++
> 
> new phy drivers should use drivers/phy instead.

Can we move all of the existing usb/phy drivers there too?

thanks,

greg k-h
