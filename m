Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F306C3B729
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390781AbfFJOVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:53586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390708AbfFJOVE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:21:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8887207E0;
        Mon, 10 Jun 2019 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560176464;
        bh=eoMjWnQ0ixXdPIe46Sfe4mWspAVGRjF9LS9dORV46kA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZpgwwAYvXbB54AruQ+Gjnqb5x1QrlSdmfqlcScT0K01y3q1dI3LcsrFo04tNadgge
         V6q37DybB/mULHnRaYvX/ezInMaA/lPCgk5xBU2AY5iw/DVO4AQiOAyi5b2P3Anksi
         P0Eklu1YvVffKCmDJS7bDzppgK0uicalWn6Sm2xA=
Date:   Mon, 10 Jun 2019 16:21:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: fsl_udc status?
Message-ID: <20190610142101.GB5937@kroah.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
 <87v9xdc1ra.fsf@linux.intel.com>
 <9171a0e63bebaa0efaec64838f9a1c6982fc33e8.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9171a0e63bebaa0efaec64838f9a1c6982fc33e8.camel@infinera.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 10, 2019 at 08:33:17AM +0000, Joakim Tjernlund wrote:
> On Mon, 2019-06-10 at 10:56 +0300, Felipe Balbi wrote:
> > Hi,
> > 
> > Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
> > > We are trying to get fsl_udc up and running on a T1042 with without success.
> > > Seems like this driver is lagging behind the corresponding host driver(mph).
> > > The mph driver has a number of USB errata workarounds while udc has none.
> > > At least erratas A007792 seems applicable for udc too.
> > >
> > > Is the fsl_udc driver functional on 4.14.x(which we use)? What is missing ?
> > 
> > If you're on v4.14, then you need to ask for support from whoever gave
> > you that kernel. In this forum we treat mainline only, which currently
> > is at v5.2-rc4. Unless you can try that version of the kernel, we can't
> > really help you here.
> 
> None gave me that kernel, it is the stable 4.14.x tree that Greg maintains, I would
> assume that this forum has some support for stable kernels too?

ONLY use a older LTS kernel if you already have a device up and working
properly and you need "long term" support for it.  Do NOT use it for
bringing up a new device and expecting everything to work properly on it
at all.  That should only be done on the latest stable release, and
sometimes, if you are using an older system, on the latest LTS release.

4.14.y is neither the latest LTS release, nor the latest stable release.
Please try either 4.19.y or 5.1 to see if Linux even works on this
device.  If so, then worry about running an older kernel (but you really
do not want to do that anyway.)

> Looking at upstream, there has not been any significant change in this
> area for a long time.

There are lots and lots of changes that have happened all over the
kernel tree since 4.14.0 was released.  Don't assume things are not
connected at all, they are not.

So please, try 5.1, and if that doesn't work, we will be glad to help
you out.

If you insist on using 4.14 for a device you do not even know if it
works or not, you really are on your own.

thanks,

greg k-h
