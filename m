Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1DE2C903B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 22:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgK3VsG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 16:48:06 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35341 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgK3VsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 16:48:06 -0500
Received: by mail-io1-f65.google.com with SMTP id i9so13460090ioo.2;
        Mon, 30 Nov 2020 13:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GilpYripAt/bLXpE/jyghzfJ8zmApgVS3kBCnvZHAqI=;
        b=dIRJUlVJpUha44NckFDeksTxNBZLSBcdeZKETqTtDPWJ2uapAqhX2tS3NOuLaMJ5p5
         cwZLkCbfAqzUpUf+qY5WZboPELgKst3Z+drw0T25+TE6Bjf9eTlxmG6EGLFW5HPWFExt
         msc5qfbVMGBL6YyIyfoc1KEl5EHOMPVbqBOD8ers8WimkNdsECyVbk3xZzo4ZjAK5YqY
         69jOCAiQ5qj9qjrXHYSKf6zBrFWLghoQY/V/zdrWUFfcX51p1D8NWeZ2zMW9IlRQ506A
         2e+Vb5M4ydOAipSVvgtEgho/FSuC/FX7mRvOwa6Bb37wpioDr8DrtTkLAZ0+aX3x+DbF
         e6Ug==
X-Gm-Message-State: AOAM530R8TDc9oEoS7qdNh0oEd6cjERd2GuF8klHlcFM/JFzMZv1JcD2
        f3yLsae1btjX02OvvSpBxw==
X-Google-Smtp-Source: ABdhPJyGtxemsjYUVFGU18tCnvYzgNkk60utnZFdMOpyjza0fMUIKtczYGaSgAFxkr28Kf5zyflnbA==
X-Received: by 2002:a5e:9512:: with SMTP id r18mr2697964ioj.86.1606772839118;
        Mon, 30 Nov 2020 13:47:19 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e19sm3122300ioh.15.2020.11.30.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:47:18 -0800 (PST)
Received: (nullmailer pid 3085495 invoked by uid 1000);
        Mon, 30 Nov 2020 21:47:16 -0000
Date:   Mon, 30 Nov 2020 14:47:16 -0700
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: Re: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec
 switch simple driver
Message-ID: <20201130214716.GA3040203@robh.at.kernel.org>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 10:01:31PM +0800, Li Jun wrote:
> Some platforms need a simple driver to do some controls according to
> typec orientation, this can be extended to be a generic driver with
> compatible with "typec-orientation-switch".
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> changes for v6:
> - Use general mux bindings for typec switch, one typec switch
>   may have 1 or 2 GPIOs for channel selection, if 1 GPIO, only
>   can be used to select cc1 or cc2; if 2 GPIOs, the second GPIO
>   can be used to deselect both channels or keep normal operations.
> - Add one more connection to usb controller.
>  
> No changes for v5.
> 
> changes on v4:
> - Use compatible instead of bool property for switch matching.
> - Change switch GPIO to be switch simple.
> - Change the active channel selection GPIO to be optional.
> 
> previous discussion:
> http://patchwork.ozlabs.org/patch/1054342/
> 
>  .../bindings/usb/typec-switch-simple.yaml          | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> new file mode 100644
> index 0000000..030ade5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/typec-switch-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Typec Orientation Switch Simple Solution Bindings
> +
> +maintainers:
> +  - Li Jun <jun.li@nxp.com>
> +
> +description: |-
> +  USB SuperSpeed (SS) lanes routing to which side of typec connector is
> +  decided by orientation, this maybe achieved by some simple control like
> +  GPIO toggle.
> +
> +properties:
> +  compatible:
> +    const: typec-orientation-switch
> +
> +  '#mux-control-cells':
> +    const: 0

Who is the mux-control consumer?

> +
> +  switch-gpios:
> +    description: |
> +      GPIO specifiers to select the target channel of mux.
> +      The first GPIO is for cc1 and cc2 selection, the GPIO flag use
> +      GPIO_ACTIVE_HIGH if GPIO physical state high is for cc1; or use
> +      GPIO_ACTIVE_LOW if GPIO physical state low is for cc1.
> +      The second gpio is to deselect any channles by places all channels
> +      in high-impedance state to reduce current consumption, the gpio flag
> +      use GPIO_ACTIVE_HIGH if GPIO physical state high is for
> +      high-impedance state (so low for normal operations); or Use
> +      GPIO_ACTIVE_LOW if GPIO physical state low is for high-impedance
> +      state(so high for normal operations).
> +    minItems: 1
> +    maxItems: 2
> +
> +  idle-state:
> +    description: -|
> +      For TYPEC_ORIENTATION_NONE by deselect both channels if supported.
> +    const: 2
> +
> +  # Standard properties described in
> +  # Documentation/devicetree/bindings/mux/mux-controller.txt
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description: -|
> +      Connection to the remote endpoint using OF graph bindings that model
> +      SS data bus to typec connector.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      endpoint@0:
> +        type: object
> +        description: Endpoint connected to typec connector.
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 0
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +      endpoint@1:
> +        type: object
> +        description: Endpoint connected to usb controller.
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 1
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint@0
> +
> +required:
> +  - compatible
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    typec_switch: mux-controller {
> +        compatible = "typec-orientation-switch";
> +        #mux-control-cells = <0>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_ss_sel>;
> +        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>,
> +                       <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +        idle-state = <2>;
> +
> +        port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                usb3_orien_sel: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&typec_con_ss>;
> +                };
> +
> +                usb3_con_data: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&dwc3_0>;
> +                };
> +        };

This still seems unnecessarily complicated. What I had in mind is just 
something like this:

mux: mux-controller {
  compatible = "gpio-mux";
  #mux-control-cells = <0>;
  mux-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>,
              <&gpio2 20 GPIO_ACTIVE_HIGH>;
  idle-state = <2>;
};

connector {
  compatible = "usb-c-connector";
  mux-controls = <&mux>;
  ...
};

Then you aren't re-implementing the gpio-mux driver.

This should work for *any* mux implementation as long as the mux states 
always have the same meanings from the perspective of the connector.

Of course, I have little visibility into the possible h/w 
implementations for Type-C and maybe this isn't sufficient. So input 
from Type-C experts would be helpful.

Rob
