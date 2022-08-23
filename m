Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F3A59ED44
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 22:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbiHWUZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 16:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbiHWUZg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 16:25:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1458D3DD;
        Tue, 23 Aug 2022 12:55:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3BA3B81D55;
        Tue, 23 Aug 2022 19:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F07C433D7;
        Tue, 23 Aug 2022 19:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661284511;
        bh=XvqZYm/jaApQ044714/uhhh4OlYPFvuwSufaHNqcrWA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CTlSA1oIpIkxmMhqxXJ5ZCTLm67TmiYq2k+8Cp47Npae1I1k9U+3WZBdOnlFxREeP
         yWM/SfZRUB7/A9/ZE8/8EnS/Y1sbc2hT8rFj+KzCHD0jo7QSlLaFhl0lgZ4jywQY6N
         Q4iwd35d2RvWcdQhzm11X/c0tiawjT7E0IzFt5W7FrgysI61Yltf2qonHO3oF/yExp
         XASkPmZLzyu82l716kDJpAZwd4KpxmPesVOsK+pHQjjCSKYIyhzzBYLnXVDnoMZ9zy
         SVFKConN/9s2eEQ+r+PBnF+ObBVpC9tdJSHwFjv17N+ZDxrbTcimAJTP43T2s8brcp
         bNmEGHM27RpqA==
Received: by mail-vs1-f54.google.com with SMTP id 190so7285632vsz.7;
        Tue, 23 Aug 2022 12:55:11 -0700 (PDT)
X-Gm-Message-State: ACgBeo2ShnD2JahQIXf3eH6T245vl8G4IFvQjNOdp5KqesCjz/lfjSvx
        EzqD4zW83pYWc976vb87p3HVOkk73lCxeHNlqg==
X-Google-Smtp-Source: AA6agR6Vc0FN9tquEi6X4C/a7A1FnPyf8kbL730PKDf9noqjwYWd2d0aQ7EXCZ8GWYarbCks81FNRf+dgRLPImV9aIU=
X-Received: by 2002:a67:c09c:0:b0:390:9073:1122 with SMTP id
 x28-20020a67c09c000000b0039090731122mr329026vsi.85.1661284510497; Tue, 23 Aug
 2022 12:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <437d6789-9ec0-fe4d-861a-5564dd291c39@milecki.pl>
In-Reply-To: <437d6789-9ec0-fe4d-861a-5564dd291c39@milecki.pl>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Aug 2022 14:54:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+F6s2jn25f7nq7gw1p5wL8W=N_dh1NmiKES6wyeiJB6w@mail.gmail.com>
Message-ID: <CAL_Jsq+F6s2jn25f7nq7gw1p5wL8W=N_dh1NmiKES6wyeiJB6w@mail.gmail.com>
Subject: Re: dt-bindings: generic-ehci.yaml doesn't work well with usb-hcd.yaml
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 21, 2022 at 4:14 AM Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> =
wrote:
>
> Hi,
>
> I'm trying to fix ARCH_BCM_5301X=3Dy + "dtbs_check" error:
>
> arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dtb: usb@21000: '#address-cell=
s', '#size-cells', '#usb-cells', 'port@1', 'port@2' do not match any of the=
 regexes: 'pinctrl-[0-9]+'
>          From schema: Documentation/devicetree/bindings/usb/generic-ehci.=
yaml
>
> that comes from:
>
> usb@21000 {
>         #usb-cells =3D <0>;
>
>         compatible =3D "generic-ehci";
>         reg =3D <0x00021000 0x1000>;
>         interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>         phys =3D <&usb2_phy>;
>
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         ehci_port1: port@1 {

I think the issue is usb-device.yaml says 'compatible' is required.

>                 reg =3D <1>;
>                 #trigger-source-cells =3D <0>;
>         };
>
>         ehci_port2: port@2 {
>                 reg =3D <2>;
>                 #trigger-source-cells =3D <0>;
>         };
> };
>
> ##########
>
> If you check Documentation/devicetree/bindings/usb/generic-ehci.yaml it d=
oes:
>
> allOf:
>    - $ref: "usb-hcd.yaml"
>
>
> In the usb-hcd.yaml there is:
>
> properties:
>    "#address-cells":
>      const: 1
>
>    "#size-cells":
>      const: 0
>
> patternProperties:
>    "^.*@[0-9a-f]{1,2}$":
>      description: The hard wired USB devices
>      type: object
>      $ref: /schemas/usb/usb-device.yaml
>
> ##########
>
> So all looks good at first sight. I guess it's some problem with $ref /
> additionalProperties / unevaluatedProperties.
>
> I thought that generic-ehci.yaml should do:
> unevaluatedProperties: false
> instead of:
> additionalProperties: false

Yes, and upstream does now.

>
> but that doesn't help:
> arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dtb: usb@21000: Unevaluated pr=
operties are not allowed ('#usb-cells', '#address-cells', '#size-cells', 'p=
ort@1', 'port@2' were unexpected)
>          From schema: Documentation/devicetree/bindings/usb/generic-ehci.=
yaml

You will see unevaluated properties warning if any of the listed
properties failed validation. I added your child nodes to the example
and got:

/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/=
usb/generic-ehci.example.dtb:
usb@1c14000: port@1: 'compatible' is a required property
        From schema:
/home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/usb/generic-e=
hci.yaml
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/=
usb/generic-ehci.example.dtb:
usb@1c14000: port@2: 'compatible' is a required property
        From schema:
/home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/usb/generic-e=
hci.yaml
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/=
usb/generic-ehci.example.dtb:
usb@1c14000: Unevaluated properties are not allowed ('#address-cells',
'#size-cells', 'port@1', 'port@2' were unexpected)
        From schema:
/home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/usb/generic-e=
hci.yaml

Rob
