Return-Path: <linux-usb+bounces-29348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF1BE0483
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 20:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF15D19A583D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 18:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B038D302CC2;
	Wed, 15 Oct 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wtbiL5Wv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104A301022
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760554710; cv=none; b=n/J2fjIG9eD7RKMYUXxUxghhlQGDgSRkRAebiyJgnh2586dQhRVNYmfCaV5K7vx967hlKQASHDW6XM6mZIzngEo95qUdpqZosaDd1yOrO29Fg3MOgwa3z+9MJMxmQwCGv12QtfEe3JNG+rIqHwn1OUjzz9bq1/0pesbFknsXMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760554710; c=relaxed/simple;
	bh=ToDe4OXCz3YO+YFGk7WoPcF3nwaVNZU8zopuhi0eZdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzU77dHoDbIk/TtsQI7ghObUwY5oLzRUyuw/8Vjgfp83WYuwXfexrCdytHEwlflCNjXWiQrZgKQlQteAfB4nvZ4wVPwwN4BkBT7k9Aq8CnObLt1iaBBs8bvicbAzwYC/Mqb+i8+fHzLIsRx2Zv4CnnIgb4ifZYsCC/9xdBUO0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wtbiL5Wv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2681660d604so75185925ad.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760554708; x=1761159508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRwPKnk8qfrHFphbSwARuokxhcbVBpznEGtVMYZ7BTU=;
        b=wtbiL5WvA5dTb8nzDeBXuJKJqGm0gP9Ac7WdumDHO1nhOBK2419K0nZDYsJnFSS9A5
         /t9OkHDf97Ghn64cDdsNtTXau26kBPnD+nPyXN9nENoSGlPDwG32YexR6LERKdFXKHKJ
         ARbj5cnXzlta2Jf6r1aK808eKkJjy1KoepB8vsCJ+COGh8DeoKa140GJCKc5bdb4iEzt
         rOKFm5UNe65oriXzPPQAGVPumBoV6jKNDyhFSJU29N/e3QzZh/o8iAAXBDqZ88X6gVy7
         r0vC1sXi1ef9JYb3+MxRYMgeHtaGRcddzj4nAnTwgHa0KgslKflBYA6x+1AXVBue6HHo
         5Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554708; x=1761159508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRwPKnk8qfrHFphbSwARuokxhcbVBpznEGtVMYZ7BTU=;
        b=tGdVxio5iTY4CrCy43psELzoxGTabNq/KiH+6RMK/73xeIRcq3hG3ps0Sv2kIVZ86X
         S5qrvxhpZdIqlcVhy/g4Hq2YzTIH2lxBOBtBu4gcbghzrYeHGMiSysCjbM1HZ+gbN05J
         fetXuTDp1YeVUd8GDLRYIeVE9OIZ2Obp+11mbCv4MrdClz2tBLctNrChWEqRZWDqErwo
         uHTPKfIoTaEmFvpvnb3m0s2ekO56NmACv6tZlRTehbxmLdAfmfuZqb9u65w6Qe0ePe59
         XnX3aO0VYIJg5klTp7V0/OjzNr1mDIDzo7cg5SwjF0UQU0iK7Lk3MAwSSAUKC8f0dofF
         sOgA==
X-Forwarded-Encrypted: i=1; AJvYcCWgzfVqpf1VLFv9XMADIWgl/4uSRe+OxKJZr9beaOOInOGYjTpjxmsva3TW58XaAHYV+DXI+usL6lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFuE1hGiRhTcdJxV9rTkymdNVSPJSZmeR4WzRyfFj/snKObZRe
	NoBBrrBGh+RjE81zS67UXmOg8x1S9hfeLPkNwx1Su38FtjInTsfDevLIB8l99hZLIprO8Qm6iGx
	wCYar94ZyeHhLstV+Q1q5k2Ln4f+D4gikPflf6wG9
X-Gm-Gg: ASbGncs420+wc7WLWQzXPKmJXU4x+41oJLYlPlX9QJjB2kogTk2q4gVf0PebafwdS3e
	QAV4cLnhj8lACceXU+G9cCYm5TZzj6VvHG5PCJV5Q8YvweNzVYU40wDd56zPP7Ej26HIVjxe+ww
	kSKDMUIROJQBvAjc2+uvqICWP94udbXwBe2DrD4BAEMbgBqDUIUSYOy8v+UC9exMuT+/jj3U89r
	BpSo3q+D+V0DW7hNmK/hSGPNxxMyyO79BcPfRvnRdvCAWryGYPRHpV9bDyS9KIywmS1JEiL7BIm
	Pz3KJ6jo8+wqKr0vMHLzNYxL
X-Google-Smtp-Source: AGHT+IFnYsW3w1gFetllx0+5CiL7Rf74v6cd4M6iTK6ClRMgKt3X+k4ZS1SInKpJctWdDoRuk+7QXEWu/txY1MI7yL0=
X-Received: by 2002:a17:903:37c7:b0:275:b1cf:6dd9 with SMTP id
 d9443c01a7336-290272f80dfmr360656995ad.52.1760554707274; Wed, 15 Oct 2025
 11:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org> <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
 <20251015130538.GA3214399-robh@kernel.org>
In-Reply-To: <20251015130538.GA3214399-robh@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 11:57:50 -0700
X-Gm-Features: AS18NWDABi6Rc7VHdjUz_InyfGjFdsf7Veklfegj5HRf0gGUj-mD1x86yUCd9pU
Message-ID: <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:05=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> > On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 10/10/2025 22:16, Roy Luo wrote:
> > > > +  reg:
> > > > +    items:
> > > > +      - description: USB2 PHY configuration registers.
> > > > +      - description: DisplayPort top-level registers.
> > > > +      - description: USB top-level configuration registers.
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: u2phy_cfg
> > > > +      - const: dp_top
> > > > +      - const: usb_top_cfg
> > > > +
> > > > +  "#phy-cells":
> > > > +    const: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  orientation-switch:
> > > > +    type: boolean
> > > > +    description:
> > > > +      Indicates the PHY as a handler of USB Type-C orientation cha=
nges
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - reg-names
> > > > +  - "#phy-cells"
> > > > +  - clocks
> > > > +  - resets
> > > > +  - power-domains
> > > > +  - orientation-switch
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    soc {
> > > > +        #address-cells =3D <2>;
> > > > +        #size-cells =3D <2>;
> > > > +
> > > > +        usb_phy: usb_phy@c410000 {
> > > > +            compatible =3D "google,gs5-usb-phy";
> > > > +            reg =3D <0 0x0c450014 0 0xc>,
> > > > +                  <0 0x0c637000 0 0xa0>,
> > >
> > > You probably miss DP support and this does not belong here.
> >
> > This register space isn't solely for DP operation, a significant portio=
n
> > manages the custom combo PHY. Consequently, this space is essential
> > even for USB-only operation. We can expect more registers in the space
> > to be utilized when DP support is added.
> >
> > While I acknowledge the current name is confusing, it directly reflects
> > the hardware documentation. We can either adhere to the hardware
> > documentation's naming or propose a more descriptive alternative.
> > What's your preference?
> >
> > >
> > > > +                  <0 0x0c45002c 0 0x4>;
> > >
> > > That's not a separate address space. I really, really doubt that
> > > hardware engineers came with address spaces of one word long.
> >
> > I initially created this space to access the usb2only mode register,
> > which must be programmed when the controller operates in high-speed
> > only mode without the USB3 PHY initialized. Upon review, I now
> > believe the controller driver is the better location for this configura=
tion,
> > as the register logically belongs there and the controller can tell
> > whether usb3 phy is going to be initialized.
> >
> > That is, I'm removing this register space in the next patch.
>
> You are missing the point. What exists from 0x0c450020-2c and
> 0x0c450000-0x14 for that matter? Hardware blocks don't just start on
> unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, not

Rob,

Thanks for chiming in. Let me elaborate the register layout here:
The register space 0x0c450000 - 0x00450043 is supposed to
be assigned to the USB controller. However, the USB phy has
to access a small portion of it, i.e. 0x0c450014 - 0x0c450020,
in order to initialize usb2 phy. This is really unfortunate and
makes things more complicated than it should've been.

The current patch is addressing it by splitting the register space:
- USB phy: <0 0x0c450014 0 0xc>
- USB controller: <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x23>

> just nodes of what a driver needs. So if the 0x2c register needs to be
> accessed by the USB driver, that's fine, but the register doesn't go in
> the USB controller node 'reg'. A property with a phandle to the node
> defining all the 0x0c450000 registers and an offset (if needed) is
> typically what we do there. Or you can just find that node by
> compatible.

Just to make sure we're on the same page, are you suggesting
making the register space a syscon node [1]? something like this:

usb_cfg_csr: usb_cfg_csr@c450000 {
  compatible =3D "syscon";
  reg =3D <0 0x0c450000 0x0 0x43>;
};

usb@c400000 {
  ...
  usb-cfg-syscon =3D <&usb_cfg_csr>;
  ...
};

usb_phy@c637000 {
  ...
  usb-cfg-syscon =3D <&usb_cfg_csr>;
  ...
}

[1] Documentation/devicetree/bindings/mfd/syscon.yaml

Thanks,
Roy Luo

>
> Rob

