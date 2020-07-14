Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D95C21EE1B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgGNKhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 06:37:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgGNKhn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 06:37:43 -0400
Received: from Mani-XPS-13-9360 (unknown [103.59.133.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34BB722202;
        Tue, 14 Jul 2020 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594723062;
        bh=QVOa/y0vX1PcyCRse2oUjr081DvV0mM27MqJ+ww2N+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gSQJ4dWLv07Kj4mYzWToESTvci2ya5KWUX158gm8wC2ZQaYlj4uXhlgE00+PltW5z
         0N+/1UDU5bYfuKybBGbf/3EQD6KuzoO7PVlx4t0EXaH8LB/uLPn44lktDOkBxABdxI
         GGJhXyLA2uJomHgxZpsP7QMdsdAeXam63boQhD30=
Date:   Tue, 14 Jul 2020 16:07:27 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
Message-ID: <20200714103727.GA2626@Mani-XPS-13-9360>
References: <20200709222126.5055-1-angelo.dureghello@timesys.com>
 <20200714100851.GB3453@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714100851.GB3453@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Jul 14, 2020 at 12:08:51PM +0200, Johan Hovold wrote:
> On Fri, Jul 10, 2020 at 12:21:26AM +0200, Angelo Dureghello wrote:
> > From some researches, this driver is available from the IC
> > constructor site, but for older kernel versions. From there, decided
> > to add a much simplier mainline version, written from scratch.
> 
> Do you have a pointer to the vendor sources for reference?
> 
> > This initial simple version is implemented without any flow control,
> > tested mainly at 115200, but all standard baud rates are supported
> > and applied as per serial terminal settings.
> > 
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

Just curious, how are you accessing this chip? I mean any breakout board
or integrated in any custom board design.

> > Reported-by: kernel test robot <lkp@intel.com>
> 
> No need for a reported-by if the robot catches issues during review.
> Just mention it in the changelog as you already did below.
> 
> > ---
> > Changes for v2:
> > - fix test robot warning, PARITY_ defines renamed
> > ---
> >  drivers/usb/serial/Kconfig     |   9 +
> >  drivers/usb/serial/Makefile    |   1 +
> >  drivers/usb/serial/xr21v1412.c | 361 +++++++++++++++++++++++++++++++++
> >  3 files changed, 371 insertions(+)
> >  create mode 100644 drivers/usb/serial/xr21v1412.c
> 
> Thanks for the submitting this.
> 
> There was another driver for this device posted recently, and which
> appears to have more features:
> 
> 	https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org
> 
> Would you mind taking a look and see if that one would work for you?
> 
> I had some comments on the latest version that needs to be addressed,
> but I'm assuming Manivannan is working on a v5?
> 

Yes! This driver is being worked on in my limited spare time. So I'm a bit
late to reiterate the patchset but planning to send v5 around this weekend.

Thanks,
Mani

> Johan
