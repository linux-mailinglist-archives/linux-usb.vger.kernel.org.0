Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C513D39D931
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 11:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhFGKA0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 06:00:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54896 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFGKAZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 06:00:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77A8B8DB;
        Mon,  7 Jun 2021 11:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623059913;
        bh=iUkngMyy9jwWY7w4KDSLanpOPWrBd8fB8/E1/dXWHME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UmP+BxfjNxdNh+jOTp7QJMRe/uFteY/aySenKCTm/ZhlG/ntOF9xASl/YocyzvUAI
         7yhFBCOHoLyYWv+k0Ok2rzjE/pi6G43pPARafqIok32FxjL1vRncuzmGQOHTW3umiM
         iBlJIoD4BwuJ5c9MDx25kwjW4+zrcQAChgM5r/Hc=
Date:   Mon, 7 Jun 2021 12:58:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: usb: add entry for isp1760
Message-ID: <YL3tuzywxJh1alrq@pendragon.ideasonboard.com>
References: <20210607083921.38441-1-rui.silva@linaro.org>
 <YL3jjPOWFTUsNXYp@pendragon.ideasonboard.com>
 <CBX9Y37I5UPS.329JON7IZ9YKZ@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CBX9Y37I5UPS.329JON7IZ9YKZ@arch-thunder>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

On Mon, Jun 07, 2021 at 10:22:08AM +0100, Rui Miguel Silva wrote:
> On Mon Jun 7, 2021 at 10:14 AM WEST, Laurent Pinchart wrote:
> > On Mon, Jun 07, 2021 at 09:39:21AM +0100, Rui Miguel Silva wrote:
> > > Giving support for isp1763 made a little revival to this driver, add
> > > entry in the MAINTAINERS file with me and Laurent Pinchart as
> > > maintainers.
> > > 
> > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > ---
> > >  MAINTAINERS | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 503fd21901f1..254803fe599a 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -18869,6 +18869,14 @@ S:	Maintained
> > >  F:	drivers/usb/host/isp116x*
> > >  F:	include/linux/usb/isp116x.h
> > >  
> > > +USB ISP1760 DRIVER
> > > +M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >
> > I can try to review patches, but I can't commit to having bandwidth to
> > do so. I'm thus a bit reluctant to list myself as a maintainer here, as
> > I fear my contribution would mostly be to increase frustration caused by
> > unresponsive maintainers.
> 
> Do you agree with the bellow better?
> +R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> 
> you will be CCed on patches only.

If it's OK to ignore the patches when I don't have the bandwidth :-) I'm
currently struggling with the drivers I currently maintain, so I don't
expect being able to spend any time on isp1760 for the next 6 months at
least.

> > > +M:	Rui Miguel Silva <rui.silva@linaro.org>
> > > +L:	linux-usb@vger.kernel.org
> > > +S:	Maintained
> > > +F:	drivers/usb/isp1760/*
> > > +F:	Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> > > +
> > >  USB LAN78XX ETHERNET DRIVER
> > >  M:	Woojung Huh <woojung.huh@microchip.com>
> > >  M:	UNGLinuxDriver@microchip.com

-- 
Regards,

Laurent Pinchart
