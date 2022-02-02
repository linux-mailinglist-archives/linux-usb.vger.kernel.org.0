Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D1A4A6971
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 01:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243363AbiBBA6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Feb 2022 19:58:44 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33397 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiBBA6o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Feb 2022 19:58:44 -0500
Received: by mail-oi1-f175.google.com with SMTP id x193so36972109oix.0;
        Tue, 01 Feb 2022 16:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yzfs4LNIKjvTvq/VJT/9v6I3gbO+hNt8P5WQ2zknsck=;
        b=2qLp1IlDHHga962zSpoiv18iNyG6GLgFx9DJOfQzWLZM7QgCxwUFRG6DlnzLdBrGJZ
         dq03Gy0j5LilWCKJHXPlSH4Lunyjq1Xbjfi6OPLKLlJpO+s67Oy9yjPhHRouxP7mtisc
         fXxWfc0clMMvNW0zw5Yl26K6B+hWGLBCGi20H6PvdYvPfs1MtiCllbFhfD5xN47iQN54
         dF+TcO3HMf6Sv5SSSqGW+1tTHsRgKpVMTFSnHZ1Yl7AXctaZEjhuvYuS6KQhYVudGsj+
         lxDsM+D2rxieLMg6yeN5P2RP9wcIPQuLy0vPCcFIwYA/I1ASQZ0VLz4iuwCOsO4ZQD/V
         eEAw==
X-Gm-Message-State: AOAM530CgUcEOgqEQEppYG9aglaNyA7IqqNk2M65w7vAXUhdtuDM2PMV
        +OvshPojXNqcF+m7975/SPGTdDFP/Q==
X-Google-Smtp-Source: ABdhPJwKJ4qi7HZXj0JZZjlNCdAZoxORfThV50l0jUgTfCjV4wtw3+Enm9o8cNcsvwr8HraUDQ2MaQ==
X-Received: by 2002:aca:2304:: with SMTP id e4mr3133590oie.167.1643763523866;
        Tue, 01 Feb 2022 16:58:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s13sm746674ooh.43.2022.02.01.16.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 16:58:43 -0800 (PST)
Received: (nullmailer pid 1099482 invoked by uid 1000);
        Wed, 02 Feb 2022 00:58:42 -0000
Date:   Tue, 1 Feb 2022 18:58:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, michal.simek@xilinx.com,
        manish.narani@xilinx.com, sean.anderson@seco.com,
        devicetree@vger.kernel.org, piyush.mehta@xilinx.com
Subject: Re: [PATCH v8 2/3] dt-bindings: usb: dwc3-xilinx: Added reset-gpios
Message-ID: <YfnXQumE1TOWur5p@robh.at.kernel.org>
References: <20220126234017.3619108-1-robert.hancock@calian.com>
 <20220126234017.3619108-3-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126234017.3619108-3-robert.hancock@calian.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 26, 2022 at 05:40:16PM -0600, Robert Hancock wrote:
> Update DT binding to reflect new reset-gpios property.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index f77c16e203d5..823ce731e95f 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -59,6 +59,10 @@ properties:
>        - const: usb_hibrst
>        - const: usb_apbrst
>  
> +  reset-gpios:
> +    description: Optional GPIO connected to ULPI PHY reset line.
> +    maxItems: 1

Reset for the PHY belongs in the PHY node.

> +
>    phys:
>      minItems: 1
>      maxItems: 2
> -- 
> 2.31.1
> 
> 
