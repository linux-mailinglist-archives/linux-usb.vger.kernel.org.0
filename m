Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDD3D42A2
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 00:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhGWV2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 17:28:10 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:41968 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhGWV2K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 17:28:10 -0400
Received: by mail-il1-f174.google.com with SMTP id s5so2862131ild.8;
        Fri, 23 Jul 2021 15:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6HBiDJI4xo9HACYmRarrDTnnmYlunvqow0d7mBxux3g=;
        b=MtBHCSQtqGnaBJG13l6O8yVMP4kPtn7ZRVXf3XB106lEasOCMtkRk5lY/lWEmGgZXt
         pUBjQFEt6hkZ4EHRChkV4KRKYh5PXH8x/Y9fTdK1iz8/oQbv996q0X5602tv0zqceHuj
         TM8OKpOWTubuvJGyT5XfIGBIRw2m4onYDdq4IyoKcLTM8Bi1vQFh9avFv5rUZ5i2qnGg
         SsrjKgNve55FdnA8rQdBlUtLopk5PghEHYIqw7Chs3CIK24a7gSze88QUg/nJP4mYN6A
         SsazoBKleFcMy7+Y6EZQOUrtkcNlf85TPIMQn3t+Um1+naN7LuHk8jjEjyTT9R6JiUof
         rOBw==
X-Gm-Message-State: AOAM5323oWiXRUhHUi55aD+t8yeTJFhyf+JRnKNnTOaUTE37kMTWMuyy
        5fuIf/bGzAUPtcHbsUMebQ==
X-Google-Smtp-Source: ABdhPJz0x9NwWKkUAMcAYkbRUdzb5k/i3X+4ToE0b3DYVzmq5TXrBU9IcaKVs8vmsNYEb/FTi27zag==
X-Received: by 2002:a05:6e02:b24:: with SMTP id e4mr4717821ilu.41.1627078122950;
        Fri, 23 Jul 2021 15:08:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l12sm464501ilg.2.2021.07.23.15.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 15:08:42 -0700 (PDT)
Received: (nullmailer pid 2682761 invoked by uid 1000);
        Fri, 23 Jul 2021 22:08:40 -0000
Date:   Fri, 23 Jul 2021 16:08:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dongjin Kim <tobetter@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 34/54] dt-bindings: usb: Convert SMSC USB3503 binding to
 a schema
Message-ID: <20210723220840.GA2675167@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-35-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-35-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 04:04:04PM +0200, Maxime Ripard wrote:
> The SMSC USB3503 USB Hub Controller is supported by Linux thanks to
> its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dongjin Kim <tobetter@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/usb/smsc,usb3503.yaml | 104 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb3503.txt       |  39 -------
>  2 files changed, 104 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb3503.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
> new file mode 100644
> index 000000000000..0e5622e7df87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/smsc,usb3503.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SMSC USB3503 High-Speed Hub Controller Device Tree Bindings
> +
> +maintainers:
> +  - Dongjin Kim <tobetter@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - smsc,usb3503
> +      - smsc,usb3503a
> +
> +  reg:
> +    maxItems: 1
> +
> +  connect-gpios:
> +    description: >
> +      GPIO for connect

maxItems: 1
> +
> +  intn-gpios:
> +    description: >
> +      GPIO for interrupt

maxItems: 1

> +
> +  reset-gpios:
> +    description: >
> +      GPIO for reset

maxItems: 1

> +
> +  disabled-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      minimum: 1
> +      maximum: 3
> +    description: >
> +      Specifies the ports unused using their port number. Do not describe this
> +      property if all ports have to be enabled.
> +
> +  initial-mode:
> +    enum: [1, 2]
> +    description: >
> +      Specifies initial mode. 1 for Hub mode, 2 for standby mode.
> +
> +  clocks:
> +    description: >
> +      Clock used for driving REFCLK signal. If not provided the driver assumes
> +      that clock signal is always available, its rate is specified by REF_SEL
> +      pins and a value from the primary reference clock frequencies table is
> +      used.

maxItems: 1

> +
> +  clock-names:
> +    const: refclk
> +
> +  refclk-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Frequency of the REFCLK signal as defined by REF_SEL pins. If not
> +      provided, driver will not set rate of the REFCLK signal and assume that a
> +      value from the primary reference clock frequencies table is used.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +        
> +          usb3503@8 {

usb-hub@8


> +              compatible = "smsc,usb3503";
> +              reg = <0x08>;
> +              connect-gpios = <&gpx3 0 1>;
> +              disabled-ports = <2 3>;
> +              intn-gpios = <&gpx3 4 1>;
> +              reset-gpios = <&gpx3 5 1>;
> +              initial-mode = <1>;
> +              clocks = <&clks 80>;
> +              clock-names = "refclk";
> +          };
> +      };
> +
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>
> +
> +      usb-hub {
> +          /* I2C is not connected */

We should probably require this is a USB bus child device in this case, 
but that's a separate change.

> +          compatible = "smsc,usb3503";
> +          initial-mode = <1>; /* initialize in HUB mode */
> +          disabled-ports = <1>;
> +          intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> +          reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +          connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
> +          refclk-frequency = <19200000>;
> +      };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/usb/usb3503.txt b/Documentation/devicetree/bindings/usb/usb3503.txt
> deleted file mode 100644
> index 057dd384d473..000000000000
> --- a/Documentation/devicetree/bindings/usb/usb3503.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SMSC USB3503 High-Speed Hub Controller
> -
> -Required properties:
> -- compatible: Should be "smsc,usb3503" or "smsc,usb3503a".
> -
> -Optional properties:
> -- reg: Specifies the i2c slave address, it is required and should be 0x08
> -       if I2C is used.
> -- connect-gpios: Should specify GPIO for connect.
> -- disabled-ports: Should specify the ports unused.
> -	'1' or '2' or '3' are available for this property to describe the port
> -	number. 1~3 property values are possible to be described.
> -	Do not describe this property if all ports have to be enabled.
> -- intn-gpios: Should specify GPIO for interrupt.
> -- reset-gpios: Should specify GPIO for reset.
> -- initial-mode: Should specify initial mode.
> -                (1 for HUB mode, 2 for STANDBY mode)
> -- refclk: Clock used for driving REFCLK signal (optional, if not provided
> -	the driver assumes that clock signal is always available, its
> -	rate is specified by REF_SEL pins and a value from the primary
> -	reference clock frequencies table is used). Use clocks and
> -	clock-names in order to assign it
> -- refclk-frequency: Frequency of the REFCLK signal as defined by REF_SEL
> -	pins (optional, if not provided, driver will not set rate of the
> -	REFCLK signal and assume that a value from the primary reference
> -	clock frequencies table is used)
> -
> -Examples:
> -	usb3503@8 {
> -		compatible = "smsc,usb3503";
> -		reg = <0x08>;
> -		connect-gpios = <&gpx3 0 1>;
> -		disabled-ports = <2 3>;
> -		intn-gpios = <&gpx3 4 1>;
> -		reset-gpios = <&gpx3 5 1>;
> -		initial-mode = <1>;
> -		clocks = <&clks 80>;
> -		clock-names = "refclk";
> -	};
> -- 
> 2.31.1
> 
> 
