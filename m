Return-Path: <linux-usb+bounces-32031-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31CD014EE
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 07:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D11830263DA
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 06:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63BB329E6F;
	Thu,  8 Jan 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELlDaww6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EEC32936F
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855314; cv=none; b=BvA/GPnaI4cSTrw6ICj1RBs4bI+mcUi6JEwj191/A1aaI8mQZU6o455QV7vg4vzsv8gkrkc4uS1kURRO62m/jG2HaMGoJ+t3UMv4QR12G1i47EUSOkrUENz7ufoJO2VxmBDIVmSwfuGXTc6bA9IQJVYIskCeKJAVsgFGt8rKMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855314; c=relaxed/simple;
	bh=nv7ToIuFJIGd8gMwVOMF9mTcX77kfw0ugV6X5a2Vr0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMCk8iGeKLePrTAn1sfuhrpycLO8EKjbstHqVEDCWauI4IUurM/quSUP8hM67NGH2DlnOTd2Df7DjyWH3FJUJcUvNWgOkm4uUZwlZrfExDDOdlV+JT4pEXUGR5OGFFMQadtUCppn20D9n/cFHkVlmDkqMVePtX8SRfztnVszEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELlDaww6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so4401409a12.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855311; x=1768460111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAyXDWLGELFvv1UWhWJn7SNZwSDSfP0ZE2dhDg/EXvA=;
        b=ELlDaww64bzX78NMuA58zlh8/lVlvogXpxA9JU0/PoFalLtXRXyzq85obaCscwBnaj
         72aJsLLS1MLzA7gT7qULSEkeP45Q4Pj9CBr8qP6iYLilgAhqkcB5QhTjfkBh7bZd9TMw
         G4sc0kY2YMTKwUe1rHoQh5Uu772jo5jXT7eYcbxhfhZroIyD3kZhzF1iCckRtdyQRkd0
         h9OykPaHYNaL0HnyFLS4ZdVl9I4XPyYhq5wS3vtuZqK668Uus5El8bXFc/MlWrN4SL9k
         EdL+jbGOIkDna9OuEKJm6brq/8mZ224oYmooPcUfPNuLQJXBYY7vjKg1lB+udXaSS08m
         lt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855311; x=1768460111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAyXDWLGELFvv1UWhWJn7SNZwSDSfP0ZE2dhDg/EXvA=;
        b=mS1Qd12Beblc0obLi84vfcAU9oa1DgT8tpv9AwnfN+Tvtkqh4DiLtCbWlFiJ1a6ktI
         jM6eoAY1U0h0xATda6L8So9XjxuPS8J2Au88WJjkI9zIRKiXN/h17tbiI1+PN7O4pqiZ
         1q2o59zuHGyhqhwiMvpWk7AmmJSL/M50vZS4rc8a/qb3zRgV9r1dOnJ6tMUY26PWuqPH
         Bv9LJgarqxSn1z0cJyVF/GFTd+LVH/cYmLUyZ5KvwID6TRrdh9uzp/09Lr5H7GdgX9VP
         DoHxMMvWksRot6dXktoDnv3z7mm+O4kw3cCInSgV8Xrx4tJgWMShXbaJt1nhg2Cc/qrd
         epmA==
X-Forwarded-Encrypted: i=1; AJvYcCXkCnAd7KeoiF8avu3Eq+EXXeVSuQ0JBiHOnz0Dvu8gW78NxgtZMurMvRrHmjy5PxsdF+eNNR3nDj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Qvyv7nmnvG+EZ0WRcFPpfcghDYc9jvoRY0r1IlhfXC4e1Yt1
	NKLHFe9wnA5vfslak+a2Iv57xWxf4YPL70jeozuU+AOPABDByROSX3sF4i0itQAZb1KNtHbZVvH
	eFTwCGZdi06WH3kd6xF/3I0ojCMnAAjU=
X-Gm-Gg: AY/fxX4b2ElG+TtA7bf4KcdkzTBPJwtElGEcVc+kv6lMaNxoq4KPgLuw7IMs7TNvnLr
	Xx5SAMaib9G7qAmL5g83970H21y06muAkObqezqIAcc1jwg91XV7Oy9qLuvi4ltZdOCW8yP+rA1
	lqeqVvBVmVaQ1+hc7pnddR5EmSVhPbjOiWMXZ2eKKPUk8YdkdWWNUnUdcFy8k3iPOOrK0GDGmqr
	BaAsemW7/H5lIyIc/G7EWyKjvq8nWyzOBTkAVr2/IKJPOCTfWgNcaiA9+GNikQ38LA=
X-Google-Smtp-Source: AGHT+IG4m9qvtkc1tMc4hksJp1Vna2m4aQX4wMUQg4Vqs3Y0Vu+b7EVPh7KsSp/EWOjuxv2xkQR9qBYjiSFRJ2sMnsk=
X-Received: by 2002:a05:6402:27c8:b0:64b:5f4e:9e88 with SMTP id
 4fb4d7f45d1cf-65097e4d851mr3774748a12.21.1767855310352; Wed, 07 Jan 2026
 22:55:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-2-linux.amoon@gmail.com>
 <aVke1kQnHJLqWGHi@venus>
In-Reply-To: <aVke1kQnHJLqWGHi@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:24:50 +0530
X-Gm-Features: AQt7F2qhaPGkLVIcZtPHVBeTYLw90eQbbpNMhgJtysYJBe3JW3HGYEkeT1DfTvQ
Message-ID: <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
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

Hi Sebastian,

Thanks for your review comments.

On Sat, 3 Jan 2026 at 19:23, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> > As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> > active-low signal. It requires a pull-up resistor to maintain a stable
> > high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable signal
> > requires a pull-down resistor to ensure it defaults to a low state,
> > preventing unintended power delivery during the boot sequence.
> >
> > Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> > pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> > electrical requirements.
> >
> > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
> >     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> > ---
>
> Checking the schematics:
>
> 5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
> 5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R95035 is NC
>
> 5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
> 5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
>
> 5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
> 5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
>
CC_INT_L is gpio interrupt pin to enable the I2C read operation.

As per FUSB302 datasheet, here is the updated version of the commit message

Configure CC_INT_L as an active-low, open-drain output. Per the hardware design,
this pin utilizes an external pull-up and is driven LOW by the Type-C
controller to
signal the processor to perform I2C register reads.

The TYPEC5V_PWREN_H pull-down resistor is turned on as a signal to
the Type-C regulator, which has an active-enable-high property. In this context,
the regulator is used to set the polarity of the GPIO used to enable or disable
the regulator.

> TLDR: All GPIOs have pull resistors in discrete hardware and do not
> need them muxed in the SoC.
>
It depends on the GPIO, pinctrl PMU configuration.

I was thinking of converting the vbus5v0_typec regulator to 'regulator-gpio.'
to better reflect the hardware schematics. The TYPEC5V_PWREN_H signal
(GPIO2_B6_d) acts as a state controller rather than a simple enable pin,
and this change ensures the device tree aligns with that design

[1] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.pdf
(page 28)

$ git diff arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 5f58e339a052..387ff009ec76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -57,9 +57,10 @@ rfkill-bt {
        };

        vbus5v0_typec: vbus5v0-typec {
-               compatible = "regulator-fixed";
+               compatible = "regulator-gpio";
                enable-active-high;
-               gpio = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+               gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+               states = <5000000 0x1>, <0 0x0>;
                pinctrl-names = "default";
                pinctrl-0 = <&vbus5v0_typec_en>;
                regulator-name = "vbus5v0_typec";

Could you please try this at your end?

Thanks
-Anand

