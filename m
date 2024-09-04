Return-Path: <linux-usb+bounces-14629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C234996B243
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 09:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F558283E26
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 07:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F161474A5;
	Wed,  4 Sep 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uUBbQ0qd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1B6A8D2;
	Wed,  4 Sep 2024 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433248; cv=none; b=JVXN6oyAxygNNQRY3wvhxJcXHj7Bby+w8LMp4HIp6Lngfp/GxBbMHeJCX7bAatFj/NjN+ZApU/Jeuvijft5A+39XR2XTGeISPbjqHcGpXeF057ya1g0rAOlx9yr4bXaKoqyMh3xtxRbkvsePaP74GtjAqc0vQpGyNBSWnSLQGMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433248; c=relaxed/simple;
	bh=cdxAWOOEytd3O6tuHVxZGPBLNWtxs7CiEOEjMXojNXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USnSZ2wgggETty8nPKTQinFq/Z6X40XX7U/gAxUcRTX1QAlMYOer3dDSFJjNxUD7TiKTtPNzjYYbGOqMqwDcSE0F1hCFesl1T4thWos8CNiEOGQiSiTevg23X7QgPbADbspwAxIvkyp0o3iHxc6V898KlSbXUZhrw+QoSBFrEMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uUBbQ0qd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A050BC4CEC2;
	Wed,  4 Sep 2024 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725433248;
	bh=cdxAWOOEytd3O6tuHVxZGPBLNWtxs7CiEOEjMXojNXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUBbQ0qdPCN+dt6qpOFPrgV1SpYObZeETsHyOEvOurNnEEawgkeU9g2BdtlOzUgpp
	 QaAwBlgDYjhlQY3waZnpILn2LrpFnbvD5x9CfQnbPKITiRH9ZSKQSRRXai3HmLpVkA
	 glMfBn9G/diqIfKb1o5N4ecW4Xl/Wl41pBAs48wM=
Date: Wed, 4 Sep 2024 09:00:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <2024090418-helpful-nearness-39ab@gregkh>
References: <20240903075810.1196928-1-xu.yang_2@nxp.com>
 <20240903075810.1196928-2-xu.yang_2@nxp.com>
 <20240904063407.qjvevd4xhvohg4cd@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904063407.qjvevd4xhvohg4cd@hippo>

On Wed, Sep 04, 2024 at 02:34:07PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> On Tue, Sep 03, 2024 at 03:58:10PM +0800, Xu Yang wrote:
> > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > index ac338320ac1d..b093f2a447ae 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
> >  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> >  			#phy-cells = <0>;
> > +			nxp,sim = <&sim>;
> >  		};
> 
> The dtschema patch #1 has been picked by Greg. You can pick up patch #2
> when you see this ping. 

Because our tools like to suck in entire patch series at once, you
should really just resend this so that Shawn doesn't accidentally take
patch 1/2 as well.

thanks,

greg k-h

