Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217815721AE
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 19:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiGLRZd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 13:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGLRZc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 13:25:32 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A340FBF564
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 10:25:31 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id p11so1424140pgr.12
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E4jmP6FgBCuShM2yxd3P64q5em9gcVisC0GtASF23gY=;
        b=FS9WBUbEEfYEED3QgznDAAd2QkvgwO8CwVKF/P6n1kM8GGIhSNb93+xyeUxDA1EDyQ
         p2dM/Uq1070+OKhh6yFhYCGB8qK/JwLqc2DnZgMVTqNLjvIrHfVjC8guWPXBl387f72A
         Irj7ZDgvmLZPt0Oav1k+pugcVsvw6PX4Y1riE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E4jmP6FgBCuShM2yxd3P64q5em9gcVisC0GtASF23gY=;
        b=7y81EvbJXpez8faPNQfIwGqQnnxiBxRdLmbO0R3Q4bCbpygeatVNy3Gmc0cyXqVEEz
         ql5gIJt2vJ8L2S78FcA3Lz0y2vREqYHVmOqQvPILDIo6IHfsHh7okaejAxeJxC8BjPRX
         t9rOEofjGYXqnjHu8pSeeZtL7TyApEZ5hBO3iqPSRx15it5Gm3nSmd+AVMFfvgn1VTX2
         HjtY+8RSn1uxQBMvvqZ/qr8SLXJZHTsBLQK8nALuKN9wovLoPyuNZuRSPISrQoK0XNVJ
         HXCea/lXVKGJPi/bEd0nOBUalp6pbaveRRqhito5McUiMAv9Gqg9edoAGSIMytIWYRD3
         ttFg==
X-Gm-Message-State: AJIora/JNaw7TcJC+CvRE3KAXT7vuv4vj927D++SkJxh4TnVFuIYOo5H
        6KqmBB4SktXpOZXH/9GTIewgHg==
X-Google-Smtp-Source: AGRyM1sWnN7nqx3ogAdQ99HHTgyORP8SiZVeXDB3osYj+OyDitCE/Klmi1y59hDRdQwCbKmsVzSQNg==
X-Received: by 2002:a63:ef05:0:b0:416:306:db8d with SMTP id u5-20020a63ef05000000b004160306db8dmr9853565pgh.203.1657646731167;
        Tue, 12 Jul 2022 10:25:31 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e036:8c0d:9cf:7a45])
        by smtp.gmail.com with UTF8SMTPSA id b15-20020a170902650f00b0016397da033csm7071064plk.62.2022.07.12.10.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 10:25:30 -0700 (PDT)
Date:   Tue, 12 Jul 2022 10:25:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Message-ID: <Ys2uiei+ZOVYaOMy@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

On Tue, Jul 12, 2022 at 05:06:25PM +0200, Alexander Stein wrote:
> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> 
> This initial version of the binding only describes USB related aspects
> of the USB8041, it does not cover the option of connecting the controller
> as an i2c slave.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Well, this is essentially a ripoff of
> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> replaced, reset-gpio added and example adjusted.
> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> to rename bindings files? I guess a common onboard-usb-hub.yaml matching
> the driver seens reasonable. Any recommendations how to proceed?

It's a tradeoff between keeping the individual bindings simple and avoid
unnecessary duplication. The current RTS5411 and TI USB8041 bindings are
very similar, which suggests combining them. However over time hubs with
diverging features could be added (e.g. with multiple regulators, a link
to an I2C/SPI bus, a clock, ...). With that a common binding might become
too messy.

From a quick look through Documentation/devicetree/bindings it doesn't
seem common to have generic bindings that cover components from multiple
vendors. In that sense I'm leaning towards separate bindings.

Rob, do you have any particular preference or suggestion?

m.

>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> new file mode 100644
> index 000000000000..9a49d60527b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for the TI USB8041 USB 3.0 hub controller
> +
> +maintainers:
> +  - Matthias Kaehlcke <mka@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - usb451,8140
> +          - usb451,8142
> +
> +  reg: true
> +
> +  reset-gpio:
> +    maxItems: 1
> +    description:
> +      GPIO specifier for GSRT# pin.
> +
> +  vdd-supply:
> +    description:
> +      phandle to the regulator that provides power to the hub.
> +
> +  peer-hub:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description:
> +      phandle to the peer hub on the controller.
> +
> +required:
> +  - peer-hub
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +          compatible = "usb451,8142";
> +          reg = <1>;
> +          peer-hub = <&hub_3_0>;
> +          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> +        };
> +
> +        /* 3.0 hub on port 2 */
> +        hub_3_0: hub@2 {
> +          compatible = "usb451,8140";
> +          reg = <2>;
> +          peer-hub = <&hub_2_0>;
> +          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> -- 
> 2.25.1
> 
