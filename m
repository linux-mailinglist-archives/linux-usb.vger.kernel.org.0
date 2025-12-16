Return-Path: <linux-usb+bounces-31491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D16CC45B8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 17:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 552CC3039917
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 16:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2530723B609;
	Tue, 16 Dec 2025 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihVt6mla"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFA726E702
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903147; cv=none; b=gKv6OI0c18Btcf4e8jA5jeY5xo/CSi4F1VNYGVgT6CDvzntVgOQ5Ki5lMoaQTTiQZO4rFZ6fu5vbvltzuxcp9o/ZgdlcegCMcvSKWMMVWdrlPcjcnjGZCFCGp4z/wEAsSa5BFDHreKjpj1TW3TjjMb0kfNIYzALmHUEbF8Q29n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903147; c=relaxed/simple;
	bh=ygnPQ7qqQym717fCvUFfhnK2QtoeS4ewCob6NeNRoB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCI9iri/EzZ7oPfYfcgQ6Nr4Zgmd/GkgyCfNUHBelt18mqflW06UE2zou1rrxD2ArOtcHLDNzuHKP05FjHKspICnz3XBWWYDWmChLtHGvdvwMyMSxdvUpTOJOh5bQh6BI2elMvd28gwBpO1EebkjJX9ggLSuBgAdY7F/0dPsln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihVt6mla; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC5AC19424
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903147;
	bh=ygnPQ7qqQym717fCvUFfhnK2QtoeS4ewCob6NeNRoB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ihVt6mlaorBbndGhkkCveepgzV2lv6R+u2Ox7OBjDcayXcVVfhA7g/licAPgZh2HG
	 +PQCi0P2TG6A7cppa84AlsyOTqJinLK1OQg6zfzWGxy0tjOOhgJ03t/O94K7iDPz2U
	 zBpK9AA0pI2yKCCTKOXEh3RVU5D4foBD5PA4kBzwTK6/+/oww/U6X31WvmVx0bzkY7
	 HiHhM+vS2tZdkyw6NYEzMaZMUgY3NtL76NxU3oJOZ4VNKi6vrXpZLh77UjMNk5HqaD
	 5wI6qI25k50sZLonzATNWb0qUapp26Vl64gCgdB7GqMlFPmlvqZVdzrmm8Bf3BzD9v
	 30Ntam0GeLiCA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6499159273dso6022468a12.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 08:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrNgPB48YnTgCqFcR1ysgF8lX/a6w5hhRCeVASRD/GayeQmUxcpcQpLIV7HgwJGtPZrh1qw71UyJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5bgAXEyNbcnrJO/IkT/T78fNVPLdpqJkEPoImbxftnJqefK38
	CRoy4Z+QxSObG4Q2etlNiGPNj5UroJ8GA97vZj0fpXcxCM/slFQixjy3FcgDO9EXk8hzmApTZYS
	hy5Pciml8amfaw50PGcO+0oBa8wAtcA==
X-Google-Smtp-Source: AGHT+IF5jXJ0Rl7YYnShYK/S+a50ZyXpCcbuaBSQB8P5v+he6uYqN0QQpK8m3x5KcKmZZWDxawZvxxtvR6G4pjd9LKo=
X-Received: by 2002:a05:6402:34c6:b0:649:6a40:143c with SMTP id
 4fb4d7f45d1cf-6499b168a3fmr15052287a12.5.1765903145910; Tue, 16 Dec 2025
 08:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215212507.3317805-1-robh@kernel.org> <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
In-Reply-To: <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 10:38:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
X-Gm-Features: AQt7F2pHbPdy-KmWb8WZRvs7TP6Y2xOXn9QzR2n7zlqPufyZqNmrkovKonzV3PQ
Message-ID: <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:22=E2=80=AFPM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Hi Rob,
>
> On 2025/12/16 6:25, Rob Herring (Arm) wrote:
> > The Socionext Uniphier DWC3 controller binding is already in use, but
> > undocumented. It's a straight-forward binding similar to other DWC3
> > bindings.
>
> After being pointed out by Krzysztof at OSSJapan, I've checked the bindin=
gs
> and was preparing some additions or fixes to resolve the warning.
>
> It's almost the same as my proposal, however, I add a little.
>
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 ++++++++++++++++++=
+
> >   1 file changed, 89 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> > b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> > new file mode 100644
> > index 000000000000..892ae3458c1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yam=
l
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
> > +
> > +maintainers:
> > +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > +  - Masami Hiramatsu <mhiramat@kernel.org>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: socionext,uniphier-dwc3
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: socionext,uniphier-dwc3
> > +      - const: snps,dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    items:
> > +      - description: Host or single combined interrupt
> > +      - description: Peripheral interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - enum:
> > +          - dwc_usb3
> > +          - host
> > +      - const: peripheral
> There's no problem, but how about the following description
> following snps,dwc3.yaml?
>
>    interrupt-names:
>      oneOf:
>        - const: dwc_usb3
>        - items:
>            enum: [host, peripheral]

That allows for 'peripheral, host' or just 'peripheral'. Mine would
seemingly allow 'dwc_usb3, host', but snps,dwc3.yaml will prevent
that.

>
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: bus_early
> > +      - const: suspend
> > +
> > +  phys:
> > +    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed P=
HYs
> > +    minItems: 2
> > +    maxItems: 6
>
> Since Pro4 only has one PHY, so:
>      minItems: 1

Ah, I only checked arm64. Will fix.

If there's other arm32 warnings, I'm not looking at those. So fixes
appreciated there.

Rob

