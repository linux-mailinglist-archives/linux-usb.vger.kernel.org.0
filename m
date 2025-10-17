Return-Path: <linux-usb+bounces-29424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0CBEC0DE
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 01:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E80304ECF57
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 23:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E41D311C21;
	Fri, 17 Oct 2025 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XIAHGi7y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D82D94B7
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 23:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760745501; cv=none; b=kNIu3gOWpY0Sq6FTkd6U/cYerUVhTsZOMeITbIDNOvbVfccV/U5Uxp1+10ztMHpvRDUahB8zG6vGFjHJHv+87BY7FFaR9ebgk2N1wxtEQJLBWUP16HoB1d+xEbOtxaFqkjrOTfDcsnaOWDUQQS31ltOR3I06Ki3Y2HJKfvVgl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760745501; c=relaxed/simple;
	bh=Wr5oFlWql1QGkhb380QWtALsgTu+7Xtxpqvn0vXzUS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEKFrE95C0dx2ER/hZhLLGImW+82KoSCY932yvVAB++9aj1zbwyG228ZnGU/Z9IXu3KQd8Gwc8pndhzRq0aps6Ax4oMspH+z3C/MEk85KCv040h4eAshPJmeUTp+M08zb98A2YUfVtBApWnuiEjOtTClPyndeu+kwxb5VY/Az88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XIAHGi7y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27eec33b737so36659155ad.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 16:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745498; x=1761350298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SE0GPjAFjItjLF86HET23/U9OrOIQ8cx/iNIr3s8Q8=;
        b=XIAHGi7yWxpkUSM5PU1N17uQ4GloUYtqqK5IaxCtAIXtV9pKXJWA34hxRJAofa/2ui
         bpy91mNCHE77yFP4NdVFzybCkkzR2swU7HzBIeZaYN7WhwmnhIoPv6Lj2/SFcabVxmNf
         CUpjQddjV3r5NLwMgrHnbcVNpYUeeHImTRz97g45aIHmI0YB2J7GlmYnPdOi1s5XnuNQ
         vTETiqb1CnQAJ0elzqyjkU4w4HW6qLuCYigdljI3PnRSBEbh8XIS1X6vRpowreMX3zUd
         IrAyjIpQMHCOVE8ER5e2nW0iKokYOZY/qPpziCHkbPdv9gpVZi4DBmyz7elJQ3HUnAIa
         fN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745498; x=1761350298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SE0GPjAFjItjLF86HET23/U9OrOIQ8cx/iNIr3s8Q8=;
        b=i9kw757X3bWDbcNWBzAra+ZZfnVeXIvcO6qzDvIQ0ezjN6JXOKIqLMe0F1qWOvo3B2
         Oc4CXIZIVp5HMPc1FaW8M5BRNDV1aJcWZGMPROSfaJvhtslT6sd4+meCs1p7udxjtbfY
         Hlp9fKH5+tUq8gGKKusiESarceePF3wCTF/6GGRd5wwea/zCJ6L9mDV+UyWgYvJzciF4
         WlpwJKFs/UeMnkOHow8E48LVe/J7mC+waVKoHUkCSe6RMvMzIRdAqNxcZQ2FQSYgCut0
         ET+HCzJX7uKkAaQ0IBTY9YJleQeKCF8wNe01dxHOm+V5BRvOEnlt/u3xKjCMizHn2b2k
         X9ng==
X-Forwarded-Encrypted: i=1; AJvYcCVNOF9n9YQffG3W5tIa7VuH/HM/iH7kSPAlQl1ErpeEQj5AnQNLyaJ+Rh8jGPMpkjHpcx+D3R8BBv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBua3z7HaxReVgkW6oTsufLOcAhE7UIwoXK9rvQIs4pqtzELi8
	XxJHnz5atZ6PqACyn8LA/ZdXMjFiFyq9/1sDCmEDfulJe8BZrpKVux71U5nkooJT1e8PZ2v0EdZ
	QKicnsbYskHflsJALl/9wQvh9r7WqB58q7QsKw5ye
X-Gm-Gg: ASbGnctseM7Ts3az2CL6TcCc5bl7TLmrF/sW+d2sIuF4mCa5yhvrPflXWe5NjadLVoR
	sCgAnT23M4zk9VjADeq33eA1N6KMfcKqZgcjacwdWsUZxEDtWQvKBbCm1oxI9K/fqMGPzvXAUgH
	+AZU3BAJzb8FGONmYjcokd9gvxkfJmphjLnhiV9B3JlotGan3zrnuV5v1LOFk6xaKrVmPHqYIZE
	lPJcEVCU24EFSC845IacUrneFj/FZKja2AAGEdoPiM6krIXZ34rqmBZzstBoi652TaBbiTbZqIY
	h6XDdGluPCt61MLiMGf5xh8HxQ==
X-Google-Smtp-Source: AGHT+IHCANqLORIt+IrA+YkO6lwZel+K3VDA4WBemP44u6xPVrUe6fi1GWh3Pp23fq65Ylj7U7aD8xTBhXTINQfkvBY=
X-Received: by 2002:a17:902:d2c4:b0:250:bd52:4cdb with SMTP id
 d9443c01a7336-290ca216351mr67457005ad.32.1760745498073; Fri, 17 Oct 2025
 16:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org> <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
 <20251015130538.GA3214399-robh@kernel.org> <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
In-Reply-To: <CA+zupgxAhErw4i0Q13hyXE2_sQSowzDgZ4Yv8o1tcZQS7G7a-Q@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 17 Oct 2025 16:57:41 -0700
X-Gm-Features: AS18NWD5UlV7b-66BMMBU_l_HmLfx0ZDw13ZyAgDAmVkiOjEHLur9mcaNTje0Ak
Message-ID: <CA+zupgxx9VQ6Mh1=x7EiGSCWeAqf8LM-047fA99tyE0sHsTamQ@mail.gmail.com>
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

On Wed, Oct 15, 2025 at 11:57=E2=80=AFAM Roy Luo <royluo@google.com> wrote:
>
> On Wed, Oct 15, 2025 at 6:05=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Oct 13, 2025 at 06:46:39PM -0700, Roy Luo wrote:
> > > On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > >
> > > > On 10/10/2025 22:16, Roy Luo wrote:
> > > > > +  reg:
> > > > > +    items:
> > > > > +      - description: USB2 PHY configuration registers.
> > > > > +      - description: DisplayPort top-level registers.
> > > > > +      - description: USB top-level configuration registers.
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: u2phy_cfg
> > > > > +      - const: dp_top
> > > > > +      - const: usb_top_cfg
> > > > > +
> > > > > +  "#phy-cells":
> > > > > +    const: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  resets:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  orientation-switch:
> > > > > +    type: boolean
> > > > > +    description:
> > > > > +      Indicates the PHY as a handler of USB Type-C orientation c=
hanges
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - reg-names
> > > > > +  - "#phy-cells"
> > > > > +  - clocks
> > > > > +  - resets
> > > > > +  - power-domains
> > > > > +  - orientation-switch
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    soc {
> > > > > +        #address-cells =3D <2>;
> > > > > +        #size-cells =3D <2>;
> > > > > +
> > > > > +        usb_phy: usb_phy@c410000 {
> > > > > +            compatible =3D "google,gs5-usb-phy";
> > > > > +            reg =3D <0 0x0c450014 0 0xc>,
> > > > > +                  <0 0x0c637000 0 0xa0>,
> > > >
> > > > You probably miss DP support and this does not belong here.
> > >
> > > This register space isn't solely for DP operation, a significant port=
ion
> > > manages the custom combo PHY. Consequently, this space is essential
> > > even for USB-only operation. We can expect more registers in the spac=
e
> > > to be utilized when DP support is added.
> > >
> > > While I acknowledge the current name is confusing, it directly reflec=
ts
> > > the hardware documentation. We can either adhere to the hardware
> > > documentation's naming or propose a more descriptive alternative.
> > > What's your preference?
> > >
> > > >
> > > > > +                  <0 0x0c45002c 0 0x4>;
> > > >
> > > > That's not a separate address space. I really, really doubt that
> > > > hardware engineers came with address spaces of one word long.
> > >
> > > I initially created this space to access the usb2only mode register,
> > > which must be programmed when the controller operates in high-speed
> > > only mode without the USB3 PHY initialized. Upon review, I now
> > > believe the controller driver is the better location for this configu=
ration,
> > > as the register logically belongs there and the controller can tell
> > > whether usb3 phy is going to be initialized.
> > >
> > > That is, I'm removing this register space in the next patch.
> >
> > You are missing the point. What exists from 0x0c450020-2c and
> > 0x0c450000-0x14 for that matter? Hardware blocks don't just start on
> > unaligned boundaries like 0x14 or 0x2c. DT describes the h/w blocks, no=
t
>
> Rob,
>
> Thanks for chiming in. Let me elaborate the register layout here:
> The register space 0x0c450000 - 0x00450043 is supposed to
> be assigned to the USB controller. However, the USB phy has
> to access a small portion of it, i.e. 0x0c450014 - 0x0c450020,
> in order to initialize usb2 phy. This is really unfortunate and
> makes things more complicated than it should've been.
>
> The current patch is addressing it by splitting the register space:
> - USB phy: <0 0x0c450014 0 0xc>
> - USB controller: <0 0x0c450000 0 0x14>, <0 0x0c450020 0 0x23>
>
> > just nodes of what a driver needs. So if the 0x2c register needs to be
> > accessed by the USB driver, that's fine, but the register doesn't go in
> > the USB controller node 'reg'. A property with a phandle to the node
> > defining all the 0x0c450000 registers and an offset (if needed) is
> > typically what we do there. Or you can just find that node by
> > compatible.
>
> Just to make sure we're on the same page, are you suggesting
> making the register space a syscon node [1]? something like this:
>
> usb_cfg_csr: usb_cfg_csr@c450000 {
>   compatible =3D "syscon";
>   reg =3D <0 0x0c450000 0x0 0x43>;
> };
>
> usb@c400000 {
>   ...
>   usb-cfg-syscon =3D <&usb_cfg_csr>;
>   ...
> };
>
> usb_phy@c637000 {
>   ...
>   usb-cfg-syscon =3D <&usb_cfg_csr>;
>   ...
> }
>
> [1] Documentation/devicetree/bindings/mfd/syscon.yaml
>
> Thanks,
> Roy Luo
>

Hi Rob,

I'm sending out a new version of the patchset.
Although this specific comment isn't fully resolved yet, I've integrated
enough new content and fixes into this and other patches that I believe
it's ready for another round of review.

I'm happy to continue the discussion on this specific point here or in
the new patchset. Here are the links to the new patches FYI:
- controller https://lore.kernel.org/linux-usb/20251017233459.2409975-1-roy=
luo@google.com
- phy https://lore.kernel.org/linux-phy/20251017235159.2417576-1-royluo@goo=
gle.com

Thanks,
Roy Luo

> >
> > Rob

