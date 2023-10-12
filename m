Return-Path: <linux-usb+bounces-1518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D157C7359
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 18:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB891C21145
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF102AB34;
	Thu, 12 Oct 2023 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ3jZA5d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B2262B2;
	Thu, 12 Oct 2023 16:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F299C433C7;
	Thu, 12 Oct 2023 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697129086;
	bh=Wj/b/rTXfuxjS20fYyMYenjOGieGl3jd2wJ+8o1xpmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ3jZA5dX6S3T30H/LlG1i9szPvYNW9TYQTVqLJTF8nA2IrgPSQe1GqVufDKF5lPJ
	 uv7cYGUTT6u5EjNv9tUqJbzgnXG7VeWOWgdKdKN/cZyKdJk9y3+YsBkasq002BS67f
	 jC1dQqDEeSOGoiIrQN9WDzgu05syJ4BcD6Ow1p0E3yLzccZSFe3Id5KkQsJ2vB4jkb
	 Thy/r78N7Yof/za89a7cXQcByx53jnxzEX2kxWPQW4EJ6JUcigykPu1yp9D46wLBTW
	 kUqdt/MRAbQYovfhtihzNZ1jE6tVh98x2Npgl4002RU3/WVcRrrRWq0PX02wER8y5l
	 8tuuUEk5h9Wdw==
Date: Thu, 12 Oct 2023 09:48:38 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: add a
 gpio used to determine the Type-C port plug orientation
Message-ID: <fdmytyymltbc2wvsobbbu57vfturwiq755fuj6vt5g35bf77ls@gkscepiyvn5a>
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
 <20231002-topic-sm8550-upstream-type-c-orientation-v2-1-125410d3ff95@linaro.org>
 <20231006154035.GA3979654-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006154035.GA3979654-robh@kernel.org>

On Fri, Oct 06, 2023 at 10:40:35AM -0500, Rob Herring wrote:
> On Mon, Oct 02, 2023 at 12:20:21PM +0200, Neil Armstrong wrote:
> > On SM8450 and SM8550 based platforms, the Type-C plug orientation is given on a
> > GPIO line for each connector which are set by the PMIC(s).
> > 
> > Document this optional Type-C connector property, and take the
> > assumption an active level represents an inverted/flipped orientation.
> > 
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > index bceb479f74c5..422921cf1f82 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> > @@ -35,6 +35,12 @@ properties:
> >    '#size-cells':
> >      const: 0
> >  
> > +  orientation-gpios:
> > +    description: Array of input gpios for the Type-C connector orientation indication.
> > +      The GPIO indication is used to detect the orientation of the Type-C connector.
> > +      The array should contain a gpio entry for each PMIC Glink connector, in reg order.
> > +      It is defined that GPIO active level means "CC2" or Reversed/Flipped orientation.
> 
> Shouldn't this node then have 'orientation-switch'?

The 'orientation-switch' property denotes that the node is the sink of a
orientation switching event, but this node represents the source of such
events (i.e. the connector-side).

The array defines the gpio signal providing the current orientation for
each of the listed usb-c-connectors under the node.

Regards,
Bjorn

