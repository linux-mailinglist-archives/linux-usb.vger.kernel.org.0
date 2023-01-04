Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804DA65E016
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 23:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240596AbjADWiC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 17:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235579AbjADWiA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 17:38:00 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F5D3D1E3
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 14:37:58 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id z10so11944612ilq.8
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcNoql4sxZAAG0Z9x382x27f16j/NJH8gvjDj7DBfeY=;
        b=ohe7m4zraaZuCG6StlOr3NDElGbtNTt/AgB57cgRJ7fR/62RRKlU/4Kkq1hw+ths9X
         H+IwFo9T4WLorbzXH15hXAuWYP0qA7UDgvG6zA0vgTCHsVQaPXB9tzFAp3rNEU/pjGFP
         Aj6X4ML3gX7K7csd049yNiopXlnTHatPghoj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcNoql4sxZAAG0Z9x382x27f16j/NJH8gvjDj7DBfeY=;
        b=2LKy/0hOLFM3FJi3YnmhELaTZLoX/rjP3AhpEp0wvsDlSSOaCl5vY58DC9RFRYTZVc
         fPAGmOUJvpX+HJRuCRfDIBw6kJUgqewYL54VH1R0eVM3tV5inbO95sntewrx6JO7FGVf
         gGQR/H2B4AhxlmXyaufm3kDkWRD0L71quZkiYQDjbk0pvMy50igih474o6oIGJv6U+qC
         sYyFzBzRugDepgSUU2+q8acJBv9qTVjf+GF41yRYHoggZ8oHiKRG74L+/o2S/H2QhMfp
         hqA16X3MN04+kmp34qA9DSMqtSQOi/Yu0WZfrVQSrc8XWK2ZTCU0dkWdMEFRiPt+0rSA
         YsAA==
X-Gm-Message-State: AFqh2kphTRo9D7hEutfduwMkrL11KTR/cxSb2IX/UvNMl0PJCtlmt+I7
        gtXab6N+CPaIr16aZ1CYUtR7aw==
X-Google-Smtp-Source: AMrXdXsnV5WKBO3y2D9jF6L7JkTbhKxnOGOhp02IPb09JTYoS/rGNOwzeyl6ujdBGNOViFzaAqfhkA==
X-Received: by 2002:a05:6e02:b2c:b0:304:c95e:8c36 with SMTP id e12-20020a056e020b2c00b00304c95e8c36mr39114239ilu.14.1672871878123;
        Wed, 04 Jan 2023 14:37:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r22-20020a02b116000000b00363ec4dcaacsm11304062jah.22.2023.01.04.14.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:37:57 -0800 (PST)
Date:   Wed, 4 Jan 2023 22:37:57 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
Message-ID: <Y7X/xadXIA2f9lHz@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-9-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-9-linux.amoon@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 28, 2022 at 10:03:17AM +0000, Anand Moon wrote:
> The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> features 4 downstream ports, an internal 5V regulator and has
> external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> new file mode 100644
> index 000000000000..4ae995160fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Via labs VL817Q7 USB 3.1 hub controller

nit: VIA Labs VL817-Q7

> +
> +maintainers:
> +  - Anand Moon <linux.amoon@gmail.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - vialab,usb2109

This is not a valid compatible string as Johan already noted.

Besides that the VL817-Q7 provides both a 3.1 and a 2.0 USB hub, which
are enumerated separately. Please also add a compatible string for the
2.0 hub (assuming 0x2109 is the 3.1 hub).

> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO controlling the RESET# pin.
> +
> +  vdd-supply:
> +    description:
> +      the regulator that provides 5.0V core power to the hub.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {
> +            compatible = "vialab,usb2109"
> +            reg = <1>;
> +            reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +        };

Please also add a node for the other hub and link the two nodes with
each other through the 'peer-hub' property. See realtek,rts5411.yaml
for reference.
