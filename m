Return-Path: <linux-usb+bounces-7618-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3E8740D6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 20:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5E81286C20
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 19:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18331350DB;
	Wed,  6 Mar 2024 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMXfY/Au"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BF13F426
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754711; cv=none; b=P8Q0mWjhLljGwK8AKM6fLaKdEcVSl9siOUpGkW6vtM2ONhAeACi6M0UhtV241DJRqLina4i6jrDNIhMT3plLs7s+roGWFg7jDbqYTP0mJV/ai+xnULfRAaMuQA0tEMwowjheReCyKlawCV/xYjC92orxiIXo9TuD3fNmqKFXTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754711; c=relaxed/simple;
	bh=8KEWij+gl+7zn2oRsJs9LcPzeFKd6OBGDhdWHXk/MPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OT4nAPvZw7e1mLXl/aLjXpXsCAzHV4bkEwgRwX7YSesoONv1qB8KUs1niTXR/nQqK2+2rdryLv+C78UywTx65s0/3LDHcgvTwcSIpTrs8sZRuuUUTgoUB+xMECS0UgBWivuZ0Nsjv/B7C3ae2Zmhyvg/VoacA/L0p3fA1HfZf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMXfY/Au; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1255420276.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Mar 2024 11:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754708; x=1710359508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=csEvl+YiH8Y/jo/itPX56IxrecdL7iIEtegQQM4ZWU0=;
        b=LMXfY/Au+r7XjvrbwsSXiuhX0E/O4K3S6jQ68i1bXaXkV6A2YJt65dMiq2aotU13XK
         zRCtM8tw7E94hdraV6uAscZqBu01zX7dg2O4IA0Gla8p/SSRdOPykY62SYhzoCgcQtWT
         2yl8EZWWjEjViybi3He+AEZ+Nu9a/jMJ5w4WwUt7luZOxn/AEXWqW69A06M+S1G8/Q5o
         57AgJsttIyfneGGUX+fAlfNJyIt2/cG+bVTT2tEkrt51z9XuKGOuKEANUX8ZJL2GhqIv
         OkrWJdAaItu7G6L/QzzF3jQcy1r5armEirwmgA5olOIymHeOF7pJDskg3Tr2YAFnNW8j
         GvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754708; x=1710359508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csEvl+YiH8Y/jo/itPX56IxrecdL7iIEtegQQM4ZWU0=;
        b=ngsIi1rzvr8Lels4kSPwh8FRB38H1XuzAV8rBzq75TXE+oynZ/dULhWlBZ18Lj/AMb
         QNtLqeWDPIxhQBuFbKHavc88QfBdUm6VAgUQ5osrc8uo0OZeuFw/BQSODxPH7SzCqB2W
         xdft/b4sFnVzhRHJ3nlwIhAdBuJqc4jSnhY1CZl2sEradhiotk2jEPIjfExcAV5UHAdL
         vI4P+1J3ikoEP6z6YlG0TGNNFeyqCVz5cyaOlkMGxiwMRuVlGTbP8XY2hMuvNVebUhTy
         bmTJDLw/98rTFmLC6niWgWRAlSmypHgXNdWNr9gqy46TFWRr2RySXMvR+gRLt2cUMAxa
         Ikrg==
X-Forwarded-Encrypted: i=1; AJvYcCWkrd3ao+zFpulvLP6K8KYsNvCRE1sF8GZGh11fS2vvQcM9HWl0ZSbshGWa4RMBK8H2vLltWMtviG8HXIxik5MAAyCX2ARKhGAZ
X-Gm-Message-State: AOJu0YxUmvwukJfeXFPUD94IhEQhTNFYSmRingYFn+5VH9/hIJcf1YYg
	wVBnzG6UnY1M5Bd7112fMoG4nO9IveuRY5mw2dsoeOcSPhCPVWlCCglpl4E6n4dzOE+7Clrp1+o
	i8u4HgRwkrTejTs0A0DuNkTXIYhSFBCKNIMHJ3Q==
X-Google-Smtp-Source: AGHT+IF/kGBb7idc3d2AEARbAxJnyUoIwtHxSDN0QDfLSSyf1XNAK8n+uv/CjDuD5p83nbhiV0hFcMEqsE4zIHZ8H1M=
X-Received: by 2002:a25:9b05:0:b0:dc7:4645:83ab with SMTP id
 y5-20020a259b05000000b00dc7464583abmr838347ybn.0.1709754708627; Wed, 06 Mar
 2024 11:51:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
 <1709657858-8563-2-git-send-email-quic_sriramd@quicinc.com>
 <CAA8EJpph+R2oJjABvNQYwp=pZLxQPzzs41Hhw4feOdQ3eU-6UA@mail.gmail.com> <4f1e4e66-e728-472e-92f4-17c295548a14@quicinc.com>
In-Reply-To: <4f1e4e66-e728-472e-92f4-17c295548a14@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:51:37 +0200
Message-ID: <CAA8EJpoRToOH-SvOf=iMqsuXkcSO-J74HsVF9pWVDde-72oaHQ@mail.gmail.com>
Subject: Re: [RFC 1/3] dt-bindings: usb: qcom,dwc3: Add support for multiple power-domains
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, quic_wcheng@quicinc.com, 
	Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, quic_psodagud@quicinc.com, quic_nkela@quicinc.com, 
	manivannan.sadhasivam@linaro.org, ulf.hansson@linaro.org, 
	sudeep.holla@arm.com, quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 17:52, Sriram Dash <quic_sriramd@quicinc.com> wrote:
>
> On 3/6/2024 12:33 AM, Dmitry Baryshkov wrote:
> > On Tue, 5 Mar 2024 at 18:58, Sriram Dash <quic_sriramd@quicinc.com> wrote:
> >>
> >> Some target systems allow multiple resources to be managed by firmware.
> >> On these targets, tasks related to clocks, regulators, resets, and
> >> interconnects can be delegated to the firmware, while the remaining
> >> responsibilities are handled by Linux.
> >>
> >> To support the management of partial resources in Linux and leave the rest
> >> to firmware, multiple power domains are introduced. Each power domain can
> >> manage one or more resources, depending on the specific use case.
> >>
> >> These power domains handle SCMI calls to the firmware, enabling the
> >> activation and deactivation of firmware-managed resources.
> >>
> >> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> >> ---
> >>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 74 ++++++++++++++++------
> >>   .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 49 ++++++++++++--
> >>   .../devicetree/bindings/usb/qcom,dwc3.yaml         | 37 ++++++++++-
> >>   3 files changed, 130 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> >> index 1e2d4dd..53b9ba9 100644
> >> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> >> @@ -44,7 +44,32 @@ properties:
> >>       maxItems: 5
> >>
> >>     power-domains:
> >> -    maxItems: 1
> >> +    description: specifies a phandle to PM domain provider node
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  power-domain-names:
> >> +    description:
> >> +      A list of power domain name strings sorted in the same order as the
> >> +      power-domains property.
> >> +
> >> +      For platforms where some resource are firmware managed, the name
> >> +      corresponding to the index of an SCMI domain provider can be
> >> +      "usb_core" or "usb_transfer".
> >> +    items:
> >> +      - const: usb_core
> >> +      - const: usb_transfer
> >> +
> >> +  qmp,fw-managed:
> >> +    description:
> >> +      Some targets allow multiple resources to be managed by firmware.
> >> +      On these targets, tasks related to clocks, regulators, resets, and
> >> +      interconnects can be delegated to the firmware, while the remaining
> >> +      responsibilities are handled by Linux.
> >> +
> >> +      Decide if the target resources will be managed by firmware or High level
> >> +      OS.
> >> +    type: boolean
> >>
> >>     resets:
> >>       maxItems: 2
> >> @@ -70,14 +95,6 @@ properties:
> >>   required:
> >>     - compatible
> >>     - reg
> >> -  - clocks
> >> -  - clock-names
> >> -  - resets
> >> -  - reset-names
> >> -  - vdda-phy-supply
> >> -  - vdda-pll-supply
> >> -  - "#clock-cells"
> >> -  - clock-output-names
> >>     - "#phy-cells"
> >>
> >>   allOf:
> >> @@ -86,6 +103,33 @@ allOf:
> >>           compatible:
> >>             contains:
> >>               enum:
> >> +              - qcom,sa8775p-qmp-usb3-uni-phy
> >> +              - qcom,sc8280xp-qmp-usb3-uni-phy
> >> +              - qcom,x1e80100-qmp-usb3-uni-phy
> >> +    then:
> >> +      required:
> >> +        - power-domains
> >> +
> >> +  - if:
> >> +      not:
> >> +        required:
> >> +          - qmp,fw-managed
> >> +    then:
> >> +      required:
> >> +        - clocks
> >> +        - clock-names
> >> +        - resets
> >> +        - reset-names
> >> +        - vdda-phy-supply
> >> +        - vdda-pll-supply
> >> +        - clock-output-names
> >> +        - "#clock-cells"
> >> +
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >>                 - qcom,ipq6018-qmp-usb3-phy
> >>                 - qcom,ipq8074-qmp-usb3-phy
> >>                 - qcom,ipq9574-qmp-usb3-phy
> >> @@ -144,18 +188,6 @@ allOf:
> >>               - const: com_aux
> >>               - const: pipe
> >>
> >> -  - if:
> >> -      properties:
> >> -        compatible:
> >> -          contains:
> >> -            enum:
> >> -              - qcom,sa8775p-qmp-usb3-uni-phy
> >> -              - qcom,sc8280xp-qmp-usb3-uni-phy
> >> -              - qcom,x1e80100-qmp-usb3-uni-phy
> >> -    then:
> >> -      required:
> >> -        - power-domains
> >> -
> >>   additionalProperties: false
> >>
> >>   examples:
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> >> index 0f200e3..ad2f08f 100644
> >> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> >> @@ -49,6 +49,34 @@ properties:
> >>       items:
> >>         - const: ref
> >>
> >> +  power-domains:
> >> +    description: specifies a phandle to PM domain provider node
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  power-domain-names:
> >> +    description:
> >> +      A list of power domain name strings sorted in the same order as the
> >> +      power-domains property.
> >> +
> >> +      For platforms where some resource are firmware managed, the name
> >> +      corresponding to the index of an SCMI domain provider can be
> >> +      "usb_core" or "usb_transfer".
> >> +    items:
> >> +      - const: usb_core
> >> +      - const: usb_transfer
> >> +
> >> +  hsphy,fw-managed:
> >> +    description:
> >> +      Some targets allow multiple resources to be managed by firmware.
> >> +      On these targets, tasks related to clocks, regulators, resets, and
> >> +      interconnects can be delegated to the firmware, while the remaining
> >> +      responsibilities are handled by Linux.
> >> +
> >> +      Decide if the target resources will be managed by firmware or High level
> >> +      OS.
> >> +    type: boolean
> >> +
> >>     resets:
> >>       items:
> >>         - description: PHY core reset
> >> @@ -154,12 +182,21 @@ required:
> >>     - compatible
> >>     - reg
> >>     - "#phy-cells"
> >> -  - clocks
> >> -  - clock-names
> >> -  - resets
> >> -  - vdda-pll-supply
> >> -  - vdda18-supply
> >> -  - vdda33-supply
> >> +
> >> +
> >> +allOf:
> >> +  - if:
> >> +      not:
> >> +        required:
> >> +          - hsphy,fw-managed
> >> +    then:
> >> +      required:
> >> +        - clocks
> >> +        - clock-names
> >> +        - resets
> >> +        - vdda-pll-supply
> >> +        - vdda18-supply
> >> +        - vdda33-supply
> >>
> >>   additionalProperties: false
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >> index 63d150b..5bf3a29 100644
> >> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >> @@ -64,7 +64,31 @@ properties:
> >>
> >>     power-domains:
> >>       description: specifies a phandle to PM domain provider node
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  power-domain-names:
> >> +    description:
> >> +      A list of power domain name strings sorted in the same order as the
> >> +      power-domains property.
> >> +
> >> +      For platforms where some resource are firmware managed, the name
> >> +      corresponding to the index of an SCMI domain provider can be
> >> +      "usb_core" or "usb_transfer".
> >> +    items:
> >> +      - const: usb_core
> >> +      - const: usb_transfer
> >> +
> >> +  qcom,fw-managed:
> >> +    description:
> >> +      Some targets allow multiple resources to be managed by firmware.
> >> +      On these targets, tasks related to clocks, regulators, resets, and
> >> +      interconnects can be delegated to the firmware, while the remaining
> >> +      responsibilities are handled by Linux.
> >> +
> >> +      Decide if the target resources will be managed by firmware or High level
> >> +      OS.
> >> +    type: boolean
> >
> > I think this is an overkill. You know that SA8775 is going to use
> > SCMI-based clocks / PD management. Thus I'd suggest adding new
> > bindings file targeting qcom,sa8775-dwc3. Also you can drop the
> > qcom,fw-managed property at all, let the driver decide basing on the
> > compat string.
> >
> >
>
> Thank you for the suggestion Dmitry. I will include
> new compat string for SA8775 which will decide whether
> to use scmi based clock/ PD.

As a reminder:
- same hardware = same compatible string
- existing DT better to continue to work. Or ask for explicit
permission from Bjorn to break the ABI.

>
> >>
> >>     required-opps:
> >>       maxItems: 1
> >> @@ -148,13 +172,20 @@ required:
> >>     - "#address-cells"
> >>     - "#size-cells"
> >>     - ranges
> >> -  - clocks
> >> -  - clock-names
> >>     - interrupts
> >>     - interrupt-names
> >>
> >>   allOf:
> >>     - if:
> >> +      not:
> >> +        required:
> >> +          - qcom,fw-managed
> >> +    then:
> >> +      required:
> >> +        - clocks
> >> +        - clock-names
> >> +
> >> +  - if:
> >>         properties:
> >>           compatible:
> >>             contains:
> >> --
> >> 2.7.4
> >>
> >>
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

