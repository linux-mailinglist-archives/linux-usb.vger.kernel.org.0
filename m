Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D514315450
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 17:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhBIQtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 11:49:31 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:42943 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhBIQro (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 11:47:44 -0500
Received: by mail-ot1-f42.google.com with SMTP id q4so8413436otm.9;
        Tue, 09 Feb 2021 08:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F+CSsAL+xXGR1XbAg2kuNNWtcXjYML1z1ykHvRPGunk=;
        b=kH2xgu3BPQPviqDX06DgoUk0FhOsKjDRpxPt+vGg7wxTMTsiTo2MEfkKriJ8NkzEWA
         C3yhpnqpNbZbGy9uxFV0L+zF3OaIhMWAqn6WOepXcqgMzD/UNWZ2n6stpDgEf1W0WXhT
         4Th4ic4CjWHXp1KyogNBQTLsU9kD0z0juPdVnuxF2ndknz/NOda/GbGsPlHoQnFl2jTI
         ld23hG2Mn8Fe0oXKfIpVxRL86CZG+v8bmGnYxcA6IXQe1Ozk2s5eXcuJoelmlTMLO3Vh
         NgDT4kylMLIFzk2raCWi3ToUiJ6lpvEYJuc6WEPGYRwLkwTt4LIDvN1nzU1BjgpOlEO2
         m0tg==
X-Gm-Message-State: AOAM5300PGMhqTE0yJSNegyi9ZRbY8tHOc6Y3utwwwG4aYsy+ivz2++z
        6XY5dP/3KBnNaFbUUg6H80IaoFGPMQ==
X-Google-Smtp-Source: ABdhPJxaRIaL4JsSQJVf2xTGDm32s46w0RRav9hS3HjUNKXtFO/lqUZIshEo+V5ZbsiObMamDSiMcA==
X-Received: by 2002:a9d:7cc4:: with SMTP id r4mr6975123otn.307.1612889222480;
        Tue, 09 Feb 2021 08:47:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l67sm945531oih.57.2021.02.09.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:47:01 -0800 (PST)
Received: (nullmailer pid 3912163 invoked by uid 1000);
        Tue, 09 Feb 2021 16:46:59 -0000
Date:   Tue, 9 Feb 2021 10:46:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc2: Add support for additional
 clock
Message-ID: <20210209164659.GA3909217@robh.at.kernel.org>
References: <20210125093825.4292-1-s.hauer@pengutronix.de>
 <20210125093825.4292-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125093825.4292-2-s.hauer@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 25, 2021 at 10:38:24AM +0100, Sascha Hauer wrote:
> This adds support for an additional clock for the dwc2 core in case
> there is another clock to the phy which must be enabled.

to the phy? 'clocks' is inputs to DWC2. Shouldn't there be a phy 
device/driver?

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index e5ee51b7b470..56dd0d18d535 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -57,11 +57,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
>      items:
>        - const: otg
> +      - const: phy
> +    minItems: 1
>  
>    resets:
>      items:
> -- 
> 2.20.1
> 
