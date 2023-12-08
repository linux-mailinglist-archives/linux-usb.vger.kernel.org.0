Return-Path: <linux-usb+bounces-3884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DD80972E
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 01:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74C801F21313
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 00:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848F781D;
	Fri,  8 Dec 2023 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXtbziia"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AE819BF;
	Thu,  7 Dec 2023 16:25:01 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-59063f8455eso741440eaf.3;
        Thu, 07 Dec 2023 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701995101; x=1702599901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MSN+KGwjWnynTpdt4z2HpHMekwKnkXSJkY0oqIZKp+Q=;
        b=mXtbziiaTLKymrhRZLBoQSvAVgt84GLrjsLnABE7Pr7LaIpruPaEMCXrmIpvEkrUzl
         Ln/alo/ubUSM3EZqsxDTRQrSg65T83nmKRun4+tWFqS5YjBxA+HvwDrUOEDvrjKrMiYR
         23GZtmGmtXp2P4xsD6Eop0NOhoqG/hF/MEpQ8ka5v3UtV6/vtLLF630jaSpWJBynpNnh
         ZCaqZg7WG/2ZX/rz5lfAp8bIEAnRJiUtBBP5XXbQJv4it2kPQowmJh+xSqohR3zjEVPA
         RxzSf96pP2LwqlqiJSRnb2fpx8s/SJOhrKJjO97vDU7eGLvi4wpe968OOd4RlNvFoXka
         Mjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701995101; x=1702599901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSN+KGwjWnynTpdt4z2HpHMekwKnkXSJkY0oqIZKp+Q=;
        b=V3CHJcxHr57pWzMlw2ZD/oPa2pWhgLjevBbkuxwrSpSI8acAe2N8IL8tqZU5BHVHXG
         Igp8o2Av+UOgyntusHDYl9XbFoXzOCiZb//2q12E4xCYrArq8GjIM6FWzmi3oypvs7fu
         WE7iI6XdxEAyQqpWdwBONDhh+SZoZ0uoFOVj0QNGmLrr2JtDQqAeJU4S5Cb291ourWtE
         M8XQEQ3pT/Xi2kV03WxdMbVNNP5Qg5G+AGKP0rtxqWiocIUtb19uEZ2rDovAa+lOIjiN
         1imA5kG4RS4/dpNJyusK2WvwFUVxJyBPhBMWby7YG7chJxmxS0zwqyUcigo33CedAjsu
         AzRA==
X-Gm-Message-State: AOJu0YxTXX5m/mVf2A6cHLx4fxOkIAZqodDRwTov/5abpADylnyFsTHZ
	F1EAWjHmxyI6rbIhlsC+FlkYFD9kAOLu6rjxOUSdFbPSh4X/Eg==
X-Google-Smtp-Source: AGHT+IE2udV2rvMrY/grsLbuSgK8URfWOYUoftrCeWOfi0y4igmmQ/GFemj7anYUoOXKfI5XMf4vtFLfWHzvboXtdVQ=
X-Received: by 2002:a05:6820:1ac8:b0:58d:6ea3:8fc with SMTP id
 bu8-20020a0568201ac800b0058d6ea308fcmr4111694oob.2.1701995100761; Thu, 07 Dec
 2023 16:25:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org>
In-Reply-To: <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 Dec 2023 05:54:43 +0530
Message-ID: <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 7 Dec 2023 at 18:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/12/2023 13:33, Anand Moon wrote:
> > Hi Krzysztof
> >
> > On Thu, 7 Dec 2023 at 14:00, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 06/12/2023 18:14, Anand Moon wrote:
> >>> Hi Rob,
> >>>
> >>> On Wed, 6 Dec 2023 at 19:23, Rob Herring <robh@kernel.org> wrote:
> >>>>
> >>>> On Mon, Dec 04, 2023 at 08:14:25PM +0530, Anand Moon wrote:
> >>>>> Add the binding example for the USB3.1 Genesys Logic GL3523
> >>>>> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> >>>>> hub.
> >>>>>
> >>>>> For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>>>> with shared resets and power supplies, this property is used to identify
> >>>>> the hubs with which these are shared.
> >>>>>
> >>>>> GL3523 has built-in 5V to 3.3V and 5V to 1.2V regulators, which serves
> >>>>> power to the USB HUB, it uses 5V power regulator.
> >>>>>
> >>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> ---
> >>>>> V6: fix the description of the regulators
> >>>>> Updated the commit message for regulator updates.
> >>>>> add reviewed by Conor Dooley
> >>>>> [1] https://lore.kernel.org/all/20231130053130.21966-2-linux.amoon@gmail.com/
> >>>>> v5: upgrade peer-hub description : Conor Dooley
> >>>>> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=67 [Block Diagram]
> >>>>> v4: Fix the description of peer-hub and update the commit message.
> >>>>> Schematics of the Odroid N2+
> >>>>> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> >>>>> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> >>>>> v2: added Genesys GL3523 binding
> >>>>> v1: none
> >>>>> ---
> >>>>>  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
> >>>>>  1 file changed, 61 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> index ee08b9c3721f..c6f63a69396d 100644
> >>>>> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> >>>>> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
> >>>>>  maintainers:
> >>>>>    - Icenowy Zheng <uwu@icenowy.me>
> >>>>>
> >>>>> -allOf:
> >>>>> -  - $ref: usb-device.yaml#
> >>>>> -
> >>>>>  properties:
> >>>>>    compatible:
> >>>>>      enum:
> >>>>> @@ -27,12 +24,46 @@ properties:
> >>>>>
> >>>>>    vdd-supply:
> >>>>>      description:
> >>>>> -      the regulator that provides 3.3V core power to the hub.
> >>>>> +      The regulator that provides 3.3V or 5.0V core power to the hub.
> >>>>> +
> >>>>> +  peer-hub:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>> +    description:
> >>>>> +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> >>>>> +      with shared resets and power supplies, this property is used to identify
> >>>>> +      the hubs with which these are shared.
> >>>>>
> >>>>>  required:
> >>>>>    - compatible
> >>>>>    - reg
> >>>>>
> >>>>> +allOf:
> >>>>> +  - $ref: usb-device.yaml#
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            enum:
> >>>>> +              - usb5e3,608
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        peer-hub: false
> >>>>> +        vdd-supply: false
> >>>>> +        reset-gpios: true
> >>>>> +
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            enum:
> >>>>> +              - usb5e3,610
> >>>>> +              - usb5e3,620
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        peer-hub: true
> >>>>> +        vdd-supply: true
> >>>>> +        reset-gpios: true
> >>>>
> >>>> No need for this if schema. The default is they are allowed.
> >>>>
> >>>
> >>> If I move reset-gpios to required, I observe the below warning.
> >>>
> >>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>> hub@1: 'reset-gpio' is a required property
> >>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>
> >> Where are the properties defined? If you open the binding you see:
> >> nowhere. You cannot define properties in some variant with "true".
> >> Please define all of them in top-level and only narrow/constrain when
> >> applicable.
> >>
> > What I meant is the example below, required meant applicable for both
> > the binding
> > But it shows me the above warning.
>
> My explanation stands... So again:
>
> >> Please define all of them in top-level and only narrow/constrain when
> >> applicable.
>
Apologies, But I have tried this multiple times but have not been able
to fix the device tree warning
I have verified that example
Documentation/devicetree/bindings/usb/genesys,gl850g.example.dts
generate is correct

required:
  - compatible
  - reg
  - reset-gpio
  - peer-hub
  - vdd-supply

allOf:
  - $ref: usb-device.yaml#
  - if:
      properties:
        compatible:
          contains:
            enum:
              - usb5e3,608
    then:
      properties:
        peer-hub: false
        vdd-supply: false

  - if:
      properties:
        compatible:
          contains:
            enum:
              - usb5e3,610
              - usb5e3,620
    then:
      properties:
        peer-hub: true
        vdd-supply: true

additionalProperties: false

> Best regards,
> Krzysztof
>

Thanks
-Anand

