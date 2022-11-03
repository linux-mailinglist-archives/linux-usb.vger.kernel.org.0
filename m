Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C97617504
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 04:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiKCD3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 23:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiKCD3U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 23:29:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95E11572D;
        Wed,  2 Nov 2022 20:28:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3FE2361D16;
        Thu,  3 Nov 2022 03:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC27C433C1;
        Thu,  3 Nov 2022 03:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667446093;
        bh=xAmjTUGGuoYwzZYs+CUgA+zDTRqCVQLVywH6SdLrkao=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S1HWFHJqoYsqOwLQ6XVbTXsu+mP+Ap97ImfrkrprVXqIQDaHaspAW8gASkn3u7H8T
         k2xoHwG6qSUMdHzIZAswWP6MCUxfjBm+oTFg2oZ7lix6PfPvh8V36jrd0rKVPvXvc9
         +6K87RMB8SOfQELcx69IGejjbXTwV1m/6qI9/ofcLwGgHO9UYfuvPb3+CJHK6hfbCm
         w6IsZsAgybQhTb62MIydx5HZMXHmz2fVzgBPKxUdXtc7Wg5DM+mv/23yY6wD+SiMHV
         L2HfWDta14aHx9FXDoiS00PnymSd8GgCF/WpSPHUuX42z5/rm/NF08EmimNYW44M1p
         gPSI8Frat4Ggg==
Received: by mail-lj1-f177.google.com with SMTP id u11so701644ljk.6;
        Wed, 02 Nov 2022 20:28:13 -0700 (PDT)
X-Gm-Message-State: ACrzQf0qYSr1+nm5kM/0ExwO142ThTE+bu+VnpYpMuvHVE2BD6xC18Fd
        b1hfgQBN6Ay1EeWRzXp36jxZVBQKTMZjmXvKYQ==
X-Google-Smtp-Source: AMsMyM6o+ZS8cz/D92TgHTP81h0h2zmbh+LGs5A/auPLbCWnCatpBOqGMGnV41znIoQws68uf1EpUjanLcHVkHZ+IRs=
X-Received: by 2002:a2e:3508:0:b0:277:611:c251 with SMTP id
 z8-20020a2e3508000000b002770611c251mr10650985ljz.211.1667446091624; Wed, 02
 Nov 2022 20:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221103000336.164507-1-marex@denx.de>
In-Reply-To: <20221103000336.164507-1-marex@denx.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 2 Nov 2022 22:28:01 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+9j1rkYYx-8dwut0WYMOmzb_RxBSvYmR5JQvO14EJ+NQ@mail.gmail.com>
Message-ID: <CAL_Jsq+9j1rkYYx-8dwut0WYMOmzb_RxBSvYmR5JQvO14EJ+NQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] dt-bindings: usb: usb251xb: Convert to YAML schema
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 2, 2022 at 7:03 PM Marek Vasut <marex@denx.de> wrote:
>
> Convert the usb251xb hub DT bindings from text to yaml schema so it is
> possible to validate DTs against the schema.
>
> Adjust the example to describe two different hubs at different I2C bus
> addresses, to avoid I2C address collission in the example.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Richard Leitner <richard.leitner@skidata.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
> NOTE: I keep getting this warning:
>       Documentation/devicetree/bindings/usb/usb251xb.example.dtb: usb2514b@2d: vendor-id: b'\x00\x00' is not of type 'integer'
>       I suspect this has something to do with the /bits/ 16 in the
>       example. Can you provide some hint on what this is about ?
> ---
>  .../devicetree/bindings/usb/usb251xb.txt      |  89 ------
>  .../devicetree/bindings/usb/usb251xb.yaml     | 264 ++++++++++++++++++
>  2 files changed, 264 insertions(+), 89 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.yaml
>
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> deleted file mode 100644
> index 1a934eab175ee..0000000000000
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -Microchip USB 2.0 Hi-Speed Hub Controller
> -
> -The device node for the configuration of a Microchip USB251x/xBi USB 2.0
> -Hi-Speed Controller.
> -
> -Required properties :
> - - compatible : Should be "microchip,usb251xb" or one of the specific types:
> -       "microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
> -       "microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
> -       "microchip,usb2517", "microchip,usb2517i", "microchip,usb2422"
> - - reg : I2C address on the selected bus (default is <0x2C>)
> -
> -Optional properties :
> - - reset-gpios : Should specify the gpio for hub reset
> - - vdd-supply : Should specify the phandle to the regulator supplying vdd
> - - skip-config : Skip Hub configuration, but only send the USB-Attach command
> - - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
> - - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
> - - device-id : Set USB Device ID of the hub (16 bit, default is 0x0bb3)
> - - language-id : Set USB Language ID (16 bit, default is 0x0000)
> - - manufacturer : Set USB Manufacturer string (max 31 characters long)
> - - product : Set USB Product string (max 31 characters long)
> - - serial : Set USB Serial string (max 31 characters long)
> - - {bus,self}-powered : selects between self- and bus-powered operation
> -       (boolean, default is self-powered)
> - - disable-hi-speed : disable USB Hi-Speed support (boolean)
> - - {multi,single}-tt : selects between multi- and single-transaction-translator
> -       (boolean, default is multi-tt)
> - - disable-eop : disable End of Packet generation in full-speed mode (boolean)
> - - {ganged,individual}-sensing : select over-current sense type in self-powered
> -       mode (boolean, default is individual)
> - - {ganged,individual}-port-switching : select port power switching mode
> -       (boolean, default is individual)
> - - dynamic-power-switching : enable auto-switching from self- to bus-powered
> -       operation if the local power source is removed or unavailable (boolean)
> - - oc-delay-us : Delay time (in microseconds) for filtering the over-current
> -       sense inputs. Valid values are 100, 4000, 8000 (default) and 16000. If
> -       an invalid value is given, the default is used instead.
> - - compound-device : indicate the hub is part of a compound device (boolean)
> - - port-mapping-mode : enable port mapping mode (boolean)
> - - led-{usb,speed}-mode : led usb/speed indication mode selection
> -       (boolean, default is speed mode)
> - - string-support : enable string descriptor support (required for manufacturer,
> -       product and serial string configuration)
> - - non-removable-ports : Should specify the ports which have a non-removable
> -       device connected.
> - - sp-disabled-ports : Specifies the ports which will be self-power disabled
> - - bp-disabled-ports : Specifies the ports which will be bus-power disabled
> - - sp-max-total-current-microamp: Specifies max current consumed by the hub
> -       from VBUS when operating in self-powered hub. It includes the hub
> -       silicon along with all associated circuitry including a permanently
> -       attached peripheral (range: 0 - 100000 uA, default 1000 uA)
> - - bp-max-total-current-microamp: Specifies max current consumed by the hub
> -       from VBUS when operating in self-powered hub. It includes the hub
> -       silicon along with all associated circuitry including a permanently
> -       attached peripheral (range: 0 - 510000 uA, default 100000 uA)
> - - sp-max-removable-current-microamp: Specifies max current consumed by the hub
> -       from VBUS when operating in self-powered hub. It includes the hub
> -       silicon along with all associated circuitry excluding a permanently
> -       attached peripheral (range: 0 - 100000 uA, default 1000 uA)
> - - bp-max-removable-current-microamp: Specifies max current consumed by the hub
> -       from VBUS when operating in self-powered hub. It includes the hub
> -       silicon along with all associated circuitry excluding a permanently
> -       attached peripheral (range: 0 - 510000 uA, default 100000 uA)
> - - power-on-time-ms : Specifies the time it takes from the time the host
> -       initiates the power-on sequence to a port until the port has adequate
> -       power. The value is given in ms in a 0 - 510 range (default is 100ms).
> - - swap-dx-lanes : Specifies the ports which will swap the differential-pair
> -       (D+/D-), default is not-swapped.
> -
> -Examples:
> -       usb2512b@2c {
> -               compatible = "microchip,usb2512b";
> -               reg = <0x2c>;
> -               reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
> -       };
> -
> -       usb2514b@2c {
> -               compatible = "microchip,usb2514b";
> -               reg = <0x2c>;
> -               vendor-id = /bits/ 16 <0x0000>;
> -               product-id = /bits/ 16 <0x0000>;
> -               string-support;
> -               manufacturer = "Foo";
> -               product = "Foo-Bar";
> -               serial = "1234567890A";
> -               /* correct misplaced usb connectors on port 1,2 */
> -               swap-dx-lanes = <1 2>;
> -       };
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
> new file mode 100644
> index 0000000000000..d644af5bbb9f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
> @@ -0,0 +1,264 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb251xb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip USB 2.0 Hi-Speed Hub Controller
> +
> +maintainers:
> +  - Richard Leitner <richard.leitner@skidata.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,usb2422
> +      - microchip,usb2512b
> +      - microchip,usb2512bi
> +      - microchip,usb2513b
> +      - microchip,usb2513bi
> +      - microchip,usb2514b
> +      - microchip,usb2514bi
> +      - microchip,usb2517
> +      - microchip,usb2517i
> +      - microchip,usb251xb
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: |
> +      Should specify the gpio for hub reset
> +
> +  vdd-supply:
> +    description: |
> +      Should specify the phandle to the regulator supplying vdd
> +
> +  skip-config:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Skip Hub configuration, but only send the USB-Attach command
> +
> +  vendor-id:
> +    $ref: /schemas/types.yaml#/definitions/uint16-item

'uint16-item' is not a type. Your choices are 'uint16', 'uint16-array'
or 'uint16-matrix'.

> +    description: |
> +      Set USB Vendor ID of the hub (16 bit, default is 0x0424)

default: 0x424
