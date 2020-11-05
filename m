Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFBE2A89B6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 23:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732548AbgKEW0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 17:26:02 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34490 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732295AbgKEW0C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 17:26:02 -0500
Received: by mail-oi1-f194.google.com with SMTP id z26so3392141oid.1;
        Thu, 05 Nov 2020 14:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YNX0hKBdy2Z0zSjKnEMiHy/teRIDmELN78h3KaAf9Hs=;
        b=WbwhgA7su2yCHF4XLgN7+rJtD+E2+yeCXdMX64CfUkXr2qZhiKBlC22gcQ3n/fp2Ic
         UhEOUSybe3BoYRiUMjPJXVVd9ferhDLH6blFBPS+QSQZ6gW59QcEf8vLqsR+3O+VriuK
         2uSAUNy+RYQNTRAKjzuOB2tCfkE63WKALJCZ5aiWKsNeFq1SszrX2IEjL54IOtjq3Ub1
         kHmWb+3Rg5UlTFGVom3QhevaPTFqPUExpblaN2egRMzItTaoBzUcCLER56RnFxG7MTZt
         H71rGZjDQxE9qET0w1feFNPGVgcG06Izpjn/UrcmM7dHqvhRrPqB+MPjpnhhu+MFV53n
         Ke1Q==
X-Gm-Message-State: AOAM533MbfQTZkzJwByLwsWJL0TCjWSwqwchC0gMGz61IWAPYUv/6vyX
        0tIEB6k+WMfMIvUKAhkCHg==
X-Google-Smtp-Source: ABdhPJxHKe1gHVdxScGqh8R/BPuAvuAXKVTJKqUhxwVTmoKbGmJdbvrriH+Fj1DFB4PI1ABqVFrlIw==
X-Received: by 2002:aca:62c3:: with SMTP id w186mr1030025oib.49.1604615161129;
        Thu, 05 Nov 2020 14:26:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x22sm286772oix.48.2020.11.05.14.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:26:00 -0800 (PST)
Received: (nullmailer pid 1911987 invoked by uid 1000);
        Thu, 05 Nov 2020 22:25:59 -0000
Date:   Thu, 5 Nov 2020 16:25:59 -0600
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
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
Message-ID: <20201105222559.GA1701705@bogus>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 03, 2020 at 07:40:07PM +0800, Li Jun wrote:
> Some platforms need a simple driver to do some controls according to
> typec orientation, this can be extended to be a generic driver with
> compatible with "typec-orientation-switch".
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
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
>  .../bindings/usb/typec-switch-simple.yaml          | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> new file mode 100644
> index 0000000..244162d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> @@ -0,0 +1,69 @@
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
> +  switch-gpios:
> +    description: |
> +      gpio specifier to switch the super speed active channel,
> +      GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> +      GPIO_ACTIVE_LOW:  GPIO state low for cc1.

What does active mean? There isn't really an active and inactive state, 
right? It's more a mux selecting 0 or 1 input?

I think you want flags 0 (aka GPIO_ACTIVE_HIGH) unless there's an 
inverter in the middle.

> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description: -|
> +      Connection to the remote endpoint using OF graph bindings that model SS
> +      data bus to typec connector.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint
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
> +    ptn36043 {
> +        compatible = "typec-orientation-switch";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_ss_sel>;
> +        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> +
> +        port {
> +                usb3_data_ss: endpoint {
> +                        remote-endpoint = <&typec_con_ss>;

The data goes from the connector to here and then where? You need a 
connection to the USB host controller.

> +                };
> +        };
> +    };
> -- 
> 2.7.4
> 
