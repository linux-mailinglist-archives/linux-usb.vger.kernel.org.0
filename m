Return-Path: <linux-usb+bounces-3280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DE7F71FD
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 11:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6505D1C20FB2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 10:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454818B15;
	Fri, 24 Nov 2023 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbD/CW6n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EDB92;
	Fri, 24 Nov 2023 02:48:40 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b843b61d8aso1044590b6e.0;
        Fri, 24 Nov 2023 02:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700822919; x=1701427719; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JSUEAKedcFlvjkIzN6LzNXLF8ZLIJ83SRbS1kwzATO0=;
        b=MbD/CW6nfK6nqn0J496x4uzqaxSn9ZC5LItkOPJOrECSsjMW06vzsdW3y2inl4Iq9K
         crdAa4/CBU4kpQDIlnG7JZqi25wzny9Bb2wkCHAA1n2X80yoX1kHJrsiZ2Icl++m+AQc
         9tU1y3bZpctBrkHG8M/Cvu3K/JZqrgp7y3ng4lGt78rbgVC7iqkgJIZid6HUdlqG2mMf
         VFY/ES07LpxKxLLdFs3m6MCJHJR+cymQlPXO/LaPNXSZFTin1P5QzHtEaz30b0npkEbg
         kFKtBSMu9nbo9se4364p9nyp90c3XwKzx70Hvj2DSvYJdBmO+Y6tblu7Vwp2XhHiqIC+
         W70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700822919; x=1701427719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSUEAKedcFlvjkIzN6LzNXLF8ZLIJ83SRbS1kwzATO0=;
        b=wb3ByAJi9iVURYnT6keF4HLMcaChGw5I0aTsWuzws8rCAcBSYO6nG7FkKoUg+FoAOY
         K28lHt2rBQ4G+ta9KW6ypogxBle5H69rzVGAove5krslu6YLD9UtoMwJQyxa7/rj1hKp
         7UNTDnyY5E3zcorK5SQH5tL73+hdySKzpVhQaJ8kdCeEO7GSR6dlsz4/JS7MO2Q0cXVr
         rN9cj8BXcHaSr7hOh08MKqALTr+HZp7YvbAh3UCZ8D+gJuibmsSy9jJmPLC9L//a+3kG
         8guavZkdFjyvQXHIejoSWO/mAICqL+fgOnlAOzV3BtYzP7VmGm1CMn1HxtVJpqBY00Jt
         Q1Sg==
X-Gm-Message-State: AOJu0Yztqg3d+SMF1XRR+LR8+s2cloAABwAYKcyL196SHXI6y/0KDtQm
	aKofMZfe2BSoSI8z25eVYbnnYe+kZI1WQT+TUz8=
X-Google-Smtp-Source: AGHT+IH2TyCtkFLMnAO/yClVYDhq70yZy6EcVUl/P6ZwWvgPzvLcjJQMd6c3yTIRYwm7OY8ExvVm49pGjrDQTZCwM54=
X-Received: by 2002:a05:6870:9f8b:b0:1e9:c7cc:df9a with SMTP id
 xm11-20020a0568709f8b00b001e9c7ccdf9amr3508073oab.11.1700822919197; Fri, 24
 Nov 2023 02:48:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122182351.63214-1-linux.amoon@gmail.com> <20231122182351.63214-2-linux.amoon@gmail.com>
 <20231123-skeletal-smirk-390543e2d6ab@spud>
In-Reply-To: <20231123-skeletal-smirk-390543e2d6ab@spud>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 24 Nov 2023 16:18:23 +0530
Message-ID: <CANAwSgQCOw_CY_Yy7zYHdme92O=O35Ev=MqHcznYnR=ycaxdPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor

On Thu, 23 Nov 2023 at 23:26, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> > Add the binding example for the USB3.1 Genesys Logic GL3523
> > integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> > hub.
> >
> > Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> > which has a common reset pin and power supply.
> > peer-hub phandle each peer controller with proper gpio reset
> > and help each peer power on during initialization
> > and power off during suspend.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v4: Fix the description of peer-hub and update the commit message.
> > Schematics of the Odroid N2+
> > https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > V3: fix the dt_binding_check error, added new example for Genesys GL3523
> > v2: added Genesys GL3523 binding
> > v1: none
> > ---
> >  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
> >  1 file changed, 63 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > index ee08b9c3721f..bc3b3f4c8473 100644
> > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> >  maintainers:
> >    - Icenowy Zheng <uwu@icenowy.me>
> >
> > -allOf:
> > -  - $ref: usb-device.yaml#
> > -
> >  properties:
> >    compatible:
> >      enum:
> > @@ -27,12 +24,48 @@ properties:
> >
> >    vdd-supply:
> >      description:
> > -      the regulator that provides 3.3V core power to the hub.
> > +      phandle to the regulator that provides power to the hub.
> > +
> > +  peer-hub:
>
> Should the property not be "peer-controller"? Your description refers to
> them as such.

No, as per my understanding, peer-hub represents a complete USB hub.
See the lock diagram in the below link.

>
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
>
>
> > +      which has a common reset pin and power supply.
> > +      peer-hub phandle each peer controller with proper gpio reset
> > +      and help each peer power on during initialization
> > +      and power off during suspend.
>
> I generally hate to talk about non-native speakers grammar etc, but what
> you have here is in need of a lot of improvement. The below is my
> attempt to understand what you are trying to say:
>
> "For onboard hubs that support USB 3.x and USB 2.0 controllers with
> shared resets and power supplies, this property is used to identify
> the controllers with which these are shared."
>

Sorry for the poor grammar, I will update this in the next v5.

> Also - this is one particular system, what prevents there being a hub
> that has more than 2 controllers? Also, as you insist that this is
> generic, and not just for genesys, should this not be defined in a
> common location?

Here is the block diagram of the Genesys GL3523 hub.
[0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]

It has two USB 2.0 and USB 3.1 controllers, so using peer-hub node
the onboard hub module will bring up this hub.

There are many examples that use similar properties hence it is generic.

# Documentation/devicetree/bindings/usb/cypress,hx3.yaml
# Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
# Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
# Documentation/devicetree/bindings/usb/ti,usb8041.yaml
# Documentation/devicetree/bindings/usb/vialab,vl817.yaml

>
> Cheers,
> Conor.
>

Thanks
-Anand

