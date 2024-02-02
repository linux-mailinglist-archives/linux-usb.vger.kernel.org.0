Return-Path: <linux-usb+bounces-5780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F98479EB
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 20:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FECD28947B
	for <lists+linux-usb@lfdr.de>; Fri,  2 Feb 2024 19:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020218060C;
	Fri,  2 Feb 2024 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi5Bb+P3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F915E5AE;
	Fri,  2 Feb 2024 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706903427; cv=none; b=eq/qwHq/0oNY6AL0ouTKMZysZG2I+d/j1qCMT9uRW/lUy4ZUJSw9Qr3bJxDiYf9k+cuRYc7+j4ONIytAmGx8BbVaI2zfZ2zZXBOFO8xRElTl2a6Ewbw7AbWX4LtOgSMF7Y2Bpfvs2WD6/dAXzvS8GeOTszsmmXe5TH83xTsURaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706903427; c=relaxed/simple;
	bh=9A36iG8VpIfsmP3VT0ZetlwfDDDTLMTUJULYO7BI59Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5K0A3pTkBGSTR22/DUXwbAQ0+IyL1hK+4Yj/UNcm7qNb8fRrP4C2ATovqD0uBZd02+UIk9eZf95TthH5kRCzA5Ij8WkUZ+In72Ch5dtn27ROYogVijGbVujK7bqVTp+NHN7QuiH/JMsVzolSo9bG7ZvL43BtAdYJT4lt+Mwtwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi5Bb+P3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25DAC433C7;
	Fri,  2 Feb 2024 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706903427;
	bh=9A36iG8VpIfsmP3VT0ZetlwfDDDTLMTUJULYO7BI59Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mi5Bb+P3HTcfmhTyIpvsitzBOeVbiY1xZe4fhEbQ4xyRlb67VjswOtUK2ZAowS0MN
	 w/Y+KOQhlZDpO7ZsJZGBg0xrCtBQLcILjX5mAa6tK6vaEgSYHstEneMrKW2q45wGpO
	 wd5Mzom/O7NGxWXnf2Xjw3wa03mLLLwRYh/YmKq01tiwnI16i/9q8CFW+kssgfQx1h
	 chW0j5aah/6e8nfIP4QUUP7eJ2m0JriMRAYtnOiR9JKghC+MEJYQV398h7UP5XRwLz
	 M1eFGgIsGhOL3/JqgqozlD5Bc53kWAfmhDPdxVmtmtNHmZ7MZMZ5eVh20j9XBUWpz0
	 d+B+NJXMka7xQ==
Date: Fri, 2 Feb 2024 13:50:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xu Yang <xu.yang_2@nxp.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"peter.chen@kernel.org" <peter.chen@kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v5 4/8] dt-bindings: usb: ci-hdrc-usb2: add
 restrictions for reg, interrupts, clock and clock-names properties
Message-ID: <20240202195024.GA846913-robh@kernel.org>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-4-xu.yang_2@nxp.com>
 <a0134089-a283-488b-8d7f-3f59dd938b60@linaro.org>
 <DU2PR04MB88221602EB986D2C2A5BBF8D8C422@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <f62289f2-0f37-4e27-bc27-ab6d70dcc898@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f62289f2-0f37-4e27-bc27-ab6d70dcc898@linaro.org>

On Fri, Feb 02, 2024 at 12:04:51PM +0100, Krzysztof Kozlowski wrote:
> On 02/02/2024 10:10, Xu Yang wrote:
> > Hi Krzysztof,
> > 
> >>
> >> On 31/01/2024 12:43, Xu Yang wrote:
> >>> Change reg, interrupts, clock and clock-names as common properties and add
> >>> restrictions on them for different compatibles.
> >>>
> >>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>>  - new patch since v3's discussion
> >>>  - split the reg, interrupts, clock and clock-names properties into
> >>>    common part and device-specific
> >>> Changes in v5:
> >>>  - keep common property unchanged
> >>>  - make if-then more readable
> >>>  - remove non imx part
> >>> ---
> >>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 118 ++++++++++++++++++
> >>>  1 file changed, 118 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-
> >> hdrc-usb2.yaml
> >>> index 3b56e0edb1c6..6ad3582051b8 100644
> >>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> >>> @@ -412,6 +412,124 @@ allOf:
> >>>          samsung,picophy-pre-emp-curr-control: false
> >>>          samsung,picophy-dc-vol-level-adjust: false
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          const: fsl,imx27-usb
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 3
> >>> +          maxItems: 3
> >>> +        clock-names:
> >>> +          minItems: 3
> >>> +          maxItems: 3
> >>> +          items:
> >>> +            anyOf:
> >>> +              - const: ipg
> >>> +              - const: ahb
> >>> +              - const: per
> >>
> >> This would be just: enum: [ipg, ahb, per], but in both cases I question
> >> why the order should be flexible? Nothing in commit msg explains it.
> > 
> > The driver will get the clock by clock-name, then the order should not
> > matter. However, these three clock-names should be present at the same
> > time. I should use enum then.
> > 
> >>
> >> Plus I will repeat myself from your v4. I don't think this is helping,
> >> because the file will soon grow to umnanageable chunk. I prefer to fix
> >> it at beginning, before we reach snps-schema level of complexities.
> >>
> >> Please define common schema, reference in this file and move IMX to own
> >> file.
> > 
> > I'm not that familiar with dt-bindings architecture. If I define a common
> > schema, then should I create imx, qcom, nvidia and other dt-binding files
> > too? 
> 
> No, the rest you can leave here. Someone, maybe me, will move them some
> time. The point is to move at least IMX to its own file.

That will only work as long as i.MX doesn't define any extra properties 
which it already has. We have to have at a minium common, imx, and 
everything else schema docs.

Rob

