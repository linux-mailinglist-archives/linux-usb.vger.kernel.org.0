Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D19A1C7B06
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 22:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgEFUQA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 16:16:00 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42508 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgEFUQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 16:16:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so2460680otq.9;
        Wed, 06 May 2020 13:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZgdGZNxNsEX9H1xXxK/wKm6E37fX8E9xp6M+GCu6EE8=;
        b=JQ6DWHHbUmiA57ZcZsW0dEQUBQuZSRP6hOKAPSAs9KGmNrA72c1Z5oVLof5soeLBFs
         y9VWnsdtLtFCHZJZ+N7zuXi7UTjXz4WR4X4Oq8Deij+0dM7STBbJsmdERHuIrsiIkgn+
         T2pByWPtg95/2tF0HYZeoiB0748eX+B+IQkV+L0ddgrRCDcQ2J3sBNDdyeeaV1Tt8bzc
         ghH6JwiCiFpQatNxiyWj4WEhWt007oTWC0nN/qw9Eycr1Xzin/WHKxHGdSzDupjQ1YI5
         wrByJe3vYzGJgiLc/sOltJNocGJU9OUvOovc+0gs123i9cT57IAqloyYPUjrROfEiYyQ
         B5tg==
X-Gm-Message-State: AGi0PuY3Lv3eMp5i5HQ1consanIHKWI4NawxUYQaAv1j7r6akPeKT9eg
        NG0DX/64K/Frm9tw3HIreg==
X-Google-Smtp-Source: APiQypI77eYd6OYhdEQQfqgyyGb3ZaRPH67aBdd9/VgaHTDcIg7JyYE750yEWqukj9W15sNl/YEe6w==
X-Received: by 2002:a9d:1d6:: with SMTP id e80mr8123517ote.300.1588796159431;
        Wed, 06 May 2020 13:15:59 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y92sm788020ota.33.2020.05.06.13.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:15:58 -0700 (PDT)
Received: (nullmailer pid 23034 invoked by uid 1000);
        Wed, 06 May 2020 20:15:58 -0000
Date:   Wed, 6 May 2020 15:15:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG
 trb cache size quirk
Message-ID: <20200506201558.GA15090@bogus>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 21, 2020 at 03:18:09PM +0530, Tejas Joglekar wrote:
> This commit adds the documentation for sgl-trb-cache-size-quirk, and
> snps,sgl-trb-cache-size-quirk property. These when set enables the
> quirk for XHCI driver for consolidation of sg list into a temporary
> buffer when small buffer sizes are scattered over the sg list not
> making up to MPS or total transfer size within TRB cache size with
> Synopsys xHC.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  Changes in v2:
>  - Renamed the property
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 4 ++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 9946ff9ba735..6d0418ee4dbd 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -104,6 +104,10 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,sgl-trb-cache-size-quirk: enable sg list consolidation - host mode
> +			only. Set to use SG buffers of at least MPS size
> +			by consolidating smaller SG buffers list into a
> +			single buffer.
>  
>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 3f378951d624..14d900474894 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -43,6 +43,9 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - sgl-trb-cache-size-quirk: set if you need to consolidate sg list into a
> +    temporary buffer when small SG buffer sizes does not make upto MPS
> +    size or total transfer size across the TRB cache size.

Why do we have 2 different names?

>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> -- 
> 2.11.0
> 
