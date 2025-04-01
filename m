Return-Path: <linux-usb+bounces-22442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 647EFA77CD7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 15:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BDFC161AB4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E182A202F67;
	Tue,  1 Apr 2025 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cj8Q1ZDw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A81E51E7;
	Tue,  1 Apr 2025 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515528; cv=none; b=uZl5ufeXdgLIH+EkwP+v7hWeIlLKnln86wvXGTuPIj9YltAY2c6LWREsGnJeASLPlYbQqamXZjBPwGAppzYsPGLRCf4b0bgH2hA2Q5AciSV6EXpis1iXQfZSzZiGvXGxP2V0M1iKYnlTof9rHGo1jZsKaKMPH6LyM6gHBV2iyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515528; c=relaxed/simple;
	bh=3+bsHk/H5ywAwfPsnOVh5Gzzaoaq6Xxg5JafTJsF3Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1127Ggt090opzEvCeYvXeQYSeD3/RaIT1XNlgf71ZD5KSwKMjU5KYzq/Oza7XBRHFqytDwTXJSde8ZSXkwWiCoTyc3CtnH5iAPjOfgkaPKGyHDeikk3NDf/5ugtrJLZdkydstjc5zTeDOOxgzEap2xoEh4YbbtdyP9ftkeOggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cj8Q1ZDw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F7DC4CEE4;
	Tue,  1 Apr 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743515527;
	bh=3+bsHk/H5ywAwfPsnOVh5Gzzaoaq6Xxg5JafTJsF3Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cj8Q1ZDwEwroWVVXVXWfg3bP1FU3Xu6vqHxxSWMyoY0tgd9HLmZAvVWjUQXf9Fy19
	 JY9usyKS6r4oMPDZPU89oWgsJw0dQoABzZKOHXVPJQqgOLHae6USFb+tV4U4o8pzkg
	 PzDjNa6q97b2NQDiI8Dv3sHAaAqWzJnHnt3cbDrg=
Date: Tue, 1 Apr 2025 14:50:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: chipidea: Add i.MX95 compatible
 string 'fsl,imx95-usb'
Message-ID: <2025040111-pushup-waking-af93@gregkh>
References: <20250318150908.1583652-1-xu.yang_2@nxp.com>
 <20250401105740.5xtkityygeucvv26@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401105740.5xtkityygeucvv26@hippo>

On Tue, Apr 01, 2025 at 06:57:40PM +0800, Xu Yang wrote:
> Hi Greg,
> 
> On Tue, Mar 18, 2025 at 11:09:05PM +0800, Xu Yang wrote:
> > The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
> > requires a second interrupt for wakeup handling. Add the compatible string
> > for the i.MX95 platform, add the iommus property, and enforce the
> > interrupt property restriction. Keep the same restriction for existing
> > compatible strings.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v6:
> >  - no changes
> > Changes in v5:
> >  - no changes
> > Changes in v4:
> >  - no changes
> > Changes in v3:
> >  - add Rb tag
> > Changes in v2:
> >  - improve interrupts description
> >  - improve subject and commit message
> > ---
> >  .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
> >  .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
> >  2 files changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> > index d2a7d2ecf48a..10020af15afc 100644
> > --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> > +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
> > @@ -42,6 +42,9 @@ properties:
> >  
> >    phy_type: true
> >  
> > +  iommus:
> > +    maxItems: 1
> > +
> >    itc-setting:
> >      description:
> >        interrupt threshold control register control, the setting should be
> > diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> > index 8f6136f5d72e..51014955ab3c 100644
> > --- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> > +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
> > @@ -41,6 +41,7 @@ properties:
> >                - fsl,imx8mm-usb
> >                - fsl,imx8mn-usb
> >                - fsl,imx93-usb
> > +              - fsl,imx95-usb
> >            - const: fsl,imx7d-usb
> >            - const: fsl,imx27-usb
> >        - items:
> > @@ -54,7 +55,11 @@ properties:
> >      maxItems: 1
> >  
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: USB controller interrupt or combine USB controller
> > +                     and wakeup interrupts.
> > +      - description: Wakeup interrupt
> >  
> >    clocks:
> >      minItems: 1
> > @@ -191,6 +196,7 @@ allOf:
> >            contains:
> >              enum:
> >                - fsl,imx93-usb
> > +              - fsl,imx95-usb
> >      then:
> >        properties:
> >          clocks:
> > @@ -238,6 +244,22 @@ allOf:
> >            maxItems: 1
> >          clock-names: false
> >  
> > +  # imx95 soc use two interrupts
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-usb
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
> > +
> >  unevaluatedProperties: false
> 
> Will you pick up these patches?

It's the middle of the merge window, I can't pick up anything right now :(

I'll look at it after -rc1 is out, thanks.

greg k-h

