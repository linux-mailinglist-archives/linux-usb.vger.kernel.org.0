Return-Path: <linux-usb+bounces-425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7267B7A89BB
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 18:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4BD281C0E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 16:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97CE3E484;
	Wed, 20 Sep 2023 16:46:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EA3E475;
	Wed, 20 Sep 2023 16:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0329EC433C7;
	Wed, 20 Sep 2023 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695228391;
	bh=v2nZUFJb75Eok75BEHLZ6a+wtZb+ffY5WGQfd+Wp6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ef6SlilF31FSgPKwuu0WfymO6HNgzAimtyNgVfXKfqv7AxemX3k92g7NZKKmqxQdD
	 4SYlOUJ3NC19NmGATgQLggWeCEqmQIj0Dp076wmr1fDow5nW7QNrs5X3UOMv5stdW4
	 go6Pi4M76ibE/k/1ED9234/0h+LlBe98GE6wJ2S0His1lg6Nui0QNZZBeBYbaHNqzr
	 Xzxxgou53z6XDr51xCg0v5RJ7qzTqlldli/pzFbLObGzy59GAC+dDDH2rysvGW0OIH
	 6lRJlV/6Y5Ly4EMtOru/RNpBt18cUeQ/A4SdQf3kDd6px94oLuELcR/sB8x+tWYf1L
	 lkgWknBLOspSg==
Date: Wed, 20 Sep 2023 09:50:39 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: add a gpio
 used to determine the Type-C port plug orientation
Message-ID: <zigqqjepj54v5vnmhm3r3knwrjd2rfw2njds4ul7vmxq3nfrua@rkupccyyxziw>
References: <20230804-topic-sm8550-upstream-type-c-orientation-v1-0-36dd3edec7bf@linaro.org>
 <20230804-topic-sm8550-upstream-type-c-orientation-v1-1-36dd3edec7bf@linaro.org>
 <zhm72wrjg7yazutkinv5lx55dgqtm4hmuexw2ht24fu6txxk3d@oum27inbk7si>
 <7fc7371a-1b2d-ccce-1e73-6bfe70ea2b20@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc7371a-1b2d-ccce-1e73-6bfe70ea2b20@linaro.org>

On Mon, Aug 14, 2023 at 10:09:41AM +0200, Neil Armstrong wrote:
> On 04/08/2023 18:03, Bjorn Andersson wrote:
> > On Fri, Aug 04, 2023 at 03:50:07PM +0200, Neil Armstrong wrote:
> > > On SM8450 and SM8550 based platforms, the Type-C plug orientation is given on a
> > > GPIO line set by the PMIC.
> > > 
> > > Document this optional Type-C connector property, and take the
> > > assumption an active level represents an inverted/flipped orientation.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml  | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > > index bceb479f74c5..1b0a00b19a54 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > > @@ -35,6 +35,11 @@ properties:
> > >     '#size-cells':
> > >       const: 0
> > > +  orientation-gpios:
> > > +    description: An input gpio for Type-C connector orientation, used to detect orientation
> > > +      of the Type-C connector. GPIO active level means "CC2" or Reversed/Flipped orientation.
> > 
> > This is a per-connector/port property, as such be part of the connector
> > sub nodes rather than as a property of the shared pmic_glink entity.
> 
> This has been rejected by Rob, Dmitry & Krzysztof in:
> https://lore.kernel.org/all/0fbf55e7-2140-751d-5347-f907a46ef78c@linaro.org/
> &
> https://lore.kernel.org/all/20230608154751.GA2750742-robh@kernel.org/
> 
> Indeed the "GPIO" is not part of the physical USB-C connector, but a property,
> and it's not part of the PMIC GLINK firmware either, so ?
> 
> The PMIC function which generates this signal is handled by the PMIC GLINK
> firmware, so this representation is the most accurate.
> 

I don't think we reached a conclusion on the discussion that followed.
If this indeed is the path forward, please document clearly how the next
person should proceed when the need for handling multiple ports with
this scheme arise.

Thanks,
Bjorn

> Neil
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > +    maxItems: 1
> > > +
> > >   patternProperties:
> > >     '^connector@\d$':
> > >       $ref: /schemas/connector/usb-connector.yaml#
> > > @@ -44,6 +49,19 @@ patternProperties:
> > >   required:
> > >     - compatible
> > > +allOf:
> > > +  - if:
> > > +      not:
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              enum:
> > > +                - qcom,sm8450-pmic-glink
> > > +                - qcom,sm8550-pmic-glink
> > > +    then:
> > > +      properties:
> > > +        orientation-gpios: false
> > > +
> > >   additionalProperties: false
> > >   examples:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> 

