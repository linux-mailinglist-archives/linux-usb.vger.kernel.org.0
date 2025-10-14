Return-Path: <linux-usb+bounces-29268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD699BD6FF8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 03:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0249418A7515
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 01:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741EF22257E;
	Tue, 14 Oct 2025 01:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wgUc0p+h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464525F973
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760406048; cv=none; b=CqPfyu+aj6746BWfWK5JfJsbVbcNrTivDa5YTf7ze3AaRvyr92ygDwG/WagLYFzQwXdLnBvqrbJsl6R9OS/a5Rn77DMJlzMBATV/VO1BGIp+Nx/EGY+DZPDPCW+8Oy04V/9kfkD2qZBNFLusXXbxTzY7esAD9CxAPvUPIsIUpjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760406048; c=relaxed/simple;
	bh=SvUOg+GhCiLgOKSplnIErGjUnl2M+DDGuRcUuzNrrSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8lBjQjZYy8bWJAQInzqhe+H6F8Lqr3iVT50HUpBc31bRldlIvnLPSFMXIXrcWXMhPLqSneaUVke0atvU29493Xn1LwGTiah8dUJvUxiLKDpCOrGhvKyuCLTtOkacIb+Fcw+y+Ac1HiBiAOUOeRTyxOjlP9E43qDg4iHvIsaRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wgUc0p+h; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7811a02316bso3349057b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406045; x=1761010845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=wgUc0p+hwwd1D0aTTBPxPMJllxgGhuBtnQDHVXcBypuMeyptP9JJQRupKvw/Qxu4nM
         6JozLu7q+eFMKFm9ifD9Fwx9WNsqR/bonN6BA2EvXxCTxwwufzkuTu+Vkv8e1UY6Hu9+
         SZpRiUUpcVKDCMi8HRkn3AE9Wo/ykM+/12AO/1v3rxf3AS34kAxFhjnhW0LfyFYmVDTz
         BS1cSC6gDUNEr+cqml4hpndYc/vqil1Gds0soQpTv7yenNjI3l0RGmrS/7iSSfU6Ja6n
         gaihr7TLLzo66MI+3rUt+HKjptAJcr3mdOkIhNivPufamL/5Ybr+YpCG1o3paIkk76BC
         HSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406045; x=1761010845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=PxiPndVz6c4vA7cRS7dEXu7K0ciwkJXZGkbjL9j5wtcrR5P5v5j4SWYiEI1tcfIbxg
         jkLbtEb9SAGXsvzHGGNTYbzy7DxiSgMsQEYgnmE9wde7n4Sk5sCdA28xq/eWjwWRCW2t
         tO+8FIEMeeohkilsPcLyz77lFjI792QZcyVN5N4aaPj/JT3UHTyA27E/Jlh1GnEK8F0K
         sOd1R0D+6vNOSqC0jQ+7YnAwrVA7iZDBVYVeeUYg+jxNpKZlVD/K2vWpZXWrP3FhlGtP
         OH/+cm4mjGqjkC7jt+JolOr/VCkutsoiKJGy4531yJTi5rPXk7Rf8XwDYvfU+2zanT5z
         Gm4g==
X-Forwarded-Encrypted: i=1; AJvYcCWhczBhap2rUpUlccx9bPPTFTmNab4aa9hje0A49fZcoPJqhQF4Vt/HUbFhNyVZhf6xrF600/OplPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzqj7+XAF0wghH4omqxKkEDUEl7yNWiu5jGJpiEOjKaJmuxJIu
	Cy3ZSi2qFHkCg6cRWqb+kuI1YHacjqd2DkCzdAG2+BWXZCo7Nu4Bdp+gTC5IsDiaSoMvXwvMNBi
	sY321v7FGz+MutHWAtGNbhcP7QSNnmbIPakjWGq9P
X-Gm-Gg: ASbGncvbZWNDJ4cHUhZIz3x9PByLEV136+B4a+BKvA6bNkos6LOTARnjy6l5yWVf0GH
	bedNmxOgKIu9/MYWp251SmPeC7mG+bC74Z9wJabRh72mwItTiczRBjUgBxcP4v1c9WlfEyhBV0I
	TPbuz03pdligDXxH2O/MDRP1f3kUjQuj5HAoex+bIF8kqZdPqA0q/ozboUm8uRc0VOiWe5JcTaJ
	FknCq6nyWDDIz4xej8zD0V9TLG3ujTH/NoeiE95rEbdqiprWVyluWHgY9TZ6+s6rRU1fZPXJcCQ
X-Google-Smtp-Source: AGHT+IH/gaVhehz3sRp9VrrzaU79D/o/NZJP8CN7/dl/fC68uxDpeqnl6j3qA8EnLxqoVUctH31vKw6FBzQox/YYs6w=
X-Received: by 2002:a17:903:2408:b0:28e:7fce:667e with SMTP id
 d9443c01a7336-2902723f51emr324260245ad.17.1760406045183; Mon, 13 Oct 2025
 18:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
In-Reply-To: <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:40:08 -0700
X-Gm-Features: AS18NWCf063mHzWv1lf5a6FraaWgtqWiANzRpv6KaU2cy8h_cSvnS3pGamEVoLc
Message-ID: <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
>
> You still mix, completely unnecessarily, subsystems. For Greg this is
> actually even undesired, but regardless don't do this for any cases
> because it just makes everything slower or more difficult to apply.
>
> Really, think how maintainers should deal with your patches.
>

Understood, I will separate the patches into two distinct series: one for
the controller and one for the PHY.
Appreciate the feedback and the explanation.

> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..6fadea7f41e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,141 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
> > +
> > +  reg:
> > +    items:
> > +      - description: Core DWC3 IP registers.
> > +      - description: USB host controller configuration registers.
> > +      - description: USB custom interrrupts control registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg
> > +      - const: usbint_cfg
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Core DWC3 interrupt.
> > +      - description: High speed power management event for remote wake=
up from hibernation.
> > +      - description: Super speed power management event for remote wak=
eup from hibernation.
>
> Wrap at 80 (see coding style) or just shorten these.

Ack, will fix it in the next patch.

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dwc_usb3
>
> So just "core"?

I'd prefer to stick to "dwc_usb3" as that's
1. more expressive by referring to the underlying IP name,
2. consistent with established dwc3 bindings such as
    Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
    Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
unless you have a strong preference for the alternative naming.

>
> > +      - const: hs_pme
> > +      - const: ss_pme
> > +
> > +  clocks:
> > +    items:
> > +      - description: Non-sticky module clock.
> > +      - description: Sticky module clock.
> > +      - description: USB2 PHY APB clock.
>
> This looks wrong. This is not the USB2 phy, so how can it consume APB clo=
ck?

That's a fair point, I'll look into the necessity and placement of this spe=
cific
clk/reset and get back.

Thanks,
Roy Luo

>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +
> > +  resets:
> > +    items:
> > +      - description: Non-sticky module reset.
> > +      - description: Sticky module reset.
> > +      - description: USB2 PHY APB reset.
>
> This as well.
>
> > +      - description: DRD bus reset.
> > +      - description: Top-level reset.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +      - const: drd_bus
> > +      - const: top
>
>
> Best regards,
> Krzysztof

