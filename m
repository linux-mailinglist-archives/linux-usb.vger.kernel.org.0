Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AF26FAA0
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 09:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfGVHqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 03:46:32 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35667 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfGVHqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 03:46:31 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hpT1g-0004Nc-Kh; Mon, 22 Jul 2019 09:46:28 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hpT1e-0006Vc-I6; Mon, 22 Jul 2019 09:46:26 +0200
Date:   Mon, 22 Jul 2019 09:46:26 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, patchwork-lst@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH 1/3] Revert "usb: usb251xb: Add US lanes inversion
 dts-bindings"
Message-ID: <20190722074626.wf523mw3uvymi5vo@pengutronix.de>
References: <20190719084407.28041-1-l.stach@pengutronix.de>
 <20190719101337.36omwmqc4lbtw6do@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719101337.36omwmqc4lbtw6do@mobilestation>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:25:25 up 65 days, 13:43, 51 users,  load average: 0.27, 0.12,
 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Serge,

On 19-07-19 13:13, Serge Semin wrote:
> Hello Lucas
> 
> On Fri, Jul 19, 2019 at 10:44:05AM +0200, Lucas Stach wrote:
> > This reverts commit 3342ce35a1, as there is no need for this separate
> > property and it breaks compatibility with existing devicetree files
> > (arch/arm64/boot/dts/freescale/imx8mq.dtsi).
> > 
> 
> Hmm, didn't know there had been anything staged to merge and touching this
> property before submitting the update. We must have done it nearly at the same
> time, or your patch hasn't been merged at the time I prepared mine.
> 
> Anyway why would you prefer to change the interface again instead of
> following the existing way? Firstly It is much easier to fix the dts-file
> than to revert the interface back and break dts-files of possible other users.

Since the dtbs are firmware thats not possible everytime. You can't even
say that nobody uses that binding because it's not grepable within the
kernel repo. Most vendors do not publish their dts files but use the
bindings and rely on stable bindings.

> Secondly the chip documentation doesn't have anything regarding port 0.

Thats not true. I've checked the usb2517 documentation and PRTSP register
description. Bit-0 points to the upstream port and the dt-binding
is such generic to cover that too. By swap-dx-lanes I mean swap d+/d-
lanes else it would be something like swap-downstream-lanes. Since the
upstream port have d+/d- lanes too it would be covered too.

> It states to swap the Ports from 1 to 4 (usb2514) corresponding to the bits
> 1 - 4 of the 'PORT SWAP' register, while bit 0 is connected with explicitly
> named Upstream Port (without any numbering). Thirdly having a separate
> property for US port makes the driver bindings interface a bit better
> readable/logical, since in current implementation there is no implicit/unspoken/hidden
> rule that port 0 corresponds to the Upstream Port, Port 0 just doesn't exists
> (following the chip datasheet text), and the other port-related properties are
> only applicable for downstream ports. So the driver code rejects them being

So the correct fix should be extending the documentation rather than
introducing a new binding?

> utilized for a port with 0 identifier. The only port-related setting being
> exposed by the interface is the swap-port-one and it has a separately bound
> property 'swap-us-lanes' for the Upstream port.
> 
> As for me, all of this makes more sense than having an implicit Port 0 - Upstream
> port binding (as you suggest). Although the final decision of which solution is
> better is after the subsystem maintainer after all.

That's true but he had to cover the dt-backward compatibility.

Regards,
  Marco

> Regards,
> -Sergey
> 
> > CC: stable@vger.kernel.org #5.2
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/usb/usb251xb.txt | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > index bc7945e9dbfe..17915f64b8ee 100644
> > --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> > @@ -64,10 +64,8 @@ Optional properties :
> >   - power-on-time-ms : Specifies the time it takes from the time the host
> >  	initiates the power-on sequence to a port until the port has adequate
> >  	power. The value is given in ms in a 0 - 510 range (default is 100ms).
> > - - swap-dx-lanes : Specifies the downstream ports which will swap the
> > -	differential-pair (D+/D-), default is not-swapped.
> > - - swap-us-lanes : Selects the upstream port differential-pair (D+/D-)
> > -	swapping (boolean, default is not-swapped)
> > + - swap-dx-lanes : Specifies the ports which will swap the differential-pair
> > +	(D+/D-), default is not-swapped.
> >  
> >  Examples:
> >  	usb2512b@2c {
> > -- 
> > 2.20.1
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
