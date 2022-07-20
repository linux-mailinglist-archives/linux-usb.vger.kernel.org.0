Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A73557B146
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 08:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbiGTG5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 02:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbiGTG5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 02:57:15 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6222E9DE;
        Tue, 19 Jul 2022 23:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658300234; x=1689836234;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lqcDMBmhvYtEu34/vuhWpFRZ7NYcBG6Ddiw4M9j2hrY=;
  b=dMSufEZFAqCBGZe7W3aA7ZA7rbsyJaoiwux/ivfaB5LqwUn6tkJK+8lh
   peBep6qorBGQaczxPfkXcRwYGs0a2fhuVcTfbLlbBZ4oD/sFTJyU2ZdNs
   EO0K/h0Z1r0KMO2j2tPZs4WGpZy8J8kek53028Itfng1LuwP9LP+mn0Ig
   WXgS3CCWYKANld3buyRp5XaeBJZJMriIUOxsG/6kTd3A0kR5FMKKlwYqh
   kT21VkRyMcjqzrboixjC4ut2SY88mVN16MKg2YDRGgubhGjlVG8RSaRem
   MXgGj2ELQiVFpZezwTmpIPMhy7fJnJ3axhOpuOWUKU5hmqzsvHS3LiwYu
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25148064"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jul 2022 08:57:12 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 20 Jul 2022 08:57:12 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 20 Jul 2022 08:57:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658300232; x=1689836232;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=lqcDMBmhvYtEu34/vuhWpFRZ7NYcBG6Ddiw4M9j2hrY=;
  b=Ibz78TJpQFhrj355jX0yfhPWfyOXlO/SW6D7x6lGy8jnB0CksIndxY2w
   WUyDEaK9/97pcFaL4V7IugpyQhFX8pT1EYg3OMzYYQI5YcYD5iu1Vkmf3
   0jcM5C7bhz9jGXP9GCZK6qiUEhc/FKnTGT6i85emGj1igUOeAtr9clX8Z
   zrGFon5L9WK0WbpeJ2gurwFQMbYNBgFVDDLPL5a60uFoW984CqIw39P0l
   wioYnshn4rLs0RTDoG/+HHcv+wBdGkCXhjpPeUis7xi+9VhqGXlQz8b9W
   rQguLO7umgFDfMSUY9YGVW2o0W5W21XhaUwtLStWQFQcA6bDfm/YCUotj
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25148063"
Subject: Re: Re: [PATCH v2 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2022 08:57:12 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EC697280056;
        Wed, 20 Jul 2022 08:57:11 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 20 Jul 2022 08:57:11 +0200
Message-ID: <7429934.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtH96FGD1+ORPKKk@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com> <YtH96FGD1+ORPKKk@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthias,

Am Samstag, 16. Juli 2022, 01:53:12 CEST schrieb Matthias Kaehlcke:
> On Fri, Jul 15, 2022 at 09:32:58AM +0200, Alexander Stein wrote:
> > The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> > 
> > This initial version of the binding only describes USB related aspects
> > of the USB8041, it does not cover the option of connecting the controller
> > as an i2c slave.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Removed 'items' from compatible, it's just en enum now
> > * Rename reset-gpio to reset-gpios
> > * Use 'items' for reset-gpios
> > * Adjust description of vdd-supply
> > * Sorted required list
> > * Adjusted example
> > 
> >  .../devicetree/bindings/usb/ti,usb8041.yaml   | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml new file mode
> > 100644
> > index 000000000000..7fe7416e2b51
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binding for the TI USB8041 USB 3.0 hub controller
> > +
> > +maintainers:
> > +  - Matthias Kaehlcke <mka@chromium.org>
> 
> Not sure this should be me, just because I'm the author/maintainer of
> the onboard_usb_hub driver, which may be used for this hub.

Sure, if you are uncomfortable I'll add myself here.

Regards,
Alexander

> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb451,8140
> > +      - usb451,8142
> > +
> > +  reg: true
> > +
> > +  reset-gpios:
> > +    items:
> > +      - description: GPIO specifier for GRST# pin.
> > +
> > +  vdd-supply:
> > +    description:
> > +      "VDD power supply to the hub"
> > +
> > +  peer-hub:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the peer hub on the controller.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - peer-hub
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    usb {
> > +        dr_mode = "host";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        /* 2.0 hub on port 1 */
> > +        hub_2_0: hub@1 {
> > +          compatible = "usb451,8142";
> > +          reg = <1>;
> > +          peer-hub = <&hub_3_0>;
> > +          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > +        };
> > +
> > +        /* 3.0 hub on port 2 */
> > +        hub_3_0: hub@2 {
> > +          compatible = "usb451,8140";
> > +          reg = <2>;
> > +          peer-hub = <&hub_2_0>;
> > +          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };




