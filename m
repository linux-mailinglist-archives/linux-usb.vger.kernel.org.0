Return-Path: <linux-usb+bounces-32164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90962D0FA7B
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 20:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E621B3046FAC
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 19:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066B6352F88;
	Sun, 11 Jan 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jThxqVdL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B7E1607A4
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768159915; cv=none; b=N3yHVCyn0HzdEUv8gac0Sttk64LN13QX8irqQocwtbYYFg7y7yni7iiDH7Te+7SHfGGf8uAbmKnF30UALMuTjrK+P7qYfOn31AcDoxYtMUdCTCcq1RQb30x3TiNmYYVvSjDyfc2d2rMx37mMTqw4XKJ4dxK6xk4ji8jtFvjtYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768159915; c=relaxed/simple;
	bh=9kRTB7j2+dOj7uuByJTedIf0C2TkNSEV20s7ZNXlfZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvQz8J72ddIN65PXGQieCuKbxP8XpQwPnma7o5/6xRATUS/leoaB5SfHRl3U9jEWtObq650jLltHnJhfUputRu8S+XK/2k7A6OBBL3zv28gZzk+ns4tqeeTRh2C4WYRrgFQGFAIGbTfjIpA5RqUm/1ER4q09579XapfC6+QVxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jThxqVdL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso5092796a12.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768159912; x=1768764712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1llCMASQ3MobTxu6nXqP5vUtdWy7RUn8pLv2JvHCXy0=;
        b=jThxqVdLpCp4kqxaxjyvWO42xJaX6Iayhf1X6f3ckpIFzzZy803Iu8+0lPGq16K1QF
         afWiITbBEiW7IaoLDRpCRGoeXQ7lxSMid5m92/H/WVu9kLSNCtNJN1+Ffl9est3BkLe4
         MOgHf0PFRvDX8o7HN+9p1ErMK9h8F5TaftUTPsVfeimeXpYGjb4cZFGiHlYFPhVoSOTQ
         oELbtVlOy9m5RjqyFPNFBM+P7eGszFou0X0qUZfJhwiXlXzQSxHvD3B0ZfNnttdvLsn4
         s3yqLej0U7stWN5TJA60JnfHD04vidh1jxWtlXGWOipvYWS24N5T0DuyGI1Q99OtAI92
         Nk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768159912; x=1768764712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1llCMASQ3MobTxu6nXqP5vUtdWy7RUn8pLv2JvHCXy0=;
        b=UAzGpb5tjYCtptoArTcOoQF8Y+Dgqu3KXtm6yHKNBm9+A+EtNEwOhzLcufXG9iSIbg
         oOkeBz9uADjtlHsxOJUhusEJahiwYqMNqPjx/7WjyOoSIM5Xitv6LPa9PWFbkAu4XLla
         6huNGgrWbmmgGl92bMSmsujt7DGtmWzKQJY/WYoTWGDQjjX6S6WxrvTzvL70w2qTjLRP
         EWsB+QuoYwVMOsZ44slfgE201QbPP6TIzn/AQd2RD+r/MAAE777Ig6Z6nJeIBw743hE5
         TJKr9JiyBw7vRUvBuLkgXBhzGeKeFOGnpO2NtkLDOM6THqoaZGPxXasyJbK/0sKO4f09
         azTg==
X-Forwarded-Encrypted: i=1; AJvYcCUhhPsPtquQt8n65lluLqmQg8dHmpPH7rTu771dMCJxT8zyMcC7Zq2tR3dZc9I5aQxl/VQhJpdINmw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4duQS8rUlB/22tger4k8XD2vKk85LFihD04JOeSk8/4xvaiFR
	JCQfrTOgYKREtjTyvJe/ziW9ldi8aMZsBHYatDbC7WIAzD2gneDGrcuHMJQ1m4wIRkklVqNr587
	afKx+E4v/huKonhAJRAPIYgRRVq+zd/A=
X-Gm-Gg: AY/fxX5WSpgsuP2BcWjtcyUp5D+aF+jle4YGnZMTfSsnQBY31+MT2s2gjhQ1wMMuNOr
	HS5aKC6sJ/cAjSIPfgK1NiisxENTwTW9su6V43bCxhNsAYsa6QobjvDN3chkgHDxBEihYhWEtyW
	oBY0ktyb3y/UeOSN+/3N7JxRoZO7L0Ss/+R9CLJPS0nM7y0jH40I39WkKrXDZbPrmdxW7LdcLfw
	jySXw7lBSYAsRi0GVIy8aArTrWEtmwozcD8dUzx97fn1PhNW/ZOCJLB9T7di0lYIJU=
X-Google-Smtp-Source: AGHT+IFT/knNVJfiA11bK06YsQejbdfC7KAQjOrTau0qt16Y+07yWK0cpRf4pmTxw0HgBdiPh3Jnl9b4btWgBTwkc7s=
X-Received: by 2002:a05:6402:1488:b0:64c:ff6b:f56 with SMTP id
 4fb4d7f45d1cf-6507c0704e4mr14268114a12.9.1768159912220; Sun, 11 Jan 2026
 11:31:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-2-linux.amoon@gmail.com>
 <aVke1kQnHJLqWGHi@venus> <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
 <aWGJYt3VPWh1kC_v@venus>
In-Reply-To: <aWGJYt3VPWh1kC_v@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 Jan 2026 01:01:34 +0530
X-Gm-Features: AZwV_Qjk0PC1h4-nzgxSMCHjCoYMB6_DfqK9WUaQvz9oLKiSdDPd37nJhqh4lBo
Message-ID: <CANAwSgTGJ5mqoieWOse3OCO3pFepwn1eQx-Hu+O1Pj6hkpdNXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

I am having difficulty articulating my thoughts clearly right now;
please bear with me as I try to explain.

On Sat, 10 Jan 2026 at 04:41, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jan 08, 2026 at 12:24:50PM +0530, Anand Moon wrote:
> > Hi Sebastian,
> >
> > Thanks for your review comments.
> >
> > On Sat, 3 Jan 2026 at 19:23, Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> > > > As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> > > > active-low signal. It requires a pull-up resistor to maintain a sta=
ble
> > > > high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable s=
ignal
> > > > requires a pull-down resistor to ensure it defaults to a low state,
> > > > preventing unintended power delivery during the boot sequence.
> > > >
> > > > Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> > > > pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> > > > electrical requirements.
> > > >
> > > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for R=
OCK 5B/5B+/5T")
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
> > > >     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> > > > ---
> > >
> > > Checking the schematics:
> > >
> > > 5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
> > > 5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R9503=
5 is NC
> > >
> > > 5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > > 5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> > >
> > > 5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > > 5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> > >
> > CC_INT_L is gpio interrupt pin to enable the I2C read operation.
> >
> > As per FUSB302 datasheet, here is the updated version of the commit mes=
sage
> >
> > Configure CC_INT_L as an active-low, open-drain output. Per the hardwar=
e design,
> > this pin utilizes an external pull-up and is driven LOW by the Type-C
> > controller to
> > signal the processor to perform I2C register reads.
> >
> > The TYPEC5V_PWREN_H pull-down resistor is turned on as a signal to
> > the Type-C regulator, which has an active-enable-high property. In this=
 context,
> > the regulator is used to set the polarity of the GPIO used to enable or=
 disable
> > the regulator.
>
> I don't understand what you want to say here.

I'm sorry for not being clear here. Well, while investigating the bug crash=
,
I was looking for some more details on this issue.

Here is the datasheet for fuse302. It shares the interrupt pin details

[1} https://www.onsemi.com/download/data-sheet/pdf/fusb302b-d.pdf

SCL     Input                          I2C serial clock signal to be
connected to the phone-based I2C master.
SDA    Open-Drain I/O          I2C serial data signal to be connected
to the phone-based I2C master
INT_N Open-Drain Output    Active LOW open drain interrupt output used
to prompt the processor to
                                             read the I2C register bits.
>
> > > TLDR: All GPIOs have pull resistors in discrete hardware and do not
> > > need them muxed in the SoC.
> > >
> > It depends on the GPIO, pinctrl PMU configuration.
>
> as I try to say it does not depend on pinctrl configuration for any
> of the GPIOs you are touching. The pull resistors for them exist as
> components on the board.
>
I understand this correctly, but these registers utilize a high-to-low
state change specifically
to prevent subthreshold leakage current.

Please check the RK3588 Datasheet V0.1-20210727.pdf  (3.4 Electrical
Characteristics for General IO)
[2] https://gitlab.com/rock-chips/rk3588/rk3588-doc/-/raw/master/RK3588%20D=
atasheet%20V0.1-20210727.pdf?ref_type=3Dheads&inline=3Dtrue

> > I was thinking of converting the vbus5v0_typec regulator to 'regulator-=
gpio.'
> > to better reflect the hardware schematics. The TYPEC5V_PWREN_H signal
> > (GPIO2_B6_d) acts as a state controller rather than a simple enable pin=
,
> > and this change ensures the device tree aligns with that design
> >
> > [1] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic=
.pdf
> > (page 28)
> >
> > $ git diff arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > index 5f58e339a052..387ff009ec76 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > @@ -57,9 +57,10 @@ rfkill-bt {
> >         };
> >
> >         vbus5v0_typec: vbus5v0-typec {
> > -               compatible =3D "regulator-fixed";
> > +               compatible =3D "regulator-gpio";
> >                 enable-active-high;
> > -               gpio =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> > +               gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> > +               states =3D <5000000 0x1>, <0 0x0>;
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&vbus5v0_typec_en>;
> >                 regulator-name =3D "vbus5v0_typec";
> >
> > Could you please try this at your end?
>
> This is missing gpios-states, but I also see no point in testing
> that. Having one state as 0 effectively means this is a complicated
> version of regulator-fixed. The switch from "gpio" to "gpios" is
> valid though, since "gpio" is deprecated.
>
Typically, a regulator-fixed GPIO input pin is used as EN to enable
the regulator.

However, in this case, TYPEC5V_PWREN_H is being used to signal on/off
to the FUSB302.
As the GPIO-controlled interrupt pin is used to enable or disable i2C
controller.
This is the reason I want to switch from regulator-fixed to regulator-gpio.
ok I will add gpios-states=3D <1>;

That=E2=80=99s why I requested these changes to be reviewed and tested.

[2] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/regulator/gpio-regulator.yaml

Please let me know if these adjustments are incorrect; if so, we can
discard them.
Currently, I'm not making the desired progress.

> Greetings,
>
> -- Sebastian
Thanks
-Anand
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

