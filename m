Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137FB31E3F0
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 02:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhBRBei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Feb 2021 20:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhBRBee (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Feb 2021 20:34:34 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5446C061786
        for <linux-usb@vger.kernel.org>; Wed, 17 Feb 2021 17:33:54 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o7so154584pgl.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Feb 2021 17:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dUsBWQzF1UbVO9gyssWKwqqPVsKjGpept75e76+NY0M=;
        b=EZHD4RD3r4NKtFFy935jOG74x1G/fHK0FvKypFAEuwvgsB3OP7Hx18MH03NP1FvPDt
         zajQZzChWcMNM5uQdx/jPC8kt3rdBiIs9HjUBWeHeSkPLM7itoLY9RCDLDfZ0FVAWAHB
         b0wa0hYd4V3K1DQH2ZSgeVOr7bXqrFSn9ZYwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dUsBWQzF1UbVO9gyssWKwqqPVsKjGpept75e76+NY0M=;
        b=DoLxhYi0vaw8Zhg5uvCVAEtNGC/tA2cv9dinikFYJWwaeKG3diV/K4CR2hcXGPbcOJ
         l698TCDmOThC2rG1xjispicL7UTD9wnu7MQ0Zyw9LrBqUKMMHcFK8Ap/MHtVa+0pPzqH
         EjkkycgVLOuh7me2HiYyv/z4crao3hVT0nCvoAoUHuVdVcTAXW08dBTWBFrN/qQr7uu7
         06U6qJW/bSE/ivOhVDxJg+8ne+U3IClDwhy5fauDUygNNtpREbBi3YgBjGQLef5OKG4h
         EtLe9oGNcb9OVJwufj3Ocb/xKMAJQGcYqnlvztB7j6pNICrhds5sfehuHy6WH51lE94a
         jDRg==
X-Gm-Message-State: AOAM530HFsodTiHfcqKOc1bBqO5y6OoX1Qb/rtUg/S9rodKYyvNZjPxA
        pCTkwr4EIstz75OIVwuxaDIhFA==
X-Google-Smtp-Source: ABdhPJw+nTaOYmXY/x13PkwgxLt2ZLMLPhZCaxh1HTdKP2UH6d2hM/Apww8jOCygDt9J0fGF0so9sQ==
X-Received: by 2002:a63:e20b:: with SMTP id q11mr1912141pgh.396.1613612034389;
        Wed, 17 Feb 2021 17:33:54 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1984:e79:81e:1101])
        by smtp.gmail.com with UTF8SMTPSA id c69sm3706117pfb.88.2021.02.17.17.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Feb 2021 17:33:53 -0800 (PST)
Date:   Wed, 17 Feb 2021 17:33:51 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: Add binding for discrete
 onboard USB hubs
Message-ID: <YC3D/+DZYFjgHQ3H@google.com>
References: <20210210171040.684659-1-mka@chromium.org>
 <20210210091015.v5.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
 <20210217210441.GA2709172@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210217210441.GA2709172@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

thanks for your review!

On Wed, Feb 17, 2021 at 03:04:41PM -0600, Rob Herring wrote:
> On Wed, Feb 10, 2021 at 09:10:36AM -0800, Matthias Kaehlcke wrote:
> > Discrete onboard USB hubs (an example for such a hub is the Realtek
> > RTS5411) need to be powered and may require initialization of other
> > resources (like GPIOs or clocks) to work properly. This adds a device
> > tree binding for these hubs.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > 
> > Changes in v5:
> > - updated 'title'
> > - only use standard USB compatible strings
> > - deleted 'usb_hub' node
> > - renamed 'usb_controller' node to 'usb-controller'
> > - removed labels from USB nodes
> > - added 'vdd-supply' to USB nodes
> > 
> > Changes in v4:
> > - none
> > 
> > Changes in v3:
> > - updated commit message
> > - removed recursive reference to $self
> > - adjusted 'compatible' definition to support multiple entries
> > - changed USB controller phandle to be a node
> > 
> > Changes in v2:
> > - removed 'wakeup-source' and 'power-off-in-suspend' properties
> > - consistently use spaces for indentation in example
> > 
> >  .../bindings/usb/onboard_usb_hub.yaml         | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml b/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
> > new file mode 100644
> > index 000000000000..bf4ec52e6c7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/onboard_usb_hub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Binding for discrete onboard USB hubs
> 
> This isn't really generic. Maybe there's a set of hubs with only a 
> single supply much like 'simple-panel', but I kind of doubt that here.
> There aren't hundreds of hub chips like panels. Though, we should put 
> this into bindings/usb/hub/ so we start collecting hub bindings in one 
> place.

Ok, I agree that the name of the binding is too generic, I anticipated that
the power supply section would need to be extended to support other hub
chips.

> A generic driver doesn't have to have a generic binding.

That's a good point, it seems to make sense to have separate bindings in
this case.

> You can have a specific device binding which is handled by a generic
> driver. Or not. Who knows. Maybe a simple user like u-boot has a generic
> driver while something more feature rich has a device specific binding.
> 
> > +
> > +maintainers:
> > +  - Matthias Kaehlcke <mka@chromium.org>
> 
> Now we have usb-device.yaml, you need:
> 
> allOf:
>   - $ref: usb-device.yaml#

ok

So with your comments addressed it seems we have a binding that could be
acceptable. I'll still hold back a bit to see if we can make progress with
the discussion about using the 'graph' binding (https://lore.kernel.org/patchwork/patch/1379002/#1578294).
The one thing I don't like about the current binding is that it wouldn't
work out of the box with a hierarchy of hubs. To make that work on the
driver side an additional property would be needed to indicate that two
(or more) USB hub devices are related (i.e. are provided by the same
chip). This is needed to be able to decide whether the hub should be
powered down during system suspend.


