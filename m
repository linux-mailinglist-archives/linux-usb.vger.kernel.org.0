Return-Path: <linux-usb+bounces-3516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A817FF826
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 18:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FF7E281783
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CE655C34;
	Thu, 30 Nov 2023 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT9kPLv8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CA21998;
	Thu, 30 Nov 2023 09:25:47 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1fa22332ca1so1065744fac.1;
        Thu, 30 Nov 2023 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701365146; x=1701969946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXaR9pLpeAkRuQ4mZJuM+g+sqyQVKCnHLpozbW6RF0=;
        b=dT9kPLv85ny8ptGxJnCwpwQwQfaMi8udoe05AK4ZVW6bPKU18EkIPVfm8JIfbrn4rt
         mmmy+qBUY4yulxsT0zmu7ob/+kSq1MSjVuULE6+HH2Z+CQ6ebM/3SVt21txZf0TeZJ64
         REAOdNxukbIbtJ4sR4+CGnSYDav/AHvMUFoDXUorCQHokXufCkpc7DI5x5nYHxhgrPVn
         IU9wjIAKN9wlcaEcduiCoh/DlKLhjmhWb1IPr+PDsiXzqu5ZjQRRjtaYgzJMWQ01XrMI
         Sf1AgkL1SouF+Yf/gOXgXeysVCHQaBGut3vuZ/KAbsrPa3c/T4gitKha3TQvfbqKieyd
         yOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701365146; x=1701969946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCXaR9pLpeAkRuQ4mZJuM+g+sqyQVKCnHLpozbW6RF0=;
        b=vkvWf6cVNB0ukrGawMy8Kgl2xtNWv2Oj2lhYUP7Q74OKBJq1bQClh9IFvvcdxCezqc
         c1/WiNkZlS8THxoVisCBgJ+qnsLRyELDW/qW1nWODEOWMG8okpE2XUVgjwgYnz4+XC7z
         eWa3XVHI68huv0sJIGbwOkEDO/a4OnC/zh+Ori5anjl30fUYOoL/WsIwKhB4EGkoRsIk
         16tytqdqwU+fMzlzVVFdgEtyz6Ah1zRkQHnvJmbm4hMoN0GakREmRwgeGhF4XyLkEjdt
         c2Ss+WOO88PH1oxAjlQ+7TkWxeoreQUKZGbw0m8MQS60SSN9IeJ/Y6GxQEQbyGpNzG9t
         jClw==
X-Gm-Message-State: AOJu0YzQqw6c+jba3cnaeHqYDUd3H6B32vQqR56cNroMjq+Yf90zgrHr
	XgyIoD2jueQLQPQD/gMIjNddCxSfZHC/bC4RepjiO9GFgIQ=
X-Google-Smtp-Source: AGHT+IE1BcT0bCdIVW8dU7KPOFqHbZlDjWkEfqiyOMkkQWhlzpLu0zqsTW6SeIivANniYLPudEgoDo2OvABE67wmLQ0=
X-Received: by 2002:a05:6870:1652:b0:1fa:28b9:ad32 with SMTP id
 c18-20020a056870165200b001fa28b9ad32mr8830097oae.29.1701365146260; Thu, 30
 Nov 2023 09:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130053130.21966-1-linux.amoon@gmail.com> <20231130053130.21966-2-linux.amoon@gmail.com>
 <20231130-twig-stoning-58235b3195c8@spud> <20231130-snub-backshift-2f69754cf58f@spud>
In-Reply-To: <20231130-snub-backshift-2f69754cf58f@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Nov 2023 22:55:29 +0530
Message-ID: <CANAwSgQhvxUgg1BO2=eWJ_ZEtFKsidYo_xQNxji7yVE=Qy0F0Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, 30 Nov 2023 at 20:52, Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Nov 30, 2023 at 03:16:33PM +0000, Conor Dooley wrote:
> > On Thu, Nov 30, 2023 at 11:01:26AM +0530, Anand Moon wrote:
> > > Add the binding example for the USB3.1 Genesys Logic GL3523
> > > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > > hub.
> > >
> > > For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> > > with shared resets and power supplies, this property is used to ident=
ify
> > > the hubs with which these are shared.
> > >
> >
> > > [Conor Dooley: upgrade peer-hub description]
> >
ok
> > This should not be in the commit message. Otherwise,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Cheers,
> > Conor.
> >
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v5: upgrade peer-hub description : Conor Dooley
> > > [0] https://www.genesyslogic.com.tw/en/product_view.php?show=3D67 [Bl=
ock Diagram]
> > > v4: Fix the description of peer-hub and update the commit message.
> > > Schematics of the Odroid N2+
> > > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_2021=
0121.pdf
> > > V3: fix the dt_binding_check error, added new example for Genesys GL3=
523
> > > v2: added Genesys GL3523 binding
> > > v1: none
> > > ---
> > >  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++=
--
> > >  1 file changed, 61 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yam=
l b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > index ee08b9c3721f..499192ea4074 100644
> > > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> > >  maintainers:
> > >    - Icenowy Zheng <uwu@icenowy.me>
> > >
> > > -allOf:
> > > -  - $ref: usb-device.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -27,12 +24,46 @@ properties:
> > >
> > >    vdd-supply:
> > >      description:
> > > -      the regulator that provides 3.3V core power to the hub.
> > > +      phandle to the regulator that provides power to the hub.
>
> Wait, why is this text changing? I don't see it mentioned anywhere why
> this is no longer specifically 3.3v
>
GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which saves
customers=E2=80=99 BOM cost, and eases for PCB design.

Do I have to update this in the commit message? or leave this original.

> Thanks,
> Conor.
>
Thanks
-Anand

