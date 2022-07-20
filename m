Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF2157B149
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 08:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiGTG6O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 02:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236335AbiGTG6L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 02:58:11 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C7C4B0C5;
        Tue, 19 Jul 2022 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658300289; x=1689836289;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hp56s+ybqvj6J1boXTVNOCPqq36i0GR92/Y3UwC0nSs=;
  b=IwA8g/u8w7MJTIMlnRFKmCyqMXEUt2ypw8MX/BAYjB98fRXuPYHxS2sL
   PBM1P0gTUHsz80dwBIJkv83Y31PySZy0+iTRVqb27dTS97B2r9riZN9p0
   0fGb3dnd59LbnOHxAmdyp4k2FP7MKRT/WVs2zOHisS3XkvylylvqWZGOx
   3c4/GvQOFlSlBfRubQ+vF/9qvTjXNq4jHrRovAtfnLhfu7WRYESWjaPmR
   3ILJQOd9+KLpoO42c6h2eufiYPOEcCqIW4Te50/0LCd5aCTPnh3k+fMGg
   mGBTQTXH2/5J4h5QNfz9FNwiDT9cDPd9FNtoT15HPgGOC/LUQPzJOQGZH
   g==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25148091"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jul 2022 08:58:07 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 20 Jul 2022 08:58:07 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 20 Jul 2022 08:58:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658300287; x=1689836287;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=hp56s+ybqvj6J1boXTVNOCPqq36i0GR92/Y3UwC0nSs=;
  b=CI9pSbo6vorwpL9HaC5bCuWgJ7q0Z9e/ZTASqLhuZrBANPbplQQbflVM
   2nkWsigElXiZoxlv+sxES3folSN5XiyUEY8JFzoDQrV7EJ1DY5usvrdkL
   wk8IxLV977gVjsoxkvjOFnYPRTVl1hOCef+ztLaLK3Gomtk1Omki1knzd
   CcJoZeWxZ8VXd6JnSNkKuOIwODDnScTA5W5cc1AnID7XBccDiI5zu3HPB
   syeOJ82mBTv4sDVZ2Q/36LP1RqETXJLasHFgD/M5smRD3vesUAYOPUUsT
   nSUmR4o1AubBso+HZMhboLc5JbjOowwSdmHWtUusQTWajli6vXhoGlMAX
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25148090"
Subject: Re: Re: [PATCH v2 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2022 08:58:07 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E19B280056;
        Wed, 20 Jul 2022 08:58:07 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 20 Jul 2022 08:58:07 +0200
Message-ID: <3467265.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <bdbec92d-877f-effd-e2bc-ebc380f107d5@linaro.org>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com> <bdbec92d-877f-effd-e2bc-ebc380f107d5@linaro.org>
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

Hi Krzysztof,

Am Freitag, 15. Juli 2022, 10:17:31 CEST schrieb Krzysztof Kozlowski:
> On 15/07/2022 09:32, Alexander Stein wrote:
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
> 
> No quotes needed.

Fixed, thanks.

Regards,
Alexander



