Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4962022B4F5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 19:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgGWRfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 13:35:30 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:39550 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgGWRf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 13:35:29 -0400
Received: by mail-il1-f195.google.com with SMTP id k6so5025157ili.6;
        Thu, 23 Jul 2020 10:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EZcmuqlw+vI8279QgykP+SnxtQePgE6A/1MM/UJc1/I=;
        b=snHCWZ9/mAYwHaoXnX4LuW4aiIvBDbF1xq0uoK1khSBOAaXdDkTD1JbsFfxBXcoobF
         FfN07q9RSyrj7zwd6J6I58XBKL3GWtcX+ZLBzrcX/X3Z8FF2E9ed8mhgqn1pZhDohIVF
         IYwPeVBapa0pI4HY0qN8R693grN7h4gUxHFN6vmHfGf9F/N3dvH+89v1d82yAcdLdhZZ
         EXNdXQ1JJ1QrmwNWFow35x7e/Nz5xX4rx2No7sn0E6Opt+qxqNKR7pqo/rE+YC6DTco5
         byFvGvm3M3Qlk87QhquCWTQOd4BF86/3zBLpXFnBMxPXJ6HEhbm6aVfMcL9LVwK1gpSB
         D06w==
X-Gm-Message-State: AOAM533RloXNnGBceJFaQFN2zZzQ8chHshXxR5A+7j0MwTC8x7D7B1xQ
        nERqESmJM9C/myyndt8gbg==
X-Google-Smtp-Source: ABdhPJz7uG1mV+jAbyXdvaIBTjENYt2s4YK7RlJI7ZsjxplwTXSBfl0YRixwUg/sAJMNR0Qtd5TmGg==
X-Received: by 2002:a05:6e02:8e3:: with SMTP id n3mr6415331ilt.259.1595525728765;
        Thu, 23 Jul 2020 10:35:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k8sm1846100ilk.11.2020.07.23.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 10:35:28 -0700 (PDT)
Received: (nullmailer pid 579882 invoked by uid 1000);
        Thu, 23 Jul 2020 17:35:25 -0000
Date:   Thu, 23 Jul 2020 11:35:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        linux-imx@nxp.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/4] doc: dt-binding: ci-hdrc-usb2: add property for
 imx picophy
Message-ID: <20200723173525.GA576802@bogus>
References: <20200717042226.18495-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717042226.18495-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 17, 2020 at 12:22:23PM +0800, Peter Chen wrote:
> Add two parameters which are used to tune USB signal for imx picophy,
> picophy is used at imx7d, imx8mm, and imx8mn.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> No changes for v2.
> 
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 51376cbe5f3d..e9858dafb08f 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -100,6 +100,13 @@ i.mx specific properties
>    It's recommended to specify the over current polarity.
>  - power-active-high: power signal polarity is active high
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
> +- picophy,pre-emp-curr-control: HS Transmitter Pre-Emphasis Current

Form is <vendor>,<prop-name> and picophy is not a vendor.

> +  Control. This signal controls the amount of current sourced to the
> +  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
> +  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.

What's the range of values? What's the default if not specified?

> +- picophy,dc-vol-level-adjust: HS DC Voltage Level Adjustment.
> +  Adjust the high-speed transmitter DC level voltage, details can refer
> +  to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.

Same comments here.

>  
>  Example:
>  
> -- 
> 2.17.1
> 
