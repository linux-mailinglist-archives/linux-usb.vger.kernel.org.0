Return-Path: <linux-usb+bounces-14517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8679694B8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 09:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2831C22A80
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 07:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DED1D61A3;
	Tue,  3 Sep 2024 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="17x5NNP9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7FA1A4E7F;
	Tue,  3 Sep 2024 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347335; cv=none; b=uk58Pb3ETOycdEFdFPaKQrIMVh/Nf7HLj2vvagIyMC6KHVt0K8+DNx9o2UyVa/Ff/vGpRcNBC+9V3ULLkPDTqBWVDOtwu+yDfHSSSvM9E1P4gYNUgXrsbkkoZ0hVXxmCU5qcRJTvrMFITo+PmB8IOcWdEceOGC48xmfBJoCdmwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347335; c=relaxed/simple;
	bh=bTovO0s/85vxVwC1EVSDWJ6CYsHfXmbw+NNS3x21Hb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etCfUtJ3iFojKlHxDnxEQuY2dC4agiE0rVRt1YzIcPrMoarphbIPy5EoL4zlSNQLiN7izttaYa1to005AMr9CCNhadawUNPc6X4nuGmZPsirDqjWIrbgFZiQQ0gexiuWpCzkaIWhz2Rj1NDs1ICv4xqLGE+Szii6GreMGvjRT+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=17x5NNP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EA0C4CEC5;
	Tue,  3 Sep 2024 07:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725347335;
	bh=bTovO0s/85vxVwC1EVSDWJ6CYsHfXmbw+NNS3x21Hb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=17x5NNP9Idwc8DE5dLqI55XntnLQ1/kNaElYPEhprdklN3M6SNkSO4SGvYShIZ380
	 6w9NeCLSeTnmK9SKKHdBBPOmTLzRphQocTfpO4sjDUL8StIWVcpMVbsKQrXKCsEutb
	 kSEbYbYcWsus+Iw4egdLvfQywd0mp9mK6jwBz3MI=
Date: Tue, 3 Sep 2024 09:08:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	peter.chen@kernel.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Message-ID: <2024090332-smokiness-virus-5f65@gregkh>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
 <20240829090935.ktc7jgd2en4qay2h@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829090935.ktc7jgd2en4qay2h@hippo>

On Thu, Aug 29, 2024 at 05:09:35PM +0800, Xu Yang wrote:
> Hi Greg,
> 
> On Fri, Jul 26, 2024 at 07:32:04PM +0800, Xu Yang wrote:
> > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > usb wakeup work well. This will add a "nxp,sim" property.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add else branch suggested by Rob
> > ---
> >  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > index f4b1ca2fb562..ce665a2779b7 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > @@ -87,6 +87,12 @@ properties:
> >      maximum: 119
> >      default: 100
> >  
> > +  nxp,sim:
> > +    description:
> > +      The system integration module (SIM) provides system control and chip
> > +      configuration registers.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -110,6 +116,17 @@ allOf:
> >        required:
> >          - fsl,anatop
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: fsl,imx7ulp-usbphy
> > +    then:
> > +      required:
> > +        - nxp,sim
> > +    else:
> > +      properties:
> > +        nxp,sim: false
> > +
> >  additionalProperties: false
> >  
> >  examples:
> 
> 
> Could you please pick up patch #3? Rest of the patches are mainlined.

Can you please resend it as an individual patch with the reviewed-by
added to it?

thanks,

greg k-h

