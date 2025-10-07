Return-Path: <linux-usb+bounces-28974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D8BC2781
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 21:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71724189DFA2
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158A72236E0;
	Tue,  7 Oct 2025 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQTAky3R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA921F92E
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863905; cv=none; b=o9goQ58Uav0EFutU4wT4uxb94bMoQQefLhw7L3K5nrszHMNHex8ub/h1oN94HEKkIwsZihmCPXYEgRDeLrVaq2TQAPyIIiuHShrEsFlYN/aHWMHHugHIuToAe9pNdYynXFJHl7nM6L6OAss40f4tYRpjIVMdW0elIcwl5LJp03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863905; c=relaxed/simple;
	bh=kO8M2sUwBSg9QsJQN+wxcXT5Cr0LRxFkDBem1zTMtMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNoCRN/tKaWU6OA23DIrGcnSvGOHRIEu7Ywo7h1L+Bzr8zRSC0z8m8Bnms+ChBxm5Nal1ngDLME8/FQttq0uXmzZ+azD0buszTs5Y649PrDMPc1k7sjDQSm4ekZ8GryfEOtqtFp/uDjls6yxKgQOc2yI/D1LnYWAhHhuXNJfFKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQTAky3R; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78f75b0a058so68968166d6.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863903; x=1760468703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfYcdfacXGl7fDg4hKzg8AXQsGo845Ky08ZG+mHHCa8=;
        b=iQTAky3R610ZXX9mUIQrAeh5AKAhDv5eDuJafG7gN+PPdUeDtRlxzLEhcZXDdkOfhe
         dJ4OrlDvWiIvyiNs7n+mcqtofHEU+TEBrygH20afQiHcs4QA7PjTW2IzULeSWnPZ6m29
         FoFYHNkh7sQn60EhEoEz6QkuU+fsCa0TLjFdJ0Dja67cdUfKYzmCikzIBTiC5zHbVz0J
         w0DmbTi+bsGEj9UCpFFDpWPBSgA5z1lkgsKx0nIjrolO/OejlbnUeFqaxybTOjWwCawP
         4SPmPr20LdUOsekbgx6Y5P4RVLm8l34wp4ndPjmK9sYlrRNBkr1f5ayKVDuzSqQ5uTJC
         SqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863903; x=1760468703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfYcdfacXGl7fDg4hKzg8AXQsGo845Ky08ZG+mHHCa8=;
        b=f9o6uOaRzD6YSnLGCFh3LSdw8PIHyoRuhxvDRIhHroVTBbv+YMzTKnRrrJCh+LIvol
         abisUhIYxiPfBlfSZ2bqeTr95pDr2RZDBylDfOI5jqauafl3PPJNdyePJiQOR9F9CWkB
         +HhS11yP099jBGbr6Q1IGs/mGFgMXvZm+LK02COwCk3kD/vtB1wJAypdtGe2qSGUHR3Q
         vGZSohM8sMHoDRb6S+hgCYuCIWo13feyOmZbEoVb3r2dZMFicIIrZQm1GWSEEBoH/lv4
         ePMRHFzb6l00lPY5v3fFe3lUm25yGbcddIUz/OssVaobAA6yFjkFPXZY5+raAxMUR7ne
         RJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnJNXEUTvsfdavevsTzFFIf7Tgj9+nmDSjQWILXMApZS573VDV1VxTkGMUhk6YCWyxjMuBeo2B2Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSywIiRxsAt7AkRixOaBGkV5H3J7bKiHIlKe04qslGocue1wg
	VxlnVDHPvFrErgBn5h3GjHsI3Kr+P8FRkfpaqLwmP+AURm3nkGlik0KGhGQ8ShyxUGQi8Rm7HDB
	zXri+UGVN28GMTmrYHsjPYYgtqjEEknVmwj1Pr5U5
X-Gm-Gg: ASbGncse5OjCXmOaEetM7V20busbcMC5wgTNo7qSfjNaWlxOUj7dU3sclDGir7oPZ7w
	OvypeYDNxx2BNQP+IKBIigvCoyeeFA3aJR2M/pmypSnpEGOBGV51W75DiA11y+/W6tNwxFMWykT
	OFwbJmKwmaQgnq+1tMuC4PWNSlNMZQCqPMrdKY5Wsxu8h7VreQaCuE2kJ5aedNr2KJEzosBFTgP
	BqNyZxktsBSE3mbP1ZuI6bkEBN9z1qaFCDr0zBoLT9+Gp7xYahJ+gRJyzamrHI0jkdI
X-Google-Smtp-Source: AGHT+IESFakXnW6Fg7wLYTYS/Mk7KjZzZUlAj2VCFe5Uoi1p/a2ZlnMdRcd1vHRmazVrtj5+BAM5Fv3D9UEy9BjEHP0=
X-Received: by 2002:ad4:5c62:0:b0:879:eb26:dafc with SMTP id
 6a1803df08f44-87b2efdbb1dmr8896926d6.54.1759863902406; Tue, 07 Oct 2025
 12:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-5-royluo@google.com>
 <c9ac3ada-d527-40b6-a45a-41572ae1cc9b@kernel.org>
In-Reply-To: <c9ac3ada-d527-40b6-a45a-41572ae1cc9b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 12:04:25 -0700
X-Gm-Features: AS18NWBx0Fa1NrpP4hD_qvt4PklaMmDusw8GBylg6_1boLk-co7d-M-x80eszUI
Message-ID: <CA+zupgyjFnNjVjv0hzOMyt50aPHZCK-p2wkj-oka7J4wtv+WUQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] dt-bindings: phy: google: Add Google SoC USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > Document the USB PHY bindings for Google Tensor SoCs.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,usb-phy.yaml          | 91 +++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,usb-ph=
y.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,usb-phy.yaml =
b/Documentation/devicetree/bindings/phy/google,usb-phy.yaml
> > new file mode 100644
> > index 000000000000..5552696edfff
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,usb-phy.yaml
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google USB PHY
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the USB PHY block on Google Tensor SoCs.
>
> Which ones? You need to be VERY specific here.

This USB PHY is specific to Tensor G5 SoC (and future generations) and thus
necessitates new drivers and new bindings. Will update the description and
commit message in the next patchset.

>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-usb-phy
> > +      - const: google,usb-phy
>
> Please read carefully  bindings. You cannot have generic compatible.
> Plus you are duplicating existing Samsung bindings.
>
> Best regards,
> Krzysztof

Will refrain from using generic compatible in the next patchset.

Thanks,
Roy Luo

