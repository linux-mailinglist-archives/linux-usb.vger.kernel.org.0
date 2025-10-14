Return-Path: <linux-usb+bounces-29269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB6BD701C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 03:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E809E4ECCF2
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 01:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BED258EC8;
	Tue, 14 Oct 2025 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DL3rfUlE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4051EE7DC
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760406439; cv=none; b=gsWjeNtxQoVgu+ZKkw1qeFrx8kjDc1B2waK+TdKVuUPXeQ4ZmxhA+Z3CmVGhcjkutShF0vEDXx7aqdlhyjStOalmtO40N1ZuXiT5NThmBfcxTwNJIWCo8JJOxn2dWNsynbh3xRraN1uqYa1koq69wrgzBFiI0sFyMGk3fdpF1tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760406439; c=relaxed/simple;
	bh=2CsPuuc7sXtpg4PefmMtwBtWIx1LnKQTXPGwO21uvw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kng+ipIkyzZLC4IP9JW+vCJAUARLFc3OeO7OsKDpJNkvfi1T8j95b1Ge/7vZwHi1vpQZN+g0+J/2PsDY+VRIeEU+VDDIT2JYEwt7cEuwYDIMbzOnvGxOz/KDRQ+xKE4cPo8e2uu2DGiIYhaVjYPjnDUUn1K9ZR804jTw9SXMCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DL3rfUlE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26d0fbe238bso34265935ad.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406436; x=1761011236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=DL3rfUlEossuTfpAQhG3fRlWmnEy98cFaiiMWVQhnFGK9oowzpJAD7cG/Hb9+ZayzM
         TB6gtWxCADS73bEn4vd96ae1ecl4feJ2URZls++AaoJVdDTe/Z5KvlgCXj9wGFSU9FiU
         3sSo1Ca37CX4LodN47lKADJ+ZqQiukR9h40LWTYinIhHzlTOS0AQWdpYGzfabumnVjFK
         RleQ70Ke7MLoSOGBmfbg6B1fsjsi7fMfkEToysLWVPEUAuoRfyT1hHs0n7hvxrC9rvTk
         ogCtP2YSEmgSJs86qlQUkyN9gZnBJxwCFzwvFXQSanWZIprX66PSH4OrfBfIXlWWs2/0
         d7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406436; x=1761011236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=n2gw5K/GX/nmUnjWBeNSoLF5y9DgtjBc132K1QxIJ1uXrcVNDG3TPdKZG8rc9sfy60
         mFBwezaK7F5F7+cK+AsIy274K/VeqzJ11aPl9DUmXNdyH6D4QXTYgkxAdqb6QnAQr2yu
         jR1sbW8A3MTmjc/9BJ5wg2JENxInCUqegEOtxDFRj9sEXTPZD64Dq1gR/6d+j9V+XROv
         T0/xzgRdHddDZXH8gaxvlZYJe8hXzvDR/tClPsXJdnLPmIunNp3Y6YkJ7y9/5Cvbxaid
         euHeyGGylohxHa29pYlAnOxawIpiknlcJWXVJmmgDQHSvQVgPmi5RfaQLDOfrAxsSe3e
         Tl7A==
X-Forwarded-Encrypted: i=1; AJvYcCVyLIv10WwbmzWOA23h46fn4ZbOAE71ZynpSDUi8ZpnZFqAk3WisvVQlb2WuUeZIklLNiO+DZK39c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwawQQRj/lMJBt1KOSlit6yFobTwMcwLO4URPoKMgiLpI4zxTpb
	5e6PGwYwI8YJgEDPzuTOxQP8cmd53APkFGjz9EL0yHpodnF3+zlR6XJtJLuB980agA6dQ3qvJlS
	wJq0Cm1e6gxJW6+lx6AKNItDBLnKUSIIKOHLpFjHv
X-Gm-Gg: ASbGnctRFWBG9S4iP8n4WwOBCm58RlU/n1DiMw5ckD2djhgaofejXcE6Dbu4Mtex2LI
	ebh1P85LR8OryXFXPQJG13q/NGiJUk6jZvMHv1iBToC0jVGuxQYMbJrYjhAi1UHLajlQNBjkmvb
	5whnv+06Wcy8HcD82dxDpMJcGOV6Tr9msg9oU4u8frRQMR8GOnLkDm5BUoR5qJDlNsQbdHIfG1n
	wu7HW/ygKG4IHlRyqHFnq+ORU7NQ0g3Bp9NBs6Z06DzE7Vw7WIVd17QW/egv1Ako8lkBnpMhe1S
X-Google-Smtp-Source: AGHT+IFfPTj8w4BDR5D6JCsus2aD4rztuewWvMbCmVCgUqrOKGYsSJJX4teAZRKcnFjdoRF0OnNBqOS96lWMLzstGuY=
X-Received: by 2002:a17:902:e952:b0:262:4878:9dff with SMTP id
 d9443c01a7336-290273567a8mr277763005ad.12.1760406436203; Mon, 13 Oct 2025
 18:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org>
In-Reply-To: <75756635-b374-4441-8526-175210e01163@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:46:39 -0700
X-Gm-Features: AS18NWCzy6Gx5qemaFGw2t6jXb-2epsDNHczVHslksbyWgF7Radr-Z781gw06UU
Message-ID: <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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

On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > +  reg:
> > +    items:
> > +      - description: USB2 PHY configuration registers.
> > +      - description: DisplayPort top-level registers.
> > +      - description: USB top-level configuration registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: u2phy_cfg
> > +      - const: dp_top
> > +      - const: usb_top_cfg
> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description:
> > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - orientation-switch
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb_phy: usb_phy@c410000 {
> > +            compatible =3D "google,gs5-usb-phy";
> > +            reg =3D <0 0x0c450014 0 0xc>,
> > +                  <0 0x0c637000 0 0xa0>,
>
> You probably miss DP support and this does not belong here.

This register space isn't solely for DP operation, a significant portion
manages the custom combo PHY. Consequently, this space is essential
even for USB-only operation. We can expect more registers in the space
to be utilized when DP support is added.

While I acknowledge the current name is confusing, it directly reflects
the hardware documentation. We can either adhere to the hardware
documentation's naming or propose a more descriptive alternative.
What's your preference?

>
> > +                  <0 0x0c45002c 0 0x4>;
>
> That's not a separate address space. I really, really doubt that
> hardware engineers came with address spaces of one word long.

I initially created this space to access the usb2only mode register,
which must be programmed when the controller operates in high-speed
only mode without the USB3 PHY initialized. Upon review, I now
believe the controller driver is the better location for this configuration=
,
as the register logically belongs there and the controller can tell
whether usb3 phy is going to be initialized.

That is, I'm removing this register space in the next patch.

Thanks,
Roy Luo
>
> > +            reg-names =3D "u2phy_cfg", "dp_top", "usb_top_cfg";
> > +            #phy-cells =3D <1>;
> > +            clocks =3D <&hsion_usb2_phy_reset_clk>;
> > +            resets =3D <&hsion_resets_usb2_phy>;
> > +            power-domains =3D <&hsio_n_usb_pd>;
> > +            orientation-switch;
> > +        };
> > +    };
> > +...
>
>
> Best regards,
> Krzysztof

