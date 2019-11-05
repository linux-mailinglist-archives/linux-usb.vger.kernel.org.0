Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A2F09AD
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 23:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbfKEWkG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 17:40:06 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44980 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfKEWkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 17:40:06 -0500
Received: by mail-oi1-f196.google.com with SMTP id s71so19138336oih.11;
        Tue, 05 Nov 2019 14:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AFBMfzuDMMDG66rRSv4aJIAqEOBlWwNMQevtzffyDmI=;
        b=O8tO/ksp8vgHPv7qA0OfIhfy5IveWORM295TJr8Sm7E06bEwMIWKw5UF1aEWqvyjTP
         wh9AcfU34Kp3dNcJFnDAV+1BJNBGWLz8+MiY21qif8BYHzpk2eBmjE7zUVcZjnQChDAY
         1xERN6h0A9bEWg/S3glMiGwhbW4mi587Ajn/b1Wq+YnEHSORDzfvrJeN1z/R/0XXwHwq
         D6vmKPWIdQ+MfuOUYC2sqUS090/cy+UNUEoN27+i2Jth9CPzu7LvADCaTn8D7x8MTapS
         pJvR6dt+62dHFhEqwaI5PdGSVHwSLFfrlDNxyQ1dYlgAeFZz3ZB00EZycx0wFrS5mzkX
         VypQ==
X-Gm-Message-State: APjAAAVpQBV/BDOYL23AwRopvfZBmULh8G/y4ufb/Gz1td9X82O99/p3
        AlRTvx7b6sCvBARfGQ86Hw==
X-Google-Smtp-Source: APXvYqw/eET73Cha942kPsvsxg8kJVX0rHtqR7c6PgeHXrasBspVanHF4zRbTyrJS3fJviU++qmKag==
X-Received: by 2002:aca:ba87:: with SMTP id k129mr1150141oif.41.1572993605126;
        Tue, 05 Nov 2019 14:40:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 100sm6623033otl.48.2019.11.05.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 14:40:04 -0800 (PST)
Date:   Tue, 5 Nov 2019 16:40:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     gregkh@linuxfoundation.org, Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner A10 mUSB
 controller to a schema
Message-ID: <20191105224003.GA28513@bogus>
References: <20191101143216.260890-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101143216.260890-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri,  1 Nov 2019 15:32:16 +0100, Maxime Ripard wrote:
> The Allwinner SoCs have an mUSB controller that is supported in Linux, with
> a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Merged compatible entries together
> ---
>  .../bindings/usb/allwinner,sun4i-a10-musb.txt |  28 -----
>  .../usb/allwinner,sun4i-a10-musb.yaml         | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> 

Applied, thanks.

Rob
