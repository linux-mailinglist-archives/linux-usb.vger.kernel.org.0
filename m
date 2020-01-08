Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B971345F5
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgAHPTv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:19:51 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:32995 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgAHPTv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 10:19:51 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so3954712otp.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2020 07:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m9q7NyF9bxvsGuJ+wYPNrRrtLEAkg6/rWpKgxYHTLfk=;
        b=sH7zxICnlC5fMT/5X2ImeltCCE6khzB/e/z04oNAZFKSALYAq1HNfhjgqMRjly0yFH
         Ku2QqE2ddgsQqHB/vosoPzVBJPJun92NcbzIcDuEdRI6Fiyo3RWjjOIemanOYz3d0eMe
         q9hB9760L+Xnd4Y4UN4jMxqK8yxEGmE2THxAbPplHhH8qkfWY2CjZGnJtviYFqw/IUnY
         5TsPjIQk+rzSTktNpD4mNVMfFoW0blfPGMjQUgT+NXlGqFkPVwipPX5iMFmPIOLtosm6
         HyKdr823AKAUy5BPDF4m9peSu2kPfs5gRrbV7r7oaH3rn0/qi7HsK9TGpUOqKqFkbxUg
         rH5g==
X-Gm-Message-State: APjAAAUgg8Ux/5rDjZiuYCbVmaKwbEB4XGd5h7gQvx+6iS67PY72MVDY
        A7ayGroMEQXq2LCOfNftWfIx/iM=
X-Google-Smtp-Source: APXvYqzBVjKR9YSwCijMUGN0E8a32d9SnexLJPiKHkVKr7rdEJo9rcyLOl6pFz/SMEpRvHacTG/rzQ==
X-Received: by 2002:a9d:67ce:: with SMTP id c14mr4477019otn.106.1578496790000;
        Wed, 08 Jan 2020 07:19:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 6sm1141252oil.43.2020.01.08.07.19.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:19:49 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 09:19:48 -0600
Date:   Wed, 8 Jan 2020 09:19:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 4/4] dt-bindings: usb: Add snps,consolidate-trbs &
 consolidate-trbs
Message-ID: <20200108151948.GA24992@bogus>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <2450178afa4e09b315402c64224b44b542363fc7.1576848504.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2450178afa4e09b315402c64224b44b542363fc7.1576848504.git.joglekar@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 20, 2019 at 07:10:24PM +0530, Tejas Joglekar wrote:
> This commit adds the documentation for consolidate-trbs, and
> snps,consolidate-trbs property. These when set enables the quirk for
> XHCI driver for consolidation of TRB's when small buffer sizes are
> scattered over the TRB cache not making up to MPS or total transfer size
> with Synopsys xHC.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt     | 6 ++++++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 66780a47ad85..9851da41a442 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -101,6 +101,12 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,consolidate-trbs: enable TRBs consolidation - host mode only. Set this
> +			to valid then for Synopsys xHC the TRBs would be
> +			consolidated to at least MPS in order to prevent the
> +			controller getting hang due to small buffer sizes which
> +			does not make up to MPS size or total transfer size
> +			across TRB cache.

Why not just always enable this?

Otherwise, this should be implied by the compatible string.

>  
>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 3f378951d624..be8d5e6a6333 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -43,6 +43,7 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - consolidate-trbs: indicate if you need to consolidate trbs
>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> -- 
> 2.11.0
> 
