Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAFF14F120
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 18:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgAaRN0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 12:13:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32923 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgAaRN0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 12:13:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so3812149pgk.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 09:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v7eI+iXhQg2Sg4d0dsN8OB5P8ovlh87pHkGQG9oBTAE=;
        b=oSRzu66xmRZ/QKo0l98+LvIeSfsnd9DW86grLpZ/S64rZKdrgDKTwIfDGX36jygWwm
         LOqfT+/2Ck6z8BP1Mv4axmrWQc22NT6O/at2Xyi8V5sHUezM7LhEL2hwudsOAakkhva+
         /23f50ciDmkkU3JdlhS3L5ncwT78+vnnP8qcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v7eI+iXhQg2Sg4d0dsN8OB5P8ovlh87pHkGQG9oBTAE=;
        b=ZOaZBj97zkRHJrXD2p3Tnk3esVUbTeoFXD9bbGsNVIY0oXo6IoT1jsUbhrEhmOpaXN
         97m1n6x5ECbZjsjYMCQJkyPsMHGsbi+ZduQJXk0IzCjmHJ0IHQc1qjkVMxfgycDpg/mA
         oDsLrJwxvVMB0fRJs2SXtjDXcIQFbfb/kz5YebtNNPBzdl9vD4yUIEkMgHX+R9f0EtEc
         BNASplyerf6OhI4Yq64sgQx6lZWiyd7Aji6lJ2+WQojJRjnQoCblzrFsLC4vIy7yUWpS
         bAa+BtB6dCWWcOLNm0HHTxIV2pVk0VOfmNAderY4yfeRy6r9ixcWTV7XYsWu+lwobexO
         2EAg==
X-Gm-Message-State: APjAAAX4tGUOa2/Qc7qlYVSLHWia99RV6gr2iDJvNbYYU0/0hVBp0T0k
        j5Zb3YmpSWOwhNyKJ03K0XVRvw==
X-Google-Smtp-Source: APXvYqy6aKE3k8YSZjwTDmJmIyGzwEL0dy+FoY+4OiTOpVGQbs4SZqQNyuyxXO3EofIf5hAHN895Zw==
X-Received: by 2002:a63:d14:: with SMTP id c20mr10967739pgl.77.1580490805991;
        Fri, 31 Jan 2020 09:13:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x12sm12036392pfr.47.2020.01.31.09.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 09:13:25 -0800 (PST)
Date:   Fri, 31 Jan 2020 09:13:24 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     cchiluve <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V4 1/3] dt-bindings: Introduce interconnect properties
 for Qualcomm DWC3 driver
Message-ID: <20200131171324.GL71044@google.com>
References: <1568983997-20004-1-git-send-email-cchiluve@codeaurora.org>
 <1568983997-20004-2-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568983997-20004-2-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Chandana,

sorry for the late reply to v4, I missed it since I wasn't in cc.
I probably would have caught it regardless if linux-arm-msm@vger.kernel.org
was in cc, most patches for QCOM drivers/code include it, which helps with
monitoring.

On Fri, Sep 20, 2019 at 06:23:15PM +0530, cchiluve wrote:
> From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Add documentation for the interconnects and interconnect-names
> properties for USB as detailed by bindings/interconnect/interconnect.txt.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa..63c21c6 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -33,6 +33,16 @@ Optional clocks:
>  
>  Optional properties:
>  - resets:		Phandle to reset control that resets core and wrapper.
> +- interconnects:	Pairs of phandles and interconnect provider specifiers
> +			to denote the edge source and destination ports of
> +			the interconnect path. Please refer to
> +			Documentation/devicetree/bindings/interconnect/
> +			for more details.
> +- interconnect-names:	List of interconnect path name strings sorted in the same
> +			order as the interconnects property. Consumer drivers will use
> +			interconnect-names to match interconnect paths with interconnect
> +			specifiers. Please refer to Documentation/devicetree/bindings/
> +			interconnect/ for more details.
>  - interrupts:		specifies interrupts from controller wrapper used
>  			to wakeup from low power/susepnd state.	Must contain
>  			one or more entry for interrupt-names property
> @@ -74,6 +84,9 @@ Example device nodes:
>  			#size-cells = <1>;
>  			ranges;
>  
> +			interconnects = <&qnoc MASTER_USB3_0 &qnoc SLAVE_EBI1>,
> +					<&qnoc MASTER_APPSS_PROC &qnoc SLAVE_USB3_0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
>  			interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
>  			interrupt-names = "hs_phy_irq", "ss_phy_irq",
>  				  "dm_hs_phy_irq", "dp_hs_phy_irq";

The binding is being converted to DT schema (https://patchwork.kernel.org/patch/11293385/),
this patch will require a re-spin once the conversion lands/stabilizes.
