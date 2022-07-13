Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F98E572EF7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 09:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiGMHU7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 03:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiGMHU6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 03:20:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF5773935;
        Wed, 13 Jul 2022 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657696856; x=1689232856;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zGRFqnL8wey+C+xRbb7l2vPyx9racNuOsu3Vhe4v1JU=;
  b=VTp1jr2ZZLJ76bIAjt8JQynb4roz65XI93CMUk1+28FFTrGzlmCvCTAm
   BK38MKGDBgnBcMI5U/WnqvOSjwweFSuEPBRf3Jf/8W06GmpoCFOx0cdME
   mRMn2OXcsIaoee+oaObk0FTDTZs8/LLYwXemRbZodk6Q/33tE1aPSsjgb
   xwnCKAlwOL0MylbiPcOla6LaBJBEzLY/fj/6+udHTRF2pSeCERQkXYkQr
   S2M4etHS8FuqQHjdC68VcaziUR+bqso1WLGHgagTNSQJlP57uz/My0xw7
   xhcVtu6GGMyajLPr3aWdUgZ4n2bGGuOVEkbwRsUo9gMCWe8ZtcWF4UBsE
   g==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25017947"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Jul 2022 09:20:54 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 13 Jul 2022 09:20:54 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 13 Jul 2022 09:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657696854; x=1689232854;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=zGRFqnL8wey+C+xRbb7l2vPyx9racNuOsu3Vhe4v1JU=;
  b=UoSlSRdAY+f2tQa+kEcAbw/ftq2OLZJZ0TYIRONw0OTydXlChp9eyRdT
   gT3LJ5++YQ0j/yeqmCCZ6ye9b1wGdOu0E2esv47UwCXllqwZLw8522ayh
   jCHlcUcXAr0kXI1VHOEdiN+3GXV1m02K0ntu3Opj3dDy9jpArKQQtGPvD
   CncBPbWnVabPaNSV5wIhGKbj05SOL+NcLDM8lcCWkYCbmhvdlRq7OfPGi
   luDrUbTTdW0svPeAbovTNSlXAcnp9f1TY6uOweZTGYf/Qf3iVi8qh7H0+
   t6WPFXbd6v+uVeoxZTqDvTfrYVvvem59L+ErElhPp2UzqVLBNcNJzY7Lu
   A==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25017946"
Subject: Re: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Jul 2022 09:20:54 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4F7C4280056;
        Wed, 13 Jul 2022 09:20:54 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 13 Jul 2022 09:20:54 +0200
Message-ID: <8966410.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com> <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

thanks for the feedback on DT bindings.

Am Dienstag, 12. Juli 2022, 23:16:21 CEST schrieb Krzysztof Kozlowski:
> On 12/07/2022 17:06, Alexander Stein wrote:
> > The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> > 
> > This initial version of the binding only describes USB related aspects
> > of the USB8041, it does not cover the option of connecting the controller
> > as an i2c slave.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Well, this is essentially a ripoff of
> > Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> > replaced, reset-gpio added and example adjusted.
> > IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> > to rename bindings files? I guess a common onboard-usb-hub.yaml matching
> > the driver seens reasonable. Any recommendations how to proceed?
> > 
> >  .../devicetree/bindings/usb/ti,usb8041.yaml   | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml new file mode
> > 100644
> > index 000000000000..9a49d60527b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> > @@ -0,0 +1,69 @@
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
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> 
> > +    items:
> No items. It's just one item.

Sure, will change.

> > +      - enum:
> > +          - usb451,8140
> > +          - usb451,8142
> > +
> > +  reg: true
> > +
> 
> > +  reset-gpio:
> reset-gpios

Will change.

> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for GSRT# pin.
> 
> Combine maxItems and above into:
> items:
>  - description: GPIO specifier for GSRT# pin.

Will change, looks much nicer.

> > +
> > +  vdd-supply:
> > +    description:
> > +      phandle to the regulator that provides power to the hub.
> 
> s/phandle to the regulator that provides//
> and create some nice sentence from left-over, like "VDD power supply to
> the hub"

Thanks for that suggestion. Will change.

> > +
> > +  peer-hub:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> 
> No quotes.

Sure, will do so.

> > +    description:
> > +      phandle to the peer hub on the controller.
> > +
> > +required:
> > +  - peer-hub
> > +  - compatible
> > +  - reg
> 
> Messed order. Use same as they appear in properties, so
> compatible+reg+peer-hub.
> 
> But another question - why "peer-hub"? I remember some discussion about
> naming, so was peer preferred over companion?
> 
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
> > +          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> 
> reset-gpios

Yes, 'make dt_binding_check' does not raise any error about this binding.

Thanks and best regards,
Alexander



