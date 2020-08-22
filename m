Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E868A24E4E8
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 05:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgHVDcB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 23:32:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgHVDcA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 23:32:00 -0400
Received: from dragon (unknown [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17BB2214F1;
        Sat, 22 Aug 2020 03:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598067120;
        bh=UAUhlnAYZxih4M0/rTtvsAwTQ69ckCB2XzCicXjAGUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qjJCE23M5WK2DnpulXekbIUWKwA/7WPyuukb3m3cDwUAJciTXl2pc2jfpGYFJklk9
         QvPfrcUw6ifj05wWUu58hO/NWJXt5QYu+1mFV7pU91v1Sp+Pa82nTfO/nROSAAV7/o
         N8RtGhg2vH+BEmA1UyUeUi03LXAnJ99ep9VFRPjY=
Date:   Sat, 22 Aug 2020 11:31:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: imx8mm-evk: add two parameters for
 samsung picophy tuning
Message-ID: <20200822033144.GB27575@dragon>
References: <20200724060532.3878-1-peter.chen@nxp.com>
 <20200724060532.3878-3-peter.chen@nxp.com>
 <20200821013839.GA24960@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821013839.GA24960@b29397-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 21, 2020 at 01:39:44AM +0000, Peter Chen wrote:
> On 20-07-24 14:05:31, Peter Chen wrote:
> > With these two parameters tuning, it can pass USB eye diagram at evk board.
> > 
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v3:
> > - Using the new property name
> > Changes for v2
> > - Address Shawn's comment to change subject.
> > 
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > index 0f1d7f8aeac4..7c652b898114 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > @@ -324,6 +324,8 @@
> >  	srp-disable;
> >  	adp-disable;
> >  	usb-role-switch;
> > +	samsung,picophy-pre-emp-curr-control = <3>;
> > +	samsung,picophy-dc-vol-level-adjust = <7>;
> >  	status = "okay";
> >  
> >  	port {
> > -- 
> 
> Hi Shawn,
> 
> Rob has already acked the binding-doc changes, would you please queue
> these two dts changes?

Applied patch #3 and #4, thanks.
