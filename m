Return-Path: <linux-usb+bounces-28972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF3BC2700
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 20:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC00402570
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 18:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0492E974E;
	Tue,  7 Oct 2025 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qF6tLWKa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157182E7648
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863004; cv=none; b=PmAzSDhfWKt2JMJMu8avPYtgQpTHE0xBDpfoYamLAqREL7oIZkkCi+kiC3jz73S2GEWiFNKwxVBmpZjKOrlQ2JtZAc5jxBFPNtfk3QMPNPildqVgiuP8qoMn3YxpkKiPuwN+8hQuT667AeBhcjD1TyAd5yo7IulDd6rxmmgxZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863004; c=relaxed/simple;
	bh=CjaCQl6yVB4wEbVAM7cWUmIAOOgx45oYuyglLl2ufaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYo0RVhEJf2caFJiOavjaDo/KaiCG08cC8Ee4fzVwtqhmoMDOZJIJEX3oyCpR819MqEbHilFrlPUm6TRlK6n8ZbKX39ZpmEY2DPV0XvBB6Eu6+Ozw7dJ5VsIC82lpUmXRoR1Mzg9IQOG8y0nhgFfiPj9s64eezsjme0jxviRpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qF6tLWKa; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87a092251eeso2139266d6.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863002; x=1760467802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aNYGyYwV4vw7l+4kbvJWnzel0gTCPuhPYenonekONo=;
        b=qF6tLWKajbHA/gNtsVQspJfpVRTIsqLgQzxlmfN0M57gEKtFDJuks161QhUJGMuMDU
         H9xHPW+t005SkW1qGN4XPVIGR2satEKPWVQKqXm0BIzzDLz4FjquMKb4eP42gVqlSGuF
         plEetkP8Op2Q9R/766+Jw7FAfG3AFIdFa6ogEg9y755skM28I3bWD4brqP7jVeHVRvkv
         gw+XXnt1Dy3Ddzdi4DsM7NCNJCZ5rJZhRcqqoiu+yf3ldnLCfH4ORtEbJs1X4M3wy0CA
         RIs39RSXXZArXIfmm0D9Zlbv54rUwgQlajDprILN+VFTfYk44KuIYRUsKgqRW8CBitWF
         oF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863002; x=1760467802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aNYGyYwV4vw7l+4kbvJWnzel0gTCPuhPYenonekONo=;
        b=DC2q2lkN3jNtHQBpSLmTsICsw0XOy+bpqwPGLd/kFEFastK81o42oeDvuedBWFmhm0
         7vU2sadgosJDQWAfBqHG247vrFCXzBYKQ5JIyJycpr0+euHcJj/G6xr7jx4xddLHaYRJ
         Knm0y+iy9NjGyCSzZWb4EuxYB+W3IbfTl7kxnrbLto7rkrswsEWgdbjUIa2wpA+UD7eP
         sdTkkR5ltf6QKAfHPv2+s74gZmMao/sTwNKdd0L2SgKUN2g4MWaTx1XlUeqlkW+WR6vd
         N1ar9JFuSR70k6mbjVoF/tMVu7qz5kM92N0fub9m62TLpBswkziqGPy21A5hwzNAwan9
         eDPA==
X-Forwarded-Encrypted: i=1; AJvYcCUuG2OLqS9lbHGyIJG66LEHYpVmtxnw/eF2aY8XN3V1LTyy8nJpEaNAcbbFJJ8Zp3Eztu9DG3RYlYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznaEfCFRAEHUgICeBPao2Rpw+p3DgCBnN9JQ9I5Sk/XI0ws9xo
	8fAiIjCUGJXK2vhM4Hmx2Dx/rD99UAp5t4ZB8I+jP9t2R84GYwcdlSuQKWfuYqmjMm99xzjqkBv
	Q0dMb+FtSMiRKVQM+O6gs2TB6akiX4CwyTuOZvk5I
X-Gm-Gg: ASbGncuTnXULOGmIpqJ3wfUhmY0KV4ysMObt174MhzO6x5YuGPZI9uWRMETTvUOhjgh
	LM1m7W4BbD60Ja54gm/VWGzRLE00EHEYX1xxHy3zPQ2iVNeW/5Vt4221BE4HgYEk3Bq4ZhBwSzM
	3TXAoFTiftOtf6CJH86MW6e7pNB2tJ+x4vFNwHa/WdzBeTnu0dan9k0kR6DJfDj9v2Vdhjfhnrl
	iU2vGSPnn8mKZ1jJ43+wt1faqyQw2skwXAYv1JWcI6nF7jlssH4lBtwAAacO4pgBAYmdQx2CXlh
	2uQ=
X-Google-Smtp-Source: AGHT+IGo6iqnWrqDrtRo1an3vJuKouV5RjS5DRtWGy3IQp7nt9esDi9MQIuwsCqJ8H6093glYV4xzd90Bb/yR8LhGEE=
X-Received: by 2002:a05:6214:1ccf:b0:86c:a297:9c97 with SMTP id
 6a1803df08f44-87a052877b1mr67912886d6.18.1759863001273; Tue, 07 Oct 2025
 11:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-3-royluo@google.com>
 <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org> <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
 <d592eb91-84e9-4bdc-8363-1d0bfd47c17c@kernel.org>
In-Reply-To: <d592eb91-84e9-4bdc-8363-1d0bfd47c17c@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:49:24 -0700
X-Gm-Features: AS18NWB1W-NkF9ZGaROK3BKRMdthcWV6kVzDTDNtLUYtC_DV2IHX4qZyOhy-2Gs
Message-ID: <CA+zupgyQGpQEoqCm9rbnw2Aum4j3mu-dqvDVN=RUEVY9E7q7Hg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 7:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 18:09, Peter Griffin wrote:
> > Hi Krzysztof & Roy,
> >
> > Firstly thanks Roy for your patches, it's great to see more Tensor
> > support being posted upstream!
> >
> > On Tue, 7 Oct 2025 at 01:44, Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
> >>
> >> On 07/10/2025 08:21, Roy Luo wrote:
> >>> Document the DWC3 USB bindings for Google Tensor SoCs.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>> ---
> >>>  .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++=
++
> >>>  1 file changed, 144 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,snps=
-dwc3.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.y=
aml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >>> new file mode 100644
> >>> index 000000000000..3e8bcc0c2cef
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >>> @@ -0,0 +1,144 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +# Copyright (c) 2025, Google LLC
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Google DWC3 USB SoC Controller
> >>> +
> >>> +maintainers:
> >>> +  - Roy Luo <royluo@google.com>
> >>> +
> >>> +description:
> >>> +  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - google,lga-dwc3
> >>> +      - const: google,snps-dwc3
> >>
> >>
> >> There is no such soc as snps, so you grossly misuse other company name
> >> as name of SoC. Neither lga. Otherwise please point me to the top-leve=
l
> >> bindings describing that SoC.
> >>
> >> You need to better describe the hardware here - why this is something
> >> completely different than GS which. Or switch to existing bindings and
> >> existing drivers. Did you align this with Peter Griffin?
> >
> > I think (from what I've seen at least) this is the first submission
> > for drivers in the Tensor G5 SoC used in Pixel 10 devices (which as I
> > understand it isn't based on any Samsung IP). Hence the new drivers,
> > bindings etc.
>
>
> That could explain a lot. I would be happy to see background of hardware
> in the bindings commit msg and the cover letter.
>
> >
> > However the issue is that none of the other base SoC drivers on which
> > this driver depends currently exist upstream (like clocks, reset
> > driver, power domains, pinctrl etc). So it's very hard to reason about
> > the correctness or otherwise of this submission. It is also likely
> > that when those drivers are upstreamed things could change in the
> > review process, to how it looks today in the downstream kernel.
>
>
> Bindings and drivers can be contributed without core SoC support, but
> then please describe the hardware (SoC) here. Having core support posted
> earlier is of course preferred, but I think not a requirement.
>
> Anyway, compatibles and all commit messages in this patchset are too
> generic and need to reflect this actual SoC, not "Tensor" because we
> already have a Tensor with USB. So basically based on existing support
> all this patchset would be redundant, right? :)
>
> Best regards,
> Krzysztof

Hi Krzysztof and Peter,

My apologies for not providing the full context on the SoC supported in thi=
s
series. Thanks to Peter for clarifying; yes, the Tensor G5 SoC is a new
generation of Google silicon that is significantly different from previous
generations which are based on Samsung/Exynos IP. This necessitates
new bindings and drivers for the G5 and future generations, and I will
ensure this is clearly detailed in the next patch set's cover letter and
commit message.

I acknowledge that the core SoC support (clocks, reset, etc.) for G5 is sti=
ll
missing from upstream. We do have plans to push this forward, but I don't
have a firm timeline yet. Thanks for confirming that this won't be a show
stopper for this patchset.

Thanks,
Roy Luo

